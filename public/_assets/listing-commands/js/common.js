document.addEventListener(`DOMContentLoaded`, () => {
	const getHeaderValues = async url => {
		try {
			const response = await fetch(url, { method: 'HEAD', cache: 'no-cache' });

			// Check for successful response or redirect
			return response.ok || (response.status >= 300 && response.status < 400);
		} catch (error) {
			console.error(`Error checking resource: ${url}`, error);
			return false;
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

					const pageCount = el.dataset.pagecount ?? 0;
					const resourceAvailable = await getHeaderValues(imageUrl);

					if (resourceAvailable) {
						// Proceed with rendering as before
						// ... (rest of the rendering logic)
					} else {
						// Resource not available, schedule a retry
						setTimeout(() => getRenderUpdate(), 5000); // Retry after 5 seconds
					}
				}
			)
		);

		if (document.querySelectorAll(`[${renderKeyAttrib}]`).length) {
			setTimeout(getRenderUpdate, 2000);
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
				<xsl:value-of select="@name" />
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
