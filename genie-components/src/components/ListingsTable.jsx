import { createSignal, Show, For, createMemo  } from "solid-js";
import { format } from "date-fns";
/* prettier-ignore */
import { address, currency, useSettings, Context4Settings, signedInAtom } from "@/utilities";
import { DataAccess } from "@/components";

import SoldIcon from "@/assets/icon-sold-small.svg";
import ActiveIcon from "@/assets/icon-active-small.svg";
import PendingIcon from "@/assets/icon-pending-small.svg";
import NewIcon from "@/assets/icon-new-small.svg";
const bgColors = {
	active: "--active-green",
	new: "--new-blue",
	pending: "--pending-yellow",
	sold: "--sold-red",
	soldextended: "--sold-red",
};

const headings = {
	soldextended: [
		"Address",
		"List Price",
		"Sold Price",
		"BR",
		"BA",
		"Sold Date",
		"List Date",
		"Sq.Ft.",
		"$/Sq.Ft.",
		"DOM",
	],
	sold: [
		"Address",
		"BR",
		"BA",
		"Sq.Ft.",
		"List Price",
		"Sold Price",
		"Sold Date",
		"$/Sq.Ft.",
		"DOM",
	],
	default: [
		"Address",
		"List Price",
		"BR",
		"BA",
		"List Date",
		"Sq.Ft.",
		"$/Sq.Ft.",
		"DOM",
	],
};

export const ListingsTable = props => {
	const { style, withIcon = false } = props;
	const settings = useSettings(Context4Settings);
	const [signedIn, setSignedIn] = createSignal(signedInAtom);
	const [showSignIn, setShowSignin] = createSignal(false);

	const signInComplete = bool => {
		setShowSignin(false);
		setSignedIn(bool);
	};

	const viewMode = createMemo(() => props?.mode()?.toLowerCase() ?? 'active');

	return (
		<>
			{showSignIn && <DataAccess signedin={signInComplete} />}
			<table id="listing-table" style={style} class={`mode-${viewMode()}`}>
				<thead>
					<Show when={viewMode()}>
						<tr>
							{headings[
								viewMode() !== "sold"
									? "default"
									: "soldextended"
							].map((caption, i) => (
								<th
									title={
										caption === "BR"
											? "Bedrooms"
											: caption === "BA"
											? "Bathrooms"
											: ""
									}>
									{caption}
								</th>
							))}
						</tr>
					</Show>
				</thead>
				<tbody>
					<Show when={viewMode() == "sold"}>
						<For each={props.listings()}>
							{(l, index) => {
								return (
									<tr>
										<td style="text-align: left">
											<Show when={withIcon}>
												<SmallIcon marketstatus={props.marketstatus} />
											</Show>
											{props.marketstatus === "sold" &&
												settings.signin &&
												!signedIn && (
													<span
														style="cursor: pointer; margin-left: 0.5rem"
														onClick={() => setShowSignin(true)}>
														Sign in to see Address
													</span>
												)}
											{(props.marketstatus !== "sold" ||
												!settings.signin ||
												signedIn) &&
												address(l)}
										</td>
										<td>{currency(parseInt(l.priceHigh))}</td>
										<td
											classList={{
												blurText: settings.blurPrice && !signedIn,
											}}>
											{currency(parseInt(l.salePrice))}
										</td>
										<td>{l.bedrooms}</td>
										<td>{l.bathroomsTotal}</td>

										<td>
											{l.soldDate && format(Date.parse(l.soldDate), "M-d-y")}
										</td>
										<td>
											{l.listDate && format(Date.parse(l.listDate), "M-d-y")}
										</td>

										<td>{Intl.NumberFormat("en-US").format(l.sqft)}</td>

										<td
											classList={{
												blurText: settings.blurPrice && !signedIn,
											}}>
											{currency(parseInt(l.salePrice) / parseInt(l.sqft))}
										</td>

										<td>{l.daysOnMarket > 0 ? l.daysOnMarket : "Today!"}</td>
									</tr>
								);
							}}
						</For>
					</Show>

					<Show when={viewMode() != "sold"}>
						<For each={props.listings()}>
							{(l, index) => {
								return (
									<tr>
										<td style="text-align: left">
											<Show when={withIcon}>
												<SmallIcon marketstatus={props.marketstatus} />
											</Show>
											{viewMode() === "sold" &&
												settings.signin &&
												!signedIn && (
													<span
														style="cursor: pointer; margin-left: 0.5rem"
														onClick={() => setShowSignin(true)}>
														Sign in to see Address
													</span>
												)}
											{(viewMode() !== "sold" ||
												!settings.signin ||
												signedIn) &&
												address(l)}
										</td>

										<Show when={viewMode() !== "sold"}>
											<td>{currency(l.priceHigh)}</td>
										</Show>

										<td>{l.bedrooms}</td>
										<td>{l.bathroomsTotal}</td>

										<Show when={l.listDate}>
											<td>{format(Date.parse(l.listDate), "M-d-y")}</td>
										</Show>

										<td>{Intl.NumberFormat("en-US").format(l.sqft)}</td>

										<td>
											{currency(parseInt(l.priceHigh) / parseInt(l.sqft))}
										</td>
										<td>{l.daysOnMarket > 0 ? l.daysOnMarket : "Today!"}</td>
									</tr>
								);
							}}
						</For>
					</Show>
				</tbody>
			</table>
		</>
	);
};

const SmallIcon = props => {
	const style = "height: 20px; width: auto";
	switch (props.marketstatus) {
		case "new":
			return <NewIcon style={style} />;
		case "active":
			return <ActiveIcon style={style} />;
		case "sold":
			return <SoldIcon style={style} />;
		case "pending":
			return <PendingIcon style={style} />;

		default:
			return null;
	}
};
