var gg = {};

document.addEventListener("DOMContentLoaded", function () {
	gg.svg = document.getElementById("genie-wrapper");

	document.querySelectorAll("[data-width]").forEach(node => {
		const w = node.getAttribute("data-width");
		const h = node.getAttribute("data-height");

		const calcW = w ? gg.svg.viewBox.baseVal.width * (parseFloat(w) / 100) : null;
		const calcH = h ? gg.svg.viewBox.baseVal.height * (parseFloat(h) / 100) : null;

		if (node instanceof SVGElement) {
			if (w) node.setAttribute("width", calcW);
			if (h) node.setAttribute("height", calcH);
		} else {
			if (w) node.style.width = calcW + "px";
			if (h) node.style.height = calcH + "px";
		}
	});

	document.querySelectorAll("text[data-max-width],text[data-max-height]").forEach(node => {
		gg.scaleFont(node);
	});
});

gg.scaleFont = node => {
	["width", "height"].forEach(direction => {
		let factor = node.getAttribute(`data-max-${direction}`) || 100;
		let textLength = node.getBoundingClientRect()[direction];
		let max = gg.svg.getBoundingClientRect()[direction] * (parseFloat(factor) / 100);

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

gg.wordwrap = (str, width = 75, cut = false) => {
	if (!str) {
		return str;
	}

	var regex = ".{1," + width + "}(s|$)" + (cut ? "|.{" + width + "}|.+$" : "|S+?(s|$)");

	return str.match(RegExp(regex, "g"));
};

gg.htmlDecode = input => {
	if (input.replace(/\s+/g, "") === "") return input;
	const doc = new DOMParser().parseFromString(input.replace(/<[^>]+>/g, ""), "text/html");
	return doc.documentElement ? doc.documentElement.textContent : input;
};

gg.measure = (text, style) => {
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
		typeof style["font-size"] === "string" ? style["font-size"] : `${style["font-size"]}px`
	);
	font.push(style["font-family"]);

	const context = document.createElement("canvas").getContext("2d");
	context.font = font.join(" ");

	if (text instanceof Array) return text.map(t => context.measureText(gg.htmlDecode(t)).width);
	return context.measureText(gg.htmlDecode(text)).width;
};

/*
gg.reportWindowSize = () => {
	let genieSVG = document.getElementById("genie-wrapper");
	let div = document.querySelector(".fullsize");

	if (div || genieSVG) {
		if (genieSVG) {
			genieSVG.setAttribute("viewBox", `0 0 ${window.innerWidth} ${window.innerHeight}`);
		}

		if (div) {
			div.style.width = window.innerWidth + "px";
			div.style.height = window.innerHeight + "px";
		}
	} else {
		window.removeEventListener("resize", gg.reportWindowSize);
	}
	window.removeEventListener("load", gg.reportWindowSize);
};
window.addEventListener("resize", gg.reportWindowSize);
window.addEventListener("load", gg.reportWindowSize);*/

gg.scrollTo = id => {
	const y = document.getElementById(id).getBoundingClientRect().top;

	window.scrollTo({
		top: y + window.pageYOffset - 80,
		behavior: "smooth",
	});
};

gg.currency = (n, abbr = true) =>
	new Intl.NumberFormat("en-US", {
		style: "currency",
		currency: "USD",
		maximumFractionDigits: n > 999999 && abbr ? 2 : 0,
		minimumFractionDigits: n > 999999 && abbr ? 2 : 0,
		notation: abbr ? "compact" : "standard",
	}).format(n);

gg.percent = n =>
	new Intl.NumberFormat("en-US", {
		style: "percent",
		maximumFractionDigits: 2,
		minimumFractionDigits: 2,
	}).format(n);

gg.number = n =>
	new Intl.NumberFormat("en-US", {
		maximumFractionDigits: 0,
		minimumFractionDigits: 0,
	}).format(n);

gg.getCssVar = (name, el) => getComputedStyle(el ?? document.body).getPropertyValue(name);

gg.hex2rgba = (hex, alpha = 1) => {
	const re = hex.length === 6 || hex.length === 8 ? /\w\w/g : /\w/g;
	const [r, g, b] = hex.match(re).map(x => parseInt(x, 16));
	return `rgba(${r},${g},${b},${alpha})`;
};

gg.circleURI = (color, caption = "", size = 12) => {
	const text =
		caption === ""
			? ""
			: `<text x="12" y="16" fill="#fff" text-anchor="middle" style="font-family:sans-serif;font-weight:800;font-size:12px">${caption}</text>`;

	const svg = `
	<svg xmlns="http://www.w3.org/2000/svg" width="${size * 2 + 4}" height="${size * 2 + 4}">
		<defs>
			<filter id="shadow" x="0" y="0" width="${size}" height="${size}">
				<feGaussianBlur in="SourceAlpha" stdDeviation="3"/> 
				<feOffset dx="2" dy="2" result="offsetblur"/>
				<feComponentTransfer>
					<feFuncA type="linear" slope="0.5"/>
				</feComponentTransfer>
				<feMerge> 
					<feMergeNode/> 
					<feMergeNode in="SourceGraphic"/> 
				</feMerge>
			</filter>
		</defs>
		<circle fill="${color}" cx="${size}" cy="${size}" r="${size}" filter="url(#shadow)" />
		${text}
	</svg>`;

	return "data:image/svg+xml," + encodeURIComponent(svg);
};

gg.flagURI = (color, price) => {
	const svg = `
	<svg xmlns="http://www.w3.org/2000/svg" width="11" height="7.5" viewBox="0 0 110 75">
		<defs>
			<filter id="f1" x="0" y="0" width="12" height="12">
			<feGaussianBlur in="SourceAlpha" stdDeviation="5"/> 
			<feOffset dx="2" dy="2" result="offsetblur"/>
			<feComponentTransfer>
			<feFuncA type="linear" slope="0.5"/>
			</feComponentTransfer>
			<feMerge> 
			<feMergeNode/> 
			<feMergeNode in="SourceGraphic"/> 
			</feMerge>
			</filter>
		</defs>
		<path fill="${color}" stroke="#fff" stroke-width="3" filter="url(#f1)" d="M105.333,0.5H5.5c-2.75,0-5,2.25-5,5v38.333c0,2.75,2.25,5,5,5h38.733l10.101,20.834l12.152-20.834h38.848c2.75,0,5-2.25,5-5V5.5C110.333,2.75,108.083,0.5,105.333,0.5z"/>

		<text x="55" y="35" style="font-size:28px;font-weight:bold;font-family:sans-serif" text-anchor="middle" fill="#FFFFFF">${price}</text>
	</svg>`;

	return "data:image/svg+xml," + encodeURIComponent(svg);
};

gg.screenToSVG = (screenX, screenY) => {
	const p = gg.svg.createSVGPoint();
	p.x = screenX;
	p.y = screenY;
	return p.matrixTransform(gg.svg.getScreenCTM().inverse());
};

gg.SVGToScreen = (svgX, svgY) => {
	const p = gg.svg.createSVGPoint();
	p.x = svgX;
	p.y = svgY;
	return p.matrixTransform(gg.svg.getScreenCTM());
};

gg.SVGPercentToScreen = (percentX, percentY) => {
	const svgPoint = gg.SVGPercentToUnits(percentX, percentY);

	return gg.SVGToScreen(svgPoint.x, svgPoint.y);
};

gg.SVGPercentToUnits = (percentX, percentY) => {
	const vBox = gg.svg.viewBox.baseVal;

	return { x: vBox.width * (percentX / 100), y: vBox.height * (percentY / 100) };
};
