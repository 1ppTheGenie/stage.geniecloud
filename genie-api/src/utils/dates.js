import { DateTime } from "luxon";

export const NOW = DateTime.local({ zone: "PST" });

export const dateFormat = (ts, format = "y-LL-d") =>
	DateTime.fromMillis(ts ?? NOW.toMillis()).toFormat(format);

export const dateAdd = (dt, period) => {
	if (typeof dt == "string") {
		dt = DateTime.fromISO(dt);
	} else if (typeof dt == "number") {
		dt = DateTime.fromMillis(dt);
	}

	return dt.plus(period);
};

export const timeAgo = period => dateAdd(NOW, period);
