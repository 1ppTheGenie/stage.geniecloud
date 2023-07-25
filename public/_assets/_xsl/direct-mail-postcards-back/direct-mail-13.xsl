<?xml version="1.0"?>
<!--
	Asset Name: Open House Postcard Back - No.13
	Tags: 		Open House
	Sizes:		Postcard
	Supports:	Listing, Open-House
	Approved: 	False
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="svg-body">
		<image x="20%" y="0" width="80%" height="75%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-1'" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>
		<rect x="0" y="75%" width="100%" height="14%" fill="var(--theme-sub-heading-color)" />
		<rect x="0" y="88.5%" width="100%" height="12%" fill="var(--theme-body-color)" />
		<filter x="-0.3" y="-0.2" width="1.6" height="1.4" id="solid">
			<feFlood flood-color="var(--theme-sub-heading-color)" />
			<feComposite in="SourceGraphic" operator="xor" />
		</filter>

		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<g style="transform: rotate(-90deg);">
			<text x="-20.8%" y="12.5%" class="center upper" reference-orientation="90" fill="var(--theme-sub-heading-color)" style="font-size:450%;font-weight:600;">
				<xsl:choose>
					<xsl:when test="//single/soldDate!=''">
						<xsl:text>Sold</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>Listed</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</text>
		</g>

		<g style="transform:translate(88.8%,15%)">
			<text x="5%" y="0%" filter="url(#solid)" class="upper bold center" style="fill:var(--theme-body-background); font-size: 110%;font-weight:600;">
				<xsl:choose>
					<xsl:when test="//single/soldDate!=''">
						<tspan class="narrow">Sold For</tspan>
						<tspan class="narrow" x="5%" dy="5%">
							<xsl:call-template name="cost">
								<xsl:with-param name="price" select="//single/salePrice" />
							</xsl:call-template>
						</tspan>
					</xsl:when>
					<xsl:otherwise>
						<tspan style="font-weight:600;">Asking</tspan>
						<tspan style="font-weight:600;" x="5%" dy="5%">
							<xsl:call-template name="cost">
								<xsl:with-param name="price" select="//single/price" />
							</xsl:call-template>
						</tspan>
					</xsl:otherwise>
				</xsl:choose>
			</text>
			<text x="5%" y="0%" fill="#fff" class="upper bold center" style="fill:var(--theme-body-background); font-size: 110%;font-weight:600;">
				<xsl:choose>
					<xsl:when test="//single/soldDate!=''">
						<tspan class="narrow">Sold For</tspan>
						<tspan class="narrow" x="5%" dy="5%">
							<xsl:call-template name="cost">
								<xsl:with-param name="price" select="//single/salePrice" />
							</xsl:call-template>
						</tspan>
					</xsl:when>
					<xsl:otherwise>
						<tspan style="font-weight:600;">Asking</tspan>
						<tspan style="font-weight:600;" x="5%" dy="5%">
							<xsl:call-template name="cost">
								<xsl:with-param name="price" select="//single/price" />
							</xsl:call-template>
						</tspan>
					</xsl:otherwise>
				</xsl:choose>
			</text>
		</g>
		<g>
			<text x="50%" y="76%" class="center upper" fill="var(--theme-body-background)" style="font-size:200%;font-weight:600;" data-max-width="80%">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'areaname'" />
					<xsl:with-param name="default" select="concat( 'Incredible ', //area/name,' ', lower-case($singularPropertyType),'!' )" />
				</xsl:call-template>
			</text>

			<text x="50%" y="82%" class="upper center" fill="var(--theme-body-background)" style="font-size:200%;">
				<xsl:call-template name="listing-address"/>
			</text>

			<text x="50%" y="92%" class="medium center" fill="var(--theme-body-background)">
				<xsl:if test="//agent[1]/firstName!='' and //agent[1]/lastName!=''">
					<tspan>
						<xsl:value-of select="concat( //agent[1]/marketingName, '&#160;', ', Innovator REALTOR' )" />
					</tspan>
					<tspan class="bold">&#160;&#160;&#8226;&#160;&#160;</tspan>
				</xsl:if>

				<xsl:if test="//agent[1]/mobile!=''">
					<tspan>
						<xsl:value-of select="//agent[1]/mobile" />
					</tspan>
				</xsl:if>

				<xsl:if test="//agent[1]/marketingEmail!=''">
					<tspan class="bold">&#160;&#160;&#8226;&#160;&#160;</tspan>
					<tspan>
						<xsl:value-of select="//agent[1]/marketingEmail" />
					</tspan>
				</xsl:if>
			</text>
		</g>
		<xsl:call-template name="copyright">
			<xsl:with-param name="disclaimer" select="'direct-mail'" />
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>
