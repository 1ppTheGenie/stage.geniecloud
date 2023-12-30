import { HomeTypes } from "@/components";
import { areaDataStore } from "@/utilities";

export default () => {
	return (
		<>
			<h1>Market Report for {areaName}</h1>

			<HomeTypes />

			{!stats && <p>Sorry, there is no data for this period.</p>}

			{stats && (
				<div class="market-report-tiles">
					<div style="grid-row:1/3">
						<h1>Units available for sale</h1>
						<h2 class="big-round">{stats.active}</h2>
					</div>
					<div>
						<h1>Units sold</h1>
						<h2>{stats.sold}</h2>
					</div>
					<div>
						<h1>Average Days on Market</h1>
						<h2>{stats.avgDOM}</h2>
					</div>
					<div>
						<h1>Average Listing Price</h1>
						<h2>{window.gHub.currency(stats.avgListPriceForSold)}</h2>
					</div>
					<div>
						<h1>Average price/Sq Ft.</h1>
						<h2>{window.gHub.currency(stats.avgPricePerSqFt)}</h2>
					</div>
					<div>
						<h1>Median sales price</h1>
						<h2>{window.gHub.currency(stats.medSalePrice)}</h2>
					</div>
					<div>
						<h1>{period} Month Turn Over Rate</h1>
						<h2>{window.gHub.percent(stats.turnOver)}</h2>
					</div>
					<div>
						<h1>Average Sales Price</h1>
						<h2>{window.gHub.currency(stats.avgSalePrice)}</h2>
					</div>
					<div>
						<h1>Percentage of asking price</h1>
						<h2>
							{window.gHub.percent(
								stats.avgSalePrice / stats.avgListPriceForSold
							)}
						</h2>
					</div>
					<div>
						<h1>Total Number of Units</h1>
						<h2>{stats.taxroll}</h2>
					</div>
					<div>
						<h1>% of owners who live here full time</h1>
						<h2>{window.gHub.percent(stats.ownerOccupancy)}</h2>
					</div>
				</div>
			)}
		</>
	);
};
