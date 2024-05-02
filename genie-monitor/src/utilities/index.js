export * from "./rest";
export * from "./state";

export const isIterable = input =>
	input === null || input === undefined
		? false
		: typeof input[Symbol.iterator] === "function";
