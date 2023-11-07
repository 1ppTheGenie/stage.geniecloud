<?xml version="1.0"?>
<!--
	Asset Name:	Your Neighbor's House - Single Side
	Tags:		Direct Mail
Supports:	Listing, Print, ListingCount, Map, QRCode
	Sizes:		Postcard
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />


	<xsl:template name="svg-scripts">
		<xsl:call-template name="map-files" />

		<script>
			<xsl:text>var listings=[</xsl:text>
			<xsl:for-each select="//listings/listing[@state='sold']">
				<xsl:if test="position() &lt;= number(//output/@listingCount)">
					<xsl:value-of select="concat( &quot;{state:'&quot;, @state, &quot;',salePrice:'&quot;, @salePrice, &quot;',lat:'&quot;, @lat, &quot;',lng:'&quot;, @lon, &quot;'},&quot; )" />
				</xsl:if>
			</xsl:for-each>
			<xsl:text>];</xsl:text>
		</script>
	</xsl:template>

	<xsl:template name="svg-body">
		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<style>
			<xsl:value-of select="'
			ul.marketing {list-style:none;margin:0;padding:0;} 
			ul.marketing li {margin-bottom:2%;padding:0;display:inline-flex;flex-direction:row;height:1rem;align-items:center;}
			svg.bullet { margin-right:1%;height: 100%;}
'" />
		</style>

		<rect x="-2%" y="-2%" width="32%" height="104%" fill="var(--theme-sub-heading-color)" fill-opacity="10%" />

		<image preserveAspectRatio="xMidYMid slice" x="-2%" y="-2%" width="32%" height="104%" fill="#f00">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'background-1'" />
				<xsl:with-param name="default" select="concat( //output/@siteUrl, '_assets/_img/map-light-bg.png' )" />
			</xsl:call-template>
		</image>

		<g style="transform: translate(45%, 3%);text-transform: capitalize;">
			<text x="20%" y="2%" fill="var(--theme-body-color)" font-size="87.5%" font-weight="600">
<xsl:value-of select="//agent[1]/address/street" />

			</text>
			<xsl:if test="$agent2LineAddress='true'">
				<text x="20%" y="4.5%" fill="var(--theme-body-color)" font-size="87.5%" font-weight="600">
					<xsl:value-of select="//agent[1]/address/address2" />
				</text>
			</xsl:if>
			<text x="20%" fill="var(--theme-body-color)" font-size="87.5%" font-weight="600">
				<xsl:attribute name="y">
					<xsl:choose>
						<xsl:when test="$agent2LineAddress='true'">
							<xsl:value-of select="'7%'" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'4.5%'" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>

				<xsl:value-of select="concat( //agent[1]/address/city, ', ' )" />

				<tspan style="text-transform: uppercase;">
<xsl:value-of select="concat( //agent[1]/address/state, ' ', //agent[1]/address/zip )" />

				</tspan>
			</text>
		</g>

		<foreignObject x="4%" y="6%" width="23%" height="44%">
			<div data-width="23%" data-height="44%" style="border-radius: 12px;">
				<xsl:call-template name="map-output">
					<xsl:with-param name="style" select="//output/@mapStyle" />
					<xsl:with-param name="iconType" select="'flag'" />
					<xsl:with-param name="scale" select="'0.5'" />
				</xsl:call-template>
			</div>
		</foreignObject>

		<foreignObject x="2%" y="92%" width="26%" height="8%" style="color:var(--theme-sub-heading-color);-webkit-line-clamp:1;line-clamp:1; text-overflow: ellipsis;display: -webkit-box; font-size: 60%;line-height: 120%;">
<xsl:call-template name="solicitation-disclaimer" />

		</foreignObject>

		<rect x="4%" y="6%" width="23%" height="44%" rx="1%" fill-opacity="0" stroke="var(--theme-heading-color)" stroke-width="1.25%" style="pointer-events: none;" />

		<svg x="8%" y="50%" height="30%" width="15%" viewBox="0 0 204 503">
			<path d="M102 503L203.325 0.5H0.675026L102 503Z" fill="var(--theme-heading-color)" />
		</svg>

		<g style="transform: translate(2%, 66%);">
			<image preserveAspectRatio="xMidYMid meet" x="-5%" y="0" width="40%" height="15%">
				<xsl:attribute name="href">
					<xsl:copy-of select="concat( //output/@siteUrl, '_assets/_img/circle-shadow.png' )" />
				</xsl:attribute>
			</image>

			<xsl:if test="//agent[1]/photo">
				<image width="10%" height="20%" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:copy-of select="//agent[1]/photo" />
					</xsl:attribute>
				</image>
			</xsl:if>

			<text y="22%" fill="var(--theme-heading-color)" style="font-size:140%;" data-max-width="24%">
				<tspan class="h1 upper bold">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'listing-alert'" />
						<xsl:with-param name="default" select="'Listing Alert'" />
					</xsl:call-template>
				</tspan>
				<tspan class="h1"> by </tspan>
				<tspan class="h1">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentName'" />
						<xsl:with-param name="default" select="concat( //agent[1]/marketingName, ' ' )" />
					</xsl:call-template>
				</tspan>
			</text>
		</g>

		<xsl:variable name="status-caption">
			<xsl:choose>
				<xsl:when test="(number(//single/statusTypeID)=3) or (number(//single/statusTypeID)=4) or (number(//single/statusTypeID)=12)">
					<xsl:value-of select="'just entered escrow'" />
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

		<script>
			<xsl:value-of select="concat( &quot;const captionOptions = { 'neighbor-heading' : [`Your neighbor&#8217;s home &quot;, $status-caption, '.`, ')" />
			<xsl:value-of select="'&quot;How does your home compare?&quot;]};'" />
		</script>

		<g style="transform: translate(30%, 2%);">
			<foreignObject x="1.15%" y="3%" width="31%" height="33%">
				<xsl:choose>
					<xsl:when test="(number(//single/statusTypeID)=3) or (number(//single/statusTypeID)=4) or (number(//single/statusTypeID)=12)">
						<h1 style="line-height:105%;margin:0;font-weight:400;font-size:200%;color:var(--theme-heading-color);" id="neighbor-heading">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'neighbor-heading'" />
								<xsl:with-param name="default" select="concat( &quot;Your neighbor&#8217;s home &quot;, 'just entered&#160;escrow.' )" />
							</xsl:call-template>
						</h1>
					</xsl:when>
					<xsl:when test="number(//single/statusTypeID)=2">
						<h1 style="line-height:105%;margin:0;font-weight:400;font-size:200%;color:var(--theme-heading-color);" id="neighbor-heading">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'neighbor-heading'" />
								<xsl:with-param name="default" select="concat( &quot;Your neighbor&#8217;s home &quot;, 'Just&#160;Sold.' )" />
							</xsl:call-template>
						</h1>
					</xsl:when>
					<xsl:when test="number(//single/statusTypeID)=14">
						<h1 style="line-height:105%;margin:0;font-weight:400;font-size:200%;color:var(--theme-heading-color);" id="neighbor-heading">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'neighbor-heading'" />
								<xsl:with-param name="default" select="concat( &quot;Your neighbor&#8217;s home &quot;, 'Coming&#160;Soon.' )" />
							</xsl:call-template>
						</h1>
					</xsl:when>
					<xsl:otherwise>
						<h1 style="line-height:105%;margin:0;font-weight:400;font-size:200%;color:var(--theme-heading-color);" id="neighbor-heading">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'neighbor-heading'" />
								<xsl:with-param name="default" select="concat( &quot;Your neighbor&#8217;s home &quot;, 'Just&#160;Listed.' )" />
							</xsl:call-template>
						</h1>
					</xsl:otherwise>
				</xsl:choose>

				<xsl:variable name="street">
					<xsl:choose>
						<xsl:when test="//single/address/streetName!=''">
							<xsl:value-of select="concat( 'on ', //single/address/streetName )" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'near you'" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>

				<p style="line-height:125%;font-size:100%;margin:0;margin-top:0.75rem; -webkit-line-clamp:unset">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'neighbor-para-1'" />
						<xsl:with-param name="default" select="concat( 'A ',  lower-case($singularPropertyType),' ', $street, '  ', $status-caption, '. Scan the QR Code below to get details on this and other properties in this area and see how your home compares.' )" />
					</xsl:call-template>
				</p>
			</foreignObject>
			<g style="transform: translateY(34%);">
				<xsl:if test="//agent[1]/website!=''">
					<svg class="bullet" x="1%" y="0%" width="3%" height="3%">
						<use >
							<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#globe-icon' )" />
						</use>
					</svg>

					<text x="4%" y="1%" class="central" data-max-width="24%" style="font-weight:bold;text-decoration:underline;">
						<xsl:value-of select="//agent[1]/website" />
					</text>
				</xsl:if>

				<xsl:if test="//agent[1]/marketingEmail!=''">
					<svg class="bullet" x="1%" y="4.5%" width="3%" height="3%">
						<use>
							<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#email-icon' )" />
						</use>
					</svg>
					<text x="4%" y="5.5%" class="central" data-max-width="25%">
						<tspan>Contact us at </tspan>
						<tspan style="font-weight:bold;text-decoration:underline;">
							<xsl:value-of select="//agent[1]/marketingEmail" />
						</tspan>
					</text>
				</xsl:if>

				<xsl:if test="//agent[1]/mobile!=''">
					<svg class="bullet" x="1%" y="9%" width="3%" height="3%">
						<use  >
							<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#phone-icon' )" />
						</use>
					</svg>
					<text x="4%" y="10%" class="central" data-max-width="24%">
						<tspan>Call us at </tspan>
						<tspan style="font-weight:bold;text-decoration:underline;">
							<xsl:value-of select="//agent[1]/mobile" />
						</tspan>
					</text>
				</xsl:if>
			</g>
			<g style="transform: translate(7%,47.5%);">
				<xsl:call-template name="qr-code">
					<xsl:with-param name="width" select="'20%'" />
				</xsl:call-template>

				<use x="18%" y="10%" width="6.5%" height="13%">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/qr.svg#qr-code' )" />
				</use>
			</g>

			<xsl:choose>
				<xsl:when test="$companyLogo='' or $personalLogo=''">
					<image x="8.25%" y="81%" width="16.5%" height="11%" preserveAspectRatio="xMidYMid meet">
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
					<image x="3%" y="81%" width="12%" height="8%" preserveAspectRatio="xMidYMid meet">
						<xsl:attribute name="href">
							<xsl:value-of select="$companyLogo" />
						</xsl:attribute>
					</image>
					<image x="18%" y="81%" width="12%" height="8%" preserveAspectRatio="xMidYMid meet">
						<xsl:attribute name="href">
							<xsl:value-of select="$personalLogo" />
						</xsl:attribute>
					</image>
				</xsl:otherwise>
			</xsl:choose>

			<text x="16.6%" y="92.5%" class="center" fill="var(--theme-body-color)">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'licenseno'" />
					<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
				</xsl:call-template>
			</text>
		</g>

<rect x="63.5%" y="18%" width="37%" height="84%" fill="#fff" />


<line x1="63.5%" x2="102%" y1="18%" y2="18%" stroke="var(--theme-heading-color)" stroke-width="1" />


		<line x1="63.5%" x2="63.5%" y1="-2%" y2="102%" stroke="var(--theme-heading-color)" stroke-width="1" />

		<xsl:call-template name="copyright">
			<xsl:with-param name="disclaimer" select="'direct-mail'" />
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>