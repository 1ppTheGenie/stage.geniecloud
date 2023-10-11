document.addEventListener(`DOMContentLoaded`, () => {
	const getHeaderValues = async url => {
		try {
			const response = await fetch(url);

			return response.status == 200;
			/*
			const headers = response.headers;

			// Convert headers to an object for easier access
			const headerValues = {};
			headers.forEach((value, name) => {
				headerValues[name] = value;
			});

			return headerValues;
			*/
		} catch (error) {
			// Not worried about errors in this context
			return null;
		}
	};

	const getRenderUpdate = async () => {
		const renderKeyAttrib = "data-renderkey";

		await Promise.all(
			Array.from(document.querySelectorAll(`[${renderKeyAttrib}]`)).map(
				async el => {
					let linkUrl = `/${el.dataset.renderkey}`;
					let imageUrl;

					switch (true) {
						case linkUrl.endsWith("html"):
							imageUrl = linkUrl.replace("index.html", "grab-1.webp");
							break;
						case linkUrl.endsWith("pdf"):
							imageUrl = linkUrl.replace(".pdf", "-grab-1.webp");
							break;
						default:
							imageUrl = linkUrl;
					}

					const headers = await getHeaderValues(imageUrl);

					const children = [];

					const h4 = document.createElement("h4");
					h4.innerHTML = el.dataset.title;
					children.push(h4);

					if (headers) {
						if (
							linkUrl.endsWith("png") ||
							linkUrl.endsWith("webp") ||
							linkUrl.endsWith("html")
						) {
							const a = document.createElement("a");
							a.setAttribute("target", "_blank");
							a.href = linkUrl;

							let child = new Image();
							child.title = "1st Thumbnail";
							child.src = imageUrl;
							a.appendChild(child);

							children.push(a);
						} else if (linkUrl.endsWith("pdf")) {
							const div = document.createElement("div");
							div.classList.add("overlap");

							const a = document.createElement("a");
							a.setAttribute("target", "_blank");
							a.href = linkUrl;
							let child = new Image();
							child.title = "1st Thumbnail";
							child.src = imageUrl;
							a.appendChild(child);

							child = new Image();
							child.title = "2nd Thumbnail";
							child.src = imageUrl.replace("-grab-1", "-grab-2");
							a.appendChild(child);

							div.appendChild(a);
							children.push(div);
						}

						const div = document.createElement("div");
						div.classList.add("asset-links");

						let a = document.createElement("a");
						a.setAttribute("target", "_blank");
						a.classList.add("download");
						a.classList.add("view");
						a.href = linkUrl;
						div.appendChild(a);

						if (!linkUrl.endsWith("html")) {
							a = document.createElement("a");
							a.classList.add("download");
							a.onclick = e => {
								e.preventDefault();
								downloadFile(linkUrl);
								//console.log("File download", linkUrl);
							};
							a.href = "#";
							div.appendChild(a);
						}

						children.push(div);
					}

					if (children.length) {
						el.innerHTML = "";

						// In case it's just the title
						if (children.length > 1) {
							el.removeAttribute(renderKeyAttrib);
							el.removeAttribute(renderKeyAttrib);
						} else {
							let s = document.createElement("span");
							s.classList.add("rendering-spinner");

							children.push(s);
						}
						children.forEach(c => el.appendChild(c));
					}
				}
			)
		);

		if (document.querySelectorAll(`[${renderKeyAttrib}]`).length) {
			setTimeout(getRenderUpdate, 1000);
		}
	};
	getRenderUpdate();
});

const downloadFile = url => {
	fetch(url, { method: "get", mode: "no-cors", referrerPolicy: "no-referrer" })
		.then(res => res.blob())
		.then(res => {
			const aElement = document.createElement("a");
			const href = URL.createObjectURL(res);

			aElement.href = href;
			aElement.setAttribute("download", url.split("/").reverse()[0]);
			aElement.setAttribute("target", "_blank");
			aElement.click();

			URL.revokeObjectURL(href);
		});
};

/*			<h4>
				<xsl:value-of select="@name"/>
				<xsl:if test="count($asset/image/@rendering) &gt; 0">
					<span class="rendering-spinner" />
				</xsl:if>
			</h4>

			<xsl:choose>
				<xsl:when test="count($asset/image) &gt; 1">
					<div class="overlap">
						<a target="_blank">
							<xsl:attribute name="href">
								<xsl:choose>
									<xsl:when test="$asset/@href != ''">
										<xsl:value-of select="$asset/@href" />
									</xsl:when>
									<xsl:when test="$asset/@link != ''">
										<xsl:value-of select="$asset/@link" />

									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="'https://thegenie.ai/'" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
							<img title="1st Thumbnail">
								<xsl:attribute name="src">
									<xsl:value-of select="$asset/image[1]/@src" />
								</xsl:attribute>
								<xsl:if test="$asset/image[1]/@rendering = '1'">
									<xsl:attribute name="data-update-render">
										<xsl:value-of select="1" />
									</xsl:attribute>
									<xsl:attribute name="data-image-render-id">
										<xsl:value-of select="$asset/@renderKey" />
									</xsl:attribute>
								</xsl:if>
							</img>
							<img title="2nd Thumbnail">
								<xsl:attribute name="src">
									<xsl:value-of select="$asset/image[2]/@src" />
								</xsl:attribute>
								<xsl:if test="$asset/image[2]/@rendering = '1'">
									<xsl:attribute name="data-update-render">
										<xsl:value-of select="2" />
									</xsl:attribute>
									<xsl:attribute name="data-image-render-id">
										<xsl:value-of select="$asset/@renderKey" />
									</xsl:attribute>
								</xsl:if>
							</img>
						</a>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<a target="_blank">
						<xsl:attribute name="href">
							<xsl:choose>
								<xsl:when test="$asset/@href != ''">
									<xsl:value-of select="$asset/@href" />
								</xsl:when>
								<xsl:when test="$asset/@link != ''">
									<xsl:value-of select="$asset/@link" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="'https://thegenie.ai/'" />

								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
						<img title="1st Thumbnail">
							<xsl:attribute name="src">
								<xsl:value-of select="$asset/image[1]/@src" />
							</xsl:attribute>
							<xsl:if test="$asset/image[1]/@rendering = '1'">
								<xsl:attribute name="data-update-render">
									<xsl:value-of select="1" />
								</xsl:attribute>
								<xsl:attribute name="data-image-render-id">
									<xsl:value-of select="$asset/@renderKey" />
								</xsl:attribute>
							</xsl:if>
						</img>
					</a>
				</xsl:otherwise>
			</xsl:choose>

			<div>
				<xsl:attribute name="class">
					<xsl:choose>
						<xsl:when test="$asset/image[1]/@rendering = '1'">
							<xsl:value-of select="'asset-links hidden'" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'asset-links'" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<a class="download view" target="_blank">
					<xsl:attribute name="href">
						<xsl:choose>
							<xsl:when test="$asset/@href != ''">
								<xsl:value-of select="$asset/@href" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$asset/@link" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</a>
				<a class="download" download="download">
					<xsl:attribute name="href">
						<xsl:value-of select="concat( //output/@siteUrl, 'genie-tools/fetch-remote/?url=', $asset/@link )" />
					</xsl:attribute>
				</a>
			</div>
*/
