window.genieChart = {};

window.genieChart.merge = (target, source) => {
	// Iterate through `source` properties and if an `Object` set property to merge of `target` and `source` properties
	for (const key of Object.keys(source)) {
		try {
			if (source[key] instanceof Object)
				Object.assign(
					source[key],
					window.genieChart.merge(target[key], source[key])
				);
		} catch {}
	}

	// Join `target` and modified `source`
	Object.assign(target || {}, source);
	return target;
};

window.genieChart.number = value =>
	new Intl.NumberFormat("en-US", {
		style: "decimal",
		maximumFractionDigits: 0,
		minimumFractionDigits: 0,
	}).format(value);

window.genieChart.percent = (value, index, values) =>
	new Intl.NumberFormat("en-US", {
		style: "percent",
		maximumFractionDigits: 0,
		minimumFractionDigits: 0,
	}).format(value);

window.genieChart.dollar = (value, index, values) =>
	new Intl.NumberFormat("en-US", {
		style: "currency",
		currency: "USD",
		maximumFractionDigits: value > 9999999 ? 2 : 1,
		minimumFractionDigits: value > 9999999 ? 2 : 1,
		notation: "compact",
	}).format(value);

window.genieChart.dollarRound = value =>
	new Intl.NumberFormat("en-US", {
		style: "currency",
		currency: "USD",
		maximumFractionDigits: value > 999999 ? 2 : 0,
		minimumFractionDigits: value > 999999 ? 2 : 0,
		notation: "compact",
	}).format(value);

window.genieChart.draw = (width, height, overrides, chartDiv = "#svgChart") => {
	let containerWidth, containerHeight;
	let svg = document.querySelector("svg[viewBox]");
	if (svg) {
		containerWidth = svg.viewBox.baseVal.width;
		containerHeight = svg.viewBox.baseVal.height;
	} else {
		svg = document.querySelector(chartDiv);
		containerWidth = svg.offsetWidth;
		containerHeight = svg.offsetHeight;
	}

	const defaults = {
		chartPadding: {
			top: 15,
			right: 15,
			bottom: 15,
			left: 15,
		},
		fullWidth: true,
		width: containerWidth * (parseInt(width) / 100),
		height: containerHeight * (parseInt(height) / 100),
		plugins: [
			Chartist.plugins.wenkTips(),
			Chartist.plugins.ctAxisTitle({
				axisX: {
					axisTitle: overrides.options.axisX?.scaleLabel,
					axisClass: "ct-axis-title",
					labelOffset: {
						x: 0,
						y: 20,
					},
					textAnchor: "middle",
				},
				axisY: {
					axisTitle: overrides.options.axisY?.scaleLabel,
					axisClass: "ct-axis-title",
					offset: {
						x: 0,
						y: 0,
					},
					textAnchor: "middle",
					flipTitle: true,
				},
			}),
		],
	};

	const options = window.genieChart.merge(defaults, overrides.options);

	const paint = () => new Chartist.Line(chartDiv, overrides.data, options);
	paint();

	const resizeObserver = new ResizeObserver(paint);
	resizeObserver.observe(svg);
};

window.genieChart.initCharts = () => {
	if (window.gHub) {
		window.gHub.charts = genieChart;
	}

	/**
	 * Chartist.js plugin to display a title for 1 or 2 axes.
	 * version 0.0.7
	 * author: alex stanbury
	 */
	/* global Chartist */
	(function (Chartist) {
		"use strict";

		var axisDefaults = {
			axisTitle: "",
			axisClass: "ct-axis-title",
			offset: {
				x: 0,
				y: 0,
			},
			textAnchor: "middle",
			flipTitle: false,
		};

		var defaultOptions = {
			axisX: axisDefaults,
			axisY: axisDefaults,
		};

		var getTitle = function (title) {
			if (title instanceof Function) {
				return title();
			}
			return title;
		};

		var getClasses = function (classes) {
			if (classes instanceof Function) {
				return classes();
			}
			return classes;
		};

		Chartist.plugins = Chartist.plugins || {};

		Chartist.plugins.wenkTips = function (options) {
			options = Chartist.extend({}, defaultOptions, options);

			return function wenkTips(chart) {
				if (chart instanceof Chartist.Line) {
					chart.on("draw", data => {
						if (data.type === "point") {
							//console.log("z", data.element._node.dataset);
							data.element._node.dataset.wenk = "A tooltop value";

							data.element.outerHTML =
								'<circle cx="1500" cy="250" r="20" fill="red" />';
							//data.element.dataset = data.element.dataset || {};

							//data.element.dataset.testValue = "hello world";
							//data.element.setAttribute("data-wenk-pos", top);
							//							data.element.setAttribute("data-wenk", 32);
						}
					});
				}
			};
		};

		const defaultToolTipOptions = {
			currency: undefined,
			currencyFormatCallback: undefined,
			tooltipOffset: {
				x: 0,
				y: -20,
			},
			anchorToPoint: false,
			appendToBody: false,
			class: undefined,
			pointClass: "ct-point",
		};

		function show(element) {
			if (!hasClass(element, "tooltip-show")) {
				element.className = element.className + " tooltip-show";
			}
		}

		function hide(element) {
			var regex = new RegExp("tooltip-show" + "\\s*", "gi");
			element.className = element.className.replace(regex, "").trim();
		}

		function hasClass(element, className) {
			return (
				(" " + element.getAttribute("class") + " ").indexOf(
					" " + className + " "
				) > -1
			);
		}

		function next(element, className) {
			do {
				element = element.nextSibling;
			} while (element && !hasClass(element, className));
			return element;
		}

		function text(element) {
			return element.innerText || element.textContent;
		}

		Chartist.plugins.tooltip = function (options) {
			options = Chartist.extend({}, defaultToolTipOptions, options);

			return function tooltip(chart) {
				var tooltipSelector = options.pointClass;
				if (chart.constructor.name == Chartist.Bar.prototype.constructor.name) {
					tooltipSelector = "ct-bar";
				} else if (
					chart.constructor.name == Chartist.Pie.prototype.constructor.name
				) {
					// Added support for donut graph
					if (chart.options.donut) {
						tooltipSelector = "ct-slice-donut";
					} else {
						tooltipSelector = "ct-slice-pie";
					}
				}

				var $chart = chart.container;
				var $toolTip = $chart.querySelector(".chartist-tooltip");
				if (!$toolTip) {
					$toolTip = document.createElement("div");
					$toolTip.className = !options.class
						? "chartist-tooltip"
						: "chartist-tooltip " + options.class;
					if (!options.appendToBody) {
						$chart.appendChild($toolTip);
					} else {
						document.body.appendChild($toolTip);
					}
				}
				var height = $toolTip.offsetHeight;
				var width = $toolTip.offsetWidth;

				hide($toolTip);

				function on(event, selector, callback) {
					$chart.addEventListener(event, function (e) {
						if (!selector || hasClass(e.target, selector)) callback(e);
					});
				}

				on("mouseover", tooltipSelector, function (event) {
					var $point = event.target;
					var tooltipText = "";

					var isPieChart =
						chart instanceof Chartist.Pie ? $point : $point.parentNode;
					var seriesName = isPieChart
						? $point.parentNode.getAttribute("ct:meta") ||
						  $point.parentNode.getAttribute("ct:series-name")
						: "";
					var meta = $point.getAttribute("ct:meta") || seriesName || "";
					var hasMeta = !!meta;
					var value = $point.getAttribute("ct:value");

					if (
						options.transformTooltipTextFnc &&
						typeof options.transformTooltipTextFnc === "function"
					) {
						value = options.transformTooltipTextFnc(value);
					}

					if (options.tooltipFnc && typeof options.tooltipFnc === "function") {
						tooltipText = options.tooltipFnc(meta, value);
					} else {
						if (options.metaIsHTML) {
							var txt = document.createElement("textarea");
							txt.innerHTML = meta;
							meta = txt.value;
						}

						meta = '<span class="chartist-tooltip-meta">' + meta + "</span>";

						if (hasMeta) {
							tooltipText += meta + "<br>";
						} else {
							// For Pie Charts also take the labels into account
							// Could add support for more charts here as well!
							if (chart instanceof Chartist.Pie) {
								var label = next($point, "ct-label");
								if (label) {
									tooltipText += text(label) + "<br>";
								}
							}
						}

						if (value) {
							if (options.currency) {
								if (options.currencyFormatCallback != undefined) {
									value = options.currencyFormatCallback(value, options);
								} else {
									value =
										options.currency +
										value.replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,");
								}
							}
							value =
								'<span class="chartist-tooltip-value">' + value + "</span>";
							tooltipText += value;
						}
					}

					if (tooltipText) {
						$toolTip.innerHTML = tooltipText;
						setPosition(event);
						show($toolTip);

						// Remember height and width to avoid wrong position in IE
						height = $toolTip.offsetHeight;
						width = $toolTip.offsetWidth;
					}
				});

				on("mouseout", tooltipSelector, function () {
					hide($toolTip);
				});

				on("mousemove", null, function (event) {
					if (false === options.anchorToPoint) setPosition(event);
				});

				function setPosition(event) {
					height = height || $toolTip.offsetHeight;
					width = width || $toolTip.offsetWidth;
					var offsetX = -width / 2 + options.tooltipOffset.x;
					var offsetY = -height + options.tooltipOffset.y;
					var anchorX, anchorY;

					if (!options.appendToBody) {
						var box = $chart.getBoundingClientRect();
						var left = event.pageX - box.left - window.pageXOffset;
						var top = event.pageY - box.top - window.pageYOffset;

						if (
							true === options.anchorToPoint &&
							event.target.x2 &&
							event.target.y2
						) {
							anchorX = parseInt(event.target.x2.baseVal.value);
							anchorY = parseInt(event.target.y2.baseVal.value);
						}

						$toolTip.style.top = (anchorY || top) + offsetY + "px";
						$toolTip.style.left = (anchorX || left) + offsetX + "px";
					} else {
						$toolTip.style.top = event.pageY + offsetY + "px";
						$toolTip.style.left = event.pageX + offsetX + "px";
					}
				}
			};
		};

		Chartist.plugins.ctAxisTitle = function (options) {
			options = Chartist.extend({}, defaultOptions, options);

			return function ctAxisTitle(chart) {
				chart.on("created", function (data) {
					if (!options.axisX.axisTitle && !options.axisY.axisTitle) {
						throw new Error(
							"ctAxisTitle plugin - You must provide at least one axis title"
						);
					} else if (!data.axisX && !data.axisY) {
						throw new Error(
							"ctAxisTitle plugin can only be used on charts that have at least one axis"
						);
					}

					var xPos,
						yPos,
						title,
						chartPadding = Chartist.normalizePadding(data.options.chartPadding); // normalize the padding in case the full padding object was not passed into the options

					//position axis X title
					if (options.axisX.axisTitle && data.axisX) {
						xPos =
							data.axisX.axisLength / 2 +
							data.options.axisY.offset +
							chartPadding.left;

						yPos = 50;

						if (data.options.axisY.position === "end") {
							xPos -= data.options.axisY.offset;
						}

						if (data.options.axisX.position === "end") {
							yPos += data.axisY.axisLength;
						}

						title = new Chartist.Svg("text");
						title.addClass(getClasses(options.axisX.axisClass));
						title.text(getTitle(options.axisX.axisTitle));
						title.attr({
							x: xPos + options.axisX.offset.x,
							y: yPos + options.axisX.offset.y,
							"text-anchor": options.axisX.textAnchor,
						});

						data.svg.append(title, true);
					}

					//position axis Y title
					if (options.axisY.axisTitle && data.axisY) {
						xPos = 0;

						yPos = data.axisY.axisLength / 2 + chartPadding.top;

						if (data.options.axisX.position === "start") {
							yPos += data.options.axisX.offset;
						}

						if (data.options.axisY.position === "end") {
							xPos = data.axisX.axisLength;
						}

						var transform =
							"rotate(" +
							(options.axisY.flipTitle ? -90 : 90) +
							", " +
							xPos +
							", " +
							yPos +
							")";

						title = new Chartist.Svg("text");
						title.addClass(getClasses(options.axisY.axisClass));
						title.text(getTitle(options.axisY.axisTitle));
						title.attr({
							x: xPos + options.axisY.offset.x,
							y: yPos + options.axisY.offset.y,
							transform: transform,
							"text-anchor": options.axisY.textAnchor,
						});
						data.svg.append(title, true);
					}
				});
			};
		};
	})(Chartist);

	return window.genieChart;
};

document.addEventListener("DOMContentLoaded", window.genieChart.initCharts);
