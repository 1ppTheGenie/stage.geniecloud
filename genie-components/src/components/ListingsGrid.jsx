import { address } from "@/utilities";

export const ListingsGrid = ({ listings, mode, style }) => {
	mode = mode.toLowerCase();
	const bgColors = {
		active: "--active-green",
		new: "--new-blue",
		pending: "--pending-yellow",
		sold: "--sold-red",
	};

	return (
		<div id="listing-grid-view">
			{listings.map((l, i) => (
				<svg key={`${l.mlsNumber}:${l.latitude}:${l.longitude}`} viewBox="0 0 1500 800">
					<image
						width="100%"
						height="100%"
						preserveAspectRatio="xMinYMid slice"
						href={`/thumbnail?url=${l.photoPrimaryUrl}`}
					/>

					<circle
						cx="5%"
						cy="5%"
						r="5%"
						fill={`var(${bgColors[mode]})`}
						fillOpacity="0.75"
					/>
					<text font-size="120%">
						<tspan
							x="5%"
							y="4%"
							textAnchor="middle"
							fill="var(--theme-body-background)">
							{i + 1}
						</tspan>
					</text>

					<polygon
						points="275,0 424,0 0,425 0,275"
						fillOpacity="0.75"
						fill={`var(${bgColors[mode]})`}
					/>

					<text
						x="5%"
						y="5%"
						transform-origin="4% 4%"
						transform="rotate(-45)"
						fill="var(--theme-body-background)"
						textAnchor="middle">
						New! || Active || Sold || Pending
					</text>

					<clipPath id="polyClip1" clipPathUnits="objectBoundingBox">
						<path d="m 0 0 h 1 v 1 h -0.7 c -0.3 0 -0.3 0 -0.3 -1" />
					</clipPath>
					<rect
						x="50%"
						width="40%"
						height="30%"
						clip-path="url(#polyClip1)"
						fill={`var(${bgColors[mode]})`}
						fillOpacity="0.75"
					/>

					<text
						className="align-right"
						x="22%"
						y="1%"
						fill="var(--theme-body-background)">
						Asking
					</text>
					<text
						className="align-right"
						x="22%"
						y="4%"
						fill="var(--theme-body-background)">
						format-number(@listPrice, '$###,###')"
					</text>

					<rect
						y="85%"
						height="15%"
						width="100%"
						fill={`var(${bgColors[mode]})`}
						fillOpacity="0.75"
					/>

					<text
						x="11.25%"
						y="23.75%"
						fill="var(--theme-body-background)"
						textAnchor="middle">
						{address(l)}
					</text>
					<text
						x="11.25%"
						y="26.75%"
						fill="var(--theme-body-background)"
						textAnchor="middle">
						<tspan>{l.bedrooms}</tspan>
						<tspan>BR | </tspan>
						<tspan>{l.bathroomsTotal}</tspan>
						<tspan>BA | </tspan>
						{Intl.NumberFormat("en-US").format(l.sqft)}
						<tspan>SQFT</tspan>
					</text>
				</svg>
			))}
		</div>
	);
};

/*

{mode !== "Sold" && <td>{window. window.gHub.currency(l.priceHigh)}</td>}

<td></td>
<td></td>

{mode !== "Sold" && <td>{format(Date.parse(l.listDate), "m-d-Y")} </td>}

<td></td>

{mode === "Sold" && (
	<>
		<td>{window. window.gHub.currency(parseInt(l.priceHigh))}</td>
		<td>{window. window.gHub.currency(parseInt(l.salePrice))}</td>
		<td>{format(Date.parse(l.soldDate), "m-d-Y")}</td>
		<td>
			{window. window.gHub.currency(parseInt(l.salePrice) / parseInt(l.sqft))}
		</td>
	</>
)}

{mode !== "Sold" && (
	<td>{window. window.gHub.currency(parseInt(l.priceHigh) / parseInt(l.sqft))}</td>
)}
*/
