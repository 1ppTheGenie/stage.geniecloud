<?xml version="1.0"?>
<!--
	Asset Name:	Direct Mail Portfolio Tracker
	Tags:		Text
Supports:	Area, QRCode
	Sizes:		Postcard
	Approved: 	False
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>

	<xsl:template name="svg-body">
		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<style>
			<xsl:value-of select="'
			table.listings{
				color:var(--theme-sub-heading-color);
			}
			table.listings th,
			table.listings td:first-child{
				text-align:left;
				font-weight:700;
				font-size:150%;
				padding:0;
			}
			table.listings td:nth-child(2){
				text-align:center;
			}
			table.listings td:first-child{
				text-transform: uppercase;
				width:20%;
			}
			table.listings th,
			table.listings td{
				border:none;
			}
			table.listings th:not(:first-child){
			    border-bottom: 2px solid var(--theme-body-color);
			}
			table.listings td:not(:nth-child(-n + 2)){
			    border-left: 2px solid var(--theme-body-color);			
			}
			table.listings img {
			    object-fit: contain;
			}
			table.listings td{
				padding:0;
			}'"/>
		</style>
		<g>

			<text x="50%" y="2%" class="center" reference-orientation="90" fill="var(--theme-sub-heading-color)" style="font-size:150%;font-weight:600;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'realestatetrends'" />
					<xsl:with-param name="default" select="'You Track your Portfolio daily, why not Track your COMMUNITYS Real Estate TRENDS?'" />
				</xsl:call-template>
			</text>
			<g style="transform: translate(0, 8%);">
				<rect x="0" y="0" width="100%" height="77%" fill="var(--theme-sub-heading-color)" />
				<text x="50%" y="2%" class="center" reference-orientation="90" fill="var(--theme-body-background)" style="font-size:150%; font-weight:600;" data-max-width="60%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'areaname'" />
						<xsl:with-param name="default" select="concat( 'Real Time, IN Depth, Statistics and Market Trends, Exclusively for ', //area/name)" />
					</xsl:call-template>...
				</text>
			</g>
			<g style="transform: translate(2%, 16%);">
				<rect x="0" y="0" width="96%" height="68%" fill="var(--theme-body-background)"/>
				<rect stroke="var(--theme-body-color)" stroke-width="2" fill-opacity="0" x="1.5%" y="3%" width="93%" height="62%"/>
				<foreignObject x="3%" y="5%" width="90%" height="60%">
					<table class="listings" style="height: 100%; width: 100%;">
						<thead class="Capitalize">
							<th>What's Included?</th>
							<th>Zipcode Summary:</th>
							<th>Community Trends</th>
							<th>Neighborhood Trends:</th>
							<th>Multi-Year Trends:</th>
							<th>Buyer Trends:</th>
						</thead>
						<tbody>
							<tr>
								<td>
									<xsl:value-of select="//area/name" />
.re
								</td>
								<td>
									<image width="32%" height="35%">
										<xsl:attribute name="href">
											<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/check-brown.png' )" />
										</xsl:attribute>
									</image>
								</td>
								<td>
									<image width="32%" height="35%">
										<xsl:attribute name="href">
											<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/check-brown.png' )" />
										</xsl:attribute>
									</image>
								</td>
								<td>
									<image width="32%" height="35%">
										<xsl:attribute name="href">
											<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/check-brown.png' )" />
										</xsl:attribute>
									</image>
								</td>
								<td>
									<image width="32%" height="35%">
										<xsl:attribute name="href">
											<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/check-brown.png' )" />
										</xsl:attribute>
									</image>
								</td>
								<td>
									<image width="32%" height="35%">
										<xsl:attribute name="href">
											<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/check-brown.png' )" />
										</xsl:attribute>
									</image>
								</td>
							</tr>
							<tr>
								<td>
									zillow &amp; trulia
								</td>
								<td>
									<image width="32%" height="35%">
										<xsl:attribute name="href">
											<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/check-purple.png' )" />
										</xsl:attribute>
									</image>
								</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>
									redfin
								</td>
								<td>
									<image width="32%" height="35%">
										<xsl:attribute name="href">
											<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/check-red.png' )" />
										</xsl:attribute>
									</image>
								</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</foreignObject>
			</g>
			<xsl:if test="//agent[1]/photo">
				<image x="0.6%" y="87%" width="12%" height="12%" clip-path="url(#clipCircle)">
					<xsl:attribute name="href">
						<xsl:copy-of select="//agent[1]/photo" />
					</xsl:attribute>
				</image>
			</xsl:if>
			<g style="transform: translate(15%, 71%);">
				<use x="-2.5%" style="transform: rotate(95deg) translate(12.8%, -19.9%);" y="20%" fill="var(--theme-sub-heading-color)" width="2%" height="2%">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#phone-icon' )" />
				</use>
				<use x="-2.5%" y="25.5%" fill="var(--theme-sub-heading-color)" width="2%" height="2%">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#globe-icon' )" />
				</use>
				<use x="-2.5%" y="22.5%" fill="var(--theme-sub-heading-color)" width="2%" height="2%">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#email-icon' )" />
				</use>
				<text class="h1" x="-2%" y="16%" style="font-size:110%;">
					<tspan>
						<xsl:value-of select="//agent[1]/firstName" />
					</tspan>
					<tspan>
						<xsl:text>&#160;</xsl:text>
					</tspan>
					<tspan class="bold">
						<xsl:value-of select="//agent[1]/lastName" />
					</tspan>
				</text>

				<text x="0" y="19%" fill="var(--theme-sub-heading-color)" style="font-size:80%;">
					<xsl:value-of select="//agent[1]/mobile" />
				</text>

				<text x="0" y="22%" fill="var(--theme-sub-heading-color)" style="font-size:80%;">
					<xsl:choose>
						<xsl:when test="//agent[1]/marketingEmail!=''">
							<xsl:value-of select="//agent[1]/marketingEmail" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="//agent[1]/marketingEmail" />
						</xsl:otherwise>
					</xsl:choose>
				</text>

				<text x="0" y="25%" fill="var(--theme-sub-heading-color)" style="font-size:80%;">
					<xsl:choose>
						<xsl:when test="website!=''">
							<xsl:value-of select="//agent[1]/website" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="//agent[1]/website" />
						</xsl:otherwise>
					</xsl:choose>
				</text>
			</g>

			<g style="transform:translate(31%, 87%)">
				<xsl:call-template name="qr-code">
					<xsl:with-param name="width" select="'6%'" />
					<xsl:with-param name="height" select="'11%'" />
				</xsl:call-template>
			</g>

			<text x="38%" y="90%" class="upper" fill="var(--theme-sub-heading-color)" style="font-size:200%;">
				<xsl:value-of select="//agent[1]/website" />
			</text>
		</g>

		<xsl:call-template name="copyright">
			<xsl:with-param name="disclaimer" select="'direct-mail'" />
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>