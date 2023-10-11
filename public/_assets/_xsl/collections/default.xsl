<?xml version="1.0"?>
<!--
	Asset Name:	Genie Marketing Kit
	Tags:		Listing Command, Collection
	Supports:	Collection	
	Version:	1.0
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template match="/">
		<html lang="en">
			<head>
				<title>
					<xsl:value-of select="concat( //collection/title, ' MARKETING KIT')" />
				</title>
				<base>
					<xsl:attribute name="href">
						<xsl:value-of select="//output/@siteUrl" />
					</xsl:attribute>
				</base>
				<link rel="preconnect" href="https://fonts.googleapis.com" />
				<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="true" />
				<link href="https://fonts.googleapis.com/css2?family=Lato:wght@100&amp;family=Roboto:wght@500&amp;display=swap" rel="stylesheet" />
				<link href="https://unpkg.com/basscss@8.0.2/css/basscss.min.css" rel="stylesheet" />
				<link rel="stylesheet">
					<xsl:attribute name="href">
						<xsl:value-of select="concat( //output/@siteUrl, '_assets/_css/genie-collection.css' )" />
					</xsl:attribute>
				</link>
			</head>
			<body style="padding:1rem;">
				<header>
					<h1>
						<xsl:value-of select="//collection/title" />
						<xsl:text> MARKETING KIT</xsl:text>
					</h1>
					<h2>
						<xsl:text>For: </xsl:text>
						<xsl:value-of select="concat( $listingAddressLine1, ', ', $listingAddressLine2 )" />
					</h2>
					<p>
						<xsl:text>PREPARED FOR:</xsl:text>
						<xsl:value-of select="concat( //agent[1]/firstName, ' ', //agent[1]/lastName )" />
					</p>
					<p>
						<xsl:text>LISTING AGENT: </xsl:text>
						<xsl:value-of select="'n/a'" />
					</p>
					<p>
						<xsl:text>MLS: #</xsl:text>
						<xsl:value-of select="//single/mlsNumber" />
					</p>
					<p>
						<xsl:text>CREATED AT: </xsl:text>
						<xsl:value-of select="genie:format-date( //collection/assembled, '[MNn] [D], [Y0001] [Hwo]:[m1o]')" />
					</p>
					<p>Open House Information</p>
					<p>
						<xsl:text>COLLECTION ID: #</xsl:text>
						<xsl:value-of select="//output/@collectionID" />
					</p>
				</header>

				<p>
					<a id="render-me">Re-render Me!</a>
					<script>
						const link = document.getElementById('render-me');
						link.href = window.location + '?re-render=true';
					</script>
				</p>

				<xsl:for-each select="//collection/folders/folder">
					<h3>
						<img alt="folder icon" style="width:18px;margin-right:1rem;">
							<xsl:attribute name="src">
								<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/folder-icon.svg')" />
							</xsl:attribute>
						</img>
						<xsl:value-of select="@name" />
					</h3>

					<div class="list-section">
						<xsl:for-each select="asset">
							<p class="asset">
								<xsl:value-of select="@name" />

								<xsl:for-each select="tag">
									<span class="tag">
										<xsl:value-of select="@name" />
									</span>
								</xsl:for-each>

								<xsl:choose>
									<xsl:when test="@href != ''">
										<a target="_blank">
											<xsl:attribute name="href">
												<xsl:value-of select="@href" />
											</xsl:attribute>
											<xsl:text>View</xsl:text>
										</a>

										<xsl:text>&#160;&#160;-&#160;&#160;</xsl:text>

										<a class="download" download="download">
											<xsl:attribute name="href">
												<xsl:value-of select="concat( //output/@siteUrl, 'genie-tools/fetch-remote/?url=', @link )" />
											</xsl:attribute>
											<xsl:text>Download</xsl:text>
										</a>
									</xsl:when>
									<xsl:otherwise>
										<a>
											<xsl:attribute name="href">
												<xsl:value-of select="@link" />
											</xsl:attribute>
											<xsl:text>Download/View</xsl:text>
										</a>
									</xsl:otherwise>
								</xsl:choose>
							</p>
						</xsl:for-each>
					</div>
				</xsl:for-each>

				<xsl:if test="count(//collection/targetFiles/file) &gt; 0">
					<h3>
						<img alt="folder icon" style="width:18px;margin-right:1rem;">
							<xsl:attribute name="src">
								<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/folder-icon.svg')" />
							</xsl:attribute>
						</img>
						<xsl:text>Customer Target Lists</xsl:text>
					</h3>

					<div class="list-section">
						<xsl:for-each select="//collection/targetFiles/file">
							<p>
								<img alt="folder icon" style="width:15px;margin-right:1rem;">
									<xsl:attribute name="src">
										<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/xsl-icon.svg')" />
									</xsl:attribute>
								</img>
								<a>
									<xsl:attribute name="href">
										<xsl:value-of select="@downLoadLink" />
									</xsl:attribute>
									<xsl:value-of select="@fileName" />
								</a>
								<span style="font-size:75%">
									<xsl:text>&#160;(&#160;</xsl:text>
									<xsl:value-of select="@fileRecordCount" />
									<xsl:text>&#160;records. Last updated:&#160;</xsl:text>
									<xsl:value-of select="@lastUpdate" />
									<xsl:text>)</xsl:text>
								</span>
							</p>
						</xsl:for-each>
					</div>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>