<?xml version="1.0"?>
<!--
	Asset Name:	Chelsea Single Listing Back																
	Tags:		Social Marketing Ad
	Sizes:		Postcard
	Supports:	Area, Listing
	Approved: 	True
	Access:		d817681d-3527-445d-b053-79f933fb03fc
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>

	<xsl:variable name="mapListingNodes" select="//listings/listing[@state='active']" />

	<xsl:template name="svg-scripts">
		<xsl:call-template name="map-files" />
		<script>
			<xsl:text>var listings=[</xsl:text>
			<xsl:for-each select="$mapListingNodes">
				<xsl:if test="position() &lt;= 8">
					<xsl:value-of select="concat( &quot;{state:'&quot;, @state, &quot;',lat:'&quot;, @lat, &quot;',lng:'&quot;, @lon, &quot;', dom:&quot;, @dom, &quot;},&quot; )" />
				</xsl:if>
			</xsl:for-each>
			<xsl:text>];</xsl:text>
		</script>
	</xsl:template>

	<xsl:template name="svg-body">
		<link rel="stylesheet">
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/futura-condensed.css')"/>
		</link>

		<defs>
			<linearGradient id="leftRightShadow">
				<stop offset="0" stop-color="#000" stop-opacity="10%"/>
				<stop offset="20%" stop-color="#000" stop-opacity="0"/>

				<stop offset="80%" stop-color="#000" stop-opacity="0"/>
				<stop offset="100%" stop-color="#000" stop-opacity="10%"/>
			</linearGradient>

			<linearGradient id="topBottomShadow" gradientTransform="rotate(90)">
				<stop offset="0" stop-color="#000" stop-opacity="10%"/>
				<stop offset="20%" stop-color="#000" stop-opacity="0"/>

				<stop offset="80%" stop-color="#000" stop-opacity="0"/>
				<stop offset="100%" stop-color="#000" stop-opacity="10%"/>
			</linearGradient>

			<filter id="inset-shadow">
				<feComponentTransfer in="SourceAlpha" result="inset-selection">
					<feFuncA type="discrete" tableValues="0 1 1 1 1 1"/>
				</feComponentTransfer>

				<feComponentTransfer in="SourceGraphic" result="original-no-fill">
					<feFuncA type="discrete" tableValues="0 0 1"/>
				</feComponentTransfer>
				<feColorMatrix type="matrix" in="original-no-fill" result="new-source-alpha" values="0 0 0 0 0
                      0 0 0 0 0
                      0 0 0 0 0
                      0 0 0 1 0" />
				<feGaussianBlur in="new-source-alpha" result="blur" stdDeviation="5" />
				<feGaussianBlur in="new-source-alpha" result="blur2" stdDeviation="10" />
				<feGaussianBlur in="new-source-alpha" result="blur3" stdDeviation="15" />
				<feMerge result="blur">
					<feMergeNode in="blur" mode="normal"/>
					<feMergeNode in="blur2" mode="normal"/>
					<feMergeNode in="blur3" mode="normal"/>
				</feMerge>

				<feComposite operator="in" in="inset-selection" in2="blur" result="inset-blur"/>

				<feComposite operator="over" in="original-no-fill" in2="inset-blur"/>
			</filter>
		</defs>

		<image x="0" y="0" width="36.5%" height="100%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/chelsea-back.jpg' )" />
			</xsl:attribute>
		</image>

		<rect fill="#fff" x="12%" y="80%" width="25%" height="12%"/>

		<image x="12.5%" y="79.5%" width="9.5%" height="13%" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/chelsea-name.png' )" />
			</xsl:attribute>
		</image>

		<rect fill="#006a64" x="22.5%" y="81%" rx="10" ry="10" width="15%" height="10%"/>

		<text x="23%" y="82.5%" class="upper" fill="#fff" font-size="105%" data-max-width="22%" style="font-family:Futura Condensed;">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'agentwebsite'" />
				<xsl:with-param name="default" select="//agent[1]/website" />
			</xsl:call-template>
		</text>

		<text x="23%" y="86.5%" class="lower" fill="#fff" font-size="105%" data-max-width="20%" style="font-family:Futura Condensed;">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'agentmarketingEmail'" />
				<xsl:with-param name="default" select="//agent[1]/marketingEmail" />
			</xsl:call-template>
		</text>

		<rect x="36.5%" y="0" width="27%" height="100%" fill="#fff"/>
		<rect x="36.5%" y="0%" width="27%" height="80%" stroke="#fff" stroke-width="0.5" fill-opacity="40%" filter="url(#inset-shadow)"/>
		<rect x="36.5%" y="80%" width="27%" height="20%" stroke="#fff" stroke-width="0.5" fill-opacity="40%" filter="url(#inset-shadow)"/>

		<rect x="63.5%" y="30%" width="40%" height="19%" fill="#006a64"/>

		<xsl:call-template name="cropped-container" />

		<image x="2%" y="74%" width="10%" height="26%" preserveAspectRatio="xMidYMin slice">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/chelsea-roger.jpg' )" />
			</xsl:attribute>
		</image>

		<rect x="2%" y="73.9%" width="10%" height="26%" stroke="#fff" stroke-width="2" fill="none" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<g style="transform: translate(5.5%, 6%);">
			<image x="-1%" y="0%" width="28%" height="29%">
				<xsl:attribute name="href">
					<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/chelsea-map.png' )" />
				</xsl:attribute>
			</image>

			<use x="2%" y="29.5%" width="10%" height="7.5%">
				<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#arrow-down-bg-shape' )" />
			</use>
			<rect stroke="#006a64" stroke-width="12" rx="20" ry="20" fill-opacity="0" x="-0.5%" y="0.2%" width="27%" height="29.2%"/>
		</g>

		<foreignObject x="37.5%" y="4%" width="25%" height="50%">
			<p class="center upper" style="font-size:290%;margin:0; color:#000; font-family:Futura Condensed; font-style:italic; -webkit-line-clamp: unset;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'your'" />
					<xsl:with-param name="default" select="'your neighbor’s house'" />
				</xsl:call-template>
				<br/>
				<span class="bold">
					<xsl:value-of select="'Just'"/>
				</span>
				<br/>
				<span class="bold">
					<xsl:value-of select="concat($soldListed, '!')"/>
				</span>
			</p>
		</foreignObject>

		<text x="51%" y="75%" class="center" fill="#000" style="font-size:85%;font-family:Futura Condensed;">

			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'Scan the QR Code with your camera'" />
				<xsl:with-param name="default" select="'Scan the QR Code with your camera'" />
			</xsl:call-template>
		</text>

		<g style="transform: translate(55.5%, 61%);">
			<use fill="#006a64" x="0" y="0" width="9%" height="9%">
				<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#hand' )" />
			</use>
		</g>

		<image width="25%" x="37.5%" y="80%" height="13%" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/seacliff.png' )" />
			</xsl:attribute>
		</image>

		<text x="50%" y="93%" class="center" fill="#000" font-size="95%" font-family="Futura Condensed">
			<tspan>
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentname'" />
					<xsl:with-param name="default" select="'Owned by a subsidiary of NRT LLC. | CalDRE #: 01416035'" />
				</xsl:call-template>
			</tspan>
		</text>

		<g style="transform: translate(65%, 34%);">
			<text fill="#fff" class="middle" font-size="160%" font-weight="600" style="font-family:Futura Condensed;">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'714.536.5377'" />
						<xsl:with-param name="default" select="'714.536.5377'" />
					</xsl:call-template>
				</tspan>
			</text>
			<text y="6%" fill="#fff" class="middle" font-size="150%" style="letter-spacing:0.4;font-family:Futura Condensed;">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'19440 Goldenwest St'" />
						<xsl:with-param name="default" select="'19440 Goldenwest St'" />
					</xsl:call-template>
				</tspan>
			</text>
			<text y="11%" fill="#fff" class="middle" font-size="150%" style="letter-spacing:0.4;font-family:Futura Condensed;">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'Huntington Beach, CA 92648'" />
						<xsl:with-param name="default" select="'Huntington Beach, CA 92648'" />
					</xsl:call-template>
				</tspan>
			</text>
		</g>
		<xsl:call-template name="copyright">
			<xsl:with-param name="disclaimer" select="'direct-mail'" />
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>