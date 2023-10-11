import { Match, Show, Switch } from "solid-js";
import { app } from "@/utilities";

import Trash from "@/assets/trash.svg";
import Up from "@/assets/up.svg";
import Down from "@/assets/down.svg";
import Eye from "@/assets/eye.svg";
import EyeSlash from "@/assets/eye-slash.svg";

export const Asset = props => {
	const asset =
		app.store.allAssets[`${props.asset.folder}/${props.asset.stylesheet}`];
	//
	console.log("@", asset);
	return (
		<Show when={asset}>
			<tr>
				<td>
					{/* <th>Asset Name</th> */}
					{asset.name}
				</td>

				<td>
					{/*<th>Name Override</th> */}
					<input
						class="focussed"
						placeholder="Override name"
						onChange={e =>
							props.update({ ...props.asset, name: e.target.value })
						}
						value={props.asset.name || asset.knownAs || ""}
					/>
				</td>

				<td style="text-transform:capitalize">
					{/*<th>Type</th>*/}
					{props.asset.folder.replaceAll("-", " ")}
				</td>

				<td>
					{/*<th>Supports</th>*/}
					{asset.supports}
				</td>

				<td>
					{/*<th>LPO</th>*/}
					<Show
						when={asset.sizes == "Landing Page"}
						fallback={<span style="opacity:0.2">-</span>}>
						<LandingPages
							onChange={value => props.update({ ...props.asset, lpo: value })}
							defaultCaption="None (will be rendered)"
							current={props.asset.lpo}
							actual={props.asset.stylesheet}
						/>
					</Show>
				</td>

				<td>
					{/*<th>QR Destination</th>*/}
					<Show
						when={asset.supports.includes("QRCode")}
						fallback={<span style="opacity:0.2">-</span>}>
						<LandingPages
							onChange={value => props.update({ ...props.asset, qrUrl: value })}
							incLPOs="true"
							defaultCaption="Use Custom URL"
							current={props.asset.qrUrl}
						/>
						<Show
							when={!props.asset?.qrUrl || parseInt(props.asset?.qrUrl) == 0}>
							<input
								type="text"
								class="focussed"
								placeholder="Enter custom url or blank for agent website."
								style={{ width: "275px" }}
								onChange={e =>
									props.update({
										...props.asset,
										qrDestination: e.target.value,
									})
								}
								value={props.asset?.qrDestination ?? ""}
							/>
						</Show>
					</Show>
				</td>

				<td class="actions">
					{/*<th>Actions</th>*/}
					<Show when={props.index() > 0}>
						<Up
							style="fill:var(--genie-primary);"
							onClick={() => props.moveUp()}
						/>
					</Show>

					<Show when={props.index() < props.count - 1}>
						<Down
							style="fill:var(--genie-primary);"
							onClick={() => props.moveDown()}
						/>
					</Show>
					<Trash
						style="fill:var(--genie-primary);"
						onClick={() => props.remove()}
					/>

					<Switch>
						<Match when={props.asset.hide}>
							<EyeSlash
								style="fill: var(--genie-dark-grey)"
								onClick={() => props.update({ ...props.asset, hide: false })}
							/>
						</Match>
						<Match when={true}>
							<Eye
								style="fill: var(--genie-primary)"
								onClick={() => props.update({ ...props.asset, hide: true })}
							/>
						</Match>
					</Switch>
				</td>
			</tr>
		</Show>
	);
};

const LandingPages = props => (
	<select
		aria-label="Landing Pages"
		class="focussed"
		onChange={e =>
			props.onChange(e.target.value !== "0" ? e.target.value : null)
		}>
		<option value="0">{props.defaultCaption}</option>
		<For each={app.currentLandingPages(props.incLPOs)}>
			{lp =>
				lp !== props.actual && (
					<option selected={props.current == lp}>{lp}</option>
				)
			}
		</For>
	</select>
);
