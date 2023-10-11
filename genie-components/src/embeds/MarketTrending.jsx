import { Show } from "solid-js";
import { HomeTypes, MRIcon, Spinner } from "@/components";
import { areaDataStore, currency, percent } from "@/utilities";

import PriceLavel from "@/assets/price-level.svg";
import ClockGreen from "@/assets/clock-green.svg";
import UpGreen from "@/assets/up-green.svg";
import DnRed from "@/assets/dn-red.svg";

// Status home Icon
import homePlus from "@/assets/home-plus.svg";
import homeSpeaker from "@/assets/home-speaker.svg";
import homeDot from "@/assets/home-dot.svg";
import homeLock from "@/assets/home-lock.svg";

import "@/assets/css/market-trending.css";

export default () => {
	return (
		<>
			<h1 class="center upper">
				{areaDataStore.areaName} {areaDataStore.propertyTypeCaption}
			</h1>
			<h4 class="center upper">Market Trending</h4>

			<HomeTypes container={`MarketTrends-${areaDataStore.areaId}`} />

			<Show when={!areaDataStore.propertyStats && !areaDataStore.loading}>
				<p>Sorry, but we have no data for that period.</p>
			</Show>

			<div id="big-squares">
				<Show when={areaDataStore.propertyStats}>
					<StatusIcon
						caption={`New`.toUpperCase()}
						isLoading={areaDataStore.loading}
						count={areaDataStore.propertyStats.new}
						period="0-30 days"
					/>
					<StatusIcon
						caption={`Active`.toUpperCase()}
						isLoading={areaDataStore.loading}
						count={areaDataStore.propertyStats.active}
						period="Total"
					/>
					<StatusIcon
						caption={`Pending`.toUpperCase()}
						isLoading={areaDataStore.loading}
						count={areaDataStore.propertyStats.pending}
						period={`${areaDataStore.areaPeriod} months`}
					/>
					<StatusIcon
						caption={`Sold`.toUpperCase()}
						isLoading={areaDataStore.loading}
						count={areaDataStore.propertyStats.sold}
						period={`${areaDataStore.areaPeriod} months`}
					/>
				</Show>
			</div>

			<div class="trending-box">
				<Show when={areaDataStore.propertyStats}>
					<MRIcon
						icon={<ClockGreen />}
						isLoading={areaDataStore.loading}
						caption={`average days on market`.toUpperCase()}
						value={areaDataStore.propertyStats.avgDOM}
						color="var(--vivid-dark-4)"
					/>

					<MRIcon
						icon={
							areaDataStore.propertyStats.avgListPricePerSqFtPrevious -
								areaDataStore.propertyStats.avgListPricePerSqFt <=
							0 ? (
								<DnRed />
							) : (
								<UpGreen />
							)
						}
						isLoading={areaDataStore.loading}
						caption={`average list price per square foot`.toUpperCase()}
						value={currency(
							areaDataStore.propertyStats.avgPricePerSqFt *
								(areaDataStore.propertyStats.avgListPriceForSold /
									areaDataStore.propertyStats.avgSalePrice)
						)}
						color="var(--vivid-dark-4)"
					/>

					<MRIcon
						icon={
							areaDataStore.propertyStats.avgSoldPricePerSqFtPrevious -
								areaDataStore.propertyStats.avgSoldPricePerSqFt <=
							0 ? (
								<DnRed />
							) : (
								<UpGreen />
							)
						}
						isLoading={areaDataStore.loading}
						caption={`average sold price per square foot`.toUpperCase()}
						value={currency(areaDataStore.propertyStats.avgPricePerSqFt)}
						color="var(--vivid-dark-4)"
					/>

					<MRIcon
						icon={<PriceLavel />}
						caption={`average sale price to list price`.toUpperCase()}
						isLoading={areaDataStore.loading}
						value={percent(
							areaDataStore.propertyStats.avgSalePrice /
								areaDataStore.propertyStats.avgListPriceForSold
						)}
						color="var(--vivid-dark-4)"
					/>
				</Show>
			</div>
		</>
	);
};

const StatusIcon = props => {
	return (
		<svg
			version="1.1"
			xmlns="http://www.w3.org/2000/svg"
			width="150px"
			height="162px"
			viewBox="0 0 120 120">
			<path
				fill={`var(--${props.caption.toLowerCase()})`}
				d="M119.548,88c0,17.673-14.272,32-31.88,32H31.879C14.272,120,0,105.673,0,88V32C0,14.327,14.272,0,31.879,0
		h55.789c17.605,0,31.88,14.327,31.88,32V88z"
			/>
			<path
				fill="#fff4"
				d="M115.495,15.705C110.6,7.244,101.955,1.247,91.841,0H28.204C12.45,1.942,0.249,15.411,0.249,31.75v56
		c0,9.414,4.051,17.877,10.497,23.732C43.246,104.831,104.001,44.82,115.495,15.705z"
			/>

			<text
				x="10"
				y="20"
				font-family="sans-serif"
				fill="#fff"
				class="status-type"
				text-anchor="left"
				dominant-baseline="hanging">
				{props.caption}
			</text>

			<text
				x="10"
				font-family="sans-serif"
				fill="#fff"
				class="number-count"
				text-anchor="left"
				dominant-baseline="hanging">
				<Show when={!props.loading}>{props.count}</Show>
				<Show when={props.loading}>
					<Spinner />
				</Show>
			</text>

			{props.caption == "NEW" ? (
				<svg
					x="80"
					y="45"
					xmlns="http://www.w3.org/2000/svg"
					viewBox="0 0 500 500"
					width="33"
					height="33">
					<path
						fill="#fff"
						d="M252.81,172.92c-23.28-23.89-46.56-47.77-69.84-71.66L49.64,219.96v160.16h100.18v-93.5h28.28
                    c1.66-12.78,5.46-30,14.57-48.51C210.71,201.43,238.86,181.45,252.81,172.92z"
					/>
					<path
						fill="#fff"
						d="M273.54,162.76c-26.96-26.55-53.92-53.1-80.88-79.64c-5.42-5.32-14.06-5.44-19.63-0.27L31.86,213.83
                    c-2.79,2.59-7.05,2.77-10.05,0.42l-9.67-7.56c-3.75-2.93-4-8.52-0.52-11.77L173.07,43.86c5.54-5.19,14.19-5.1,19.63,0.19
                    c37.79,36.51,75.58,73.03,113.36,109.54C295.22,156.65,284.38,159.71,273.54,162.76z"
					/>
					<polygon
						fill="#fff"
						points="282.98,119.15 315.5,149.23 322,149.23 322,74.43 282.98,74.43 "
					/>
					<circle
						stroke="#fff"
						stroke-width="15"
						fill="transparent"
						cx="328.09"
						cy="309"
						r="156.04"
					/>
					<path
						fill="#fff"
						d="M328.09,181.32c-70.52,0-127.68,57.16-127.68,127.68s57.16,127.68,127.68,127.68S455.77,379.52,455.77,309
                    S398.6,181.32,328.09,181.32z M339.13,320.04v81.6h-22.08v-81.6h-81.6v-22.08h81.6v-81.6h22.08v81.6h81.6v22.08H339.13z"
					/>
				</svg>
			) : (
				""
			)}

			{props.caption == "SOLD" ? (
				<svg
					x="80"
					y="45"
					xmlns="http://www.w3.org/2000/svg"
					viewBox="0 0 500 500"
					width="33"
					height="33">
					<path
						fill="#fff"
						d="M252.81,172.92c-23.28-23.89-46.56-47.77-69.84-71.66L49.64,219.96v160.16h100.18v-93.5h28.28
                    c1.66-12.78,5.46-30,14.57-48.51C210.71,201.43,238.86,181.45,252.81,172.92z"
					/>
					<path
						fill="#fff"
						d="M269.97,158.98l-86.99-85.37L25.25,219.96c0,0-30.38,2.44-21.29-17.89L182.98,34.59l121.95,118.7L269.97,158.98
                    z"
					/>
					<polygon
						fill="#fff"
						points="282.98,119.15 315.5,149.23 322,149.23 322,74.43 282.98,74.43 "
					/>
					<circle
						fill-opacity="0"
						stroke="#fff"
						stroke-width="15"
						cx="332.53"
						cy="306.96"
						r="156.04"
					/>

					<path
						fill="#fff"
						d="M342.71,320.25c-1.05-4.57-4.72-7.58-9.5-7.97c-4.18-0.35-8.39,2.31-10.09,6.35
                        c-1.76,4.18-0.66,8.74,2.89,11.84c0.42,0.36,0.53,0.69,0.46,1.24c-0.53,4.49-1.03,8.99-1.52,13.49c-0.23,2.1,0.84,3.29,2.98,3.32
                        c1.58,0.02,3.15,0,4.73,0c1.62,0,3.23,0.03,4.85-0.01c2.05-0.04,3.1-1.26,2.88-3.3c-0.48-4.42-0.96-8.84-1.49-13.25
                        c-0.09-0.72,0.05-1.14,0.6-1.64C342.48,327.61,343.62,324.2,342.71,320.25z"
					/>
					<path
						fill="#fff"
						d="M353.3,280.2c-0.33-10.62-9.36-19.5-19.99-19.72c-11.83-0.24-21.21,8.84-21.35,20.69
                        c-0.04,3.11,0.03,6.23-0.03,9.34c-0.02,0.87,0.23,1.05,1.07,1.05c6.55-0.04,13.1-0.02,19.65-0.02s13.1-0.02,19.65,0.02
                        c0.85,0,1.07-0.2,1.06-1.06C353.31,287.07,353.41,283.63,353.3,280.2z"
					/>
					<path
						fill="#fff"
						d="M332.53,179.28c-70.52,0-127.68,57.16-127.68,127.68s57.16,127.68,127.68,127.68s127.68-57.16,127.68-127.68
                        S403.05,179.28,332.53,179.28z M379.62,318.9c0,13.15,0.01,26.29,0,39.44c0,4.64-2.08,8.03-6.18,10.21
                        c-1.01,0.54-2.12,0.39-3.16,0.68c-25.16,0-50.32,0-75.49,0c-5.86-1.12-9.1-5.07-9.1-11.12c0-20.75,0-41.5,0-62.25
                        c0-0.32,0-0.65,0-0.97c0.05-2.58,1.13-3.65,3.75-3.69c1.74-0.02,3.48,0.01,5.22-0.01c1.35-0.01,1.46-0.12,1.46-1.45
                        c0.01-3.16-0.05-6.31,0.01-9.47c0.19-9.4,3.63-17.48,10.06-24.29c5.23-5.55,11.64-9.06,19.09-10.63c3.31-0.69,6.68-0.61,10.03-0.5
                        c7.95,0.27,14.88,3.29,20.88,8.36c7.22,6.09,11.47,13.91,12.73,23.3c0.55,4.06,0.14,8.16,0.25,12.24c0.01,0.32,0,0.65,0,0.97
                        c0.03,1.34,0.12,1.45,1.46,1.46c1.78,0.02,3.56-0.02,5.34,0.01c2.51,0.05,3.62,1.15,3.63,3.68
                        C379.64,302.88,379.62,310.89,379.62,318.9z"
					/>
				</svg>
			) : (
				""
			)}

			{props.caption == "ACTIVE" ? (
				<svg
					x="80"
					y="45"
					xmlns="http://www.w3.org/2000/svg"
					viewBox="0 0 500 500"
					fill="#ffffff"
					width="33"
					height="33">
					<path
						fill="#fff"
						d="M252.81,172.92c-23.28-23.89-46.56-47.77-69.84-71.66L49.64,219.96v160.16h100.18v-93.5h28.28
                    c1.66-12.78,5.46-30,14.57-48.51C210.71,201.43,238.86,181.45,252.81,172.92z"
					/>
					<path
						fill="#fff"
						d="M273.54,162.76c-26.96-26.55-53.92-53.1-80.88-79.64c-5.42-5.32-14.06-5.44-19.63-0.27L31.86,213.83
                    c-2.79,2.59-7.05,2.77-10.05,0.42l-9.67-7.56c-3.75-2.93-4-8.52-0.52-11.77L173.07,43.86c5.54-5.19,14.19-5.1,19.63,0.19
                    c37.79,36.51,75.58,73.03,113.36,109.54C295.22,156.65,284.38,159.71,273.54,162.76z"
					/>
					<polygon
						fill="#fff"
						points="282.98,119.15 315.5,149.23 322,149.23 322,74.43 282.98,74.43 "
					/>
					<circle
						fill-opacity="0"
						stroke="#fff"
						stroke-width="15"
						cx="328.09"
						cy="309"
						r="156.04"
					/>
					<path
						fill="#fff"
						d="M338.14,287.78c-8.14-0.91-16-2.94-23.68-5.75c-14.91-5.45-28.35-13.53-40.99-23.02
                        c-0.41-0.31-0.74-0.85-1.4-0.77c0,27.64,0,55.24,0,82.91c0.19,0.01,0.25,0.04,0.28,0.02c2.23-1.61,4.44-3.25,6.7-4.82
                        c17.97-12.54,37.28-21.86,59.31-24.64c0.84-0.11,0.96-0.44,0.95-1.16c-0.02-7.14-0.03-14.29,0.01-21.43
                        C339.33,288.2,339.03,287.88,338.14,287.78z"
					/>
					<path
						fill="#fff"
						d="M328.09,183.42c-70.52,0-127.68,57.16-127.68,127.68s57.16,127.68,127.68,127.68s127.68-57.16,127.68-127.68
                        S398.6,183.42,328.09,183.42z M406.5,310.42c-0.72,2.15-1.32,4.35-2.81,6.17c-2.75,3.37-6.16,5.46-10.61,5.53
                        c-3.37,0.06-6.74,0.04-10.11,0.03c-0.73,0-1.18,0.03-0.91,0.99c3.04,10.62,2.44,21.15-0.67,31.65c-1.77,5.95-4.01,11.75-5.85,17.67
                        c-0.24,0.76-0.85,1.13-1.42,1.54c-3.49,2.52-7.52,3.58-11.71,4.06c-5.46,0.63-10.79,0.01-15.89-2.12c-2.63-1.1-4.88-2.71-6.54-5.11
                        c-0.6-0.87-0.63-1.36,0.3-2.07c3.45-2.63,6.74-5.45,9.38-8.96c3.25-4.32,3.55-8.85,1.17-13.63c-0.24-0.48-0.65-0.89-0.09-1.49
                        c5.72-5.96,3.15-16.61-4.75-20.93c-1.79-0.98-3.57-1.23-5.57-0.99c-15.53,1.88-29.75,7.42-43.19,15.22
                        c-8.53,4.96-16.52,10.68-24.11,16.97c-0.96,0.79-1.86,0.89-2.95,0.69c-5.29-0.99-9.2-5.39-9.26-10.82
                        c-0.11-10.31-0.04-20.62-0.05-30.93c0-0.15,0-0.31,0-0.46c0-2.28,0-2.28-2.19-2.66c-5.37-0.94-9.25-5.93-9.02-11.61
                        c0.22-5.37,4.63-10.07,9.95-10.46c1.16-0.08,1.27-0.54,1.27-1.5c-0.03-10.52-0.03-21.03-0.01-31.55
                        c0.01-5.67,3.23-10.08,8.26-11.49c1.74-0.49,3.09-0.32,4.6,0.93c12.49,10.28,25.92,19.07,41.03,25.09
                        c11.86,4.73,24.14,7.29,36.96,7.2c13.32-0.09,26.65-0.02,39.97-0.02c7.67,0,12.92,4.24,14.57,11.73c0.02,0.08,0.14,0.13,0.21,0.19
                        C406.5,296.33,406.5,303.37,406.5,310.42z"
					/>
				</svg>
			) : (
				""
			)}

			{props.caption == "PENDING" ? (
				<svg
					x="80"
					y="45"
					xmlns="http://www.w3.org/2000/svg"
					viewBox="0 0 500 500"
					width="33"
					height="33">
					<path
						fill="#fff"
						d="M252.81,172.92c-23.28-23.89-46.56-47.77-69.84-71.66L49.64,219.96v160.16h100.18v-93.5h28.28
                    c1.66-12.78,5.46-30,14.57-48.51C210.71,201.43,238.86,181.45,252.81,172.92z"
					/>
					<path
						fill="#fff"
						d="M269.97,158.98l-86.99-85.37L25.25,219.96c0,0-30.38,2.44-21.29-17.89L182.98,34.59l121.95,118.7L269.97,158.98
                    z"
					/>
					<polygon
						fill="#fff"
						points="282.98,119.15 315.5,149.23 322,149.23 322,74.43 282.98,74.43 "
					/>
					<circle
						fill-opacity="0"
						stroke="#fff"
						stroke-width="15"
						cx="332.72"
						cy="306.97"
						r="156.04"
					/>
					<path
						fill="#fff"
						d="M332.47,180.62c-70.17,0-127.05,56.88-127.05,127.05s56.88,127.05,127.05,127.05s127.05-56.88,127.05-127.05
                    S402.64,180.62,332.47,180.62z M255.46,333.23c-13.58,0-24.59-11.01-24.59-24.59c0-13.58,11.01-24.59,24.59-24.59
                    c13.58,0,24.59,11.01,24.59,24.59C280.05,322.22,269.04,333.23,255.46,333.23z M329.52,332.56c-13.58,0-24.59-11.01-24.59-24.59
                    c0-13.58,11.01-24.59,24.59-24.59s24.59,11.01,24.59,24.59C354.11,321.55,343.1,332.56,329.52,332.56z M407.46,331.23
                    c-13.58,0-24.59-11.01-24.59-24.59c0-13.58,11.01-24.59,24.59-24.59c13.58,0,24.59,11.01,24.59,24.59
                    C432.05,320.22,421.04,331.23,407.46,331.23z"
					/>
				</svg>
			) : (
				""
			)}

			<g>
				<path
					fill="#0003"
					d="M7.083,83.672v8.562c0,10.09,8.178,18.267,18.266,18.267h69.069c10.089,0,18.266-8.177,18.266-18.267
			v-8.562H7.083z"
				/>
				<line
					fill="none"
					stroke="#0006"
					stroke-width="2"
					x1="7.083"
					y1="82.87"
					x2="112.527"
					y2="82.87"
				/>
				<text
					x="60"
					y="90"
					font-family="sans-serif"
					font-size="15"
					class="date"
					fill="#fff"
					dominant-baseline="hanging"
					text-anchor="middle">
					{props.period}
				</text>
			</g>
		</svg>
	);
};
