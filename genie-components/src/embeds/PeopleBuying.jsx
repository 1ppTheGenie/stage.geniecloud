import { Index } from "solid-js";
import { areaDataStore, propertyTypeCaption, currency } from "@/utilities";
import { HomeTypes, Editable, Spinner } from "@/components";

import "@/assets/css/people-buying.css";

var link = document.createElement("link");
link.rel = "stylesheet";
link.type = "text/css";
link.href = "https://cdn.rawgit.com/tiaanduplessis/wenk/master/dist/wenk.css";
document.head.appendChild(link);

export default () => {
	return (
		<>
			<Editable id="people-buying-heading">
				<h1>Look at What People are&#160;Buying</h1>
			</Editable>

			<p style="margin: 0 2rem" class="subtitle-font">
				{`${areaDataStore.areaName} has seen a lot of movement of \n`}
				<br />
				{`${
					areaDataStore.topSize.beds > 0
						? areaDataStore.topSize.beds + " bedroom"
						: "studio"
				}  ${areaDataStore.propertyTypeCaption} in the past ${
					areaDataStore.areaPeriod
				} months.`}
			</p>

			<HomeTypes container={`PeopleBuying-${areaDataStore.areaid}`} />

			{!areaDataStore.bedroomStats && <p>Sorry, there is no data for this period.</p>}

			<div id="colors" class="horizontal-bars">
				<Index each={areaDataStore.bedroomStats}>
					{(size, i) => {
						// Only bedroom counts up to 5?
						if (i > 5) return null;

						// Don't show Studio if none sold
						if (size().beds === 0 && size().sold === 0) return null;

						return (
							<div>
								<span class="graph-number">
									<Switch>
										<Match when={size().beds < 1}>Studio</Match>
										<Match when={size().beds > 0 && size().beds < 5}>{`${
											size().beds
										} br`}</Match>
										<Match when={size().beds === 5}>5+ br</Match>
									</Switch>
								</span>
								<span>
									{size().sold === 0 && <span>None sold</span>}
									{size().sold > 0 && (
										<span
											class="color"
											style={`cursor:pointer; font-weight:bold;--size:${
												((!areaDataStore.loading ? size().sold : 0) /
													areaDataStore.topSize.sold) *
												100
											}%;textTransform:capitalize;color:#fff;`}>
											<span
												data-wenk={`Avg: ${currency(size().avgSalePrice)}`}
												data-wenk-pos="top">
												{!areaDataStore.loading ? (
													`${size().sold} ${propertyTypeCaption(
														areaDataStore.propertyTypeID,
														size().sold,
														true
													)} sold`
												) : (
													<Spinner
														style="margin: 0; width: 16px; transform: scale(2.5)"
														fill="var(--theme-body-color)"
													/>
												)}
											</span>
										</span>
									)}
								</span>
							</div>
						);
					}}
				</Index>
			</div>
		</>
	);
};
