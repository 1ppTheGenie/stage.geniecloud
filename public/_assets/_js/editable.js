window.genieIsEditing = true;

document.addEventListener("DOMContentLoaded", function () {
	const editing = {};
	const svg = document.getElementById("genie-wrapper");
	const ns = svg.getAttribute("xmlns");

	document.querySelectorAll("image, video").forEach(node => {
		node.addEventListener("click", e => {
			const msg = {
				type: "ImageEdited",
				name: node.getAttribute("data-name"),
			};
			window.parent.postMessage(msg, "*");
		});
	});

	window.addEventListener("paste", e => {
		let paste = (e.clipboardData || window.clipboardData).getData("text");

		paste = paste.replace(/(<([^>]+)>)/gi, "");

		const selection = window.getSelection();
		if (!selection.rangeCount) return false;
		selection.deleteFromDocument();
		selection.getRangeAt(0).insertNode(document.createTextNode(paste));

		e.preventDefault();
	});

	const postContentChange = (el, content) => {
		if (!el.getAttribute("data-name")) {
			return false;
		}

		const msg = {
			type: "ContentEdited",
			name: el.getAttribute("data-name"),
			value: content,
			default: el.getAttribute("data-default"),
		};
		window.parent.postMessage(msg, "*");
	};

	/**
	 *
	 * 	t.getComputedTextLength()
	 *	t.style.fontSize = ((parseFloat(t.style.fontSize) /100 * 0.8) * 100) + '%'
	 */
	document.querySelectorAll("[data-editable]").forEach(node => {
		node.addEventListener("click", e => {
			if (typeof node.getBBox === "function") {
				const rect = node.getBBox();
				let fo = document.createElementNS(ns, "foreignObject");
				fo.setAttribute("x", rect.x);
				fo.setAttribute("y", rect.y);
				fo.setAttribute("height", rect.height);
				fo.setAttribute("width", rect.width);

				const attrbs = ["class"];
				const styles = ["fontSize", "color"];
				attrbs.forEach(attr => fo.setAttribute(attr, node.getAttribute(attr)));
				styles.forEach(style => (fo.style[style] = node.style[style]));

				fo.classList.add("editing");
				editing.objectEl = fo;
				node.parentElement.appendChild(fo);

				const currentText = !node.hasChildNodes()
					? node.textContent
					: [...node.childNodes].map(child => child.textContent).join("\n");

				const el = document.createElement(node.getAttribute("data-element"));
				el.contentEditable = true;
				el.innerText = currentText;
				el.style.color = node.style.fill;

				fo.appendChild(el);
				el.focus();

				el.addEventListener("blur", e => {
					let newContent = el.innerText.split("\n");

					fo.parentNode.removeChild(fo);
					node.style.whiteSpace = "pre";
					fo = null;

					if (newContent.length === 1) {
						node.textContent = newContent[0];
						node.style.display = "block";

						if (!gg.scaleFont(node) && node.getAttribute("data-old-font-size")) {
							node.style.fontSize = node.getAttribute("data-old-font-size");
							gg.scaleFont(node);
						}
					} else {
						node.textContent = "";
						node.style.display = "block";
						let yOffset = 0;
						newContent.forEach((line, i) => {
							let ts = document.createElementNS(ns, "tspan");
							ts.textContent = line !== "" ? line : " ";
							ts.setAttribute("x", node.getAttribute("x"));
							ts.setAttribute("y", yOffset);
							node.appendChild(ts);
							yOffset += ts.getBBox().height;
						});
					}

					postContentChange(node, newContent);
				});

				node.style.display = "none";
			} else {
				editing.objectEl = node;
				node.contentEditable = true;

				node.addEventListener("blur", e => {
					postContentChange(node, node.innerHTML);
				});
			}
		});
	});

	window &&
		window.addEventListener("message", msg => {
			if (msg.data.type === "Customizations" && msg.data.values) {
				Object.keys(msg.data.values).forEach(key => {
					var el = document.querySelector(`[data-name="${key}"]`);

					if (el) {
						if (el.nodeName.toLowerCase() === "image") {
							el.setAttribute("href", msg.data.values[key]);
						} else if (el.nodeName.toLowerCase() === "video") {
							el.setAttribute("src", msg.data.values[key]);
						} else {
							el[key.startsWith("xml-") ? "innerHTML" : "textContent"] =
								msg.data.values[key];
						}
					}
				});
			}
		});

	document.querySelectorAll("[data-msg='social-post']").forEach(el => {
		const msg = {
			type: "social-post",
			name: el.getAttribute("data-name"),
			value: el.textContent,
		};
		window.parent.postMessage(msg, "*");
	});

	const genieSVG = document.getElementById("genie-wrapper");
	if (genieSVG) {
		const resizeObserver = new ResizeObserver(entries => {
			const cr = entries[0].contentRect;
			//console.log("cr", cr);
			if (cr.width > 0) {
				/*				const er = genieSVG.getAttribute("viewBox").split(" ").map(parseInt);
				const ratio = cr.width / cr.height;

				genieSVG.setAttribute(
					"viewBox",
					`0 0 ${er.width * ratio} ${er.height * (1 / ratio)}`
				);*/
				//genieSVG.setAttribute("viewBox", `0 0 ${cr.width} ${cr.height}`);
				resizeObserver.disconnect();
			}
		});

		resizeObserver.observe(genieSVG);
	}

	if (typeof captionOptions !== "undefined") {
		const pt = svg.createSVGPoint();

		const placeCaptionIcon = key => {
			let svgP;
			const el = document.getElementById(key);
			const icon = document.getElementById(`captionIcon-${key}`);
			const bounding = el.getBoundingClientRect();
			pt.x = bounding.x;
			pt.y = bounding.y;

			if (typeof el.getScreenCTM !== "undefined") {
				svgP = pt.matrixTransform(el.getScreenCTM().inverse());
			} else {
				svgP = pt;
			}

			icon.setAttribute("x", svgP.x - 30);
			icon.setAttribute("y", svgP.y);
		};

		Object.keys(captionOptions).forEach(key => {
			const el = document.getElementById(key);

			if (el) {
				const bounding = el.getBoundingClientRect();
				pt.x = bounding.x;
				pt.y = bounding.y;

				const icon = document.createElementNS(ns, "svg");
				icon.setAttribute("id", `captionIcon-${key}`);
				icon.setAttribute("viewBox", "0 0 384 512");
				icon.innerHTML =
					'<path fill="currentColor" d="M336 64h-53.88C268.9 26.8 233.7 0 192 0S115.1 26.8 101.9 64H48C21.5 64 0 85.48 0 112v352C0 490.5 21.5 512 48 512h288c26.5 0 48-21.48 48-48v-352C384 85.48 362.5 64 336 64zM96 392c-13.25 0-24-10.75-24-24S82.75 344 96 344s24 10.75 24 24S109.3 392 96 392zM96 296c-13.25 0-24-10.75-24-24S82.75 248 96 248S120 258.8 120 272S109.3 296 96 296zM192 64c17.67 0 32 14.33 32 32c0 17.67-14.33 32-32 32S160 113.7 160 96C160 78.33 174.3 64 192 64zM304 384h-128C167.2 384 160 376.8 160 368C160 359.2 167.2 352 176 352h128c8.801 0 16 7.199 16 16C320 376.8 312.8 384 304 384zM304 288h-128C167.2 288 160 280.8 160 272C160 263.2 167.2 256 176 256h128C312.8 256 320 263.2 320 272C320 280.8 312.8 288 304 288z" />';
				icon.setAttribute("width", 30);
				icon.setAttribute("height", 30);
				icon.setAttribute("class", "hoverIcon");
				el.after(icon);

				placeCaptionIcon(key);

				let index = 0;
				el.addEventListener("mouseover", () => {
					icon.style.display = "block";
				});
				el.addEventListener("mouseout", () => {
					setTimeout(() => {
						icon.style.display = "none";
					}, 1250);
				});

				icon.addEventListener("click", () => {
					if (index >= captionOptions[key].length) {
						index = 0;
					}

					el.textContent = captionOptions[key][index];

					postContentChange(el, el.textContent);

					placeCaptionIcon(key);

					index++;
				});
			}
		});
	}
});
