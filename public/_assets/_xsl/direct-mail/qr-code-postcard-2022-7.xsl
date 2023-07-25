<?xml version="1.0"?>
<!--
	Asset Name: Qr code postcard 2022 7
	Tags: 		Direct Mail
	Sizes:		Postcard
	Supports:	Area, Print, Listing, QRCode
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:variable name="mapListingNodes" select="//listings/listing[@state='sold']" />

	<xsl:template name="svg-scripts">
		<xsl:call-template name="map-files" />
		<script>
			<xsl:text>var listings=[</xsl:text>
			<xsl:for-each select="$mapListingNodes">
				<xsl:if test="position() &lt;= 20">
					<xsl:value-of select="concat( &quot;{state:'&quot;, @state, &quot;',lat:'&quot;, @lat, &quot;',lng:'&quot;, @lon, &quot;'},&quot; )" />
				</xsl:if>
			</xsl:for-each>
			<xsl:text>];</xsl:text>
		</script>
	</xsl:template>

	<xsl:template name="svg-body">
		<image x="0" y="0" width="100%" height="100%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-1'" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<rect x="0%" y="0%" width="100%" height="100%" fill="var(--theme-body-background)" fill-opacity="0.8"/>

		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<g>
			<text x="50%" y="7%" class="center upper bold" fill="var(--theme-body-color)" style="font-size: 210%; font-family:var(--theme-heading-font);letter-spacing: 3px">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentfirstName'" />
						<xsl:with-param name="default" select="//agent[1]/firstName" />
					</xsl:call-template>
				</tspan>
				<tspan>
					<xsl:text>&#160;</xsl:text>
				</tspan>
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentlastname'" />
						<xsl:with-param name="default" select="//agent[1]/lastName" />
					</xsl:call-template>
				</tspan>
				<tspan style="font-weight:400; letter-spacing:0">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'associates'" />
						<xsl:with-param name="default" select="' + ASSOCIATES'" />
					</xsl:call-template>
				</tspan>
			</text>

			<text x="50%" y="14%" class="center upper bold" fill="var(--theme-body-color)" style="font-size: 150%; font-family:var(--theme-heading-font);letter-spacing: 3px">
				<tspan style="font-weight:400;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'realestateteam'" />
						<xsl:with-param name="default" select="' real estate team'" />
					</xsl:call-template>
				</tspan>
			</text>

			<text x="20%" y="20%" class="center upper bold" fill="var(--theme-body-color)" style="font-size: 210%;font-family:var(--theme-heading-font); letter-spacing: 1px; ">
				<tspan x="20%" dy="8%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'ofyour'" />
						<xsl:with-param name="default" select="'SCAN TO SEE '" />
					</xsl:call-template>
				</tspan>

				<tspan x="20%" dy="8%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'howyour'" />
						<xsl:with-param name="default" select="'HOW YOUR '" />
					</xsl:call-template>
				</tspan>
				<tspan fill="var(--theme-sub-heading-color)" style="font-size: 130%;dominant-baseline: hanging;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'home'" />
						<xsl:with-param name="default" select="'HOME'" />
					</xsl:call-template>
				</tspan>
				<tspan x="20%" dy="8%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'compares'" />
						<xsl:with-param name="default" select="'COMPARES!'" />
					</xsl:call-template>
				</tspan>
			</text>

			<text x="80%" y="13%" class="center upper" fill="var(--theme-body-color)" style=" letter-spacing: 6px; font-family:var(--theme-heading-font);font-weight: 600;">
				<xsl:choose>
					<xsl:when test="(number(//single/statusTypeID)=3) or (number(//single/statusTypeID)=4) or (number(//single/statusTypeID)=12)">
						<tspan x="80%" dy="10.5%" style="font-size:400%;letter-spacing:10px;">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'record'" />
								<xsl:with-param name="default" select="'Now In'" />
							</xsl:call-template>
						</tspan>
						<tspan x="80%" dy="12%" fill="var(--theme-sub-heading-color)" style="font-weight:800;font-size:380%;">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'sale'" />
								<xsl:with-param name="default" select="'Escrow'" />
							</xsl:call-template>
						</tspan>
					</xsl:when>

					<xsl:when test="number(//single/statusTypeID)=14">
						<tspan x="80%" dy="10%" style="font-size:355%;letter-spacing:5px;">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'record'" />
								<xsl:with-param name="default" select="'coming'" />
							</xsl:call-template>
						</tspan>
						<tspan x="80%" dy="9.5%" fill="var(--theme-sub-heading-color)" style="font-weight:800;font-size:510%;">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'sale'" />
								<xsl:with-param name="default" select="'soon'" />
							</xsl:call-template>
						</tspan>
					</xsl:when>
					<xsl:otherwise>
						<tspan x="80%" dy="9%" style="font-size:480%;letter-spacing:14px;">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'record'" />
								<xsl:with-param name="default" select="'just'" />
							</xsl:call-template>
						</tspan>
						<tspan x="80%" dy="14%" fill="var(--theme-sub-heading-color)" style="font-weight:800;font-size:380%;">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'sale'" />
								<xsl:with-param name="default" select="'sold'" />
							</xsl:call-template>
						</tspan>
					</xsl:otherwise>
				</xsl:choose>
			</text>

			<text x="80%" y="50%" data-max-width="30%" class="center upper bold" fill="var(--theme-body-color)" style="font-size: 160%;font-family:var(--theme-heading-font); letter-spacing: 1px; ">
				<xsl:call-template name="listing-address-line-one"/>
			</text>

			<text x="50%" y="75%" class="center upper" fill="var(--theme-body-color)" style="font-size: 410%;font-family:var(--theme-sub-heading-font); letter-spacing: 1px;font-weight:600 ">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'always'" />
						<xsl:with-param name="default" select="'ALWAYS BRINGING YOU '" />
					</xsl:call-template>
				</tspan>
				<tspan fill="var(--theme-sub-heading-color)">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'home'" />
						<xsl:with-param name="default" select="'HOME'" />
					</xsl:call-template>
				</tspan>
				<tspan>
					<xsl:text>.</xsl:text>
				</tspan>
			</text>
		</g>

		<g style="transform:translate(35%, 21%)">
			<xsl:call-template name="qr-code">
				<xsl:with-param name="width" select="'30%'" />
				<xsl:with-param name="height" select="'35%'" />
			</xsl:call-template>
		</g>
	</xsl:template>
</xsl:stylesheet>