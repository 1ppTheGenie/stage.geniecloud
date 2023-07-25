import { areaDataStore, periodName, percent } from "@/utilities";

export const MarketComment = () => {
	return (
		<p style="margin: 2% 20%" classList={{ loading: areaDataStore.loading }}>
			The number of closed {areaDataStore.areaName} {areaDataStore.propertyTypeCaption} sales
			have <span class="blur">{areaDataStore.soldDelta < 0 ? "shrunk" : "increased"}</span> by{" "}
			<span class="blur">{percent(Math.abs(areaDataStore.soldDelta))}</span> in the last{" "}
			{periodName(areaDataStore.areaPeriod)} from{" "}
			<span class="blur">
				{areaDataStore.totalSoldLastPeriod} to {areaDataStore.totalSold}
			</span>
			.{" "}
			<Show when={!areaDataStore.loading}>
				{areaDataStore.soldDelta <= -0.05 && (
					<>
						This unusual reduction in listing inventory to the {areaDataStore.areaName}{" "}
						{areaDataStore.propertyTypeCaption} market creates a huge demand from
						buyers. If you're looking to sell your home for the highest possible price
						there has not been a better time.
					</>
				)}
				{areaDataStore.soldDelta >= 0.05 && (
					<>
						This increase in listing inventory to the {areaDataStore.areaName}{" "}
						{areaDataStore.propertyTypeCaption} market means more possible competition
						and if you're looking to sell make sure you choose the best REALTOR who
						knows how to maximize your home value.
					</>
				)}
				{areaDataStore.soldDelta > -0.05 && areaDataStore.soldDelta < 0.05 && (
					<>
						This shows the listing inventory to the {areaDataStore.areaName}{" "}
						{areaDataStore.propertyTypeCaption} market is steady and healthy. If you're
						looking to sell make sure you choose the best REALTOR who knows how to
						maximize your home value.
					</>
				)}
			</Show>
		</p>
	);
};
