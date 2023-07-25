import { lazy, Suspense, createSignal, onMount, onCleanup } from "solid-js";
import { Portal } from "solid-js/web";
import { SettingsContext } from "@/utilities";

import "@/index.css";

const cssRootOverrides = {
	"--pending": "var(--pending-yellow)",
	"--sold": "var(--sold-red)",
	"--active": "var(--active-green)",
	"--new": "var(--new-blue)",
};

const DATASTUB = "data-genie-";
const CAMELCASE = {
	agentid: "agentID",
	renderid: "renderID",
	layout: "layout",
	theme: "theme",
	areaid: "areaID",
	areaperiod: "areaPeriod",
	period: "areaPeriod",
	leadareaid: "leadAreaID",
	mode: "mode",
	mapstyle: "mapStyle",
	mapicon: "mapIcon",
	mapkey: "mapKey",
	mlsnumber: "mlsNumber",
	mlsid: "mlsID",
	blurprice: "blurPrice",
	signin: "signIn",
	pricepercent: "pricePercent",
	propertytype: "propertyTypeID",
	nocopyright: "noCopyright",
	openhouse: "openHouseTimes",
	hideavm: "hideAVM",
	downloadurl: "downloadUrl",
	leadcapture: "isLeadCapture",
	nomargin: "noMargin",
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
				...window.ggSettings,
				...queryParams,
			};
			const attrs = genieNode.getAttributeNames();

			attrs.forEach(name => {
				if (name.startsWith(DATASTUB)) {
					settings[CAMELCASE[name.replace(DATASTUB, "")]] =
						genieNode.getAttribute(name);
				}
			});

			if (queryParams.shorturldataid) {
				(async () => {
					const agentID = document
						.querySelector(`div[${DATASTUB}agentid]`)
						?.getAttribute(`${DATASTUB}agentid`);
					if (agentID) {
						const r = await getShortData({
							shortID: queryParams.shorturldataid,
							token: queryParams.token,
							agentID,
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
			settings.theme && genieNode.classList.add(settings.theme);

			if (!linkedThemes.includes(settings.theme)) {
				linkedThemes.push(settings.theme);

				var link = document.createElement("link");
				link.rel = "stylesheet";
				link.type = "text/css";
				link.href = `${window.ghub.site_url}_assets/themes/${settings.theme}.css`;
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

	const Layout = lazy(() =>
		import(/* @vite-ignore */ `../embeds/${layout}.jsx`)
	);

	return (
		<div
			class={`genie-wrap ${layout.toLowerCase()}${
				nomargin ? " no-margin" : ""
			}`}
			style={cssRootOverrides}>
			<SettingsContext.Provider value={props}>
				<Suspense fallback={<div>Analyzing latest market data...</div>}>
					<Layout />
				</Suspense>
			</SettingsContext.Provider>

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
						{`Copyright \u00a9 ${new Date().getFullYear()} 1parkplace, Inc.`}
					</span>
				</footer>
			</Show>
		</div>
	);
};
