import { address, currency } from "@/utilities";
import { createMemo, For } from "solid-js";

const bgColors = {
	active: "--active-green",
	new: "--new-blue",
	pending: "--pending-yellow",
	sold: "--sold-red",
};

const fallbackUrl = 'data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMSIgaGVpZ2h0PSIxIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciLz4=';

export const ListingsGrid = ({ listings, mode }) => {
	const fill = createMemo(() => `var(${bgColors[mode().toLowerCase()]})`);

	return (
		<div id="listing-grid-view">
			<For each={listings()}>
				{(l, i) => (
					<svg
						key={`${l.mlsNumber}:${l.latitude}:${l.longitude}`}
						viewBox="0 0 100 50">
						<image
							width="100%"
							height="100%"
							preserveAspectRatio="xMinYMid slice"
							href={l.photoPrimaryUrl}
							onError={e => {
								if ( e.target.getAttribute( "href" ) !== fallbackUrl ) {
									e.target.setAttribute( "href", fallbackUrl );
								}
							}}
						/>

						<circle cx="5" cy="5" r="3.5" fill={fill()} fill-opacity="0.6" />

						<text font-size="5"
								x="5"
								y="5"
							text-anchor="middle"
							dominant-baseline="middle"
								fill="#fff">
								{i() + 1}
						</text>

						<polygon
							points="275,0 424,0 0,425 0,275"
							fill-opacity="0.6"
							fill={fill()}
						/>

						{/*<!-- <text
							x="5%"
							y="5%"
							transform-origin="4% 4%"
							transform="rotate(-45)"
							fill="#fff"
							textAnchor="middle"
							dominant-baseline="middle">
							{mode} {/*New! || Active || Sold || Pending* /}
						</text>*/}

						<clipPath id="polyClip1" clipPathUnits="objectBoundingBox">
							<path d="m 0 0 h 1 v 1 h -0.7 c -0.3 0 -0.3 0 -0.3 -1" />
						</clipPath>
						<rect
							x="50%"
							width="50%"
							height="30%"
							clip-path="url(#polyClip1)"
							fill={fill()}
							fill-opacity="0.6"
						/>

						<text
							text-anchor="end"
							font-size="5"
							x="95"
							y="2"
							dominant-baseline="hanging"
							fill="#fff">
							{mode == 'Sold' ? 'Sold at' : 'Asking'}
						</text>
						<text
							text-anchor="end"
							font-size="7"
							x="95"
							y="8"
							dominant-baseline="hanging"
							fill="#fff">
							{currency(l.priceHigh)}

						</text>

						<g transform="translate(0,38)">
							<rect
								height="12"
								width="100"
								fill={`var(${bgColors[mode]})`}
								fill-opacity="0.6"
							/>
							<text
								x="50"
								y="4"
								fill="var(--theme-body-background)"
								text-anchor="middle"
								dominant-baseline="middle"
								font-size="5">
								{address(l)}
							</text>
							<text
								x="50"
								y="10"
								fill="var(--theme-body-background)"
								text-anchor="middle"
								dominant-baseline="middle"
								font-size="4">
								<tspan>{l.bedrooms}</tspan>
								<tspan>BR | </tspan>
								<tspan>{l.bathroomsTotal}</tspan>
								<tspan>BA | </tspan>
								{Intl.NumberFormat("en-US").format(l.sqft)}
								<tspan font-size="3"> SQFT</tspan>
							</text>
						</g>
					</svg>
				)}
			</For>
		</div>
	);
};
