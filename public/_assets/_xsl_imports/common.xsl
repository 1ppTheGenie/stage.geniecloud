<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:math="http://www.w3.org/2005/xpath-functions/math"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:import href="global-variables.xsl" />
	<xsl:import href="genie-functions.xsl" />
	<xsl:import href="printers-marks.xsl" />

	<xsl:preserve-space elements="*" />

	<xsl:output method="xml" />

	<xsl:template match="/">
		<xsl:call-template name="svg-wrapper" />
	</xsl:template>

	<xsl:template name="cropped-container">
		<g>
			<xsl:attribute name="transform">
				<xsl:value-of select="concat( 'translate(', $cropSize, ',', $cropSize, ') scale(', ($svgWidth - ($cropSize * 2) ) div $svgWidth, ',', ($svgHeight - ($cropSize * 2) ) div $svgHeight, ')' )" />
			</xsl:attribute>
			<xsl:call-template name="cropped-content" />

		</g>
	</xsl:template>

	<xsl:template name="cropped-content" />

	<xsl:template name="svg-body" />


	<xsl:template name="empty-listing-text">
		<rect xmlns="" x="7%" y="25%" rx="10" ry="10" width="85%" height="60%" fill-opacity="0" stroke-width="2" stroke="var(--theme-heading-color)"></rect>
		<g style="transform: translate(-0.5%,-2.5%)">
			<foreignObject x="10%" y="30%" class="center" width="80%" height="60%">
				<p class="center bold" style="margin:0;margin-bottom:2rem;font-size:120%;font-family:var(--theme-sub-heading-font);color:var(--theme-sub-heading-color);display: inline-block;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'empty-listing-text-1'" />
						<xsl:with-param name="default" select="concat('If you’re thinking of SELLING in ',//area/name, '... Great News!' )" />
					</xsl:call-template>
				</p>
				<p class="center" style="margin:0;margin-bottom:2rem;font-size:90%;font-family:var(--theme-sub-heading-font);color:var(--theme-body-color);display: inline-block;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'empty-listing-text-2'" />
						<xsl:with-param name="default" select="'Your Home will not have ANY COMPETITION if you put it on the market right TODAY!'" />
					</xsl:call-template>
				</p>

				<p class="center" style="margin:0;margin-bottom:2rem;font-size:90%;font-family:var(--theme-sub-heading-font);color:var(--theme-body-color);display: inline-block;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'empty-listing-text-3'" />
						<xsl:with-param name="default" select="'Prices are typically much higher when supply is LOW and DEMAND IS HIGH.'" />
					</xsl:call-template>
				</p>
				<p class="center" style="margin:0;margin-bottom:2rem;font-size:90%;font-family:var(--theme-sub-heading-font);color:var(--theme-body-color);display: block;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'empty-listing-text-4'" />
						<xsl:with-param name="default" select="concat('Get your EXACT home value text or call ' , //agent[1]/firstName , ' at ',  //agent[1]/mobile , '.')" />
					</xsl:call-template>
				</p>
				<p class="center bold" style="margin:0;margin-bottom:2rem;font-size:120%;font-family:var(--theme-sub-heading-font);color:var(--theme-sub-heading-color);display: inline-block;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'empty-listing-text-6'" />
						<xsl:with-param name="default" select="concat('If you’re looking to BUY a ', upper-case($singularPropertyType), ' in this area…')" />
					</xsl:call-template>
				</p>
				<p class="center" style="margin:0;margin-bottom:2rem;font-size:90%;font-family:var(--theme-sub-heading-font);color:var(--theme-body-color);display: inline-block;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'empty-listing-text-7'" />
						<xsl:with-param name="default" select="'Unfortunately at this moment, there are no active listings in this area. If you would like to be the FIRST TO KNOW about any buying opportunities in this area, please reach out to me so we can get you notified, in some cases even before the MLS and ZILLOW so you an have an early opportunity.'" />
					</xsl:call-template>
				</p>

			</foreignObject>
		</g>
	</xsl:template>

	<xsl:template name="svg-defs">
		<defs>
			<filter id="blurred-shadow" x="-20%" y="-20%" width="130%" height="140%">
				<feOffset result="offOut" in="SourceAlpha" dx="0" dy="0" />
				<feGaussianBlur result="blurOut" in="offOut" stdDeviation="6" />
				<feBlend in="SourceGraphic" in2="blurOut" mode="normal" />
			</filter>

			<xsl:variable name="count" select="number(5)" />

			<xsl:for-each select="(//*)[position()&lt;=$count]">
				<linearGradient>
					<xsl:attribute name="id">
						<xsl:value-of select="concat( 'main-bar-', position() )" />
					</xsl:attribute>

					<stop offset="0">
						<xsl:attribute name="style">
							<xsl:value-of select="concat( 'stop-color:var(--vivid-dark-', position(), ')' )" />
						</xsl:attribute>
					</stop>
					<stop offset="0.2">
						<xsl:attribute name="style">
							<xsl:value-of select="concat( 'stop-color:var(--vivid-color-', position(), ')' )" />
						</xsl:attribute>
					</stop>
					<stop offset="0.27">
						<xsl:attribute name="style">
							<xsl:value-of select="concat( 'stop-color:var(--vivid-color-', position(), ')' )" />
						</xsl:attribute>
					</stop>
					<stop offset="0.95">
						<xsl:attribute name="style">
							<xsl:value-of select="concat( 'stop-color:var(--vivid-end-', position(), ')' )" />
						</xsl:attribute>
					</stop>
					<stop offset="1">
						<xsl:attribute name="style">
							<xsl:value-of select="concat( 'stop-color:var(--vivid-end-', position(), ')' )" />
						</xsl:attribute>
					</stop>
				</linearGradient>
			</xsl:for-each>
		</defs>
	</xsl:template>

	<xsl:template name="svg-wrapper">
		<xsl:param name="nobg" />
		<xsl:param name="width" />
		<xsl:param name="height" />

		<html>
			<body>
				<svg id="genie-wrapper"
					xmlns="http://www.w3.org/2000/svg">
					<xsl:attribute name="class">
						<xsl:value-of select="concat( //output/@size, ' ', //output/@theme )" />
					</xsl:attribute>

					<xsl:attribute name="viewBox">
						<xsl:value-of select="concat( '0 0 ', $svgWidth, ' ', $svgHeight )" />

					</xsl:attribute>

					<xsl:if test="//output/@isSample">
						<xsl:comment>
							<xsl:text>IsSample:</xsl:text>
							<xsl:value-of select="//output/@isSample" />
							<xsl:text>.</xsl:text>
						</xsl:comment>
					</xsl:if>

					<defs>
						<style>
							<xsl:value-of select="concat( '@import url(', //output/@siteUrl, '_assets/_css/svg.css);' )" />
							<xsl:text>
							</xsl:text>
							<xsl:value-of select="concat( '@import url(', //output/@siteUrl, '_assets/themes/', //output/@theme, '.css);')" />
						</style>
					</defs>

					<script>
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_js/genie-global.js') " />

						<xsl:text>;</xsl:text>
					</script>

					<xsl:call-template name="svg-scripts" />

					<xsl:if test="not($nobg='true')">
						<rect x="0" y="0" width="100%" height="100%" fill="var(--theme-body-background)" />
					</xsl:if>

					<xsl:call-template name="svg-body" />


					<xsl:if test="//output/@pageIndex and number(//output/@pageIndex) > 1">
						<circle cx="98%" cy="4%" r="1%" fill="var(--theme-heading-color)" />
						<text font-size="70%" x="98%" y="4%" class="bold center" style="dominant-baseline: central;" fill="var(--theme-body-background)">
							<xsl:value-of select="//output/@pageIndex" />
						</text>
					</xsl:if>

					<xsl:if test="number(//output/@isSample)=1">
						<text x="50%" y="50%" class="genie-sample">TheGenie.AI Sample</text>
					</xsl:if>

					<xsl:if test="number(//output/@withBleed)=1 and number(//output/@withCrops)=1">
						<xsl:call-template name="printers-marks" />
					</xsl:if>
				</svg>
			</body>
		</html>
	</xsl:template>

	<xsl:template name="svg-scripts" />

	<xsl:template name="template-folders">
		<xsl:value-of select="'[`Not specified, assume free form.`]'" />
	</xsl:template>

	<xsl:template name="render-key">
		<xsl:value-of select="concat (//output/@folder, '/', //output/@stylesheet )" />
	</xsl:template>

	<xsl:template name="include-in-render">
		<xsl:value-of select="'true'" />
	</xsl:template>

	<xsl:template name="area-heading">
		<xsl:param name="default" />
		<xsl:param name="id" />
		<xsl:param name="showDate" select="'true'" />

		<g id="area-title">
			<text class="h1 upper heading" fill="var(--theme-heading-color)" style="font-size:260%;" data-max-width="40%">
				<xsl:call-template name="editable">
					<xsl:with-param name="default" select="$default" />
					<xsl:with-param name="id" select="'$id'" />
				</xsl:call-template>
			</text>

			<foreignObject width="50%" height="50" x="0" y="60" class="map-marker">
				<span class="banner" style="background-color:var(--vivid-banner);color:var(--printers-marks);font-family: var(--theme-sub-heading-font);">
					<svg style="width: 15px">
						<use>
							<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#map-pin-icon' )" />
						</use>
					</svg>
					<xsl:value-of select="$areaWithPropertyType" />
				</span>
			</foreignObject>

			<xsl:if test="string($showDate)='true'">
				<text id="date" class="h3 align-right" style="transform: translate(95%, 10%);font-size:170%;">
					<xsl:value-of select="concat( 'As of ', genie:format-date( //output/@reportDate, '[MNn] [D], [Y0001]' ) )" />
				</text>
			</xsl:if>
		</g>
	</xsl:template>

	<xsl:template name="lozenge">
		<xsl:param name="width" />
		<xsl:param name="fill-id" />
		<xsl:param name="price-type" select="''" />
		<xsl:param name="left-caption" />
		<xsl:param name="caption" />
		<xsl:param name="caption-width" select="number(10)" />
		<xsl:param name="caption-align" select="hanging" />
		<xsl:param name="value" />
		<xsl:param name="diamond-caption" />
		<xsl:param name="available-space" select="number(0.50)" />

		<xsl:variable name="percent-width">
			<xsl:value-of select="format-number( number($width) * $available-space, '#.00%')" />

		</xsl:variable>

		<xsl:variable name="max-width">
			<xsl:value-of select="format-number( number($width) * $available-space * 0.65, '#.00%')" />

		</xsl:variable>

		<xsl:variable name="left-max-width">
			<xsl:value-of select="format-number( number($width) * $available-space * 0.175, '#.00%')" />

		</xsl:variable>

		<xsl:variable name="fill">
			<xsl:value-of select="concat( 'var(--vivid-color-', $fill-id, ')' )" />

		</xsl:variable>
		<xsl:variable name="dark-fill">
			<xsl:value-of select="concat( 'var(--vivid-end-', $fill-id, ')')" />

		</xsl:variable>

		<rect x="-2.5%" y="0" width="5%" height="10%" rx="5%">
			<xsl:attribute name="fill">
				<xsl:value-of select="$fill" />
			</xsl:attribute>
		</rect>

		<rect y="0" width="5%" height="10%" rx="5%">
			<xsl:attribute name="x">
				<xsl:value-of select="$percent-width" />
			</xsl:attribute>
			<xsl:attribute name="fill">
				<xsl:value-of select="$dark-fill" />
			</xsl:attribute>
			<xsl:attribute name="style">
				<xsl:choose>
					<xsl:when test="$diamond-caption">
						<xsl:value-of select="'transform:translateX(7.5%)'" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="'transform:translateX(13.5%)'" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
		</rect>

		<rect y="0" height="10%">
			<xsl:attribute name="x">
				<xsl:value-of select="format-number( number($caption-width) div 100, '#.00%')" />
			</xsl:attribute>
			<xsl:attribute name="width">
				<xsl:value-of select="$percent-width" />
			</xsl:attribute>
			<xsl:attribute name="fill">
				<xsl:value-of select="concat( 'url(#main-bar-', $fill-id, ')' )" />
			</xsl:attribute>
		</rect>

		<rect x="0" y="0" height="10%">
			<xsl:attribute name="width">
				<xsl:value-of select="format-number( number($caption-width) div 100, '#.00%')" />
			</xsl:attribute>
			<xsl:attribute name="fill">
				<xsl:value-of select="$fill" />
			</xsl:attribute>
		</rect>

		<g>
			<xsl:attribute name="style">
				<xsl:value-of select="concat( 'transform:translateX(', format-number( number($caption-width) div 100, '#.00%'), ')' )" />
			</xsl:attribute>

			<xsl:variable name="hasSpace">
				<xsl:choose>
					<xsl:when test="number($width) &gt; 0.175">
						<xsl:value-of select="'true'" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="'false'" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>

			<xsl:if test="$left-caption!=''">
				<text x="1%" y="5.5%" text-anchor="start" dominant-baseline="hanging" font-size="100%">
					<xsl:attribute name="data-max-width">
						<xsl:value-of select="$left-max-width" />

					</xsl:attribute>
					<xsl:attribute name="fill">
						<xsl:choose>
							<xsl:when test="string($hasSpace)='true'">
								<xsl:value-of select="'#fff'" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="'var(--theme-body-color)'" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<xsl:value-of select="$left-caption" />

				</text>
			</xsl:if>

			<text y="5.5%" text-anchor="end" dominant-baseline="hanging" font-size="150%">
				<xsl:attribute name="data-max-width">
					<xsl:value-of select="$max-width" />

				</xsl:attribute>

				<xsl:attribute name="fill">
					<xsl:choose>
						<xsl:when test="string($hasSpace)='true'">
							<xsl:value-of select="'#fff'" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'var(--theme-body-color)'" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>

				<xsl:attribute name="x">
					<xsl:value-of select="$percent-width" />
				</xsl:attribute>

				<xsl:attribute name="style">
					<xsl:choose>
						<xsl:when test="$diamond-caption">
							<xsl:choose>
								<xsl:when test="string($hasSpace)='true'">
									<xsl:value-of select="'transform:translateX(-3%)'" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="'transform:translateX(14%)'" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:choose>
								<xsl:when test="string($hasSpace)='true'">
									<xsl:value-of select="'transform:translateX(0)'" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="'transform:translateX(11%)'" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<xsl:value-of select="$value" />
			</text>
		</g>

		<text x="-1%" y="5.4%" fill="#fff" text-anchor="left" font-size="110%" class="upper rsb">
			<xsl:attribute name="style">
				<xsl:value-of select="$caption-align" />
			</xsl:attribute>
			<xsl:copy-of select="$caption" />
		</text>

		<xsl:if test="string($price-type)!=''">
			<xsl:if test="number($fill-id)=5">
				<text x="20%" y="5.5%" fill="#fff" text-anchor="left" font-size="110%" class="upper rsb">
					<xsl:copy-of select="'AVG. LIST PRICE'" />
				</text>
			</xsl:if>
			<xsl:if test="number($fill-id)=2">
				<text x="20%" y="5.5%" fill="#fff" text-anchor="left" font-size="110%" class="upper rsb">
					<xsl:copy-of select="'AVG. SALE PRICE'" />
				</text>
			</xsl:if>
		</xsl:if>

		<xsl:if test="$diamond-caption">
			<g style="transform:translateX(9%)">
				<g>
					<xsl:attribute name="style">
						<xsl:value-of select="concat( 'transform:translateX(', $percent-width, ')' )" />
					</xsl:attribute>

					<rect y="-1%" width="75" height="75" stroke-width="5" fill="#fff" style="transform-origin: 32px 32px;transform:rotate(45deg)">
						<xsl:attribute name="stroke">
							<xsl:value-of select="concat( 'url(#main-bar-', $fill-id, ')' )" />
						</xsl:attribute>
					</rect>

					<text x="35" y="5%" class="bold center" font-size="150%" font-weight="bold">
						<xsl:attribute name="style">
							<xsl:value-of select="concat( 'dominant-baseline:mathematical', '' )" />
						</xsl:attribute>
						<xsl:attribute name="fill">
							<xsl:value-of select="concat( 'var(--vivid-color-', $fill-id, ')' )" />
						</xsl:attribute>
						<xsl:value-of select="$diamond-caption" />
					</text>
				</g>
			</g>
		</xsl:if>
	</xsl:template>

	<xsl:template name="area-heading-letter">
		<xsl:param name="default" />
		<xsl:param name="id" />
		<xsl:param name="showDate" select="'true'" />

		<g id="area-title">
			<text class="h1 upper heading" fill="var(--theme-heading-color)" style="font-size:270%;" data-max-width="50%">
				<xsl:call-template name="editable">
					<xsl:with-param name="default" select="$default" />
					<xsl:with-param name="id" select="'$id'" />
				</xsl:call-template>
			</text>

			<foreignObject width="55%" height="10%" x="0%" y="8%" class="map-marker">
				<span class="banner" style="background-color:var(--vivid-banner);color:var(--printers-marks);font-family: var(--theme-sub-heading-font);">
					<use>
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#map-pin-icon' )" />
					</use>
					<xsl:value-of select="$areaWithPropertyType" />
				</span>
			</foreignObject>

			<xsl:if test="$showDate='true'">
				<text id="date" class="h3 align-right" style="transform: translate(95%, 10%)" font-size="170%">
					<xsl:value-of select="concat( 'As of ', genie:format-date( //output/@reportDate, 'MNn D, Y0001' ) )" />
				</text>
			</xsl:if>
		</g>
	</xsl:template>

	<xsl:template name="lozenge-letter">
		<xsl:param name="width" />

		<xsl:param name="fill-id" />
		<xsl:param name="price-type" select="''" />
		<xsl:param name="left-caption" />
		<xsl:param name="caption" />
		<xsl:param name="caption-width" select="'20'" />
		<xsl:param name="caption-align" select="hanging" />
		<xsl:param name="value" />
		<xsl:param name="diamond-caption" />
		<xsl:param name="available-space" select="number(0.50)" />

		<xsl:variable name="percent-width">
			<xsl:value-of select="format-number( $width * $available-space, '#.00%')" />

		</xsl:variable>

		<xsl:variable name="max-width">
			<xsl:value-of select="format-number( $width * $available-space * 0.65, '#.00%')" />

		</xsl:variable>

		<xsl:variable name="left-max-width">
			<xsl:value-of select="format-number( $width * $available-space * 0.175, '#.00%')" />

		</xsl:variable>

		<xsl:variable name="fill">
			<xsl:value-of select="concat( 'var(--vivid-color-', $fill-id, ')' )" />

		</xsl:variable>
		<xsl:variable name="dark-fill">
			<xsl:value-of select="concat( 'var(--vivid-end-', $fill-id, ')')" />

		</xsl:variable>

		<rect x="-2.5%" y="0" width="8%" height="8%" rx="5%">
			<xsl:attribute name="fill">
				<xsl:value-of select="$fill" />
			</xsl:attribute>
		</rect>

		<rect y="0" width="6%" height="8%" rx="5%">
			<xsl:attribute name="x">
				<xsl:value-of select="$percent-width" />
			</xsl:attribute>
			<xsl:attribute name="fill">
				<xsl:value-of select="$dark-fill" />
			</xsl:attribute>
			<xsl:attribute name="style">
				<xsl:choose>
					<xsl:when test="$diamond-caption">
						<xsl:value-of select="'transform:translateX(10.5%)'" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="'transform:translateX(13.5%)'" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
		</rect>

		<rect y="0" height="8%">
			<xsl:attribute name="x">
				<xsl:value-of select="format-number( $caption-width div 100, '#.00%')" />
			</xsl:attribute>

			<xsl:attribute name="width">
				<xsl:value-of select="$percent-width" />
			</xsl:attribute>
			<xsl:attribute name="fill">
				<xsl:value-of select="concat( 'url(#main-bar-', $fill-id, ')' )" />
			</xsl:attribute>
		</rect>

		<!-- middle rectangle -->
		<rect x="1.5%" y="0" height="8%">
			<xsl:attribute name="width">
				<xsl:value-of select="format-number( $caption-width div 100, '#.00%')" />
			</xsl:attribute>
			<xsl:attribute name="fill">
				<xsl:value-of select="$fill" />
			</xsl:attribute>
		</rect>

		<g>
			<xsl:attribute name="style">
				<xsl:value-of select="concat( 'transform:translateX(', format-number( $caption-width div 100, '#.00%'), ')' )" />
			</xsl:attribute>

			<xsl:variable name="hasSpace">
				<xsl:choose>
					<xsl:when test="number($width) &gt; 0.175">
						<xsl:value-of select="'true'" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="'false'" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>

			<xsl:if test="$left-caption!=''">
				<text x="1%" y="5.5%" text-anchor="start" dominant-baseline="hanging" font-size="100%">
					<xsl:attribute name="data-max-width">
						<xsl:value-of select="$left-max-width" />

					</xsl:attribute>
					<xsl:attribute name="fill">
						<xsl:choose>
							<xsl:when test="$hasSpace='true'">
								<xsl:value-of select="'#fff'" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="'var(--theme-body-color)'" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<xsl:value-of select="$left-caption" />

				</text>
			</xsl:if>

			<text y="6.3%" text-anchor="end" dominant-baseline="hanging" font-size="150%">
				<xsl:attribute name="data-max-width">
					<xsl:value-of select="$max-width" />

				</xsl:attribute>
				<xsl:attribute name="fill">
					<xsl:choose>
						<xsl:when test="$hasSpace='true'">
							<xsl:value-of select="'#fff'" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'var(--theme-body-color)'" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>

				<xsl:attribute name="x">
					<xsl:value-of select="$percent-width" />
				</xsl:attribute>

				<xsl:attribute name="style">
					<xsl:choose>
						<xsl:when test="$diamond-caption">
							<xsl:choose>
								<xsl:when test="$hasSpace='true'">
									<xsl:value-of select="'transform:translateX(-3%)'" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="'transform:translateX(14%)'" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:choose>
								<xsl:when test="$hasSpace='true'">
									<xsl:value-of select="'transform:translateX(0)'" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="'transform:translateX(11%)'" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<xsl:value-of select="$value" />
			</text>
		</g>

		<text x="-1%" y="4%" fill="#fff" text-anchor="left" font-size="110%" class="upper rsb">
			<xsl:attribute name="style">
				<xsl:value-of select="$caption-align" />
			</xsl:attribute>
			<xsl:copy-of select="$caption" />
		</text>

		<xsl:if test="string($price-type)!=''">
			<xsl:if test="number($fill-id)=5">
				<text x="25%" y="4%" fill="#fff" text-anchor="left" font-size="110%" class="upper rsb">
					<xsl:copy-of select="'AVG. LIST PRICE'" />
				</text>
			</xsl:if>
			<xsl:if test="number($fill-id)=2">
				<text x="25%" y="4%" fill="#fff" text-anchor="left" font-size="110%" class="upper rsb">
					<xsl:copy-of select="'AVG. SALE PRICE'" />
				</text>
			</xsl:if>
		</xsl:if>

		<xsl:if test="$diamond-caption">
			<g style="transform:translateX(11.7%)">
				<g>
					<xsl:attribute name="style">
						<xsl:value-of select="concat( 'transform:translateX(', $percent-width, ')' )" />
					</xsl:attribute>

					<rect y="0.1%" width="75" height="75" stroke-width="5" fill="#fff" style="transform-origin: 32px 32px;transform:rotate(45deg)">
						<xsl:attribute name="stroke">
							<xsl:value-of select="concat( 'url(#main-bar-', $fill-id, ')' )" />
						</xsl:attribute>
					</rect>

					<text x="3.8%" y="3.7%" class="bold center" font-size="150%" font-weight="bold">
						<xsl:attribute name="style">
							<xsl:value-of select="concat( 'dominant-baseline:mathematical', '' )" />
						</xsl:attribute>
						<xsl:attribute name="fill">
							<xsl:value-of select="concat( 'var(--vivid-color-', $fill-id, ')' )" />
						</xsl:attribute>
						<xsl:value-of select="$diamond-caption" />
					</text>
				</g>
			</g>
		</xsl:if>
	</xsl:template>

	<xsl:template name="curved-rect">
		<xsl:param name="width" />
		<xsl:param name="height" />
		<xsl:param name="fill" />
		<xsl:param name="fill-opacity" select="number(1)" />

		<g>
			<rect>
				<xsl:attribute name="fill-opacity">
					<xsl:value-of select="$fill-opacity" />
				</xsl:attribute>
				<xsl:attribute name="fill">
					<xsl:value-of select="$fill" />
				</xsl:attribute>
				<xsl:attribute name="x">
					<xsl:value-of select="format-number( ($height div 4) * -1, '#.00%' )" />
				</xsl:attribute>
				<xsl:attribute name="width">
					<xsl:value-of select="format-number( $height div 2, '#.00%' )" />
				</xsl:attribute>
				<xsl:attribute name="height">
					<xsl:value-of select="format-number( $height, '#.00%' )" />
				</xsl:attribute>
				<xsl:attribute name="rx">
					<xsl:value-of select="format-number( $height div 2, '#.00%' )" />
				</xsl:attribute>
			</rect>

			<rect>
				<xsl:attribute name="fill-opacity">
					<xsl:value-of select="$fill-opacity" />
				</xsl:attribute>
				<xsl:attribute name="fill">
					<xsl:value-of select="$fill" />
				</xsl:attribute>
				<xsl:attribute name="x">
					<xsl:value-of select="format-number( $width + ($height div 4) * -1, '#.00%' )" />
				</xsl:attribute>
				<xsl:attribute name="width">
					<xsl:value-of select="format-number( $height div 2, '#.00%' )" />
				</xsl:attribute>
				<xsl:attribute name="height">
					<xsl:value-of select="format-number( $height, '#.00%' )" />
				</xsl:attribute>
				<xsl:attribute name="rx">
					<xsl:value-of select="format-number( $height div 2, '#.00%' )" />
				</xsl:attribute>
			</rect>

			<rect x="0" y="0">
				<xsl:attribute name="fill-opacity">
					<xsl:value-of select="$fill-opacity" />
				</xsl:attribute>
				<xsl:attribute name="fill">
					<xsl:value-of select="$fill" />
				</xsl:attribute>
				<xsl:attribute name="width">
					<xsl:value-of select="format-number( $width, '#.00%' )" />
				</xsl:attribute>
				<xsl:attribute name="height">
					<xsl:value-of select="format-number( $height, '#.00%' )" />
				</xsl:attribute>
			</rect>
		</g>
	</xsl:template>

	<xsl:template name="listing-address-two-line">
		<xsl:param name="line-1-class" select="'heading bold'" />
		<xsl:param name="line-2-class" select="'sub-heading narrow'" />

		<text class="listing-address-two-line">
			<tspan>
				<xsl:attribute name="class">
					<xsl:value-of select="$line-1-class" />
				</xsl:attribute>
				<xsl:value-of select="//single/address/streetName" />
			</tspan>

			<tspan x="0" y="5%">
				<xsl:attribute name="class">
					<xsl:value-of select="$line-2-class" />
				</xsl:attribute>
				<xsl:value-of select="//single/address/city" />
				<xsl:text>, </xsl:text>
				<xsl:value-of select="//single/address/state" />
				<xsl:text>&#160;</xsl:text>
				<xsl:value-of select="//single/address/zip" />
			</tspan>
		</text>
	</xsl:template>

	<xsl:template name="agent-address">
		<xsl:if test="//agent[1]/address">
			<tspan>
				<xsl:call-template name="agent-address-line-one" />
			</tspan>
			<tspan>, </tspan>
			<tspan>
				<xsl:call-template name="agent-address-line-two" />
			</tspan>
		</xsl:if>
	</xsl:template>

	<xsl:template name="listing-address">
		<xsl:if test="//agent[1]/address">
			<tspan>
				<xsl:call-template name="listing-address-line-one" />
			</tspan>
			<tspan>, </tspan>
			<tspan>
				<xsl:call-template name="listing-address-line-two" />
			</tspan>
		</xsl:if>
	</xsl:template>

	<xsl:template name="market-header">
		<xsl:param name="title" />
		<g class="bold" style="font-size:1.25em">
			<g>
				<text class="h1 upper">
					<xsl:value-of select="$title" />
				</text>

				<div class="banner">
					<span class="flex" style="items-align:center">
						<xsl:call-template name="svg-icon">
							<xsl:with-param name="icon" select="'map-pin'" />
						</xsl:call-template>
						<xsl:value-of select="//area/name" />
					</span>
				</div>
			</g>
			<g class="flex-b50 right-align self-end self-center-portrait">
				<xsl:value-of select="//date/@period" />
			</g>
		</g>
	</xsl:template>

	<xsl:template name="agent-box-style">
		<xsl:param name="circle-image" select="'yes'" />
		<g id="agent-box-style">
			<clipPath id="clipCircle">
				<circle r="13%" cx="12.5%" cy="50%" />

			</clipPath>
			<image x="2%" y="10%" width="20%" height="80%" preserveAspectRatio="xMidYMid slice">
				<xsl:attribute name="href">
					<xsl:value-of select="//agent[1]/photo" />

				</xsl:attribute>
				<xsl:if test="$circle-image='yes'">
					<xsl:attribute name="clip-path">
						<xsl:value-of select="'url(#clipCircle)'" />
					</xsl:attribute>
				</xsl:if>
			</image>

			<g style="transform:translate(25%,12%)">
				<text x="0">
					<tspan style="font-size:150%; font-weight:bold;">
						<xsl:value-of select="//agent[1]/firstName" />

						<xsl:text>&#160;</xsl:text>
						<xsl:value-of select="//agent[1]/lastName" />

					</tspan>
				</text>

				<text x="0" y="23%" class="bold">
					<tspan x="0">
						<xsl:value-of select="//agent[1]/mobile" />

					</tspan>
					<tspan x="0" dy="17.5%" class="bold">
						<xsl:choose>
							<xsl:when test="//agent[1]/marketingEmail!=''">
								<xsl:value-of select="//agent[1]/marketingEmail" />

							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="//agent[1]/marketingEmail" />

							</xsl:otherwise>
						</xsl:choose>
					</tspan>
					<tspan x="0" dy="17.5%" class="bold">
						<xsl:choose>
							<xsl:when test="website!=''">
								<xsl:value-of select="//agent[1]/website" />

							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="//agent[1]/website" />

							</xsl:otherwise>
						</xsl:choose>
					</tspan>
				</text>
			</g>
		</g>
	</xsl:template>

	<xsl:template match="//agent" mode="two-line">
		<text>
			<xsl:value-of select="//agent[1]/first-name" />

			<xsl:text>&#160;</xsl:text>
			<xsl:value-of select="//agent[1]/last-name" />

		</text>
		<text>
			<tspan>
				<xsl:value-of select="//agent[1]/mobile" />

			</tspan>
			<tspan> &#124; </tspan>
			<tspan>
				<xsl:value-of select="//agent[1]/marketingEmail" />

			</tspan>
			<tspan> &#124; </tspan>
			<tspan>
				<xsl:value-of select="//agent[1]/website" />

			</tspan>
		</text>
	</xsl:template>

	<xsl:template name="postcard-agent" match="//agent">

		<text>This information is presented by</text>

		<g>
			<clipPath id="clipCircle" clipPathUnits="objectBoundingBox">
				<circle r=".3185" cx=".5" cy=".5" />

			</clipPath>

			<image x="5%" y="5%" width="20%" height="20%" clip-path="url(#clipCircle)">
				<xsl:attribute name="href">
					<xsl:value-of select="//agent[1]/photo" />

				</xsl:attribute>
			</image>

			<g>
				<text class="h1">
					<tspan>
						<xsl:value-of select="//agent[1]/first-name" />

					</tspan>
					<tspan>
						<xsl:text>&#160;</xsl:text>
					</tspan>
					<tspan class="bold">
						<xsl:value-of select="//agent[1]/last-name" />

					</tspan>
				</text>
				<text>
					<xsl:value-of select="//agent[1]/mobile" />

				</text>
				<text>
					<xsl:value-of select="concat( //agent[1]/marketingEmail, ' / ' )" />

				</text>
			</g>
		</g>
		<image x="5%" y="50%" width="40%" height="20%">
			<xsl:attribute name="href">
				<xsl:value-of select="$companyLogo" />
			</xsl:attribute>
		</image>

		<text>
			<xsl:value-of select="concat( 'become your neighborhood genius at ', //agent[1]/website )" />

		</text>
	</xsl:template>

	<xsl:template name="view-period">
		<xsl:param name="prefix" />


		<xsl:choose>
			<xsl:when test="number(//areas/area[1]/statistics/@lookbackMonths)=1">
				<xsl:value-of select="concat( $prefix, '30 Days')" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="concat( $prefix, //areas/area[1]/statistics/@lookbackMonths, ' months')" />

			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="property-count">
		<xsl:param name="transform" select="''" />
		<xsl:param name="icon" />
		<xsl:param name="icon-fill" />
		<xsl:param name="broder-stroke-color" />
		<xsl:param name="caption" />
		<xsl:param name="count" />
		<xsl:param name="description" />

		<g>
			<xsl:attribute name="style">
				<xsl:value-of select="$transform" />
			</xsl:attribute>
			<rect height="25%" rx="15" fill-opacity="100%" stroke="#fff" stroke-width="4px">
				<xsl:attribute name="width">
					<xsl:choose>
						<xsl:when test="$isFBAd='true'">
							<xsl:value-of select="'25%'" />

						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'14%'" />

						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<xsl:attribute name="fill">
					<xsl:value-of select="$icon-fill" />
				</xsl:attribute>
			</rect>

			<svg height="180" width="250" preserveAspectRatio="xMidYMid slice">
				<defs>
					<linearGradient id="grad1" x1="0%" y1="0%" x2="100%" y2="0%" gradientTransform="rotate(45)">
						<stop offset="0%" style="stop-color:var(--theme-body-background);stop-opacity:0"></stop>
						<stop offset="70%" style="stop-color:var(--theme-body-background);stop-opacity:0.05"></stop>
						<stop offset="100%" style="stop-color:var(--theme-body-background);stop-opacity:0.35"></stop>
					</linearGradient>
				</defs>
				<path d="M0 0 L0 150 C 35 170, 150 35, 150 0 Z" fill="url(#grad1)"></path>
			</svg>

			<text x="1%" y="3%" class="upper" fill="#fff" style="letter-spacing:2px; font-size:160%;font-weight:800;">
				<xsl:value-of select="$caption" />
			</text>

			<text x="1%" y="8%" fill="#fff" style="font-weight:800;">
				<xsl:attribute name="font-size">
					<xsl:choose>
						<xsl:when test="$isFBAd='true'">
							<xsl:value-of select="'305%'" />

						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'305%'" />

						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>

				<xsl:attribute name="data-max-width">
					<xsl:choose>
						<xsl:when test="$isFBAd='true'">
							<xsl:value-of select="'7.3%'" />

						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'7.3%'" />

						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>

				<xsl:if test="number($count) &gt;= 10">
					<xsl:value-of select="$count" />
				</xsl:if>
				<xsl:if test="number($count) &lt; 10">
					<xsl:value-of select="concat(0,$count)" />
				</xsl:if>
			</text>

			<use y="8.5%" height="9%">
				<xsl:attribute name="x">
					<xsl:choose>
						<xsl:when test="$isFBAd='true'">
							<xsl:value-of select="'16.5%'" />

						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'8%'" />

						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<xsl:attribute name="width">
					<xsl:choose>
						<xsl:when test="$isFBAd='true'">
							<xsl:value-of select="'8%'" />

						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'5.5%'" />

						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<xsl:attribute name="href">
					<xsl:value-of select="concat( '#', $icon )" />
				</xsl:attribute>
			</use>

			<rect id="rounded-rect" height="5%" fill="var(--theme-heading-color)" fill-opacity="0.1" y="19%" x="1%" rx="0.5%">
				<xsl:attribute name="width">
					<xsl:choose>
						<xsl:when test="$isFBAd='true'">
							<xsl:value-of select="'23%'" />

						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'12%'" />

						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</rect>

			<rect height="0.2%" y="18%" x="1%">
				<xsl:attribute name="width">
					<xsl:choose>
						<xsl:when test="$isFBAd='true'">
							<xsl:value-of select="'25%'" />

						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'12%'" />

						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<xsl:attribute name="fill">
					<xsl:value-of select="$broder-stroke-color" />
				</xsl:attribute>
			</rect>
			<text class="center central" y="21.5%" fill="#fff" font-weight="800">
				<xsl:attribute name="data-max-width">
					<xsl:choose>
						<xsl:when test="$isFBAd='true'">
							<xsl:value-of select="'22%'" />

						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'11%'" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<xsl:attribute name="x">
					<xsl:choose>
						<xsl:when test="$isFBAd='true'">
							<xsl:value-of select="'12.5%'" />

						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'7%'" />

						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<xsl:attribute name="font-size">
					<xsl:choose>
						<xsl:when test="$isFBAd='true'">
							<xsl:value-of select="'120%'" />

						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'100%'" />

						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<xsl:value-of select="$description" />
			</text>
		</g>
	</xsl:template>

	<xsl:template name="property-count-letter">
		<xsl:param name="transform" select="''" />
		<xsl:param name="icon" />
		<xsl:param name="icon-fill" />
		<xsl:param name="broder-stroke-color" />
		<xsl:param name="caption" />
		<xsl:param name="count" />
		<xsl:param name="description" />

		<g>
			<xsl:attribute name="style">
				<xsl:value-of select="$transform" />
			</xsl:attribute>
			<rect height="15%" rx="15" fill-opacity="100%" stroke="#fff" stroke-width="4px">
				<xsl:attribute name="width">
					<xsl:choose>
						<xsl:when test="$isFBAd='true'">
							<xsl:value-of select="'25%'" />

						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'18%'" />

						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<xsl:attribute name="fill">
					<xsl:value-of select="$icon-fill" />
				</xsl:attribute>
			</rect>

			<svg height="180" width="250" preserveAspectRatio="xMidYMid slice">
				<defs>
					<linearGradient id="grad1" x1="0%" y1="0%" x2="100%" y2="0%" gradientTransform="rotate(45)">
						<stop offset="0%" style="stop-color:var(--theme-body-background);stop-opacity:0"></stop>
						<stop offset="70%" style="stop-color:var(--theme-body-background);stop-opacity:0.05"></stop>
						<stop offset="100%" style="stop-color:var(--theme-body-background);stop-opacity:0.35"></stop>
					</linearGradient>
				</defs>
				<path d="M0 0 L0 150 C 35 170, 150 35, 150 0 Z" fill="url(#grad1)"></path>
			</svg>

			<text x="1%" y="3%" class="upper" fill="#fff" font-size="150%" font-weight="800" style="letter-spacing:2px">
				<xsl:value-of select="$caption" />
			</text>
			<text x="1%" y="7%" fill="#fff" style="font-weight:800;">
				<xsl:attribute name="font-size">
					<xsl:choose>
						<xsl:when test="$isFBAd='true'">
							<xsl:value-of select="'240%'" />

						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'240%'" />

						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>

				<xsl:attribute name="data-max-width">
					<xsl:choose>
						<xsl:when test="$isFBAd='true'">
							<xsl:value-of select="'7.3%'" />

						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'7.3%'" />

						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>

				<xsl:if test="number($count) &gt;= 10">
					<xsl:value-of select="$count" />
				</xsl:if>
				<xsl:if test="number($count) &lt; 10">
					<xsl:value-of select="concat(0,$count)" />
				</xsl:if>
			</text>

			<use y="2%" height="9%">
				<xsl:attribute name="x">
					<xsl:choose>
						<xsl:when test="$isFBAd='true'">
							<xsl:value-of select="'16.5%'" />

						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'10%'" />

						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<xsl:attribute name="width">
					<xsl:choose>
						<xsl:when test="$isFBAd='true'">
							<xsl:value-of select="'8%'" />

						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'6%'" />

						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<xsl:attribute name="href">
					<xsl:value-of select="concat( '#', $icon )" />
				</xsl:attribute>
			</use>

			<rect id="rounded-rect" height="4%" fill="var(--theme-heading-color)" fill-opacity="0.1" y="10.5%" x="1%" rx="0.5%">

				<xsl:attribute name="width">
					<xsl:choose>
						<xsl:when test="$isFBAd='true'">
							<xsl:value-of select="'23%'" />

						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'16%'" />

						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</rect>
			<!-- rect is here -->
			<rect height="0.2%" y="9.5%" x="1%">
				<xsl:attribute name="width">
					<xsl:choose>
						<xsl:when test="$isFBAd='true'">
							<xsl:value-of select="'25%'" />

						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'16%'" />

						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<xsl:attribute name="fill">
					<xsl:value-of select="$broder-stroke-color" />
				</xsl:attribute>
			</rect>
			<text class="center central" y="12.5%" fill="#fff" font-size="150%" font-weight="800">
				<xsl:attribute name="x">
					<xsl:choose>
						<xsl:when test="$isFBAd='true'">
							<xsl:value-of select="'12.5%'" />

						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'8.8%'" />

						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<xsl:attribute name="font-size">
					<xsl:choose>
						<xsl:when test="$isFBAd='true'">
							<xsl:value-of select="'120%'" />

						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'100%'" />

						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<xsl:value-of select="$description" />
			</text>
		</g>
	</xsl:template>

	<xsl:template name="map-property-count-letter">
		<xsl:param name="transform" select="''" />
		<xsl:param name="icon" />
		<xsl:param name="icon-fill" />
		<xsl:param name="broder-stroke-color" />
		<xsl:param name="caption" />
		<xsl:param name="count" />
		<xsl:param name="description" />

		<g>
			<xsl:attribute name="style">
				<xsl:value-of select="$transform" />
			</xsl:attribute>
			<rect height="17%" rx="15" fill-opacity="100%" stroke="#fff" stroke-width="4px">
				<xsl:attribute name="width">
					<xsl:choose>
						<xsl:when test="$isFBAd='true'">
							<xsl:value-of select="'25%'" />

						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'23%'" />

						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<xsl:attribute name="fill">
					<xsl:value-of select="$icon-fill" />
				</xsl:attribute>
			</rect>

			<svg height="180" width="250" preserveAspectRatio="xMidYMid slice">
				<defs>
					<linearGradient id="grad1" x1="0%" y1="0%" x2="100%" y2="0%" gradientTransform="rotate(45)">
						<stop offset="0%" style="stop-color:var(--theme-body-background);stop-opacity:0"></stop>
						<stop offset="70%" style="stop-color:var(--theme-body-background);stop-opacity:0.05"></stop>
						<stop offset="100%" style="stop-color:var(--theme-body-background);stop-opacity:0.35"></stop>
					</linearGradient>
				</defs>
				<path d="M0 0 L0 150 C 35 170, 150 35, 150 0 Z" fill="url(#grad1)"></path>
			</svg>

			<text x="1%" y="2%" class="upper" fill="#fff" font-size="180%" font-weight="600" style="letter-spacing:2px;">
				<xsl:value-of select="$caption" />
			</text>
			<text x="1%" y="5.5%" fill="#fff" font-weight="600" font-family="var(--theme-sub-heading-font)">
				<xsl:attribute name="font-size">
					<xsl:choose>
						<xsl:when test="$isFBAd='true'">
							<xsl:value-of select="'340%'" />

						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'340%'" />

						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>

				<xsl:attribute name="data-max-width">
					<xsl:choose>
						<xsl:when test="$isFBAd='true'">
							<xsl:value-of select="'7.3%'" />

						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'7.3%'" />

						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>

				<xsl:if test="number($count) &gt;= 10">
					<xsl:value-of select="$count" />
				</xsl:if>
				<xsl:if test="number($count) &lt; 10">
					<xsl:value-of select="concat(0,$count)" />
				</xsl:if>
			</text>

			<use y="4%" height="10%">
				<xsl:attribute name="x">
					<xsl:choose>
						<xsl:when test="$isFBAd='true'">
							<xsl:value-of select="'16.5%'" />

						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'14.5%'" />

						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<xsl:attribute name="width">
					<xsl:choose>
						<xsl:when test="$isFBAd='true'">
							<xsl:value-of select="'8%'" />

						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'7%'" />

						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<xsl:attribute name="href">
					<xsl:value-of select="concat( '#', $icon )" />
				</xsl:attribute>
			</use>

			<rect id="rounded-rect" height="3.7%" fill="var(--theme-heading-color)" fill-opacity="0.1" y="12.5%" x="1%" rx="0.5%">
				<xsl:attribute name="width">
					<xsl:choose>
						<xsl:when test="$isFBAd='true'">
							<xsl:value-of select="'23%'" />

						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'21%'" />

						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</rect>
			<!-- rect is here -->
			<rect height="0.1%" y="12%" x="1%" fill="#000">
				<xsl:attribute name="width">
					<xsl:choose>
						<xsl:when test="$isFBAd='true'">
							<xsl:value-of select="'23%'" />

						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'21%'" />

						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</rect>
			<text class="center central" y="14.3%" fill="#fff" font-weight="600" font-family="var(--theme-sub-heading-font)">
				<xsl:attribute name="x">
					<xsl:choose>
						<xsl:when test="$isFBAd='true'">
							<xsl:value-of select="'12.5%'" />

						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'11%'" />

						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<xsl:attribute name="font-size">
					<xsl:choose>
						<xsl:when test="$isFBAd='true'">
							<xsl:value-of select="'120%'" />

						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'130%'" />

						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<xsl:value-of select="$description" />
			</text>
		</g>
	</xsl:template>

	<xsl:template name="property-type-caption">
		<xsl:param name="short" select="'false'" />
		<xsl:param name="singular" select="'false'" />

		<xsl:choose>
			<xsl:when test="number(//areas/area[1]/statistics/@propertyType) = 0">
				<xsl:choose>
					<xsl:when test="$singular='true'">
						<xsl:choose>
							<xsl:when test="$short='true'">
								<xsl:text>Home</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>Home</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<xsl:when test="$short='true'">
								<xsl:text>Homes</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>Homes</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="$singular='true'">
						<xsl:text>Condo</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>Condos</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="chart-header">
		<xsl:param name="title" />

		<text x="50%" y="2%" class="h3 upper medium center">
			<tspan>
				<xsl:value-of select="//areas/area[1]/name" />
			</tspan>
			<tspan>
				<xsl:value-of select="concat( ' ', $propertyType)" />
			</tspan>
		</text>

		<text x="50%" y="6%" class="h1 large sub-heading upper center">
			<xsl:value-of select="$title" />
		</text>

		<text x="50%" y="13%" class="h4 upper center">
			<xsl:choose>
				<xsl:when test="number(//areas/area[1]/statistics/@lookbackMonths)=1">
					<xsl:text>Last Month</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="concat( 'Last ', //areas/area[1]/statistics/@lookbackMonths, ' months')" />

				</xsl:otherwise>
			</xsl:choose>
		</text>
	</xsl:template>

	<xsl:template name="agent-contact-g">
		<g id="agent-contact">
			<text x="50%" y="92%" text-anchor="middle" data-max-width="98%">
				<xsl:call-template name="agent-contact" />
			</text>
		</g>
	</xsl:template>

	<xsl:template name="agent-contact">
		<tspan>
			<xsl:if test="//agent[1]/mobile">
				<xsl:value-of select="concat( 'Text ', $agentMeUs, ' at')" />

				<a style="color:#1e88e5;fill:#1e88e5;">
					<xsl:attribute name="href">
						<xsl:value-of select="concat( 'tel:', //agent[1]/mobile )" />

					</xsl:attribute>
					<xsl:value-of select="//agent[1]/mobile" />
				</a>
			</xsl:if>

			<xsl:if test="//agent[1]/marketingEmail">
				<xsl:text> or email </xsl:text>
				<a style="color:#1e88e5;fill:#1e88e5;">
					<xsl:attribute name="href">
						<xsl:value-of select="concat( 'mailto:', //agent[1]/marketingEmail )" />

					</xsl:attribute>
					<xsl:value-of select="//agent[1]/marketingEmail" />

				</a>
			</xsl:if>

			<xsl:text> for PRIVATE ACCESS to the full list with all property details.</xsl:text>
		</tspan>
	</xsl:template>

	<xsl:template name="solicitation-disclaimer">
		<xsl:value-of select="concat( 'Neighborhood Market Trends Information provided by third-party sources is deemed reliable, but not guaranteed. If your home is currently listed for sale, this is not intended to be a solicitation. &#169; ', //output/@year )" />

	</xsl:template>

	<xsl:template name="copyright">
		<xsl:param name="url" select="'https://genie.ai'" />
		<xsl:param name="disclaimer" select="'default'" />

		<g id="footer">
			<text>
				<tspan fill="var(--theme-heading-color)">
					<xsl:text>SOURCE: theGenie.ai  Copyright &#169; </xsl:text>
					<xsl:value-of select="//output/@year" />

				</tspan>
				<tspan>
					<xsl:text> 1parkplace, Inc.</xsl:text>
				</tspan>
			</text>
		</g>
	</xsl:template>

	<xsl:template name="soldListed">
		<xsl:param name="sold" select="//single/soldDate!=''" />
		<xsl:choose>
			<xsl:when test="$sold">
				<xsl:text>Sold</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>Listed</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="soldListedPrice">
		<xsl:choose>
			<xsl:when test="//single/soldDate!=''">
				<tspan class="narrow">Sold For </tspan>
				<xsl:value-of select="format-number( //single/salePrice, '$###,###')" />

			</xsl:when>
			<xsl:otherwise>
				<tspan class="narrow">Asking </tspan>
				<xsl:value-of select="format-number( //single/price, '$###,###')" />

			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="background-image">
		<xsl:param name="class" />
		<xsl:param name="style" />
		<xsl:param name="index" select="number(1)" />

		<figure>
			<xsl:attribute name="class">
				<xsl:value-of select="concat( $class, ' cover' )" />
			</xsl:attribute>
			<xsl:attribute name="style">
				<xsl:value-of select="concat( $style,&quot;background-image:url('&quot;,//single/images/image[$index]/@src, &quot;')&quot; )" />
			</xsl:attribute>
		</figure>
	</xsl:template>

	<xsl:template name="listing-description">
		<xsl:call-template name="editable">
			<xsl:with-param name="id" select="'listing-description'" />
			<xsl:with-param name="default" select="//single/description" />
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="bed-icon">
		<xsl:call-template name="listing-icon">
			<xsl:with-param name="icon" select="'bed'" />
			<xsl:with-param name="caption" select="'Bedrooms: '" />
			<xsl:with-param name="value" select="//single/bedrooms/@count" />
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="bath-icon">
		<xsl:call-template name="listing-icon">
			<xsl:with-param name="icon" select="'bath'" />
			<xsl:with-param name="caption" select="'Bathrooms: '" />
			<xsl:with-param name="value" select="(//single/bathrooms/@full+//single/bathrooms/@half)" />
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="park-icon">
		<xsl:call-template name="listing-icon">
			<xsl:with-param name="icon" select="'parking'" />
			<xsl:with-param name="caption" select="'Car Spaces: '" />
			<xsl:with-param name="value" select="(//single/parking/@spaces+//single/parking/@garage)" />
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="tag-icon">
		<xsl:call-template name="listing-icon">
			<xsl:with-param name="icon" select="'tag'" />
			<xsl:with-param name="caption" select="'Price per Sq.Ft.: '" />
			<xsl:with-param name="value" select="format-number( //single/price div //single/square-feet, '$###,###')" />
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="listed-icon">
		<xsl:call-template name="listing-icon">
			<xsl:with-param name="icon" select="'calendar'" />
			<xsl:with-param name="caption" select="'Listed on: '" />
			<xsl:with-param name="value" select="//single/listed" />
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="dom-icon">
		<xsl:call-template name="listing-icon">
			<xsl:with-param name="icon" select="'clock'" />
			<xsl:with-param name="caption" select="'DoM: '" />
			<xsl:with-param name="value" select="//single/days-on-market" />
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="size-icon">
		<xsl:call-template name="listing-icon">
			<xsl:with-param name="icon" select="'ruler'" />
			<xsl:with-param name="caption" select="'Sq.Ft.: '" />
			<xsl:with-param name="value" select="format-number(//single/square-feet, '###,###')" />
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="asking-icon">
		<xsl:call-template name="listing-icon">
			<xsl:with-param name="icon" select="'tag'" />
			<xsl:with-param name="caption" select="'Asking '" />
			<xsl:with-param name="value" select="format-number(//single/price, '$###,###')" />
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="mls-icon">
		<xsl:call-template name="listing-icon">
			<xsl:with-param name="icon" select="'map-pin'" />
			<xsl:with-param name="caption" select="'Mls #: '" />
			<xsl:with-param name="value" select="//single/mls" />
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="type-icon">
		<xsl:call-template name="listing-icon">
			<xsl:with-param name="icon" select="'map-pin'" />
			<xsl:with-param name="caption" select="'Type: '" />
			<xsl:with-param name="value" select="//single/type" />
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="listing-icon">
		<xsl:param name="icon" />
		<xsl:param name="caption" />
		<xsl:param name="value" />

		<g class="listing-icon">
			<g class="round">
				<use>
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#', $icon )" />
				</use>
			</g>
			<text>
				<tspan>
					<xsl:value-of select="$caption" />

				</tspan>
				<tspan>
					<xsl:value-of select="$value" />

				</tspan>
			</text>
		</g>
	</xsl:template>

	<xsl:template name="mls-number">
		<xsl:text>MLS #: </xsl:text>
		<xsl:value-of select="//single/mls" />
	</xsl:template>

	<xsl:template name="chart-files">
		<style>
			<xsl:value-of select="'@import url(&quot;https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.css&quot;);'" />
		</style>
		<script>
			<xsl:attribute name="href">
				<xsl:value-of select="'https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.js'" />
			</xsl:attribute>
			<xsl:text>;</xsl:text>
		</script>
		<script>
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_js/charts.js') " />

			<xsl:text>;</xsl:text>
		</script>
		<!-- <style><![CDATA[.ct-series-a .ct-line,.ct-series-a .ct-point {stroke:var(- -theme-heading-color);}.ct-axis-title{fill:var(- -theme-heading-color);}]]></style> -->
	</xsl:template>

	<xsl:template name="map-files">
		<style>
			<xsl:value-of select="'@import url(&quot;https://unpkg.com/leaflet@1.9.4/dist/leaflet.css&quot;);'" />
		</style>
		<script href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js">
			<xsl:text>;</xsl:text>
		</script>
		<script >
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_js/maps.js') " />

			<xsl:text>;</xsl:text>
		</script>
	</xsl:template>

	<xsl:template name="mixed-listings">
		<xsl:param name="limit" select="10" />
		<xsl:param name="status" select="'all'" />


		<script>
			<xsl:text>var listings=[</xsl:text>
			<xsl:if test="$status='all' or $status='sold'">
				<xsl:for-each select="//listings/listing[@state='sold']">
					<xsl:if test="position() &lt;= $limit">
						<xsl:value-of select="concat( &quot;{state:'&quot;, @state, &quot;',listPrice:'&quot;, @listPrice, &quot;',salePrice:'&quot;, @salePrice, &quot;',lat:'&quot;, @lat, &quot;',lng:'&quot;, @lon, &quot;'},&quot; )" />
					</xsl:if>
				</xsl:for-each>
			</xsl:if>

			<xsl:if test="$status='all' or $status='pending'">
				<xsl:for-each select="//listings/listing[@state='pending']">
					<xsl:if test="position() &lt;= $limit">
						<xsl:value-of select="concat( &quot;{state:'&quot;, @state, &quot;',listPrice:'&quot;, @listPrice, &quot;',salePrice:'&quot;, @salePrice, &quot;',lat:'&quot;, @lat, &quot;',lng:'&quot;, @lon, &quot;'},&quot; )" />
					</xsl:if>
				</xsl:for-each>
			</xsl:if>

			<xsl:if test="$status='all' or $status='active'">
				<xsl:for-each select="//listings/listing[@state='active']">
					<xsl:if test="position() &lt;= $limit">
						<xsl:value-of select="concat( &quot;{state:'&quot;, @state, &quot;',listPrice:'&quot;, @listPrice, &quot;',salePrice:'&quot;, @salePrice, &quot;',lat:'&quot;, @lat, &quot;',lng:'&quot;, @lon, &quot;', dom:&quot;, @dom, &quot;},&quot; )" />
					</xsl:if>
				</xsl:for-each>
			</xsl:if>

			<xsl:text>];</xsl:text>
		</script>
	</xsl:template>


	<xsl:template name="map-key">
		<xsl:param name="status" select="'all'" />

		<filter x="-8%" y="-1%" width="115%" height="8.5" id="solid">
			<feFlood flood-color="var(--theme-sub-heading-color)" flood-opacity="0.5" />

			<feComposite in="SourceGraphic" operator="xor" />
		</filter>

		<rect width="100%" height="100%" fill="var(--theme-sub-heading-color)" fill-opacity="0.5" />

		<xsl:if test="$status='all' or $status='active'">
			<svg x="5%" y="6%">
				<circle cx="9%" fill="var(--new-blue)" r="12" cy="10%"></circle>
				<text x="9%" y="10%" class="small center central" fill="#fff" font-size="100%" font-weight="bold">
					<xsl:value-of select="count($listingsTotalNew)" />
				</text>
				<text x="20%" y="8" fill="var(--theme-body-background)" font-size="100%" font-weight="bold">
					<xsl:value-of select="concat( 'New (Active)', '')" />
				</text>
			</svg>

			<svg x="5%" y="29.5%">
				<circle cy="9%" r="12" fill="var(--active-green)" cx="10%"></circle>
				<text x="10%" y="10%" class="small center central" fill="#fff" font-size="100%" font-weight="bold">
					<xsl:value-of select="count(Active)" />
				</text>
				<text x="20%" y="5%" fill="var(--theme-body-background)" font-size="100%" font-weight="bold">
						Active
				</text>
			</svg>
		</xsl:if>

		<xsl:if test="$status='all' or $status='pending'">
			<svg x="5%">
				<xsl:variable name="y">
					<xsl:choose>
						<xsl:when test="$status='all'">
							<xsl:value-of select="'52'" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'25'" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:attribute name="y">
					<xsl:value-of select="concat( $y, '%')" />

				</xsl:attribute>

				<circle cy="9%" r="12" fill="var(--pending-yellow)" cx="10%"></circle>
				<text x="10%" y="10%" class="small center central" fill="#fff" font-size="100%" font-weight="bold">
					<xsl:value-of select="count($listingsTotalPending)" />
				</text>
				<text x="20%" y="5%" fill="var(--theme-body-background)" font-size="100%" font-weight="bold">
						Pending
				</text>
			</svg>
		</xsl:if>

		<xsl:if test="$status='all' or $status='sold'">
			<svg x="5%">
				<xsl:variable name="y">
					<xsl:choose>
						<xsl:when test="$status='all'">
							<xsl:value-of select="'75'" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'25'" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:attribute name="y">
					<xsl:value-of select="concat( $y, '%')" />

				</xsl:attribute>

				<circle cy="9%" r="12" fill="var(--sold-red)" cx="10%"></circle>
				<text x="10%" y="10%" class="small center central" fill="#fff" font-size="90%" font-weight="bold">
					<xsl:value-of select="count($listingsTotalSold)" />
				</text>
				<text x="20%" y="5%" fill="var(--theme-body-background)" font-size="100%" font-weight="bold">
						Sold
				</text>
			</svg>
		</xsl:if>
	</xsl:template>

	<xsl:template name="coming-soon">
		<svg x="30%" y="5%" width="40%" height="40%">
			<use>
				<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#pending-icon' )" />
			</use>
		</svg>

		<text x="50%" y="50%" class="h1 center bold" style="font-size:450%">Coming Soon!</text>

		<xsl:call-template name="copyright" />
	</xsl:template>

	<xsl:variable name="month_type">
		<xsl:choose>
			<xsl:when test="number(//output/@areaPeriod ) &gt; 1">
				<xsl:value-of select="concat(//output/@areaPeriod, ' months' )" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="' 30 days'" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:template name="qr-code">
		<xsl:param name="width" />
		<xsl:param name="height" />

		<xsl:param name="url">
			<xsl:variable name="folder" select="//output/@folder" />
			<xsl:variable name="stylesheet" select="//output/@stylesheet" />

			<xsl:choose>
				<xsl:when test="string(//output/@qrUrl)='skip'">
					<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/blank-qr.svg' )" />
				</xsl:when>
				<xsl:when test="//overrides/qrUrl!=''">
					<xsl:value-of select="//overrides/qrUrl" />
				</xsl:when>
				<xsl:when test="//collection/folders/folder/asset[@folder=$folder and @stylesheet=$stylesheet and @qrUrl!='']">
					<xsl:value-of select="//collection/folders/folder/asset[@folder=$folder and @stylesheet=$stylesheet]/@qrUrl" />
				</xsl:when>
				<xsl:when test="//output/@qrUrl!=''">
					<xsl:value-of select="//output/@qrUrl" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="''" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:param>

		<xsl:if test="$url!='' and $url!='skip'">
			<image preserveAspectRatio="xMidYMid meet">
				<xsl:attribute name="href">
					<xsl:value-of select="$url" />
				</xsl:attribute>

				<xsl:if test="string($width)!=''">
					<xsl:attribute name="width">
						<xsl:value-of select="$width" />
					</xsl:attribute>
				</xsl:if>

				<xsl:if test="string($height)!=''">
					<xsl:attribute name="height">
						<xsl:value-of select="$height" />
					</xsl:attribute>
				</xsl:if>
			</image>
		</xsl:if>
	</xsl:template>

	<xsl:template name="switch-image">
		<xsl:param name="idx" />
		<xsl:param name="id" select="concat('LImage', $idx)" />

		<xsl:param name="preferPrimary" select="'false'" />
		<xsl:param name="preferArea" select="'false'" />

		<xsl:param name="default">
			<xsl:call-template name="listing-image">
				<xsl:with-param name="index" select="number($idx)" />
				<xsl:with-param name="preferPrimary" select="$preferPrimary" />
			</xsl:call-template>
		</xsl:param>

		<xsl:if test="//output/@isEditing">
			<xsl:attribute name="data-default">
				<xsl:value-of select="$default" />
			</xsl:attribute>
			<xsl:attribute name="data-name">
				<xsl:value-of select="$id" />
			</xsl:attribute>
		</xsl:if>

		<xsl:attribute name="href">
			<xsl:choose>
				<xsl:when test="//overrides/*[name()=$id][1]">
					<xsl:value-of select="//overrides/*[name()=$id][1]" />

				</xsl:when>
				<xsl:when test="$preferArea='true' and //area/image!=''">
					<xsl:value-of select="//area/image" />

				</xsl:when>
				<xsl:when test="$default">
					<xsl:value-of select="$default" />

				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/picture-pending.jpg' )" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
	</xsl:template>

	<xsl:template name="test-edit">
		<xsl:attribute name="xclass">
			<xsl:value-of select="'pulsate'" />
		</xsl:attribute>
		<xsl:attribute name="data-y-test">
			<xsl:value-of select="'true'" />
		</xsl:attribute>
	</xsl:template>

	<xsl:template name="editable">
		<xsl:param name="id" />
		<xsl:param name="default" />
		<xsl:param name="data-msg" select="'false'" />
		<xsl:param name="data-element" select="'p'" />

		<xsl:if test="//output/@isEditing">
			<xsl:attribute name="data-element">
				<xsl:value-of select="$data-element" />
			</xsl:attribute>
			<xsl:attribute name="data-editable">
				<xsl:value-of select="'true'" />
			</xsl:attribute>
			<xsl:attribute name="data-default">
				<xsl:value-of select="$default" />
			</xsl:attribute>
			<xsl:attribute name="data-name">
				<xsl:value-of select="$id" />
			</xsl:attribute>
			<xsl:if test="$data-msg='true'">
				<xsl:attribute name="data-msg">
					<xsl:value-of select="'social-post'" />
				</xsl:attribute>
			</xsl:if>
		</xsl:if>

		<xsl:call-template name="overridable">
			<xsl:with-param name="id" select="$id" />
			<xsl:with-param name="default" select="$default" />
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="get-in-touch-form">
		<div id="in-touch-form"></div>
	</xsl:template>

	<xsl:template name="svg-icon">
		<xsl:param name="icon" />
		<xsl:param name="class" />
		<xsl:param name="style" />

		<div>
			<xsl:attribute name="class">
				<xsl:value-of select="concat( 'svg-icon ', $class )" />
			</xsl:attribute>
			<xsl:attribute name="style">
				<xsl:value-of select="$style" />
			</xsl:attribute>
			<use>
				<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#', $icon )" />
			</use>
		</div>
	</xsl:template>

	<xsl:template name="map-fallback-image">
		<xsl:param name="x" />
		<xsl:param name="y" />
		<xsl:param name="width" />
		<xsl:param name="height" />
		<xsl:param name="index" select="1" />

		<xsl:variable name="imageIndex">
			<!-- TODO port "pick" function? <xsl:value-of select="version="3.0":function('Genie\XSL::pick', number($index), string(//output/@imageIndex), count(//single/images/image) )" /> -->
			<xsl:value-of select="number($index)" />
		</xsl:variable>

		<xsl:if test="$imageIndex &gt; 0">
			<image preserveAspectRatio="xMidYMid slice">
				<xsl:attribute name="x">
					<xsl:value-of select="$x" />
				</xsl:attribute>
				<xsl:attribute name="y">
					<xsl:value-of select="$y" />
				</xsl:attribute>
				<xsl:attribute name="width">
					<xsl:value-of select="$width" />
				</xsl:attribute>
				<xsl:attribute name="height">
					<xsl:value-of select="$height" />
				</xsl:attribute>

				<xsl:call-template name="switch-image">
					<xsl:with-param name="id" select="concat( 'image-', $imageIndex )" />
					<xsl:with-param name="idx" select="$imageIndex" />

				</xsl:call-template>
			</image>
		</xsl:if>

		<xsl:if test="$imageIndex &lt; 0">
			<foreignObject>
				<xsl:attribute name="x">
					<xsl:value-of select="$x" />
				</xsl:attribute>
				<xsl:attribute name="y">
					<xsl:value-of select="$y" />
				</xsl:attribute>
				<xsl:attribute name="width">
					<xsl:value-of select="$width" />
				</xsl:attribute>
				<xsl:attribute name="height">
					<xsl:value-of select="$height" />
				</xsl:attribute>

				<div>
					<xsl:attribute name="data-width">
						<xsl:value-of select="$width" />
					</xsl:attribute>
					<xsl:attribute name="data-height">
						<xsl:value-of select="$height" />
					</xsl:attribute>

					<xsl:call-template name="map-output">
						<xsl:with-param name="style" select="'satellite-v9'" />
						<xsl:with-param name="center" select="concat( '[', //single/latitude, ',', //single/longitude, ']' )" />
						<xsl:with-param name="zoom" select="18" />
					</xsl:call-template>
				</div>
			</foreignObject>
		</xsl:if>
	</xsl:template>

	<xsl:template name="map-output">
		<!-- 
			Valid styles are (April 2020):
				streets-v11
				outdoors-v11
				light-v10
				dark-v10
				satellite-v9
				satellite-streets-v11 (streets)

				For updates:
				https://docs.mapbox.com/api/maps/#styles
		-->
		<xsl:param name="style" select="'streets-v11'" />
		<xsl:param name="iconType" select="''" />
		<xsl:param name="mapContainer" select="'genie-map'" />
		<xsl:param name="scale" select="'1'" />
		<xsl:param name="zoom" select="number(18)" />
		<xsl:param name="center" />

		<div style="width: 100%; height: 100%">
			<xsl:attribute name="id">
				<xsl:value-of select="$mapContainer" />
			</xsl:attribute>
			<!-- Force a closing tag, otherwise Chrome throws a wobbly -->
			<xsl:comment />

			<div class="leaflet-overlay-pane" style="position: absolute;z-index:9999999999;width:100%;height:100%;">
				<svg style="width: 100%; height: 100%; point-events:none;">
					<xsl:call-template name="map-overlay" />

				</svg>
			</div>
		</div>

		<script>
			<xsl:value-of select="concat( &quot;var wkt='&quot;, //area/geojson, &quot;';&quot;)" />
			<xsl:value-of select="concat( 'document.addEventListener( `DOMContentLoaded`, function () { if( typeof drawMap !== `undefined` ) { drawMap( `',$mapContainer,'`,`', $style,'`,`',//output/@mapboxKey,'`, { lat: ', //area/centerLat, ', lng: ', //area/centerLng, ' }, wkt, listings, `', $iconType, '`, ', $scale, ' );}});' )" />
		</script>
	</xsl:template>

	<xsl:template name="map-overlay" />


	<xsl:template name="listings-header">
		<xsl:param name="title" />
		<xsl:param name="color" />

		<text x="50%" y="8%" class="align-center upper sub-heading" style="font-size:180%;letter-spacing:2px;">
			<xsl:value-of select="concat( //areas/area/name, ' ', $propertyType)" />
		</text>

		<text x="50%" y="16.5%" class="align-center upper heading">
			<xsl:attribute name="style">
				<xsl:value-of select="concat( 'font-size:300%;font-weight:500;letter-spacing:2px;fill:', $color,';' )" />
			</xsl:attribute>

			<xsl:value-of select="$title" />
		</text>

		<text x="50%" y="23%" class="align-center capitalize" style="font-size:140%">
			<xsl:value-of select="concat( 'As of ', genie:format-date( //output/@reportDate, '[FNn] [MNn] [D], [Y0001]' ) )" />
		</text>
	</xsl:template>

	<xsl:template name="letter-report-header">
		<xsl:param name="title" />
		<xsl:param name="color" />

		<text x="50%" y="9%" class="align-center upper sub-heading" font-size="180%" style="letter-spacing:2px;">
			<xsl:value-of select="concat( //areas/area/name, ' ', $propertyType)" />
		</text>

		<text x="50%" y="14.5%" class="align-center upper heading" font-size="320%" font-weight="500">
			<xsl:attribute name="style">
				<xsl:value-of select="concat('letter-spacing:2px;fill:', $color,';' )" />
			</xsl:attribute>

			<xsl:value-of select="$title" />
		</text>
	</xsl:template>

	<xsl:template name="listings-footer">
		<xsl:param name="min" select="number(10)" />
		<xsl:param name="nodes" />
		<xsl:param name="summary" />

		<xsl:if test="$isFBAd!='true'">
			<text y="92%" class="align-center" style="font-size:80%" data-max-width="98%">
				<tspan x="50%" style="font-size:75%">
					<xsl:value-of select="concat( 'Showing the most recent ', fn:min(( $min, count($nodes) )), ' of a total of ', count($nodes), $summary )" />
				</tspan>

				<tspan x="50%" dy="2.5%" style="font-size:90%">
					<xsl:call-template name="agent-contact" />
				</tspan>
			</text>
		</xsl:if>

		<text style="font-size:70%">
			<xsl:for-each select="$nodes">
				<xsl:if test="position() &lt;= 8">
					<tspan x="1.5%" dy="1%" class="align-center" fill="#fff">
						<xsl:value-of select="concat( position(), ' - ', @thumb )" />
					</tspan>
				</xsl:if>
			</xsl:for-each>
		</text>
	</xsl:template>

	<xsl:template name="ed-showing-listing">
		<xsl:param name="min" select="number(10)" />
		<xsl:param name="nodes" />
		<xsl:param name="summary" />

		<xsl:if test="$isFBAd!='true'">
			<text x="50%" y="29%" fill="#b0934c" class="center futura-text" style="word-spacing:5px; text-transform: uppercase;">
				<tspan x="50%" font-size="110%">
					<xsl:text>Showing </xsl:text>
					<!-- <xsl:value-of select="version="3.0":function('Genie\XSL::min', $min, number(count($nodes)) )" /> -->
					<xsl:value-of select="'XSL::min'" />
					<xsl:text> of </xsl:text>
					<xsl:value-of select="number(count($nodes))" />


					<xsl:text> TOTAL LISTINGS</xsl:text>
				</tspan>
			</text>
		</xsl:if>
	</xsl:template>

	<xsl:template name="show-agent-logos">
		<!-- 
			Logo Position and width/height variables

			pl-X = personalLogo X
			pl-Y = personalLogo Y
			cl-X = companyLogo X
			cl-Y = companyLogo Y

			pl-W = personalLogo width
			pl-H = personalLogo height
			cl-W = companyLogo width
			cl-H = companyLogo height

			pl-par = personalLogo preserveAspectRatio
			cl-par = companyLogo preserveAspectRatio

			pl-Class = personalLogo Classes
			cl-Class = companyLogo Classes

		-->
		<xsl:param name="pl-X" />
		<xsl:param name="pl-Y" />
		<xsl:param name="cl-X" />
		<xsl:param name="cl-Y" />

		<xsl:param name="pl-W" />
		<xsl:param name="pl-H" />
		<xsl:param name="cl-W" />
		<xsl:param name="cl-H" />

		<xsl:param name="pl-par" />
		<xsl:param name="cl-par" />

		<xsl:param name="pl-Class" />
		<xsl:param name="cl-Class" />

		<xsl:choose>
			<xsl:when test="$companyLogo!='' or $personalLogo!=''">
				<image preserveAspectRatio="xMidYMid meet">

					<xsl:attribute name="x">
						<xsl:value-of select="$pl-X" />
					</xsl:attribute>
					<xsl:attribute name="y">
						<xsl:value-of select="$pl-Y" />
					</xsl:attribute>
					<xsl:attribute name="width">
						<xsl:value-of select="$pl-W" />
					</xsl:attribute>
					<xsl:attribute name="height">
						<xsl:value-of select="$pl-H" />
					</xsl:attribute>
					<xsl:attribute name="class">
						<xsl:value-of select="$pl-Class" />
					</xsl:attribute>
					<xsl:attribute name="preserveAspectRatio">
						<xsl:value-of select="$pl-par" />
					</xsl:attribute>

					<xsl:attribute name="href">
						<xsl:choose>
							<xsl:when test="$personalLogo=''">
								<xsl:value-of select="$companyLogoInverse" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$personalLogoInverse" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</image>
			</xsl:when>
			<xsl:otherwise>
				<image>
					<xsl:attribute name="x">
						<xsl:value-of select="$pl-X" />
					</xsl:attribute>
					<xsl:attribute name="y">
						<xsl:value-of select="$pl-Y" />
					</xsl:attribute>
					<xsl:attribute name="width">
						<xsl:value-of select="$pl-W" />
					</xsl:attribute>
					<xsl:attribute name="height">
						<xsl:value-of select="$pl-H" />
					</xsl:attribute>
					<xsl:attribute name="class">
						<xsl:value-of select="$pl-Class" />
					</xsl:attribute>
					<xsl:attribute name="preserveAspectRatio">
						<xsl:value-of select="$pl-par" />
					</xsl:attribute>
					<xsl:attribute name="href">
						<xsl:value-of select="$personalLogoInverse" />
					</xsl:attribute>
				</image>
				<image >
					<xsl:attribute name="x">
						<xsl:value-of select="$cl-X" />
					</xsl:attribute>
					<xsl:attribute name="y">
						<xsl:value-of select="$cl-Y" />
					</xsl:attribute>
					<xsl:attribute name="width">
						<xsl:value-of select="$cl-W" />
					</xsl:attribute>
					<xsl:attribute name="height">
						<xsl:value-of select="$cl-H" />
					</xsl:attribute>
					<xsl:attribute name="class">
						<xsl:value-of select="$cl-Class" />
					</xsl:attribute>
					<xsl:attribute name="preserveAspectRatio">
						<xsl:value-of select="$cl-par" />
					</xsl:attribute>
					<xsl:attribute name="href">
						<xsl:value-of select="$companyLogoInverse" />
					</xsl:attribute>
				</image>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>