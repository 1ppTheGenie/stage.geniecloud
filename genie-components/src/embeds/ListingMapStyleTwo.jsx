import { format } from "date-fns";
import {
	HomeTypes,
	LeafletMap,
	GeoArea,
	ListingsTable,
	ListingsShowing,
	Pagination,
	CircleMarker,
} from "@/components";
import {
	areaDataStore,
	listingsStore,
	usePagination,
	filterListings,
} from "@/utilities";

export default () => {
	const { currentPage, setPage, pageOffset, pageSize } = usePagination({});

	useEffect(() => {
		setPage(1);
	}, [period, setPage]);

	const currentListings = filterListings(
		listings,
		propertyTypeID,
		period,
		settings.mode
	);
	const visibleListings = currentListings.slice(
		pageOffset,
		pageOffset + pageSize
	);
	const color = window.window.gg
		.getCssVar(`--${settings.mode.toLowerCase()}`, document.body)
		.trim();

	let icon, subtitle;
	switch (settings.mode.toLowerCase()) {
		case "active":
			icon = "home-speaker";
			subtitle = "Active Listings";
			break;
		case "pending":
			icon = "home-dot";
			subtitle = "Pending Listings";
			break;
		default:
			icon = "home-speaker";
			subtitle = `${period} Month Sales`;
			break;
	}

	return (
		<>
			<div style={{ display: "flex", width: "100%", marginBottom: 0 }}>
				<svg
					style={{ width: "8vw", height: "8vw", marginRight: "2rem" }}
					viewBox="0 0 200 200">
					<rect
						width="100%"
						height="100%"
						rx="15"
						fillOpacity="100%"
						fill={color}
					/>

					<path
						d="M0 0 L0 140 L160 0 Z"
						fill="var(--theme-body-background)"
						fillOpacity="0.1"
					/>

					<text
						x="5%"
						y="10%"
						font-size="165%"
						font-weight="bold"
						dominantBaseline="hanging"
						style="text-transform: uppercase"
						fill="var(--theme-body-background)">
						{settings.mode}
					</text>

					<text
						x="5%"
						y="30%"
						font-weight="900"
						font-size="400%"
						dominantBaseline="hanging"
						fill="var(--theme-body-background)">
						{currentListings.length}
					</text>

					<image
						x="60%"
						y="35%"
						width="35%"
						preserveAspectRatio="xMidYMid meet"
						href={`/_assets/_img/icons/${icon}.svg`}
					/>

					<rect
						id="rounded-rect"
						width="12%"
						height="5%"
						fill="var(--theme-heading-color)"
						fillOpacity="0.1"
						y="19%"
						x="1%"
						rx="0.5%"
					/>

					<text
						x="50%"
						y="90%"
						fill="var(--theme-body-background)"
						font-size="180%"
						font-weight="bold"
						textAnchor="middle">
						{format(new Date(), "MMM yyyy")}
					</text>
				</svg>
				<div>
					<h2
						class="upper"
						style={`margin-bottom: 0.5rem; font-size: 220%; font-weight: 99; align-self: self-start; color: ${color}`}>
						{areaName}
					</h2>
					<h4
						class="upper"
						style={`margin: 0.5rem 0; font-weight: 300; align-self: self-start; color: ${color}`}>
						Market Report
					</h4>
				</div>
				<div
					style={{
						textAlign: "right",
						flexGrow: 1,
						color: color,
						alignSelf: "flex-end",
						textTransform: "uppercase",
					}}>
					<h3 style="font-size: 175%">{subtitle}</h3>
					<h4 style="font-weight: 300; font-size: 100%; color: var(--theme-body-color)">
						{format(new Date(), "EEEE, MMMM d, yyyy")}
					</h4>
				</div>
			</div>

			<HomeTypes
				container={`MarketActivity-${settings.areaid}`}
				style="margin: 0.5rem"
				showPeriod={settings.mode.toLowerCase() === "sold"}
			/>

			<div
				style={{
					position: "relative",
					width: `100%`,
					display: "grid",
					gridTemplateColumns: "300px 1fr",
					borderRadius: "15px",
					border: "2px solid",
					borderColor: color,
					marginBottom: "0.25rem",
				}}>
				<LeafletMap
					mapStyle={settings.mapstyle || "satellite-streets-v11"}
					zoomControl={true}
					style={{
						width: `100%`,
						height: `100%`,
						borderRadius: "15px",
					}}>
					<GeoArea
						areaID={settings.areaid}
						style={{
							color: "#feff00",
							fillOpacity: 0,
						}}
					/>
					{visibleListings &&
						visibleListings.map((l, i) => (
							<CircleMarker
								color={color}
								caption={pageOffset * pageSize + i + 1}
								key={i + pageOffset * pageSize}
								position={[l.latitude, l.longitude]}
							/>
						))}
				</LeafletMap>
				<ListingsTable
					mode={settings.mode}
					listings={visibleListings}
					style={{
						width: "100%",
						color: "var(--theme-body-color)",
						borderRadius: "15px",
					}}
				/>
			</div>

			<div
				style={{
					display: "flex",
					justifyContent: "space-between",
					flexDirection: "row",
					margin: 0,
					width: "100%",
				}}>
				<div style="font-size:80%">
					<ListingsShowing
						pageSize={pageSize}
						offset={pageOffset}
						len={currentListings.length}
						mode={settings.mode}
						period={period}
					/>
					<br />
					DOM: Days On Market
				</div>
				<Pagination
					totalItems={currentListings.length}
					currentPage={currentPage}
					pageChange={page => setPage(page)}
					style="align-self:flex-end; margin: 0.25rem 0"
				/>
			</div>
		</>
	);
};
