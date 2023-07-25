//import { lazy } from "solid-js";
//import BarsIcon from "@/assets/bar-chart.svg";

export const MRIcon = props => {
	//const SVG = lazy(() => import(/* @vite-ignore */ `../assets/${icon}.svg`));

	return (
		<div class="mr-icon" style={props.style}>
			<div>{props.icon}</div>
			<div class="avg-text">{props.caption}</div>
			<div class="avg-value">{props.value}</div>
		</div>
	);
};
