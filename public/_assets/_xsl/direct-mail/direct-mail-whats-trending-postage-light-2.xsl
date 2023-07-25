<?xml version="1.0"?>
<!--
	Asset Name:	Direct Mail Whats Trending Postage Light 2
	Tags:		Social Marketing Ad
	Sizes:		Postcard
	Supports:	Area
	Approved: 	False
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
	<xsl:import href="common.xsl"/>

	<xsl:template name="svg-body">
		<image x="0" y="0%" width="63.5%" height="100%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="1" />
				<xsl:with-param name="preferPrimary" select="'true'" />
			</xsl:call-template>
		</image>
		<rect x="0%" y="0%" width="63.5%" height="100%" fill-opacity="0.8" fill="var(--theme-body-background)"/>
		<rect x="63.5%" y="0%" width="36.5%" height="100%" fill="#fff" />

		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">

		<style>
			<xsl:value-of select="'
	        foreignObject:not(.editing) p{
	            line-height:140%;
	            overflow: unset;
                -webkit-line-clamp: unset;
	        }'"/>
		</style>

		<rect x="3%" y="5%" width="58%" height="39%" fill="var(--theme-body-background)"/>
		<image x="3.5%" y="6%" width="28%" height="36.6%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="2" />
			</xsl:call-template>
		</image>

		<image x="32.5%" y="6%" width="28%" height="36.6%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="3" />
			</xsl:call-template>
		</image>

		<svg x="0.5%" y="30.5%" width="50%" height="52%">
			<xsl:if test="number(//single/statusTypeID)=2">
				<foreignObject x="5%" y="20%" width="85%" height="40%" style="font-weight:600;font-size:180%;line-height:1.5; color:var(--theme-heading-color)">
					<p>
						<xsl:text>JUST SOLD – But </xsl:text>
						<xsl:value-of select="$agentIWe"/>
						<xsl:text> still have buyers who want YOUR home!</xsl:text>
					</p>
				</foreignObject>
				<foreignObject x="5%" y="52%" width="77%" height="46%" style="font-size:94%;line-height:1.5;-webkit-line-clamp: 3;text-align: justify;">
					<p>
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'yourneighborhood'" />
							<xsl:with-param name="default" select="concat( 'The home at ', //single/address/street , ' just sold. Scan the QR code below to see how your home compares! Then call ', $agentMeUs, ' for a custom evaluation.')" />
						</xsl:call-template>
					</p>
				</foreignObject>
			</xsl:if>
			<xsl:if test="number(//single/statusTypeID)=1">
				<text x="5%" y="33%" fill="var(--theme-heading-color)" style="font-weight:600;font-size:180%">

					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'yourneighborhood'" />
						<xsl:with-param name="default" select="concat( 'How does your' , ' ', lower-case($singularPropertyType),' ', 'compare?')" />
					</xsl:call-template>
				</text>
				<foreignObject x="5%" y="42%" width="77%" height="46%" style="font-size:94%;line-height:1.5;text-align: justify;">
					<p>
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'yourneighborhood'" />
							<xsl:with-param name="default" select="concat( 'The home at ', //single/address/street , ' is available for sale. Scan the QR code below to get the details about this location and see how YOUR home compares!')" />
						</xsl:call-template>
					</p>
				</foreignObject>
			</xsl:if>
			<xsl:if test="(number(//single/statusTypeID)=3) or (number(//single/statusTypeID)=4) or (number(//single/statusTypeID)=12)">
				<text x="5%" y="33%" fill="var(--theme-heading-color)" style="font-weight:600;font-size:180%">
		    		How does your home compare?
				</text>
				<foreignObject x="5%" y="42%" width="77%" height="46%" style="font-size:94%;line-height:1.5;-webkit-line-clamp: 3;text-align: justify;">
					<p>
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'yourneighborhood'" />
							<xsl:with-param name="default" select="concat( 'The home at ', //single/address/street , ' just went into escrow. Scan the QR code below to get the details on other properties that are available in this area.')" />
						</xsl:call-template>
					</p>
				</foreignObject>
			</xsl:if>

			<xsl:if test="number(//single/statusTypeID)=14">
				<text x="5%" y="33%" fill="var(--theme-heading-color)" style="font-weight:600;font-size:180%">
		    		How does your home compare?
				</text>
				<foreignObject x="5%" y="42%" width="77%" height="46%" style="font-size:94%;line-height:1.5;-webkit-line-clamp: 3;text-align: justify;">
					<p>
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'yourneighborhood'" />
							<xsl:with-param name="default" select="'The home is coming soon. Scan the QR code below to get the details on other properties that are available in this area.'" />
						</xsl:call-template>
					</p>
				</foreignObject>
			</xsl:if>
		</svg>

		<g style="transform: translate(56%, 66%);">
			<use x="0" y="0" width="10%" height="10%">
				<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/qr.svg#qr-code' )" />
			</use>

			<text x="1.2%" y="4.8%" fill="var(--theme-body-color)" style="font-size:40%">
				<tspan x="1.3%">Scan the</tspan>
				<tspan x="1.3%" dy="1.2%">QR Code</tspan>
				<tspan x="1.3%" dy="1.2%">with your</tspan>
				<tspan x="1.3%" dy="1.2%">camera</tspan>
			</text>
		</g>

		<image x="49%" y="78%" width="10%" height="10%" id="logo" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="$companyLogo" />
			</xsl:attribute>
		</image>

		<text x="54%" y="89%" class="center small">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'licenseno'" />
				<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
			</xsl:call-template>
		</text>

		<g style="transform:translate(3%,78%)">
			<svg width="45%" height="17.5%">
				<image x="0" y="0" width="15%" height="80%" preserveAspectRatio="xMidYMid slice">
					<xsl:attribute name="href">
						<xsl:value-of select="//agent[1]/photo" />
					</xsl:attribute>
				</image>

				<text x="23%" y="2%" class="upper" style="font-weight:600;font-size:140%;letter-spacing:4px;" fill="var(--theme-body-color)" data-max-width="20%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentname'" />
						<xsl:with-param name="default" select="concat( //agent[1]/marketingName,'' )" />
					</xsl:call-template>
				</text>
				<text x="23%" y="26%" style="font-size:100%;" fill="var(--theme-heading-color)">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'realtor'" />
						<xsl:with-param name="default" select="'REALTOR'" />
					</xsl:call-template>
				</text>
				<text x="23%" y="45%" style="font-size:100%;" fill="var(--theme-heading-color)">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentmobile'" />
						<xsl:with-param name="default" select="//agent[1]/mobile" />
					</xsl:call-template>
				</text>

				<text x="23%" y="60%" style="font-size:100%;" fill="var(--theme-heading-color)">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentmarketingEmail'" />
						<xsl:with-param name="default" select="//agent[1]/marketingEmail" />
					</xsl:call-template>
				</text>
			</svg>
		</g>

		<rect x="64%" y="17%" stroke="#E6EAEB" stroke-width="1" fill-opacity="1" width="35%" height=".2" fill="#E6EAEB"/>
		<rect x="63.5%" y="0" stroke="#E6EAEB" stroke-width="1" fill-opacity="1" width=".2" height="100%" fill="#E6EAEB"/>

		<text class="small" fill="#8494a0" style="font-weight:600;font-size:100%;">
			<tspan x="67.5%" y="5%">
				<xsl:value-of select="//agent[1]/address/street" />
			</tspan>
			<tspan x="67.5%" y="8%">
				<xsl:value-of select="//agent[1]/address/city" />

				<xsl:text>, </xsl:text>
				<xsl:value-of select="//agent[1]/address/state" />

				<xsl:text>&#160;</xsl:text>
				<xsl:value-of select="//agent[1]/address/zip" />
			</tspan>
		</text>

		<foreignObject x="3%" y="94%" width="55%" height="5%" style="color:var(--theme-sub-heading-color);-webkit-line-clamp:1;line-clamp:1; text-overflow: ellipsis;display: -webkit-box; font-size: 60%;line-height: 120%;">
			<xsl:call-template name="solicitation-disclaimer"/>
		</foreignObject>

		<xsl:call-template name="copyright">
			<xsl:with-param name="disclaimer" select="'direct-mail'" />
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>