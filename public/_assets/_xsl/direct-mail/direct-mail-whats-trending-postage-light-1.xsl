<?xml version="1.0"?>
<!--
	Asset Name:	Direct Mail Whats Trending Postage Light 01
	Tags:		Social Marketing Ad
	Sizes:		Postcard
	Supports:	Area, Listing
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />


	<xsl:template name="body">
		<xsl:call-template name="svg-wrapper" />
	</xsl:template>

	<xsl:template name="svg-body">
		<rect x="0%" y="0%" width="34%" height="100%" fill-opacity="0.1" fill="var(--theme-sub-heading-color)" />
		<image x="0" y="0" width="34%" height="100%" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/map-light-bg.png' )" />
			</xsl:attribute>
		</image>
		<rect x="63.5%" y="0%" width="36.5%" height="100%" fill="#fff"></rect>

		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<xsl:variable name="status-caption">
			<xsl:choose>
				<xsl:when test="(number(//single/statusTypeID)=3) or (number(//single/statusTypeID)=4) or (number(//single/statusTypeID)=12)">
					<xsl:value-of select="'In Escrow'" />
				</xsl:when>
				<xsl:when test="number(//single/statusTypeID)=2">
					<xsl:value-of select="'Just Sold'" />
				</xsl:when>
				<xsl:when test="number(//single/statusTypeID)=14">
					<xsl:value-of select="'Coming Soon'" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'Just Listed'" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<use fill="var(--theme-sub-heading-color)" x="-8%" y="45%" width="50%" height="30%">
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#arrow-down-bg-shape' )" />
		</use>
		<g style="transform: translate(2%, 71%);">
			<image x="0" y="0" width="8%" height="17%" preserveAspectRatio="xMidYMid slice">
				<xsl:attribute name="href">
					<xsl:value-of select="//agent[1]/photo" />
				</xsl:attribute>
			</image>
			<text class="h1" x="0" y="18%" style="font-size:120%;">
				<tspan class="upper bold">
					<xsl:value-of select="$status-caption" />
				</tspan>
				<tspan>
					<xsl:text>&#160;</xsl:text>
				</tspan>
				<tspan>By</tspan>
				<tspan>
					<xsl:text>&#160;</xsl:text>
				</tspan>
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentName'" />
						<xsl:with-param name="default" select="//agent[1]/marketingName" />
					</xsl:call-template>
				</tspan>
			</text>
		</g>

		<image x="5.8%" y="11%" width="22.5%" height="34%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-1'" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<foreignObject x="2%" y="93.5%" width="31%" height="7%" style="color:var(--theme-sub-heading-color);-webkit-line-clamp:1;line-clamp:1; text-overflow: ellipsis;display: -webkit-box; font-size: 60%;line-height: 120%;">
<xsl:call-template name="solicitation-disclaimer" />

		</foreignObject>

		<rect stroke="var(--theme-heading-color)" stroke-width="15" rx="20" ry="20" fill-opacity="0" x="5.3%" y="10.8%" width="23.5%" height="34%"></rect>
		<rect stroke="var(--theme-body-background)" stroke-width="10" rx="20" ry="20" fill-opacity="0" x="5.9%" y="11.8%" width="22.3%" height="32%"></rect>
		<rect x="34%" y="0%" width="32%" height="100%" fill="#fff"></rect>
		<svg x="33.5%" y="4%" width="34%" height="50%">
			<xsl:if test="number(//single/statusTypeID)=2">
				<foreignObject x="5.5%" y="6%" class="medium" width="80%" height="30%" fill="#5C5C5C" style=" font-size:150%;font-family: var(--theme-heading-font);color:var(--theme-heading-color); line-height: 100%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'justlisted'" />
						<xsl:with-param name="default" select="concat( 'How does your' , ' ', lower-case($singularPropertyType),' ', 'compare?')" />
					</xsl:call-template>
				</foreignObject>
			</xsl:if>
			<xsl:if test="number(//single/statusTypeID)=1">
				<foreignObject x="5.5%" y="6%" class="medium" width="80%" height="30%" fill="#5C5C5C" style=" font-size:150%;font-family: var(--theme-heading-font);color:var(--theme-heading-color); line-height: 100%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'justlisted'" />
						<xsl:with-param name="default" select="concat( 'How does your' , ' ', lower-case($singularPropertyType),' ', 'compare?')" />
					</xsl:call-template>
				</foreignObject>
			</xsl:if>
			<xsl:if test="(number(//single/statusTypeID)=3) or (number(//single/statusTypeID)=4) or (number(//single/statusTypeID)=12)">
				<foreignObject x="5.5%" y="0%" class="medium" width="80%" height="30%" fill="#5C5C5C" style="font-size:160%;font-family: var(--theme-heading-font);color:var(--theme-heading-color); line-height: 100%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'justlisted'" />

						<xsl:with-param name="default" select="concat( 'In Escrow! – Want to see how YOUR' , ' ', lower-case($singularPropertyType),' ', 'compare?')" />
					</xsl:call-template>
				</foreignObject>
			</xsl:if>
			<xsl:if test="number(//single/statusTypeID)=14">
				<foreignObject x="5.5%" y="0%" class="medium" width="80%" height="30%" fill="#5C5C5C" style="font-size:160%;font-family: var(--theme-sub-heading-font);color:var(--theme-heading-color); line-height: 100%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'justlisted'" />

						<xsl:with-param name="default" select="concat( 'In Escrow! – Want to see how YOUR' , ' ', lower-case($singularPropertyType),' ', 'compare?')" />
					</xsl:call-template>
				</foreignObject>
			</xsl:if>

			<xsl:if test="number(//single/statusTypeID)=2">
				<foreignObject x="5.5%" y="27%" width="80%" height="40%" style="font-size:100%;line-height:1.5; color:var(--theme-body-color);font-family: var(--theme-sub-heading-font);">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'discript'" />
						<xsl:with-param name="default" select="concat( ' Just Sold at ', //single/address/street , '. Scan the QR code below to see how your' , ' ', lower-case($singularPropertyType),' ', 'compares with this property.')" />
					</xsl:call-template>
				</foreignObject>
			</xsl:if>
			<xsl:if test="number(//single/statusTypeID)=1">
				<foreignObject x="5.5%" y="27%" width="80%" height="40%" style="font-size:100%;line-height:1.5; color:#(--theme-body-color);font-family: var(--theme-sub-heading-font);">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'discript'" />
						<xsl:with-param name="default" select="concat( ' Just Listed at ', //single/address/street , '. Scan the QR code below to see how your' , ' ', lower-case($singularPropertyType),' ', 'compares with this property.')" />
					</xsl:call-template>
				</foreignObject>
			</xsl:if>
			<xsl:if test="(number(//single/statusTypeID)=3) or (number(//single/statusTypeID)=4) or (number(//single/statusTypeID)=12)">
				<foreignObject x="5.5%" y="27%" width="80%" height="40%" style="font-size:100%;line-height:1.5; color:#(--theme-body-color);font-family: var(--theme-sub-heading-font);">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'discript'" />
						<xsl:with-param name="default" select="concat( ' Now pending at ', //single/address/street , '. Scan the QR code below to see how your' , ' ', lower-case($singularPropertyType),' ', 'compares with this property.')" />
					</xsl:call-template>
				</foreignObject>
			</xsl:if>
			<xsl:if test="number(//single/statusTypeID)=14">
				<foreignObject x="5.5%" y="27%" width="80%" height="40%" style="font-size:100%;line-height:1.5; color:#(--theme-body-color);font-family: var(--theme-sub-heading-font);">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'discript'" />
						<xsl:with-param name="default" select="concat( ' Coming Soon at ', //single/address/street , '. Scan the QR code below to see how your' , ' ', lower-case($singularPropertyType),' ', 'compares with this property.')" />
					</xsl:call-template>
				</foreignObject>
			</xsl:if>
		</svg>
		<xsl:if test="number(//single/statusTypeID)=2">
			<g style="transform: translate(34.5%, 40%);">
				<use x="0" y="0" width="3%" height="3%">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#pin-icon' )" />
				</use>
				<use x="0" y="5%" width="3%" height="3%">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#email-new' )" />
				</use>
				<use x="0" y="10%" width="3%" height="3%">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#telephone' )" />
				</use>
				<text x="3%" y="0" fill="#5C5C5C" data-max-width="20%" style="font-weight:600;font-size:97%; font-family: var(--theme-sub-heading-font);">
					<tspan class="narrow" style="font-family: var(--theme-sub-heading-font);">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'website'" />
							<xsl:with-param name="default" select="'Website'" />
						</xsl:call-template>
					</tspan>
					<tspan>
						<xsl:text>&#160;</xsl:text>
					</tspan>
					<tspan text-decoration="underline">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'website'" />
							<xsl:with-param name="default" select="//agent[1]/website" />
						</xsl:call-template>
					</tspan>
				</text>

				<text x="3%" y="5%" fill="#5C5C5C" data-max-width="20%" style="font-weight:600;font-size:97%;font-family: var(--theme-sub-heading-font);">
					<tspan class="narrow">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'Contact Us'" />
							<xsl:with-param name="default" select="'Contact Us'" />
						</xsl:call-template>
					</tspan>
					<tspan>
						<xsl:text>&#160;</xsl:text>
					</tspan>
					<tspan text-decoration="underline">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'agentmarketingEmail'" />
							<xsl:with-param name="default" select="//agent[1]/marketingEmail" />
						</xsl:call-template>
					</tspan>
				</text>
				<text x="3%" y="10%" fill="#5C5C5C" style="font-weight:600;font-size:97%;font-family: var(--theme-sub-heading-font);">
					<tspan class="narrow">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'Call Us'" />
							<xsl:with-param name="default" select="'Call Us'" />
						</xsl:call-template>
					</tspan>
					<tspan>
						<xsl:text>&#160;</xsl:text>
					</tspan>
					<tspan text-decoration="underline">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'agentmobile'" />
							<xsl:with-param name="default" select="//agent[1]/mobile" />
						</xsl:call-template>
					</tspan>
				</text>
			</g>
		</xsl:if>

		<xsl:if test="number(//single/statusTypeID)=1">
			<g style="transform: translate(34.5%, 40%);">
				<use x="0" y="0" width="3%" height="3%">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#pin-icon' )" />
				</use>
				<use x="0" y="5%" width="3%" height="3%">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#email-new' )" />
				</use>
				<use x="0" y="10%" width="3%" height="3%">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#telephone' )" />
				</use>
				<text x="3%" y="0" fill="#5C5C5C" data-max-width="20%" style="font-weight:600;font-size:97%; font-family: var(--theme-sub-heading-font);">
					<tspan class="narrow" style="font-family: var(--theme-sub-heading-font);">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'website'" />
							<xsl:with-param name="default" select="'Website'" />
						</xsl:call-template>
					</tspan>
					<tspan>
						<xsl:text>&#160;</xsl:text>
					</tspan>
					<tspan text-decoration="underline">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'website'" />
							<xsl:with-param name="default" select="//agent[1]/website" />
						</xsl:call-template>
					</tspan>
				</text>
				<text x="3%" y="5%" fill="#5C5C5C" data-max-width="20%" style="font-weight:600;font-size:97%;font-family: var(--theme-sub-heading-font);">
					<tspan class="narrow">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'Contact Us'" />
							<xsl:with-param name="default" select="'Contact Us'" />
						</xsl:call-template>
					</tspan>
					<tspan>
						<xsl:text>&#160;</xsl:text>
					</tspan>
					<tspan text-decoration="underline">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'agentmarketingEmail'" />
							<xsl:with-param name="default" select="//agent[1]/marketingEmail" />
						</xsl:call-template>
					</tspan>
				</text>
				<text x="3%" y="10%" fill="#5C5C5C" style="font-weight:600;font-size:97%;font-family: var(--theme-sub-heading-font);">
					<tspan class="narrow">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'Call Us'" />
							<xsl:with-param name="default" select="'Call Us'" />
						</xsl:call-template>
					</tspan>
					<tspan>
						<xsl:text>&#160;</xsl:text>
					</tspan>
					<tspan text-decoration="underline">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'agentmobile'" />
							<xsl:with-param name="default" select="//agent[1]/mobile" />
						</xsl:call-template>
					</tspan>
				</text>
			</g>
		</xsl:if>

		<xsl:if test="number(//single/statusTypeID)=3">
			<g style="transform: translate(34.5%, 40%);">
				<use x="0" y="0" width="3%" height="3%">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#pin-icon' )" />
				</use>
				<use x="0" y="5%" width="3%" height="3%">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#email-new' )" />
				</use>
				<use x="0" y="10%" width="3%" height="3%">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#telephone' )" />
				</use>
				<text x="3%" y="0" fill="#5C5C5C" data-max-width="20%" style="font-weight:600;font-size:90%; font-family: var(--theme-sub-heading-font);">
					<tspan class="narrow" style="font-family: var(--theme-sub-heading-font);">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'website'" />
							<xsl:with-param name="default" select="'Website'" />
						</xsl:call-template>
					</tspan>
					<tspan>
						<xsl:text>&#160;</xsl:text>
					</tspan>
					<tspan text-decoration="underline">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'website'" />
							<xsl:with-param name="default" select="//agent[1]/website" />
						</xsl:call-template>
					</tspan>
				</text>
				<text x="3%" y="5%" fill="#5C5C5C" data-max-width="20%" style="font-weight:600;font-size:90%;font-family: var(--theme-sub-heading-font);">
					<tspan class="narrow">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'Contact Us'" />
							<xsl:with-param name="default" select="'Contact Us'" />
						</xsl:call-template>
					</tspan>
					<tspan>
						<xsl:text>&#160;</xsl:text>
					</tspan>
					<tspan text-decoration="underline">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'agentmarketingEmail'" />
							<xsl:with-param name="default" select="//agent[1]/marketingEmail" />
						</xsl:call-template>
					</tspan>
				</text>
				<text x="3%" y="10%" fill="#5C5C5C" style="font-weight:600;font-size:90%;font-family: var(--theme-sub-heading-font);">
					<tspan class="narrow">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'Call Us'" />
							<xsl:with-param name="default" select="'Call Us'" />
						</xsl:call-template>
					</tspan>
					<tspan>
						<xsl:text>&#160;</xsl:text>
					</tspan>
					<tspan text-decoration="underline">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'agentmobile'" />
							<xsl:with-param name="default" select="//agent[1]/mobile" />
						</xsl:call-template>
					</tspan>
				</text>
			</g>
		</xsl:if>

		<g style="transform: translate(57%, 66%);">
			<image x="0" y="0" width="8%" height="8%" preserveAspectRatio="xMidYMid meet">
				<xsl:attribute name="href">
					<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons/qr-code.svg' )" />
				</xsl:attribute>
			</image>
			<text x="0.8%" y="4%" fill="#5C5C5C" style="font-size:50%">
				<tspan x="0.6%">Scan the</tspan>
				<tspan x="0.6%" dy="1.2%">QR Code</tspan>
				<tspan x="0.6%" dy="1.2%">with your</tspan>
				<tspan x="0.6%" dy="1.2%">camera</tspan>
			</text>
		</g>

		<!-- <image width="23%" height="10%" x="38.5%" y="78%" class="center" id="logo" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="$personalLogo" />
			</xsl:attribute>
		</image> -->

		<xsl:choose>
			<xsl:when test="$companyLogo='' or $personalLogo=''">
				<image x="38.5%" y="78%" width="23%" height="10%" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:choose>
							<xsl:when test="$personalLogo=''">
								<xsl:value-of select="$companyLogo" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$personalLogo" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</image>
			</xsl:when>
			<xsl:otherwise>
				<image x="30%" y="78%" width="23%" height="11.5%" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="$companyLogo" />
					</xsl:attribute>
				</image>
				<image x="48.5%" y="78%" width="14%" height="10%" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="$personalLogo" />
					</xsl:attribute>
				</image>
			</xsl:otherwise>
		</xsl:choose>

		<text x="50%" y="93%" class="center small">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'licenseno'" />
				<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
			</xsl:call-template>
		</text>

		<rect x="64%" y="20%" stroke="#E6EAEB" stroke-width="1" fill-opacity="1" width="34.5%" height=".2" fill="#E6EAEB"></rect>
		<g style="transform: translate(66.5%, 7%);">
			<text fill="#5c5c5c" style="font-size:100%;font-weight:400; letter-spacing:0.4;">
				<xsl:value-of select="//agent[1]/address/street" />
			</text>
			<text y="3%" fill="#5c5c5c" style="font-size:100%;font-weight:400; letter-spacing0.4;">
				<xsl:value-of select="//agent[1]/address/city" />

				<xsl:text>, </xsl:text>
				<xsl:value-of select="//agent[1]/address/state" />

				<xsl:text>&#160;</xsl:text>
				<xsl:value-of select="//agent[1]/address/zip" />
			</text>
		</g>
<rect x="63.5%" y="0" stroke="#E6EAEB" stroke-width="1" fill-opacity="1" width=".2" height="100%" fill="#E6EAEB" />


		<xsl:call-template name="copyright">
			<xsl:with-param name="disclaimer" select="'direct-mail'" />
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>