import { createSignal, createEffect, Show } from "solid-js";
import { areaMonthlyStore, areaDataStore } from "@/utilities";
import { format } from "date-fns";
import { HomeTypes, Editable, LineChart } from "@/components";

import "@/assets/css/market-history.css";

const link = document.createElement("link");
link.rel = "stylesheet";
link.type = "text/css";
link.href = "https://cdn.rawgit.com/tiaanduplessis/wenk/master/dist/wenk.css";
document.head.appendChild(link);

export default () => {
	const [graphView, setGraphView] = createSignal("averagePricePerSqFt");
	const [series, setSeries] = createSignal();
	const [labels, setLabels] = createSignal();
	const [high, setHigh] = createSignal();
	const [low, setLow] = createSignal();

	createEffect(() => {
		if (areaMonthlyStore.loading == false) {
			const stats = areaMonthlyStore.stats.filter(
				stats => stats.propertyTypeId === areaDataStore.propertyTypeID
			);

			setLabels(
				stats
					.slice(Math.max(stats.length - areaDataStore.areaPeriod, 1))
					.map(m => format(new Date(m.yearPart, m.monthPart - 1, 1), "MMM yy"))
			);
			const series = stats
				.slice(Math.max(stats.length - areaDataStore.areaPeriod, 1))
				.map(m => ({
					name: format(new Date(m.yearPart, m.monthPart - 1, 1), "MMM yy"),
					value: m[graphView()],
				}));

			setSeries(series);

			const min = Math.min.apply(
				9999999999999,
				series.map(i => i.value)
			);
			const max = Math.max.apply(
				0,
				series.map(i => i.value)
			);
			switch (graphView) {
				case "averagePricePerSqFt":
					setLow(Math.round(min / 1.4 / 250000) * 250000);
					setHigh(Math.ceil((max * 1.3) / 250000) * 250000);
					break;

				case "averageSalePrice":
					setLow(Math.round(min / 1.4 / 250) * 250);
					setHigh(Math.ceil((max * 1.3) / 250) * 250);
					break;

				default:
					setLow(min / 1.4);
					setHigh(max * 1.3);
					break;
			}
		}
	});

	return (
		<>
			<Editable style="text-align:center" id="market-history-title">
				<h1>
					A History of the
					<br />
					{areaDataStore.areaName}&#160;Market
				</h1>
			</Editable>

			<HomeTypes container={`MarketHistory-`} />

			<div class="curved-tabs">
				<span
					class={graphView() === "averagePricePerSqFt" ? "active" : ""}
					onClick={() => setGraphView("averagePricePerSqFt")}>
					Price per sq/ft
				</span>
				<span
					class={graphView() === "averageSalePrice" ? "active" : ""}
					onClick={() => setGraphView("averageSalePrice")}>
					Price history
				</span>
				<span
					class={graphView() === "soldCount" ? "active" : ""}
					onClick={() => setGraphView("soldCount")}>
					Sales history
				</span>
			</div>
			<div class="market-history-chart">
				<Show when={series()}>
					<LineChart
						element=".market-history-chart"
						margin={{
							top: 15,
							right: 15,
							bottom: 15,
							left: 15,
						}}
						width={900}
						height={300}
						data={{
							data: {
								labels: labels(),
								series: [series()],
							},
							options: {
								width: "100%",
								height: "100%",
								axisX: {
									scaleLabel: "Month",
									onlyInteger: false,
								},
								axisY: {
									high: high(),
									low: low(),
									offset: 60,
									onlyInteger: true,
									labelInterpolationFnc:
										graphView() === "soldCount"
											? window.genieChart.number
											: window.genieChart.dollarRound,
									scaleLabel:
										graphView() === "soldCount" ? "Total Sold" : "Price",
								},
							},
						}}></LineChart>
				</Show>
			</div>
		</>
	);
};
