import { lazy, Suspense, createSignal, onMount, onCleanup } from "solid-js";
import { Portal } from "solid-js/web";
import { Context4Settings } from "@/utilities";

import "@/index.css";

const cssRootOverrides = {
	"--pending": "var(--pending-yellow)",
	"--sold": "var(--sold-red)",
	"--active": "var(--active-green)",
	"--new": "var(--new-blue)",
};

const DATASTUB = "data-genie-";
const CAMELCASE = {
	agentid: "agentId",
	areaid: "areaId",
	areaid: "areaID",
	areaperiod: "areaPeriod",
	blurprice: "blurPrice",
	downloadurl: "downloadUrl",
	hideavm: "hideAVM",
	layout: "layout",
	leadareaid: "leadAreaId",
	leadcapture: "isLeadCapture",
	mapicon: "mapIcon",
	mapkey: "mapKey",
	mapstyle: "mapStyle",
	marketstatus: "marketStatus",
	mlsid: "mlsId",
	mlsnumber: "mlsNumber",
	mode: "mode",
	nocopyright: "noCopyright",
	nomargin: "noMargin",
	openhouse: "openHouseTimes",
	period: "areaPeriod",
	pricepercent: "pricePercent",
	propertytype: "propertyTypeId",
	renderid: "renderId",
	signin: "signIn",
	theme: "theme",
};

const defaultSettings = {
	mode: "sold",
	propertyTypeID: 0,
	areaPeriod: 6,
	mapStyle: "street-v11",
	mapKey: false,
	mapIcon: "dot",
	blurPrice: false,
	hideAVM: false,
	pricePercent: "percent",
	signIn: false,
	noCopyright: true,
	noMargin: true,
};

export default () => {
	const genies = [];
	const linkedThemes = [];

	document
		.querySelectorAll(`.genie-embed`)
		.forEach((genieNode, index, embeds) => {
			const source = Object.fromEntries(
				new URLSearchParams(window.location.search).entries()
			);
			const [queryParams] = createSignal(
				Object.keys(source).reduce((destination, key) => {
					destination[key.toLowerCase()] = source[key];
					return destination;
				}, {})
			);
			const settings = {
				...defaultSettings,
				...window.gHub,
				...queryParams,
			};
			const attrs = genieNode.getAttributeNames();

			attrs.forEach(name => {
				if (name.startsWith(DATASTUB)) {
					settings[CAMELCASE[name.replace(DATASTUB, "")]] =
						genieNode.getAttribute(name);
				}
			} );
			
			

			if (queryParams.shorturldataid) {
				(async () => {
					const agentId = document
						.querySelector(`div[${DATASTUB}agentid]`)
						?.getAttribute(`${DATASTUB}agentid`);
					if (agentId) {
						const r = await getShortData({
							shortID: queryParams.shorturldataid,
							token: queryParams.token,
							agentId,
						});

						let ov = Object.fromEntries(
							Object.entries(r.result.property).map(([k, v]) => [
								k.toLowerCase(),
								v,
							])
						);

						// Fudge to prevent identically named param overriding the built in one
						if (ov.areaid && !ov.leadareaid) {
							ov.leadareaid = ov.areaid;
							delete ov.areaid;
						}

						setOverrideSettings(ov);
					}
				})();
			}

			settings.layout && genieNode.classList.add(settings.layout);
			//settings.theme && genieNode.classList.add(settings.theme);

			settings.theme = settings.theme.replace( '-light', '' ).replace( '-dark', '' );

			if (!linkedThemes.includes(settings.theme)) {
				linkedThemes.push(settings.theme);

				var link = document.createElement("link");
				link.rel = "stylesheet";
				link.type = "text/css";
				link.href = `${window.gHub.siteUrl}_assets/themes/${settings.theme}.css`;
				document.head.appendChild(link);
			}

			genies.push(
				<Portal mount={genieNode}>
					<Genie {...settings} isLast={index === embeds.length} />
				</Portal>
			);
		});

	return <>{genies}</>;
};

const Genie = ({ layout, nocopyright, nomargin, isLast, ...props }) => {
	const [customs, setCustomizations] = createSignal();

	const msgListener = msg => {
		if (msg.data.type === "Customizations" && msg.data.values) {
			setCustomizations(msg.data.values);
		}
	};

	onMount(() => {
		// Two ways of getting the custom overrides in: from embed HTML or via the IFRAME messaging, the latter being for the Wizard editor
		let customs = {};
		document.querySelectorAll(`[data-genie-custom]`).forEach(node => {
			customs[node.getAttribute("data-custom-id")] = node.innerHTML;
		});
		if (Object.keys(customs).length > 0) {
			setCustomizations(customs);
		} else {
			window.addEventListener("message", msgListener);
		}
	});

	onCleanup(() => window.removeEventListener("message", msgListener));

	const Layout = lazy(() => import(`../embeds/${layout}.jsx`));

	//console.log( "Genie", props.marketstatus, props.marketStatus );
	//nsole.log("Provider’s Context4Settings is →", Context4Settings);
	return (
		<div
			class={`genie-wrap ${layout.toLowerCase()}${
				nomargin ? " no-margin" : ""
			}`}
			style={cssRootOverrides}>
			<Context4Settings.Provider value={props}>
				<Suspense fallback={<div>Analyzing latest market data...</div>}>
					<Layout {...props} />
				</Suspense>
			</Context4Settings.Provider>

			<Show when={!nocopyright}>
				<footer style="padding-bottom:1rem;">
					<span>
						Source:
						<a
							style="margin: auto 0.25rem; color: var(--theme-sub-heading-color);"
							href="https://thegenie.ai">
							TheGenie.ai
						</a>
					</span>

					<span>Recipients to verify all information.</span>

					<span>
						&nbsp;
						{`\u00a9 ${new Date().getFullYear()} 1parkplace, Inc.`}
					</span>
				</footer>
			</Show>
		</div>
	);
};
