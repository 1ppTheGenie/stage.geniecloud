/* @refresh reload */
import { render } from "solid-js/web";
import { lazy } from "solid-js";

// Generic js actions that run on all pages
const genericJS = () => {
	if (
		document.querySelectorAll("html.genie-landing-page,html.genie-collection")
			.length > 0
	) {
		const div = document.createElement("div");
		div.id = "genie-landing";
		document.body.appendChild(div);

		const Landing = lazy(() => import("@/landing/_LandingPages"));

		render(Landing, document.getElementById("genie-landing"));
	}

	if (document.querySelectorAll("div.genie-embed").length > 0) {
		const div = document.createElement("div");
		div.id = "genie-embeds";
		document.body.appendChild(div);

		const Genies = lazy(() => import("@/embeds/_Genies"));

		render(Genies, document.getElementById("genie-embeds"));

		document.dispatchEvent(new Event("genie-embeds-loaded"), true);
	}
};

console.log("Hello from Genie Hub");

if (
	document.readyState === "complete" ||
	document.readyState === "interactive"
) {
	genericJS();
} else {
	window.addEventListener("DOMContentLoaded", genericJS);
}

document.addEventListener("trigger-genie-load", genericJS);
