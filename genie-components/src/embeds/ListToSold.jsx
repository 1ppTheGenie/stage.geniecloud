import { format } from "date-fns";
import { HomeTypes, Editable } from "@/components";
import { areaMonthlyStore, areaDataStore, currency, percent } from "@/utilities";


import "@/assets/css/list-to-sold.css";

export default () => {
	const series = () => {
		if (!areaMonthlyStore.loading) {
			const stats = [
				...areaMonthlyStore.stats.filter(
					stats => stats.propertyTypeId === areaDataStore.propertyTypeID
				),
			];

			return stats.slice(Math.max(stats.length - areaDataStore.areaPeriod, 1)).reverse();
		}
	};

	return (
		<>
			<Editable id="list-to-sold-title">
				<h1>List to Sold Price</h1>
			</Editable>

			<HomeTypes optionTabs={true} />

			<div class="no-more-tables">
				<table class="data-table">
					<thead>
						<tr>
							<th class="year-filter">Year</th>
							<th>Quantity Sold</th>
							<th>Avg List Price $</th>
							<th>Avg Sale Price $</th>
							<th>Avg DOM*</th>
							<th>Sale to List %</th>
						</tr>
					</thead>
					<tbody id="list-to-sold">
						<For each={series()}>
							{m => (
								<tr>
									<td>
										{format(new Date(m.yearPart, m.monthPart - 1, 1), "MMM yy")}
									</td>
									<td>{m.soldCount}</td>
									<td>{currency(m.averageListPrice)}</td>
									<td>{currency(m.averageSalePrice)}</td>
									<td>{Math.round(m.averageDaysOnMarket)}</td>
									<td>{percent(m.averageSalePrice / m.averageListPrice)}</td>
								</tr>
							)}
						</For>
					</tbody>
				</table>
			</div>
			<p class="market-days-text" style="font-size: 80%; text-align: center">
				*Avg DOM: Days On Market<span class="SM-hidden"> - </span>
				<span class="SM-visible">
					
				</span>
				Average number of days properties take to sell 
			</p>
		</>
	);
};
