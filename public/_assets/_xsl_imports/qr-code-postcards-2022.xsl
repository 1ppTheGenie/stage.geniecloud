<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">

	<xsl:template name="qr-code-2022-content-part-1">
		<g id="qr-code-2022-content-part-1" style="transform:translateX(0.2%);">
			<xsl:if test="number(//single/statusTypeID)=2">
				<text x="18%" y="8.7%" class="center upper" fill="var(--theme-heading-color)" font-size="340%" font-family="var(--theme-heading-font)" font-weight="800" style="letter-spacing: 2px; word-spacing: -8px" data-max-width="80%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'justlisted'" />
						<xsl:with-param name="default" select="'just sold'" />
					</xsl:call-template>
				</text>
			</xsl:if>
			<xsl:if test="number(//single/statusTypeID)=1">
				<text x="18%" y="10%" class="center upper" fill="var(--theme-heading-color)" font-size="300%" font-family="var(--theme-heading-font)" font-weight="900" style="letter-spacing: 1px;" data-max-width="80%">				
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'justlisted'" />
						<xsl:with-param name="default" select="'just listed'" />
					</xsl:call-template>
				</text>
			</xsl:if>
			<xsl:if test="(//single/statusTypeID=3) or (//single/statusTypeID=4) or (//single/statusTypeID=12)">
				<text x="18%" y="10%" class="center upper bold" fill="var(--theme-heading-color)" style="font-size: 300%; font-family:var(--theme-heading-font);letter-spacing: 1px;font-weight:800;" data-max-width="80%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'justlisted'" />
						<xsl:with-param name="default" select="'In Escrow'" />
					</xsl:call-template>
				</text>
			</xsl:if>

			<xsl:if test="number(//single/statusTypeID)=14">
				<text x="18%" y="10%" class="center upper bold" fill="var(--theme-heading-color)" style="font-size: 300%; font-family:var(--theme-heading-font);letter-spacing: 1px;font-weight:800;" data-max-width="80%">
					<tspan>
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'commingsoon'" />
							<xsl:with-param name="default" select="'Coming Soon'" />
						</xsl:call-template>
					</tspan>
				</text>
			</xsl:if>

			<text x="16.8%" y="23%" class="center upper" fill="var(--theme-body-color)" font-size="130%" font-weight="600" font-family="var(--theme-heading-font)" data-max-width="35%">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'yourneighborhood'" />
					<xsl:with-param name="default" select="concat( ' IN ', //area/name ) " />
				</xsl:call-template>
			</text>

			<text x="18%" y="29.7%" class="center upper" fill="var(--theme-body-color)" font-size="210%" font-weight="700" font-family="var(--theme-heading-font)" style="letter-spacing: 1px;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'scantosee'" />
					<xsl:with-param name="default" select="'SCAN TO SEE'" />
				</xsl:call-template>
			</text>
			<text x="18%" y="43.5%" class="center upper" font-size="210%" font-weight="700" font-family="var(--theme-heading-font)" style="letter-spacing: 1px;dominant-baseline: auto;">

				<tspan fill="var(--theme-body-color)">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'howyour'" />
						<xsl:with-param name="default" select="'HOW YOUR '" />
					</xsl:call-template>
				</tspan>
				<tspan fill="var(--theme-sub-heading-color)" font-size="130%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'HOME'" />
						<xsl:with-param name="default" select="'HOME'" />
					</xsl:call-template>
				</tspan>
			</text>

			<text x="18%" y="46%" class="center upper" fill="var(--theme-body-color)" font-size="255%" font-weight="600" font-family="var(--theme-heading-font)">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'compares'" />
						<xsl:with-param name="default" select="'COMPARES!'" />
					</xsl:call-template>
				</tspan>
			</text>

			<xsl:if test="//single/statusTypeID!=14">
				<text x="18%" y="58%" class="center upper" fill="var(--theme-body-color)" font-size="115%" font-weight="500" font-family="var(--theme-sub-heading-font)" >
					<xsl:call-template name="listing-address-line-one" />
					<xsl:text>, </xsl:text>
					<xsl:value-of select="concat(//single/address/state, ' ', //single/address/zip)" />
				</text>

				<!-- <text x="18%" y="58%" class="center upper" fill="var(-/-theme-body-color)" style="font-size:100%;font-weight:600;font-family:var(-/-theme-sub-heading-font);">
					<xsl:call-template name="listing-address-line-two" />
				</text> -->
			</xsl:if>

			<circle r="6.5%" cx="18%" cy="76%"></circle>
			<rect x="13%" y="67%" width="10%" height="18.5%" stroke="var(--theme-heading-color)" stroke-width="5" rx="70" ry="70" fill="var(--theme-heading-color)"></rect>

			<clipPath id="clipCircle">
				<circle r="6.5%" cx="18%" cy="76%"></circle>
			</clipPath>
			<image x="13%" y="67%" width="10%" height="21.5%" preserveAspectRatio="xMidYMid meet" clip-path="url(#clipCircle)">
				<xsl:attribute name="href">
					<xsl:value-of select="//agent[1]/photo" />
				</xsl:attribute>
			</image>

			<text x="18%" y="85.5%" class="center upper" fill="var(--theme-body-color)" font-size="195%" font-weight="600" font-family="var(--theme-body-font)" data-max-width="35%">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentname'" />
						<xsl:with-param name="default" select="concat( //agent[1]/marketingName,'') " />
					</xsl:call-template>
				</tspan>
			</text>
			<text x="18%" y="91.5%" class="center upper" fill="var(--theme-body-color)" font-size="175%" font-weight="500" font-family="var(--theme-body-font)" style="letter-spacing:1px;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentmobile'" />
					<xsl:with-param name="default" select="//agent[1]/mobile" />
				</xsl:call-template>
			</text>
		</g>
	</xsl:template>

	<xsl:template name="listing-photo-marker">
		<xsl:param name="mapLeft" />
		<xsl:param name="pinLeft" />
		<xsl:param name="pinTop" />
		<xsl:param name="markerSize" select="number(200)" />

		<foreignObject y="0%" height="100%">
			<xsl:attribute name="x">
				<xsl:value-of select="concat( $mapLeft , '%' )" />
			</xsl:attribute>
			<xsl:attribute name="width">
				<xsl:value-of select="concat( 100 - $mapLeft , '%' )" />
			</xsl:attribute>

			<div data-height="100%">
				<xsl:attribute name="data-width">
					<xsl:value-of select="concat( 100 - $mapLeft , '%' )" />
				</xsl:attribute>
				<xsl:call-template name="map-output">
					<xsl:with-param name="style" select="'streets-v11'" />
					<xsl:with-param name="iconType" select="'dot'" />
				</xsl:call-template>
			</div>

			<xsl:variable name="ListingImage1">
				<xsl:call-template name="listing-image">
					<xsl:with-param name="preferPrimary" select="'true'" />
				</xsl:call-template>
			</xsl:variable>

			<script>
				<xsl:value-of select="concat( 'gHub.addListingPopup( ', //single/latitude, ',', //single/longitude, ',`', $ListingImage1, '`,', $pinLeft, ',', $pinTop, ',', $markerSize,  ' );' )" />
			</script>
		</foreignObject>
	</xsl:template>
</xsl:stylesheet>