document.addEventListener("DOMContentLoaded", function () {
	window.gHub.svg = document.getElementById("genie-wrapper");

	document.querySelectorAll("[data-width]").forEach(node => {
		const w = node.getAttribute("data-width");
		const h = node.getAttribute("data-height");

		const calcW = w
			? window.gHub.svg.viewBox.baseVal.width * (parseFloat(w) / 100)
			: null;
		const calcH = h
			? window.gHub.svg.viewBox.baseVal.height * (parseFloat(h) / 100)
			: null;

		if (node instanceof SVGElement) {
			if (w) node.setAttribute("width", calcW);
			if (h) node.setAttribute("height", calcH);
		} else {
			if (w) node.style.width = calcW + "px";
			if (h) node.style.height = calcH + "px";
		}
	});

	document
		.querySelectorAll("text[data-max-width],text[data-max-height]")
		.forEach(node => {
			window.gHub.scaleFont(node);
		});
} );

window.gHub = window.gHub ?? {};

window.gHub.scaleFont = node => {
	["width", "height"].forEach(direction => {
		let factor = node.getAttribute(`data-max-${direction}`) || 100;
		let textLength = node.getBoundingClientRect()[direction];
		let max =
			window.gHub.svg.getBoundingClientRect()[direction] *
			(parseFloat(factor) / 100);

		if (textLength > max) {
			let fontSize = getComputedStyle(node).fontSize;
			let sizeFactor = max / textLength;

			if (!node.getAttribute("data-old-font-size") && node.style.fontSize) {
				// Store the original fontsize, first time only
				node.setAttribute("data-old-font-size", node.style.fontSize);
			}
			node.style.fontSize = parseFloat(fontSize) * sizeFactor;

			return true;
		}
	});

	return false;
};

window.gHub.wordwrap = (str, width = 75, cut = false) => {
	if (!str) {
		return str;
	}

	var regex =
		".{1," + width + "}(s|$)" + (cut ? "|.{" + width + "}|.+$" : "|S+?(s|$)");

	return str.match(RegExp(regex, "g"));
};

window.gHub.htmlDecode = input => {
	if (input.replace(/\s+/g, "") === "") return input;
	const doc = new DOMParser().parseFromString(
		input.replace(/<[^>]+>/g, ""),
		"text/html"
	);
	return doc.documentElement ? doc.documentElement.textContent : input;
};

window.gHub.measure = (text, style) => {
	style = Object.assign(
		{
			"font-size": 10,
			"font-family": "sans-serif",
			"font-style": "normal",
			"font-weight": 400,
			"font-variant": "normal",
		},
		style
	);
	const font = [];
	font.push(style["font-style"]);
	font.push(style["font-variant"]);
	font.push(style["font-weight"]);
	font.push(
		typeof style["font-size"] === "string"
			? style["font-size"]
			: `${style["font-size"]}px`
	);
	font.push(style["font-family"]);

	const context = document.createElement("canvas").getContext("2d");
	context.font = font.join(" ");

	if (text instanceof Array)
		return text.map(t => context.measureText(window.gHub.htmlDecode(t)).width);
	return context.measureText(window.gHub.htmlDecode(text)).width;
};

window.gHub.scrollTo = id => {
	const y = document.getElementById(id).getBoundingClientRect().top;

	window.scrollTo({
		top: y + window.pageYOffset - 80,
		behavior: "smooth",
	});
};

window.gHub.currency = (n, abbr = true) =>
	new Intl.NumberFormat("en-US", {
		style: "currency",
		currency: "USD",
		maximumFractionDigits: n > 999999 && abbr ? 2 : 0,
		minimumFractionDigits: n > 999999 && abbr ? 2 : 0,
		notation: abbr ? "compact" : "standard",
	}).format(n);

window.gHub.percent = n =>
	new Intl.NumberFormat("en-US", {
		style: "percent",
		maximumFractionDigits: 2,
		minimumFractionDigits: 2,
	}).format(n);

window.gHub.number = n =>
	new Intl.NumberFormat("en-US", {
		maximumFractionDigits: 0,
		minimumFractionDigits: 0,
	}).format(n);

window.gHub.getCssVar = (name, el) =>
	getComputedStyle(el ?? document.body).getPropertyValue(name);

window.gHub.hex2rgba = (hex, alpha = 1) => {
	const re = hex.length === 6 || hex.length === 8 ? /\w\w/g : /\w/g;
	const [r, g, b] = hex.match(re).map(x => parseInt(x, 16));
	return `rgba(${r},${g},${b},${alpha})`;
};

window.gHub.circleURI = (color, caption = "", size = 12) => {
	const text =
		caption === ""
			? ""
			: `<text x="12" y="16" fill="#fff" text-anchor="middle" style="font-family:sans-serif;font-weight:800;font-size:12px">${caption}</text>`;

	const svg = `
	<svg xmlns="http://www.w3.org/2000/svg" width="${size * 2 + 4}" height="${
		size * 2 + 4
	}">
		<defs>
			<filter id="shadow" x="0" y="0" width="${size}" height="${size}">
				<feGaussianBlur in="SourceAlpha" stdDeviation="3" /> 
				<feOffset dx="2" dy="2" result="offsetblur" />
				<feComponentTransfer>
					<feFuncA type="linear" slope="0.5" />
				</feComponentTransfer>
				<feMerge> 
					<feMergeNode/> 
					<feMergeNode in="SourceGraphic" /> 
				</feMerge>
			</filter>
		</defs>
		<circle fill="${color}" cx="${size}" cy="${size}" r="${size}" filter="url(#shadow)" />
		${text}
	</svg>`;

	return "data:image/svg+xml," + encodeURIComponent(svg);
};

window.gHub.flagURI = (color, price) => {
	const svg = `
	<svg xmlns="http://www.w3.org/2000/svg" width="11" height="7.5" viewBox="0 0 110 75">
		<defs>
			<filter id="f1" x="0" y="0" width="12" height="12">
			<feGaussianBlur in="SourceAlpha" stdDeviation="5" /> 
			<feOffset dx="2" dy="2" result="offsetblur" />
			<feComponentTransfer>
			<feFuncA type="linear" slope="0.5" />
			</feComponentTransfer>
			<feMerge> 
			<feMergeNode/> 
			<feMergeNode in="SourceGraphic" /> 
			</feMerge>
			</filter>
		</defs>
		<path fill="${color}" stroke="#fff" stroke-width="3" filter="url(#f1)" d="M105.333,0.5H5.5c-2.75,0-5,2.25-5,5v38.333c0,2.75,2.25,5,5,5h38.733l10.101,20.834l12.152-20.834h38.848c2.75,0,5-2.25,5-5V5.5C110.333,2.75,108.083,0.5,105.333,0.5z" />

		<text x="55" y="35" style="font-size:28px;font-weight:bold;font-family:sans-serif" text-anchor="middle" fill="#FFFFFF">${price}</text>
	</svg>`;

	return "data:image/svg+xml," + encodeURIComponent(svg);
};

window.gHub.screenToSVG = (screenX, screenY) => {
	const p = window.gHub.svg.createSVGPoint();
	p.x = screenX;
	p.y = screenY;
	return p.matrixTransform(window.gHub.svg.getScreenCTM().inverse());
};

window.gHub.SVGToScreen = (svgX, svgY) => {
	const p = window.gHub.svg.createSVGPoint();
	p.x = svgX;
	p.y = svgY;
	return p.matrixTransform(window.gHub.svg.getScreenCTM());
};

window.gHub.SVGPercentToScreen = (percentX, percentY) => {
	const svgPoint = window.gHub.SVGPercentToUnits(percentX, percentY);

	return window.gHub.SVGToScreen(svgPoint.x, svgPoint.y);
};

window.gHub.SVGPercentToUnits = (percentX, percentY) => {
	const vBox = window.gHub.svg.viewBox.baseVal;

	return {
		x: vBox.width * (percentX / 100),
		y: vBox.height * (percentY / 100),
	};
};
