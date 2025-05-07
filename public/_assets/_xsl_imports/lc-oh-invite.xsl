<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="flyers.xsl" />

	<xsl:template name="lc-oh-invite">
		<xsl:param name="sub-heading" />
		<g>
			<image x="0" y="0" width="100%" height="45%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="id" select="'image-1'" />
					<xsl:with-param name="idx" select="1" />
				</xsl:call-template>
			</image>

			<g style="transform:translate(80%, 0%)">
				<svg width="10%" x="-0.3%" y="-44.5%" viewBox="0 0 68 100" fill="var(--theme-body-background)"
					xmlns="http://www.w3.org/2000/svg">
					<path d="M0 82.5V0H67.5V82.5L33.5 100L0 82.5Z" />
				</svg>
 
				<xsl:call-template name="qr-code">
					<xsl:with-param name="width" select="'9.5%'" />
					<xsl:with-param name="height" select="'7%'" />
				</xsl:call-template>

				<text x="4.5%" y="6%" class="align-center heading" fill="var(--theme-heading-color)" font-family="var(--theme-heading-font)" font-weight="700" font-size="140%">
					<tspan x="4.5%" dy="1%">
						<xsl:value-of select="'SCAN FOR'" />
					</tspan>
					<tspan x="4.5%" dy="1.4%">
						<xsl:value-of select="'DETAILS'" />
					</tspan>
				</text>
			</g>

			<rect x="0" y="45%" fill="var(--theme-sub-heading-color)" width="100%" height="2%" />

			<g style="transform:translate(0%,43%)">
				<rect x="13%" y="-3%" fill="var(--theme-sub-heading-color)" width="75%" height="13.5%" />

				<text x="50%" y="-1%" fill="var(--theme-body-background)" font-family="var(--theme-heading-font)" class="center upper" font-size="370%" font-weight="500">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'openhouse'" />
						<xsl:with-param name="default" select="'you’re invited'" />
					</xsl:call-template>
				</text>

				<text x="50%" y="2.5%" fill="var(--theme-body-background)" font-family="var(--theme-heading-font)" class="center upper" font-size="700%" font-weight="400">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'openhouse'" />
						<xsl:with-param name="default" select="'Open House'" />
					</xsl:call-template>
				</text>			
			</g>

			<xsl:if test="count(//openHouse/session) &gt; 0">
					<text x="50%" y="0%" class="center bold" font-family="var(--theme-heading-font)" fill="var(--theme-body-background)" text-anchor="middle" font-size="320%" style="dominant-baseline: middle; letter-spacing:4px;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'LC-OH-INVITE-01'" />
							<xsl:with-param name="default" select="concat( //openHouse/session[1]/@dow, ', ', //openHouse/session[1]/@month, ' ', //openHouse/session[1]/@date, ' - ', //openHouse/session[1]/@starts, ' to ',//openHouse/session[1]/@ends)" />
						</xsl:call-template>
					</text>
				</xsl:if>

			<g style="transform:translate(0%,57.5%)">
				
				<!-- <xsl:if test="count(//openHouse/session) &gt; 0">
					<text x="50%" y="0%" class="center bold" font-family="var(--theme-heading-font)" fill="var(--theme-body-background)" text-anchor="middle" font-size="320%" style="dominant-baseline: middle; letter-spacing:4px;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'LC-OH-INVITE-01'" />
							<xsl:with-param name="default" select="concat( //openHouse/session[1]/@dow, ', ', //openHouse/session[1]/@month, ' ', //openHouse/session[1]/@date, ' - ', //openHouse/session[1]/@starts, ' to ',//openHouse/session[1]/@ends)" />
						</xsl:call-template>
					</text>
				</xsl:if> -->
				
				<foreignObject x="0" y="2.5%" width="100%" height="25%">
					<p class="center upper" style="font-family:var(--theme-body-font);font-size:500%;font-weight:500;width: 800px; margin-inline: auto;margin-top:0;margin-bottom:12px;color:var(--theme-sub-heading-color);line-height:110%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'yourdreamhome'" />
							<xsl:with-param name="default" select="concat('',$sub-heading)" />
						</xsl:call-template>
					</p>
				</foreignObject>
				<text x="50%" y="12%" class="center upper" fill="var(--theme-body-color)" font-size="350%" font-family="var(--theme-heading-font)" style="letter-spacing:2px;margin:0;" font-weight="700">
					<tspan x="50%" dy="0">
						<xsl:value-of select="$listingAddressLine1" />
					</tspan>
					<tspan x="50%" dy="4%">
						<xsl:value-of select="$listingAddressLine2" />
					</tspan>
				</text>

				<text x="98.2%" y="23%" fill="var(--theme-sub-heading-color)" font-family="var(--theme-heading-font)" class="right upper narrow" font-size="140%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'bedroomscount'" />
						<xsl:with-param name="default" select="concat( ' MLS #: ', //single/mlsNumber)" />
					</xsl:call-template>
				</text>
			</g>

			<g style="transform:translate(0%,83%)">
				<rect fill="var(--theme-body-color)" width="100%" height="5%" />

				<g class="icon-stat" style="transform:translate(26.5%, -0.9%)">
					<use x="0" y="1%" width="3%" height="4%" fill="var(--theme-body-background)">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#bed-icon' )" />
					</use>
					<text x="3.5%" y="2%" class="narrow" fill="var(--theme-body-background)" font-family="var(--theme-heading-font)" font-size="180%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'bedroomscount'" />
							<xsl:with-param name="default" select="concat( //single/bedrooms/@count, ' Bedrooms ')" />
						</xsl:call-template>
					</text>
				</g>
				<g class="icon-stat" style="transform:translate(44.5%, -0.5%)">
					<use x="0" y="1%" width="2.5%" height="3%" fill="var(--theme-body-background)">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#bath-icon' )" />
					</use>
					<text x="3.5%" y="1.6%" class="narrow" fill="var(--theme-body-background)" font-family="var(--theme-heading-font)" font-size="180%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'bathroomscount'" />
							<xsl:with-param name="default" select="concat( $listingTotalBathrooms, ' Bathrooms ')" />
						</xsl:call-template>
					</text>
				</g>
				<g class="icon-stat" style="transform:translate(62%, -0.7%)">
					<use x="1%" y="1.3%" width="3%" height="3%" fill="var(--theme-body-background)">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#object-ungroup-icon' )" />
					</use>
					<text x="4.5%" y="1.7%" class="narrow" fill="var(--theme-body-background)" font-family="var(--theme-heading-font)" font-size="180%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'sqft'" />
							<xsl:with-param name="default" select="concat ('Sq. ft.: ', format-number( //single/squareFeet, '###,###' ))" />
						</xsl:call-template>
					</text>
				</g>
			</g>
			<xsl:call-template name="flyer-footer" />
		</g>
	</xsl:template>
</xsl:stylesheet>