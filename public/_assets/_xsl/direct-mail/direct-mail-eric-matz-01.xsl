<?xml version="1.0"?>
<!--
	Asset Name: Direct Mail Eric Matz - No.1
	Tags: 		Open House
	Sizes:		Postcard
	Supports:	Listing, Open-House, Multi-Listing
	Approved: 	False
	Roles:		eric-matz
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
<rect x="0" y="0" width="100%" height="25%" fill="var(--theme-sub-heading-color)" />

		<svg height="80" width="100%" y="22%" x="0">
			<path stroke-linecap="butt" d="M0 20 l3375 0" fill="none" stroke="var(--vivid-color-5)" stroke-width="5"></path>
		</svg>

		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<g>
			<image x="2.5%" y="5%" width="10%" height="15%">
				<xsl:attribute name="href">
					<xsl:value-of select="$companyLogo" />
				</xsl:attribute>
			</image>
			<text x="55%" y="6.5%" class="upper bold large center" fill="var(--theme-body-background)" style="font-size: 160%;font-weight: 600">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'consideringbuying'" />
					<xsl:with-param name="default" select="'are you considering buying or selling?'" />
				</xsl:call-template>
			</text>

			<svg height="80" width="100%" y="13%" x="20%">
				<path stroke-linecap="butt" d="M0 20 l140 0" fill="none" stroke="var(--vivid-color-5)" stroke-width="5"></path>
			</svg>
			<text x="55%" y="13%" class="upper bold large center" fill="var(--theme-body-background)" style="font-size: 160%;font-weight: 600">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentmobile'" />
					<xsl:with-param name="default" select="concat( 'call ', //agent[1]/mobile, '&#160;and let&#8242;s talk' )" />
				</xsl:call-template>
			</text>
			<svg height="80" width="100%" y="13%" x="78%">
				<path stroke-linecap="butt" d="M0 20 l140 0" fill="none" stroke="var(--vivid-color-5)" stroke-width="5"></path>
			</svg>
		</g>

		<g style="transform: translateY(21%);">
			<xsl:for-each select="//listings/listing">
				<xsl:if test="position() &lt; 4">
					<svg x="2.5%" width="20%" height="50%">
						<xsl:attribute name="x">
							<xsl:value-of select="concat( 2.5 + ((position() - 1) * 21), '%')" />
						</xsl:attribute>
						<image x="5%" y="15%" width="95%" height="37%" preserveAspectRatio="xMidYMid slice">
							<xsl:call-template name="switch-image">
								<xsl:with-param name="idx">
									<xsl:value-of select="position()" />
								</xsl:with-param>
								<xsl:with-param name="default" select="@thumb" />
							</xsl:call-template>
						</image>
						<text class="bold center medium" x="50%" y="54%" fill="var(--theme-body-color)" style="font-size:150%" data-max-width="18%">
							<xsl:value-of select="//areas/area[1]/name" />
						</text>
						<text class="center" x="50%" y="62%" fill="var(--theme-body-color)" style="font-size:120%">
							<xsl:value-of select="@address" />
						</text>
						<text class="center upper" x="50%" y="70%" fill="var(--theme-body-color)" style="font-size:120%">
<xsl:value-of select="concat( @beds, ' BR &#8226; ', @baths,' BA &#8226; ', format-number( @size, '###,###' ), ' SF' )" />

						</text>
						<text class="upper center bold" x="50%" y="78%" fill="var(--theme-body-color)" style="font-size:120%;">
							<xsl:choose>
								<xsl:when test="@state='sold'">
									<tspan>Sold For </tspan>
<xsl:value-of select="format-number( @salePrice, '$###,###')" />

								</xsl:when>
								<xsl:otherwise>
									<tspan>Asking </tspan>
<xsl:value-of select="format-number( @listPrice, '$###,###')" />

								</xsl:otherwise>
							</xsl:choose>
						</text>
						<g style="transform:translate(4%,35%)">
							<filter x="-0.1" y="-0.3" width="1.2" height="1.7" id="solid">
<feFlood flood-color="var(--theme-body-color)" />

								<feComposite in="SourceGraphic" operator="xor" />
							</filter>
							<text y="0%" filter="url(#solid)" class="upper" style="fill:var(--theme-body-background); font-size: 100%;">
								<xsl:text>Just </xsl:text>
								<xsl:call-template name="soldListed">
									<xsl:with-param name="sold" select="@state='sold'" />
								</xsl:call-template>
							</text>
							<text y="0%" fill="#fff" class="upper" style="fill:var(--theme-body-background); font-size: 100%;">
								<xsl:text>Just </xsl:text>
								<xsl:call-template name="soldListed">
									<xsl:with-param name="sold" select="@state='sold'" />
								</xsl:call-template>
							</text>
						</g>
					</svg>
				</xsl:if>
			</xsl:for-each>

<rect x="2.5%" y="46%" width="63%" height="13%" fill="var(--theme-sub-heading-color)" />

			<text x="35%" y="48%" class="center bold capitalize" fill="var(--theme-body-background)" fontWeight="600" style="font-size:150%;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'sellinganywhere'" />
					<xsl:with-param name="default" select="concat( 'Buying Or Selling Anywhere In ', //single/address/state, '…')" />
				</xsl:call-template>
			</text>
			<text x="35%" y="53%" class="center bold upper" fill="var(--theme-body-background)" fontWeight="600" style="font-size:140%;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'wesellit'" />
					<xsl:with-param name="default" select="'WE SELL IT ALL!'" />
				</xsl:call-template>
			</text>

			<svg x="65.5%" y="7%" height="63.5%" width="500">
				<line y2="100%" style="stroke:var(--theme-body-color);stroke-width:5" />
			</svg>
		</g>

		<g style="transform: translate(79%, 28%);">
			<text x="5%" class="upper medium center" fill="var(--theme-sub-heading-color)" style="font-weight: 600; font-size:150%;">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'downloadournew'" />
						<xsl:with-param name="default" select="'download our new'" />
					</xsl:call-template>
				</tspan>
				<tspan x="5%" dy="5%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'freeapptoday'" />
						<xsl:with-param name="default" select="'free app today!'" />
					</xsl:call-template>
				</tspan>
			</text>
			<image x="0" y="11%" width="10%" height="20%" preserveAspectRatio="xMidYMid meet">
				<xsl:attribute name="href">
					<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/real-state-logo.png' )" />
				</xsl:attribute>
			</image>

			<image x="-12%" y="34%" width="12%" height="30%" preserveAspectRatio="xMidYMid meet">
				<xsl:attribute name="href">
					<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/mobile-img.png' )" />
				</xsl:attribute>
			</image>

			<text x="0" y="36%" class="upper" style="font-weight: 600; font-size:120%;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'accuratedata'" />
					<xsl:with-param name="default" select="'1. Accurate data'" />
				</xsl:call-template>
			</text>
			<text x="0" y="42%" class="upper medium" style="font-weight: 600; font-size:120%;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'filtersearch'" />
					<xsl:with-param name="default" select="'2. filter &amp; search'" />
				</xsl:call-template>
			</text>
			<text x="0" y="48%" class="upper medium" style="font-weight: 600; font-size:120%;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'onetouchaway'" />
					<xsl:with-param name="default" select="'3. one touch away'" />
				</xsl:call-template>
			</text>
			<text x="0" y="54%" class="upper medium" style="font-weight: 600; font-size:120%;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'funeasy'" />
					<xsl:with-param name="default" select="'4. fun &amp; easy'" />
				</xsl:call-template>
			</text>
		</g>

		<g style="transform: translateY(83%);">
			<image x="6%" y="-11%" width="18%" height="30%" preserveAspectRatio="xMidYMid meet">
				<xsl:attribute name="href">
					<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/team-member.png' )" />
				</xsl:attribute>
			</image>

			<image x="30%" width="10%" height="15%">
				<xsl:attribute name="href">
					<xsl:value-of select="$companyLogo" />
				</xsl:attribute>
			</image>
			<text x="49%" class="upper normal sub-heading">
				<tspan>
					<xsl:value-of select="//agent[1]/marketingLicense" />
				</tspan>
			</text>
		</g>

		<xsl:call-template name="copyright">
			<xsl:with-param name="disclaimer" select="'direct-mail'" />
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>