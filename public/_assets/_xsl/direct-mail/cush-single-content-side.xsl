<?xml version="1.0"?>
<!--
	Asset Name: Cush Sigle Content Side
	Tags: 		Direct Mail
	Sizes:		Postcard
Supports:	Area, Print, Listing, QRCode
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />

	<xsl:template name="svg-scripts">
		<xsl:call-template name="map-files" />
		<xsl:variable name="mapListingNodes" select="//listings/listing[@state='sold']" />

		<script>
			<xsl:value-of select="'var listings=['" />

			<xsl:for-each select="$mapListingNodes">
				<xsl:if test="position() &lt;= 6">
					<xsl:value-of select="concat( &quot;{state:'&quot;, @state, &quot;',salePrice:'&quot;, @salePrice, &quot;',lat:'&quot;, @lat, &quot;',lng:'&quot;, @lon, &quot;'},&quot; )" />
				</xsl:if>
			</xsl:for-each>
			<xsl:value-of select="'];'" />

		</script>
	</xsl:template>

	<xsl:template name="svg-body">
		<image x="0" y="0" width="50%" height="100%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/Diamondback_lg.jpg' )" />
			</xsl:attribute>
		</image>
		<xsl:if test="number(//single/statusTypeID)!=14">
			<image x="50%" y="0%" width="50%" height="100%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="id" select="'image-1'" />
					<xsl:with-param name="idx" select="1" />
				</xsl:call-template>
			</image>
		</xsl:if>

		<xsl:if test="number(//single/statusTypeID)=14">
			<image x="50%" y="0%" width="50%" height="100%" preserveAspectRatio="xMidYMid slice" style="filter:blur(3px) brightness(0.9);">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="id" select="'image-1'" />
					<xsl:with-param name="idx" select="1" />
				</xsl:call-template>
			</image>
		</xsl:if>
		<xsl:if test="//single/statusTypeID=''">
			<foreignObject x="50%" y="0%" width="50%" height="100%">
				<div data-width="50%" data-height="100%" style="z-index:-50;">
					<xsl:call-template name="map-output">
						<xsl:with-param name="iconType" select="'flag'" />
						<xsl:with-param name="style" select="'streets-v11'" />
					</xsl:call-template>
				</div>
			</foreignObject>
		</xsl:if>

		<line stroke="#ffffff" stroke-width="0.3%" x1="50%" x2="50%" y1="0" y2="100%" />

		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<link rel="stylesheet">
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/gotham-embedded.css')" />
		</link>
		<style>
			<xsl:value-of select="'	g.agent-detail { transform: translateY(-13%); }'" />
		</style>

		<g style="transform:translate(35%, 21%)">
			<xsl:call-template name="qr-code">
				<xsl:with-param name="width" select="'25%'" />
			</xsl:call-template>
		</g>

		<g>
			<xsl:variable name="status-caption">
				<xsl:choose>
					<xsl:when test="(number(//single/statusTypeID)=3) or (number(//single/statusTypeID)=4) or (number(//single/statusTypeID)=12)">
						<xsl:value-of select="'In Escrow!'" />
					</xsl:when>
					<xsl:when test="number(//single/statusTypeID)=2">
						<xsl:value-of select="'Just Sold!'" />
					</xsl:when>
					<xsl:when test="number(//single/statusTypeID)=14">
						<xsl:value-of select="'Coming Soon!'" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="'Just Listed!'" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>

			<xsl:if test="number(//single/statusTypeID)!=14 and //single/mlsNumber!=''">
				<text x="4%" y="18.5%" class="bold middle" fill="#ffffff" font-family="var(--theme-body-font)" style="font-size:330%;">
					<tspan>
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'justlisted'" />
							<xsl:with-param name="default" select="$status-caption" />
						</xsl:call-template>
					</tspan>
					<tspan x="4%" dy="9.2%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'buthowdoes'" />
							<xsl:with-param name="default" select="'How does'" />
						</xsl:call-template>
					</tspan>
					<tspan x="4%" dy="9.2%" fill="#eeac27">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'youhomes'" />

							<xsl:with-param name="default" select="'your home'" />
						</xsl:call-template>
					</tspan>
					<tspan x="4%" dy="9.2%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'compare'" />
							<xsl:with-param name="default" select="'compare?'" />
						</xsl:call-template>
					</tspan>
				</text>
			</xsl:if>

			<xsl:if test="number(//single/statusTypeID)=14">
				<text x="4%" y="26%" class="bold middle" fill="#fff" style="letter-spacing: 1px;font-size:300%;font-family:var(--theme-heading-font)">
					<tspan>
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'oneofyour'" />
							<xsl:with-param name="default" select="'One of your'" />
						</xsl:call-template>
					</tspan>
					<tspan x="4%" dy="8.5%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'neighborsis'" />
							<xsl:with-param name="default" select="'neighbors is'" />
						</xsl:call-template>
					</tspan>
					<tspan x="4%" dy="8.5%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'sellingtheir'" />
							<xsl:with-param name="default" select="'selling their'" />
						</xsl:call-template>
					</tspan>
					<tspan x="4%" dy="8.5%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'home'" />

							<xsl:with-param name="default" select="lower-case( $singularPropertyType )" />
						</xsl:call-template>
					</tspan>
					<tspan fill="#eeac27">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'soon'" />
							<xsl:with-param name="default" select="' soon.'" />
						</xsl:call-template>
					</tspan>
				</text>

				<text class="upper" fill="#ffffff" style=" font-family:var(--theme-heading-font);letter-spacing: 1px;font-weight:700;">
					<tspan x="68%" y="30%" style="font-size:240%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'scanto'" />
							<xsl:with-param name="default" select="'SCAN TO'" />
						</xsl:call-template>
					</tspan>
					<tspan x="68%" y="35.5%" style="font-size:180%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'becomean'" />
							<xsl:with-param name="default" select="'BECOME AN'" />
						</xsl:call-template>
					</tspan>
					<tspan x="68%" y="39.1%" style="font-size:272%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'insider'" />
							<xsl:with-param name="default" select="'INSIDER'" />
						</xsl:call-template>
					</tspan>
				</text>

				<svg id="Layer_1" width="5%" height="11%" x="62%" y="33%" data-name="Layer 1"
					xmlns="http://www.w3.org/2000/svg" viewBox="0 0 398.62 113.47" fill="#ffffff">
					<defs></defs>
					<title>arrow 3</title>
					<polygon class="cls-1" points="61.38 113.47 75.03 98.82 29.37 56.41 75.63 14.65 61.99 0 0 56.41 61.38 113.47" />
					<rect class="cls-1" x="28.81" y="46.73" width="369.82" height="20" />

				</svg>
			</xsl:if>
			<xsl:if test="//single/mlsNumber='' ">
				<style>
					<xsl:value-of select="'
	    			g.scan-svg-text {
					    transform: translateY(3%);
					}
					g.logo-part {
					    transform: translate(76%, 0);
					}
					g.agent-detail {
					    transform: translateY(-2%);
}'" />
				</style>
				<text x="4%" y="26%" class="bold middle" fill="#fff" style="letter-spacing: 1px;font-size:280%;font-family:var(--theme-heading-font)">
					<tspan>
						<xsl:value-of select="format-number(//statistics/@soldPropertyTypeCount, '###,###')" />

					</tspan>
					<tspan>
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'neighbors'" />
							<xsl:with-param name="default" select="' neighbors'" />
						</xsl:call-template>
					</tspan>
					<tspan x="4%" dy="8.5%">
						<xsl:choose>
							<xsl:when test="number(//single/statusTypeID)=2">
								<xsl:value-of select="'sold'" />
							</xsl:when>

							<xsl:otherwise>
								<xsl:value-of select="'listed '" />
							</xsl:otherwise>
						</xsl:choose>
					</tspan>
					<tspan>
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'homes'" />

							<xsl:with-param name="default" select="lower-case( $propertyType)" />
						</xsl:call-template>
					</tspan>
					<tspan fill="#eeac27" x="4%" dy="8.5%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'inthe'" />
							<xsl:with-param name="default" select="'in just the'" />
						</xsl:call-template>
					</tspan>
					<tspan fill="#eeac27" x="4%" dy="8.5%">
						<xsl:choose>
							<xsl:when test="//areas/area[1]/statistics/@lookbackMonths='1'">
								<xsl:text>last 30 days.</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat( 'last ', //areas/area[1]/statistics/@lookbackMonths, ' months.')" />

							</xsl:otherwise>
						</xsl:choose>
					</tspan>
				</text>

				<text x="4%" y="10%" class="upper narrow" fill="#eeac27" style="font-size: 170%;letter-spacing:2.5px; font-weight:500;font-family:var(--theme-sub-heading-font)" data-max-width="40%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'areanames'" />
						<xsl:with-param name="default" select="concat(//area/name, ' TRENDS')" />
					</xsl:call-template>
				</text>
				<image x="75%" y="84%" width="22%" height="10%" id="logo" preserveAspectRatio="xMinYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="companyLogo" />
					</xsl:attribute>
				</image>
			</xsl:if>
		</g>
		<xsl:if test="number(//single/statusTypeID)!=14 and //single/statusTypeID!=''">
			<text x="96%" y="93%" data-max-width="30%" class="align-right upper" fill="#eeac27" font-family="var(--theme-body-font)" style="font-size:110%;font-weight:500;text-shadow: 1px 1px 2px #0e1232;">
				<tspan>
					<xsl:value-of select="//single/address/street" />
					<xsl:text> &#8226; </xsl:text>
				</tspan>
				<tspan style="font-weight:400">
					<xsl:value-of select="//single/address/city" />
				</tspan>
			</text>
		</xsl:if>

		<xsl:choose>
			<xsl:when test="$companyLogo='' or $personalLogo=''">
				<image x="4%" y="84%" width="13%" height="10%" id="logo" preserveAspectRatio="xMinYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="$companyLogo" />
					</xsl:attribute>
				</image>
				<image x="4%" y="84%" width="13%" height="10%" id="logo" preserveAspectRatio="xMinYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="$personalLogo" />
					</xsl:attribute>
				</image>
			</xsl:when>
			<xsl:otherwise>
				<image x="4%" y="84%" width="13%" height="10%" id="logo" preserveAspectRatio="xMinYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="$companyLogo" />
					</xsl:attribute>
				</image>
				<image x="19%" y="84%" width="13%" height="10%" id="logo" preserveAspectRatio="xMinYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="$personalLogo" />
					</xsl:attribute>
				</image>
			</xsl:otherwise>
		</xsl:choose>

		<xsl:if test="number(//single/statusTypeID)!=14">
			<g class="scan-svg-text">
				<xsl:variable name="scan-instantly-text">
					<xsl:choose>
						<xsl:when test="(number(//single/statusTypeID)=3) or (number(//single/statusTypeID)=4) or (number(//single/statusTypeID)=12)">
							<xsl:value-of select="'INSTANTLY.'" />
						</xsl:when>
						<xsl:when test="number(//single/statusTypeID)=2">
							<xsl:value-of select="'INSTANTLY.'" />
						</xsl:when>
						<xsl:when test="number(//single/statusTypeID)=14">
							<xsl:value-of select="'INSTANTLY.'" />
						</xsl:when>
						<xsl:when test="//single/statusTypeID=''">
							<xsl:value-of select="'WHO’S ON THE MOVE.'" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'INSTANTLY.'" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="scan-tofind-text">
					<xsl:choose>
						<xsl:when test="(number(//single/statusTypeID)=3) or (number(//single/statusTypeID)=4) or (number(//single/statusTypeID)=12)">
							<xsl:value-of select="'SCAN TO FIND OUT '" />
						</xsl:when>
						<xsl:when test="number(//single/statusTypeID)=2">
							<xsl:value-of select="'SCAN TO FIND OUT '" />
						</xsl:when>
						<xsl:when test="number(//single/statusTypeID)=14">
							<xsl:value-of select="'SCAN TO FIND OUT '" />
						</xsl:when>
						<xsl:when test="//single/statusTypeID=''">
							<xsl:value-of select="'SCAN TO SEE '" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'SCAN TO FIND OUT '" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<text x="4%" y="59.5%" class="bold" fill="#ffffff" font-family="var(--theme-body-font)" style="font-size:110%;">
					<tspan>
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'scan'" />
							<xsl:with-param name="default" select="$scan-tofind-text" />
						</xsl:call-template>
					</tspan>
					<tspan fill="#eeac27">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'instantly'" />
							<xsl:with-param name="default" select="$scan-instantly-text" />
						</xsl:call-template>
					</tspan>
				</text>

				<svg width="41%" class="scan-svg-icon" height="22%" x="0.8%" y="47%" viewBox="0 0 2000 452">
					<path fill="#eeac27" d="M1757.79,75.26c-58.07,0-105.31,47.24-105.31,105.31v117.14c0,42.23-34.36,76.59-76.59,76.59H136.91v11.53 h1438.98c48.59,0,88.12-39.53,88.12-88.12V180.57c0-51.71,42.07-93.78,93.78-93.78h114.2V75.26H1757.79z" />
					<polygon fill="#eeac27" points="1841.9,44.98 1834.31,53.66 1865.73,81.13 1835.02,109.35 1842.82,117.84 1883,80.92" />
				</svg>
			</g>
		</xsl:if>

		<clipPath id="agent-clip-mask">
			<rect x="30%" y="65%" width="20%" height="35%"></rect>
		</clipPath>

		<g class="agent-detail">
			<text x="4%" y="85%" style="font-size:115%;" font-family="var(--theme-body-font)" data-max-width="15%" fill="#ffffff">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentfirstName'" />
						<xsl:with-param name="default" select="//agent[1]/firstName" />
					</xsl:call-template>
				</tspan>
				<tspan>
					<xsl:text>&#160;</xsl:text>
				</tspan>
				<tspan fill="#eeac27">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentlastname'" />
						<xsl:with-param name="default" select="//agent[1]/lastName" />
					</xsl:call-template>
				</tspan>
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'team'" />
						<xsl:with-param name="default" select="' Team'" />
					</xsl:call-template>
				</tspan>
			</text>
			<text x="4%" y="92.6%" class="upper" style="font-size:100%;font-weight:500;" font-family="var(--theme-body-font)" data-max-width="25%" fill="#eeac27">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentwebsite'" />
					<xsl:with-param name="default" select="//agent[1]/website" />
				</xsl:call-template>
			</text>
			<text x="4%" y="89%" style="font-size:75%;" font-family="var(--theme-body-font)" data-max-width="15%" fill="#ffffff">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'licenseno'" />
					<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
				</xsl:call-template>
			</text>
			<text x="22.5%" y="85.5%" style="font-size:90%;" font-family="var(--theme-body-font)" fill="#ffffff">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentmobile'" />
					<xsl:with-param name="default" select=" //agent[1]/mobile" />
				</xsl:call-template>
			</text>
			<text x="22.5%" y="88.5%" fill="#ffffff" data-max-width="15%" style="font-size:90%;" font-family="var(--theme-body-font)">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentmarketingEmail'" />
					<xsl:with-param name="default" select="//agent[1]/marketingEmail" />
				</xsl:call-template>
			</text>
		</g>
	</xsl:template>
</xsl:stylesheet>