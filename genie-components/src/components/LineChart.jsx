import { createResource } from "solid-js";

import "@/assets/css/charts.css";

let genieCharts;

export const LineChart = props => {
	const [charts] = createResource(loadCharts);

	return (
		<>
			{!charts.loading &&
				genieCharts.draw("90%", "70%", props.data, props.element)}
		</>
	);
};

const loadCharts = () =>
	new Promise(resolve => {
		if (!document.getElementById("genie-charts")) {
			var link = document.createElement("link");
			link.rel = "stylesheet";
			link.type = "text/css";
			link.href =
				"https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.css";
			document.head.appendChild(link);

			var script = document.createElement("script");
			script.src =
				"https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.js";
			script.id = "chartist-script";
			script.onload = () => {
				var gScript = document.createElement("script");
				gScript.src = `${window.gHub.siteUrl}_assets/_js/charts.js`;
				gScript.id = "genie-charts";

				gScript.onload = () => {
					genieCharts = window.genieChart.initCharts();
					resolve(true);
				};
				document.head.appendChild(gScript);
			};
			document.head.appendChild(script);
		} else {
			resolve(true);
		}
	});
