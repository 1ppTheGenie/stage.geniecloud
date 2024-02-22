<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:genie="https://theGenie.ai/hub" version="3.0">
	<xsl:import href="genie-functions.xsl" />

	<xsl:variable name="quot">"</xsl:variable>
	<xsl:variable name="apos">'</xsl:variable>

	<xsl:template name="overridable">
		<xsl:param name="id" />
		<xsl:param name="default" />
		<xsl:choose>
			<xsl:when test="//overrides/*[name()=$id][1]">
				<xsl:value-of select="//overrides/*[name()=$id][1]" />

			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$default" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="listing-image">
		<xsl:param name="index" select="number(1)" />
		<xsl:param name="preferPrimary" select="'false'" />
		<xsl:param name="skipDefault" select="'false'" />

		<xsl:choose>
			<xsl:when test="//overrides/primaryImage">
				<xsl:value-of select="//overrides/primaryImage" />
			</xsl:when>
			<xsl:when test="//overrides/*[name()=concat('LImage',$index)][1]">
				<xsl:value-of select="//overrides/*[name()=concat('LImage',$index)][1]" />
			</xsl:when>
			<xsl:when test="$index=1 and $preferPrimary='true' and //single/photoPrimary!=''">
				<xsl:value-of select="//single/photoPrimary" />
			</xsl:when>
			<xsl:when test="//single/images/image[$index]/@src!=''">
				<xsl:value-of select="//single/images/image[$index]/@src" />
			</xsl:when>
			<xsl:when test="skipDefault='true'">
				<xsl:value-of select="''" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/picture-pending.jpg' )" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="break">
		<xsl:param name="text" select="string(.)" />


		<xsl:choose>
			<xsl:when test="contains($text, '&#10;')">
				<xsl:value-of select="substring-before($text, '&#10;')" />

				<br/>
				<xsl:call-template name="break">
					<xsl:with-param name="text" select="substring-after($text, '&#10;')" />
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$text" />

			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="sanitize">
		<xsl:param name="value" />

		<xsl:value-of select="replace( lower-case(string($value)), ' ', '-' )" />
	</xsl:template>

	<xsl:template name="cost">
		<xsl:param name="price" />

		<xsl:choose>
			<xsl:when test="$price">
				<xsl:value-of select="format-number( $price, '$###,###')" />

			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'$TBC'" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="format-price">
		<xsl:param name="price" />
		<xsl:choose>
			<xsl:when test="$price > 999999">
				<xsl:value-of select="format-number( $price div 1000000, '$#.00M')" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="format-number( $price, '$###,###')" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="agent-address-line-one">
		<xsl:value-of select="//agent[1]/address/street" />
	</xsl:template>

	<xsl:template name="agent-address-line-two">
		<xsl:value-of select="//agent[1]/address/city" />
		<xsl:text>,&#160;</xsl:text>
		<xsl:value-of select="//agent[1]/address/state" />
		<xsl:text>&#160;</xsl:text>
		<xsl:value-of select="//agent[1]/address/zip" />
	</xsl:template>

	<!-- $hasMultipleAgents -->
	<xsl:variable name="hasMultipleAgents" select="count(//agent) &gt; 1" />

	<!-- $agentCount -->
	<xsl:variable name="agentCount" select="count(//agent)" />

	<!-- $lookbackPeriodName -->
	<xsl:variable name="lookbackPeriodName">
		<xsl:choose>
			<xsl:when test="//areas/area[1]/statistics/@lookbackMonths='1'">
				<xsl:text>last month</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="concat( 'last ', //areas/area[1]/statistics/@lookbackMonths, ' months')" />

			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<!-- $propertyType -->
	<xsl:variable name="propertyType">
		<xsl:choose>
			<xsl:when test="string(//output/@propertyCaption)!=''">
				<xsl:value-of select="//output/@propertyCaption" />
			</xsl:when>
			<xsl:when test="(//single/type = 'Condo') or ( string(//single/type) = '' and number(//areas/area[1]/statistics/@propertyType) = 1 )">
				<xsl:text>Condos</xsl:text>
			</xsl:when>
			<xsl:when test="(//single/type = 'Townhome') or ( string(//single/type) = '' and number(//areas/area[1]/statistics/@propertyType) = 9 )">
				<xsl:text>Townhomes</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>Homes</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<!-- $longPropertyType -->
	<xsl:variable name="longPropertyType">
		<xsl:choose>
			<xsl:when test="string(//output/@longPropertyCaption)!=''">
				<xsl:value-of select="//output/@longPropertyCaption" />
			</xsl:when>
			<xsl:when test="(//single/type = 'Condo') or ( string(//single/type) = '' and number(//areas/area[1]/statistics/@propertyType) = 1 )">
				<xsl:text>Condos</xsl:text>
			</xsl:when>
			<xsl:when test="(//single/type = 'Townhome') or ( string(//single/type) = '' and number(//areas/area[1]/statistics/@propertyType) = 9 )">
				<xsl:text>Townhomes</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>Detached Homes</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<!-- $singularPropertyType -->
	<xsl:variable name="singularPropertyType">
		<xsl:choose>
			<xsl:when test="//output/@propertyCaptionSingular!='' and //output/@propertyCaptionSingular!='null'">
				<xsl:value-of select="//output/@propertyCaptionSingular" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="substring( $propertyType, 1, string-length($propertyType) - 1 )" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<!-- $areaWithPropertyType -->
	<xsl:variable name="areaWithPropertyType">
		<xsl:value-of select="concat( //areas/area[1]/name, ' ', $propertyType)" />
	</xsl:variable>

	<!-- $withBleed -->
	<xsl:variable name="withBleed" select="boolean( number( //output/@withBleed ) = 1 )" />

	<xsl:variable name="dims">
		<dims name="door-hanger" width="1275" height="3300" />
		<dims name="ipad-landscape" width="2160" height="1620" />
		<dims name="video" width="1980" height="1020" />
		<dims name="facebookstory" width="1080" height="1920" />
		<dims name="instagram-square" width="1080" height="1080" />
		<dims name="instagram-ad" width="1080" height="566" />
		<dims name="linkedin" width="736" height="1104" />
		<dims name="pinterest" width="1200" height="800" />
		<dims name="twitter" width="1200" height="675" />
		<dims name="letter" width="1458" height="1883" />
		<dims name="us-letter" width="850" height="1100" />
		<dims name="a4" width="827" height="1169" />
		<!-- For sizes going to print, values should be inches * 100, eg 11" x 6" = 1100 x 600 -->
		<!-- DO NOT CHANGE these values -->
		<dims name="postcard" width="1100" height="600" />

		<dims name="facebook-ad" width="555" height="555" />
		<dims name="facebook-post" width="555" height="555" />
		<dims name="facebook-video-ad" width="555" height="555" />
		<dims name="instagram-story" width="1080" height="1920" />
		<dims width="1200" height="628" />
	</xsl:variable>

	<xsl:variable name="assetSize">
		<xsl:value-of select="//output/@size" />
	</xsl:variable>

	<!-- Dims for print should always be "inches * 100" Thus a 0.125" bleed, adds 0.25" in total (* 100 = 25) -->

	<!-- $svgWidth -->
	<xsl:variable name="svgWidth">
		<xsl:choose>
			<xsl:when test="$withBleed">
				<xsl:choose>
					<xsl:when test="$dims/dims[@name=$assetSize]">
						<xsl:value-of select="number($dims/dims[@name=$assetSize]/@width) + 25" />

					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="number( $dims/dims[last()]/@width ) + 25" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="$dims/dims[@name=$assetSize]">
						<xsl:value-of select="number($dims/dims[@name=$assetSize]/@width)" />

					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="number( $dims/dims[last()]/@width )" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<!-- $svgHeight -->
	<xsl:variable name="svgHeight">
		<xsl:choose>
			<xsl:when test="$withBleed">
				<xsl:choose>
					<xsl:when test="$dims/dims[@name=$assetSize]">
						<xsl:value-of select="number($dims/dims[@name=$assetSize]/@height) + 25" />

					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="number( $dims/dims[last()]/@height ) + 25" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="$dims/dims[@name=$assetSize]">
						<xsl:value-of select="number($dims/dims[@name=$assetSize]/@height)" />

					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="number( $dims/dims[last()]/@height )" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<!-- $cropSize -->
	<xsl:variable name="cropSize">
		<xsl:choose>
			<xsl:when test="$withBleed=true()">
				<xsl:value-of select="number(12.5)" />
			</xsl:when >
			<xsl:otherwise>
				<xsl:value-of select="number(0)" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:variable name="renderMode" select="''" />

	<!-- $isFBAd -->
	<xsl:variable name="isFBAd">
		<xsl:choose>
			<xsl:when test="$svgWidth=555 and $svgHeight=555">
				<xsl:value-of select="'true'" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'false'" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<!-- $areaSlug -->
	<xsl:variable name="areaSlug">
		<xsl:call-template name="sanitize">
			<xsl:with-param name="value" select="//areas/area/name" />
		</xsl:call-template>
	</xsl:variable>

	<!-- $currentYear -->
	<xsl:variable name="currentYear">
		<xsl:value-of select="genie:format-date( //output/@reportDate, 'Y' )" />
	</xsl:variable>

	<!-- $buildVersion -->
	<xsl:variable name="buildVersion" select="//output/@version" />

	<!-- $today -->
	<xsl:variable name="today">
		<xsl:value-of select="genie:format-date( //output/@reportDate, 'm/d/Y' )" />
	</xsl:variable>

	<!-- $domNew -->
	<xsl:variable name="domNew" select="number(30)" />

	<!-- $soldListed -->
	<xsl:variable name="soldListed">
		<xsl:choose>
			<xsl:when test="//single/soldDate!=''">
				<xsl:value-of select="'Sold'" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'Listed'" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<!-- agentIWe -->
	<xsl:variable name="agentIWe">
		<xsl:choose>
			<xsl:when test="//agent[1]/pronoun='plural'">
				<xsl:value-of select="'we'" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'I'" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<!-- agentMeUs -->
	<xsl:variable name="agentMeUs">
		<xsl:choose>
			<xsl:when test="//agent[1]/pronoun='plural'">
				<xsl:value-of select="'us'" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'me'" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<!-- Logos -->
	<xsl:variable name="personalLogo">
		<xsl:choose>
			<xsl:when test="//output/@themeShade='Dark'">
				<xsl:value-of select="//agent[1]/personalLogoDark" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="//agent[1]/personalLogoLight" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:variable name="personalLogoInverse">
		<xsl:choose>
			<xsl:when test="//output/@themeShade='Dark'">
				<xsl:value-of select="//agent[1]/personalLogoLight" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="//agent[1]/personalLogoDark" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:variable name="companyLogo">
		<xsl:choose>
			<xsl:when test="//output/@themeShade='Dark'">
				<xsl:value-of select="//agent[1]/companyLogoDark" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="//agent[1]/companyLogoLight" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:variable name="companyLogoInverse">
		<xsl:choose>
			<xsl:when test="//output/@themeShade='Dark'">
				<xsl:value-of select="//agent[1]/companyLogoLight" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="//agent[1]/companyLogoDark" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<!-- $listingAddressLine1 -->
	<xsl:variable name="listingAddressLine1">
		<xsl:choose>
			<xsl:when test="//single/address/unitNumber!=''">
				<xsl:value-of select="concat(//single/address/streetNumber, ' ', //single/address/streetName, ' #',  //single/address/unitNumber)" />
			</xsl:when>
			<xsl:when test="//single/address/street!=''">
				<xsl:value-of select="//single/address/street" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="concat(//single/address/streetNumber, ' ', //single/address/streetName )" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<!-- $listingAddressLine2 -->
	<xsl:variable name="listingAddressLine2">
		<xsl:value-of select="concat(//single/address/city, ',&#160;', //single/address/state, '&#160;', //single/address/zip )" />
	</xsl:variable>

	<!-- $listingAddressHTML -->
	<xsl:variable name="listingAddressHTML">
		<xsl:value-of select="$listingAddressLine1" />
		<br />
		<span class="heading-font">
			<xsl:value-of select="$listingAddressLine2" />
		</span>
	</xsl:variable>

	<!-- $listingTotalBathrooms -->
	<xsl:variable name="listingTotalBathrooms">
		<xsl:choose>
			<xsl:when test="string(//single/bathrooms/@total)!=''">
				<xsl:value-of select="number(//single/bathrooms/@total)" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="number(concat('0', //single/bathrooms/@full ))+number(concat('0',//single/bathrooms/@half))" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<!-- Listing Switch Case -->
	<xsl:variable name="status-caption">
		<xsl:choose>
			<xsl:when test="number(//single/statusTypeID)=1">
				<xsl:value-of select="'Just Listed'" />
			</xsl:when>
			<xsl:when test="number(//single/statusTypeID)=2">
				<xsl:value-of select="'Just Sold'" />
			</xsl:when>
			<xsl:when test="number(//single/statusTypeID)=3 or number(//single/statusTypeID)=4 or number(//single/statusTypeID)=12">
				<xsl:value-of select="'In Escrow'" />
			</xsl:when>
			<xsl:when test="number(//single/statusTypeID)=14">
				<xsl:value-of select="'Coming Soon'" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'Expired'" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<!-- $listingStatusColor -->
	<xsl:variable name="listingStatusColor">
		<xsl:choose>
			<xsl:when test="number(//single/statusTypeID)=1">
				<xsl:value-of select="'var(--active-green)'" />
			</xsl:when>
			<xsl:when test="number(//single/statusTypeID)=2">
				<xsl:value-of select="'var(--sold-red)'" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'var(--pending-yellow)'" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<!-- $listingStatusCaption -->
	<xsl:variable name="listingStatusCaption">
		<xsl:choose>
			<xsl:when test="number(//single/statusTypeID)=1">
				<xsl:value-of select="'Active'" />
			</xsl:when>
			<xsl:when test="number(//single/statusTypeID)=2">
				<xsl:value-of select="'Sold'" />
			</xsl:when>
			<xsl:when test="number(//single/statusTypeID)=3 or number(//single/statusTypeID)=4 or number(//single/statusTypeID)=12">
				<xsl:value-of select="'Pending'" />
			</xsl:when>			
			<xsl:otherwise>
				<xsl:value-of select="'Other'" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:variable name="salePriceOrZero">
		<xsl:choose>
			<xsl:when test="//single/salePrice!=''">
				<xsl:value-of select="//single/salePrice" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="number(0)" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:variable name="listingPrice">
		<xsl:choose>
			<xsl:when test="number(//single/statusTypeID)=2 and //single/salePrice!=''">
				<xsl:call-template name="format-price">
					<xsl:with-param name="price" select="//single/salePrice" />
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="//single/highPrice!=''">
				<xsl:variable name="tmp1">
					<xsl:call-template name="format-price">
						<xsl:with-param name="price" select="//single/lowPrice" />
					</xsl:call-template>
				</xsl:variable>

				<xsl:variable name="tmp2">
					<xsl:call-template name="format-price">
						<xsl:with-param name="price" select="//single/highPrice" />
					</xsl:call-template>
				</xsl:variable>

				<xsl:value-of select="concat( $tmp1, ' - ', $tmp2 )" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="format-price">
					<xsl:with-param name="price" select="//single/price" />
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<!-- primaryImage -->
	<xsl:variable name="primaryImage">
		<xsl:call-template name="listing-image">
			<xsl:with-param name="index" select="number(1)" />
			<xsl:with-param name="preferPrimary" select="'true'" />
		</xsl:call-template>
	</xsl:variable>

	<!-- primaryImageNoDefault -->
	<xsl:variable name="primaryImageNoDefault">
		<xsl:call-template name="listing-image">
			<xsl:with-param name="index" select="number(1)" />
			<xsl:with-param name="preferPrimary" select="'true'" />
			<xsl:with-param name="skipDefault" select="'true'" />
		</xsl:call-template>
	</xsl:variable>

	<!-- Listing totals -->
	<xsl:variable name="listingsTotalNew" select="//listings/listing[@state='active' and number(@dom)&lt;=$domNew]" />
	<xsl:variable name="listingsTotalActive" select="//listings/listing[@state='active']" />
	<xsl:variable name="listingsTotalActiveNotNew" select="//listings/listing[@state='active' and number(@dom) &gt; $domNew]" />
	<xsl:variable name="listingsTotalPending" select="//listings/listing[@state='pending']" />
	<xsl:variable name="listingsTotalSold" select="//listings/listing[@state='sold']" />

	<!-- agent2LineAddress -->
	<xsl:variable name="agent2LineAddress">
		<xsl:choose>
			<xsl:when test="//agent[1]/address/address2!=''">
				<xsl:value-of select="'true'" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'false'" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<!-- marketingAboutWithBreaks -->
	<xsl:variable name="marketingAboutWithBreaks">
		<xsl:call-template name="break">
			<xsl:with-param name="text" select="//agent[1]/marketingAbout/text()" />

		</xsl:call-template>
	</xsl:variable>

	<!-- $requireDataAccess -->
	<xsl:variable name="requireDataAccess">
		<xsl:choose>
			<xsl:when test="1=1">
				<xsl:value-of select="'true'" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'false'" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:template name="listing-address-line-one">
		<xsl:value-of select="$listingAddressLine1" />
	</xsl:template>

	<xsl:template name="listing-address-line-two">
		<xsl:value-of select="$listingAddressLine2" />
	</xsl:template>

	<xsl:template name="lot-size">
		<xsl:choose>
			<xsl:when test="//single/lotSize castable as xs:double">
				<xsl:value-of select="format-number( //single/lotSize, '###,###')" />

			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="//single/lotSize" />

			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>