export * from "./rest";
export * from "./state";
export * from "./notify";


export const isIterable = input =>
	input === null || input === undefined
		? false
		: typeof input[Symbol.iterator] === "function";
  