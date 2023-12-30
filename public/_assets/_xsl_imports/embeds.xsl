<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:preserve-space elements="*" />

	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="//output/@process='render'">
				<xsl:call-template name="embed-instructions" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="displaying" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="displaying">
		<html lang="en" class="h-100">
			<head>
				<meta charset="utf-8" />
				<meta name="viewport" content="width=device-width, initial-scale=1" />
				<meta name="theme-color" content="#000000" />
				<meta name="description" content="Genie Embed" />
				<title>Genie Hub Render</title>

				<base>
					<xsl:attribute name="href">
						<xsl:value-of select="//output/@siteUrl" />
					</xsl:attribute>
				</base>

				<script type="text/javascript" src="/_assets/_js/genie-global.js">
					<xsl:text>;</xsl:text>
				</script>

				<link rel="stylesheet" type="text/css">
<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/genie-colors.css') " />

				</link>
				<link rel="manifest">
<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/components/genie-embed/build/manifest.json') " />

				</link>

				<script>
<xsl:value-of select="concat( 'window.gHub = { SINGLE:  0, CONDO: 1, siteUrl: `', //output/@siteUrl, '`, apiUrl: `', //output/@apiUrl, '`, googleKey: `', //output/@googleKey, '`, mapboxKey: `', //output/@mapboxKey, '` };')" />

				</script>

				<script>
					<xsl:value-of select="'
					ghub.api = ghub.apiUrl;
					ghub.build_url = ghub.siteUrl;

					ghub.addlink = function (href, rel) {
						let sheet = document.createElement(`link`);
						sheet.href = href;
						sheet.rel = rel;
						document.head.appendChild(sheet);
					};
					ghub.addscript = function (src) {
						let script = document.createElement(`script`);
						script.src = src;
						document.head.appendChild(script);
					};

					document.addEventListener(`DOMContentLoaded`, function () {
						let targetDiv = document.createElement(`div`);
						targetDiv.id = `genie-hub`;
						document.body.appendChild(targetDiv);

						var request = new XMLHttpRequest();
						request.open(`GET`, ghub.build_url + `asset-manifest.json?` + Date.now(), true);
						request.onload = function () {
							if (request.status >= 200) {
								if( request.status	< 400) {
									var data = JSON.parse(request.responseText);

									data.entrypoints.map(url => {
										if (url.endsWith(`.js`)) {
											ghub.addscript(ghub.build_url + url);
										} else if (url.endsWith(`.css`)) {
											ghub.addlink(ghub.build_url + url, `stylesheet`);
										}
									});
								}
							}
						};
						request.onerror = function () {};
						request.send();
					});'" />
				</script>
			</head>

			<body style="margin: 0; padding: 0;">
				<xsl:attribute name="class">
					<xsl:value-of select="//output/@theme" />
				</xsl:attribute>
				<noscript>You need to enable JavaScript to run this app.</noscript>

				<xsl:call-template name="body" />
			</body>
		</html>
	</xsl:template>

	<xsl:template name="embed">
		<xsl:param name="component" />
<xsl:param name="variation" select="''" />
<xsl:param name="mode" select="''" />
<xsl:param name="nocopyright" select="''" />

		<xsl:param name="mapStyle" select="//output/@mapStyle" />
<xsl:param name="renderAs" select="'html'" />


		<xsl:if test="$renderAs='html'">
			<div style="width:100%;" data-genie-xsl-output="true">
				<xsl:attribute name="class">
					<xsl:value-of select="concat( 'data-genie-embed ', //output/@theme )" />
				</xsl:attribute>

				<xsl:attribute name="data-genie-theme">
					<xsl:value-of select="//output/@theme" />
				</xsl:attribute>

				<xsl:attribute name="data-genie-layout">
					<xsl:value-of select="$component" />
				</xsl:attribute>

				<xsl:if test="not($variation='')">
					<xsl:attribute name="data-genie-variation">
						<xsl:value-of select="$variation" />
					</xsl:attribute>
				</xsl:if>

				<xsl:attribute name="data-genie-areaid">
					<xsl:value-of select="//areas/area[1]/id" />
				</xsl:attribute>

				<xsl:if test="not($nocopyright='')">
					<xsl:attribute name="data-genie-nocopyright">
						<xsl:value-of select="'true'" />
					</xsl:attribute>
				</xsl:if>

				<xsl:if test="not($mapStyle='')">
					<xsl:attribute name="data-genie-mapstyle">
						<xsl:value-of select="$mapStyle" />
					</xsl:attribute>
				</xsl:if>

				<xsl:if test="not($mode='')">
					<xsl:attribute name="data-genie-mode">
						<xsl:value-of select="$mode" />
					</xsl:attribute>
				</xsl:if>

				<xsl:attribute name="data-genie-propertytype">
					<xsl:choose>
						<xsl:when test="//output/@propertyType">
							<xsl:value-of select="//output/@propertyType" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>0</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>

				<xsl:attribute name="data-genie-agentid">
					<xsl:value-of select="//output/@userId" />
				</xsl:attribute>

				<xsl:attribute name="data-genie-period">
					<xsl:value-of select="//output/@areaPeriod" />
				</xsl:attribute>

				<xsl:if test="count(//single)=1">
					<xsl:attribute name="data-genie-mlsnumber">
						<xsl:value-of select="210030166" />
					</xsl:attribute>
					<xsl:attribute name="data-genie-mlsid">
						<xsl:value-of select="0" />
					</xsl:attribute>
				</xsl:if>
			</div>
		</xsl:if>

		<xsl:if test="$renderAs='text'">
			<xsl:text>&lt;div class="data-genie-embed" style="width:100%;"</xsl:text>
			<br/>
			<xsl:value-of select="concat( ' data-genie-theme=&quot;', //output/@theme, '&quot;' )" />
			<br/>
			<xsl:value-of select="concat( ' data-genie-layout=&quot;', $component, '&quot;' )" />
			<br/>
			<xsl:value-of select="concat( ' data-genie-areaid=&quot;', //areas/area[1]/id, '&quot;' )" />
			<br/>
			<xsl:value-of select="concat( ' data-genie-agentid=&quot;', //output/@userID, '&quot;' )" />
			<br/>

			<xsl:if test="not($mapStyle='')">
				<br/>
				<xsl:value-of select="concat( ' data-genie-mapstyle=&quot;', $mapStyle, '&quot;' )" />
			</xsl:if>

			<xsl:if test="not($mode='')">
				<br/>
				<xsl:value-of select="concat( ' data-genie-mode=&quot;', $mode, '&quot;' )" />
			</xsl:if>

			<xsl:if test="not(string(//single/mlsNumber)='')">
				<br/>
				<xsl:value-of select="concat( ' data-genie-mlsNumber=&quot;', //single/mlsNumber, '&quot;' )" />
			</xsl:if>

			<xsl:text>&gt;&lt;/div&gt;</xsl:text>
		</xsl:if>
	</xsl:template>

	<xsl:template name="embed-instructions">
		<style>
			<xsl:value-of select="'
			pre.formatted-html {
				margin: 1rem;
				padding: 1rem;
				border: 2px solid #ccc;
				font-family: monospace;
				font-size: 150%;
				background-color: #eee;
				white-space: break-spaces;
}'" />
		</style>

		<h1>Genie Embeds</h1>

		<p>Some generic copy that describes how to use the embedded components. Could link to <a href="https://app.theghub.ai">more detailed information</a> on-line.
		</p>

		<p>The first code is only required once, regardless of how many Genie Embeds you have on the page:</p>

		<pre class="formatted-html" id="genie-script">
<xsl:value-of select="concat( '&lt;script src=&quot;', //output/@siteUrl,'embed-handler?v=3.1&quot;&gt;&lt;/script&gt;' )" />

		</pre>

		<p>For this specific embed, copy the following to your web page in the place you wish it to appear:</p>

		<p>That's it!</p>
	</xsl:template>
</xsl:stylesheet>