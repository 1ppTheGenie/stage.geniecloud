import { sharedEmbedStore, setSharedEmbedStore } from "@/utilities";

export const DataPeriod = () => {
	
	return (
		<select
			id="date-period"
			style="padding:0.33rem;border-radius:5px;"
			onChange={e => setSharedEmbedStore({ period: e.target.value })}
			value={isNaN(sharedEmbedStore.period) ? 12 : sharedEmbedStore.period}>
			<option value="12">Last 12 months</option>
			<option value="9">Last 9 months</option>
			<option value="6">Last 6 months</option>
			<option value="3">Last 3 months</option>
			<option value="1">Last month</option>
		</select>
	);
};
