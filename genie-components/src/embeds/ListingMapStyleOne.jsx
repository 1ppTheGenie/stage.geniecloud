import { Show } from "solid-js";
import { areaDataStore, listingsStore, usePagination, useSettings } from "@/utilities";
import { HomeTypes, MapListings, Pagination, ListingsShowing } from "@/components";
import { format } from "date-fns";

import "@/assets/css/listing-map-style-one.css";

export default () => {
	const { currentPage, setPage, pageOffset, pageSize } = usePagination();
	const settings = useSettings();
	const currentListings = () =>
		listingsStore.listings.slice(pageOffset(), pageOffset() + pageSize());
    
    const date = new Date();
    
    var day = date.toLocaleString('default', {day:'numeric', timeZone:'America/Los_Angeles'});
    var month = date.toLocaleString('default', {month:'long', timeZone:'America/Los_Angeles'});
    var year = date.toLocaleString('default', {year:'numeric', timeZone:'America/Los_Angeles'});
    var hour = date.toLocaleString('default', {hour:'numeric',hour12: false, timeZone:'America/Los_Angeles'});
    var minute = date.toLocaleString('default', {minute:'2-digit', timeZone:'America/Los_Angeles'});
    if(minute.length<2){
        minute = '0'+minute;
    }
    var ap = hour > 11? 'pm' : 'am';

    var date_time_text = month+' '+day+', '+year+' @ '+hour+':'+minute+ap;

	return (
		<div id="padded" style="padding: 1rem 0; width: 100%">
			<h1>
				LIVE HOT LIST OF HOMES FOR SALE
			</h1>
			
			<p class="current-date">- as of <span>{date_time_text}</span></p>
			
           
			<HomeTypes
				container={`ListingMapStyleOne-${settings.marketstatus}-${settings.areaid}`}
				showPeriod={settings.marketstatus === "sold"}
			/>
			<Show when={listingsStore.listings.length > 0}>
				<MapListings listings={currentListings()} style="margin-top: 30px" />

				<p class="filterTxt" style="font-size:13px; color: #fff;">
					<ListingsShowing
						pageSize={pageSize()}
						offset={pageSize() * currentPage()}
						len={listingsStore.listings.length}
						mode={settings.marketstatus}
						period={areaDataStore.areaPeriod}
					/>
				</p>

				<Pagination
					totalItems={listingsStore.listings.length}
					currentPage={currentPage()}
					pageChange={page => setPage(page)}
				/>

			</Show>
		</div>
	);
};
