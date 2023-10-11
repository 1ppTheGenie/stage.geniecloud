<?xml version="1.0"?>
<!--
	Asset Name: Open House Postcard back 02
	Tags: 		Open House
	Sizes:		Postcard
	Supports:	Listing, Open-House
	Approved: 	False
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<image x="0" y="0" width="50%" height="100%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
<xsl:with-param name="idx" select="genie:pick( 0, string(//output/@imageIndex), count(//single/images/image), '', '' )" />

			</xsl:call-template>
		</image>

<rect x="0" width="50%" height="100%" fill-opacity="0.8" fill="var(--theme-sub-heading-color)" />


		<image x="50.4%" y="0" width="49.6%" height="49.6%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
<xsl:with-param name="idx" select="genie:pick( ( 1, string(//output/@imageIndex), count(//single/images/image) ) )" />

			</xsl:call-template>
		</image>

		<xsl:call-template name="map-fallback-image">
			<xsl:with-param name="x" select="'50.4%'" />
			<xsl:with-param name="y" select="'50.4%'" />
			<xsl:with-param name="width" select="'49.6%'" />
			<xsl:with-param name="height" select="'49.6%'" />
			<xsl:with-param name="index" select="2" />
		</xsl:call-template>

		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<g>
			<text x="25%" y="17%" class="center upper" fill="var(--theme-body-background)" style="font-size: 400%; font-weight:550;">
				<tspan>
					<xsl:variable name="defaultCaption">
						<xsl:choose>
							<xsl:when test="number(//single/statusTypeID)=2">
								<xsl:value-of select="'Just Sold!'" />
							</xsl:when>
							<xsl:when test="number(//single/statusTypeID)=1">
								<xsl:value-of select="'Just Listed!'" />
							</xsl:when>
							<xsl:when test="(number(//single/statusTypeID)=3) or (number(//single/statusTypeID)=4) or (number(//single/statusTypeID)=12)">
								<xsl:value-of select="'In Escrow!'" />
							</xsl:when>
							<xsl:otherwise>								<!-- test="number(//single/statusTypeID)=14" -->
								<xsl:value-of select="'Coming Soon'" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'dm-open-house-caption'" />
						<xsl:with-param name="default" select="$defaultCaption" />
					</xsl:call-template>
				</tspan>
			</text>

			<text x="25%" y="29%" class="center narrow" fill="var(--theme-body-background)" style="font-size:180%;" data-max-width="23%">
				<tspan class="center">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'yourneighborhood'" />
						<xsl:with-param name="default" select="concat( ' New In The ', //area/name , ' Area')" />
					</xsl:call-template>
				</tspan>
			</text>

			<text x="25%" y="35%" class="center upper" fill="var(--theme-body-background)" style="font-size: 400%;font-weight:550;">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'wanttosee'" />
						<xsl:with-param name="default" select="'WANT TO SEE'" />
					</xsl:call-template>
				</tspan>
				<tspan x="25%" dy="12%" style="font-size:60%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'howyouhome'" />

						<xsl:with-param name="default" select="concat( 'HOW YOUR' , ' ', $singularPropertyType)" />
					</xsl:call-template>
				</tspan>
				<tspan x="25%" dy="7%" style="font-size:60%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'compare'" />
						<xsl:with-param name="default" select="'COMPARES?'" />
					</xsl:call-template>
				</tspan>
			</text>

			<text x="25%" y="63.6%" class="narrow center upper" fill="var(--theme-body-background)" style="font-size:100%;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'scantheqr'" />
					<xsl:with-param name="default" select="'SCAN THE QR CODE ON THE BACK OF THIS POSTCARD NOW!'" />
				</xsl:call-template>
			</text>

			<text x="25%" y="68.5%" class="narrow center upper" fill="var(--theme-body-background)" style="font-size:100%;">
				<xsl:call-template name="listing-address" />
			</text>
			<text x="25%" y="73.1%" class="narrow center" fill="var(--theme-body-background)" style="font-size:100%;">
				<xsl:value-of select="//agent[1]/marketingEmail" />
			</text>
		</g>
		<xsl:call-template name="copyright">
			<xsl:with-param name="disclaimer" select="'direct-mail'" />
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>