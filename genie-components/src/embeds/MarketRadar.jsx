import { HomeTypes, MRIcon } from "@/components";
import { areaDataStore } from "@/utilities";

export default () => {
	return (
		<>
			<h1>Market Radar</h1>
			<h2 style="text-align: center">Latest Market Trends in {areaName}</h2>

			<HomeTypes container={`MarketRadar-${settings.areaid}`} />

			{!stats && <p>Sorry, but we have no stats for that period.</p>}
			{stats && (
				<div class="flexed-icons">
					<MRIcon
						icon="tag"
						value={stats.sold + stats.active + stats.pending}
						caption="homes available for sale"
						color="#b9be1c"
					/>
					<MRIcon
						icon="house"
						value={stats.sold}
						caption={`homes sold in last ${period} months`}
						color="#e4670e"
					/>
					<MRIcon
						icon="calendar"
						value={stats.avgDOM}
						caption="average days on market"
						color="#43abaa"
					/>
					<MRIcon
						icon="line-chart"
						value={window.gg.currency(stats.avgListPriceForSold)}
						caption="average listing price"
						color="#37c6e9"
					/>
					<MRIcon
						icon="ruler"
						value={window.gg.currency(stats.avgPricePerSqFt)}
						caption="average price/sq ft."
						color="#f8495d"
					/>
					<MRIcon
						icon="bar-chart"
						value={window.gg.currency(stats.maxSale.salePrice)}
						caption="highest sale price"
						color="#33c3e8"
					/>
					<MRIcon
						icon="bar-chart"
						value={window.gg.currency(stats.avgSalePrice)}
						caption="average sales price"
						color="#f8495d"
					/>
					<MRIcon
						icon="bar-chart"
						value={window.gg.currency(stats.medSalePrice)}
						caption="median sales price"
						color="#3ea9a7"
					/>
					<MRIcon
						icon="bar-chart"
						value={window.gg.currency(stats.minSale.salePrice)}
						caption="lowest sales price"
						color="#b9be1c"
					/>
					<MRIcon
						icon="tag"
						value={(12, 934)}
						caption={`total attached homes in ${areaName}`}
						color="#e4670e"
					/>
				</div>
			)}
		</>
	);
};
