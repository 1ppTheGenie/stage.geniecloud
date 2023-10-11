<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">

	<xsl:preserve-space elements="*" />

	<xsl:template name="single-listing-header">

		<xsl:template name="social-button-caption">
			<div class="fa-button">
				<span data-msg="social-post" data-name="ctaButton">
					<xsl:value-of select="'Larn More'" />
				</span>
			</div>
		</xsl:template>

		<xsl:template name="social-caption">

			<xsl:if test="number(//single/statusTypeID) = 1">
<xsl:value-of select="concat('NEW TO MARKET in ', //area/name , ' &#124; This ' , //single/bedrooms/@count , ' BR, ', $listingTotalBathrooms, ' BA, ', $singularPropertyType , '  is it!' )" />

				<xsl:value-of select="substring-before(substring-after(//single/description, '.'), '.')"/>
				<xsl:value-of select="'Click the LEARN button: for photos, details, pricing and more'"/>
			</xsl:if>

			<xsl:if test="number(//single/statusTypeID) = 2">
				<xsl:value-of select="concat('Sold for ', $listingPrice , ' OVER Listing Price in ' , //single/daysOnMarket, ' days on market!!')" />

				<xsl:value-of select="'If you’re looking to sell, there is no question that your real estate team matters. Work with a team who has proven success in the Crest market.'"/>
			</xsl:if>

			<xsl:if test="(//single/statusTypeID=3) or (//single/statusTypeID=4) or (//single/statusTypeID=12)">
				<xsl:value-of select="'Now Pending! If you’re looking to sell, there is no question that your real estate team matters. Work with a team who has proven success in the Crest market.'"/>
			</xsl:if>

			<xsl:value-of select="concat(' Call/Text:',//agent[1]/mobile , ' for all your Real Estate Needs')"/>
			<xsl:value-of select="concat('',//agent[1]/marketingName, ', ' , //agent[1]/marketingTitles)"/>
			<xsl:value-of select="concat('',//agent[1]/marketingLicense)"/>

		</xsl:template>

		<xsl:template name="social-cta">
			<xsl:value-of select="'CLICK FOR DETAILS'" />
		</xsl:template>

		<xsl:template name="social-sub-title">
			<xsl:value-of select="'See photos, virtual tour and more'" />
		</xsl:template>
	</xsl:template>

	<xsl:template name="open-house-header">
		<xsl:template name="social-button-caption">
			<div class="fa-button">
				<span data-msg="social-post" data-name="ctaButton">
					<xsl:value-of select="'Larn More'" />
				</span>
			</div>
		</xsl:template>

		<xsl:template name="social-caption">

			<xsl:if test="count(//openHouse/session) &gt;= 1">

				<xsl:value-of select="concat('JOIN US ', //openHouse/session[1]/@dow, ', ', //openHouse/session[1]/@month, ' ', //openHouse/session[1]/@date, ' - ', //openHouse/session[1]/@starts, ' to ',//openHouse/session[1]/@ends, ' to see this ' , //single/bedrooms/@count , ' BR, ', $listingTotalBathrooms, ' BA, ', format-number(//single/squareFeet, '###,###'), ' SF ', //area/name, ' ' , $singularPropertyType, '. Located at: ', $listingAddressLine1, ', ' , $listingAddressLine2 )" />

			</xsl:if>

			<xsl:if test="count(//openHouse/session) &lt; 1">

				<xsl:value-of select="concat('JOIN US ','Saturday, July 9th - 1:00 PM to 4:00 PM to see this ' , //single/bedrooms/@count , ' BR, ', $listingTotalBathrooms, ' BA, ', format-number(//single/squareFeet, '###,###'), ' SF ', //area/name, ' ' , $singularPropertyType, '. Located at: ', $listingAddressLine1, ', ' , $listingAddressLine2 )" />

			</xsl:if>

			<text>
				<xsl:value-of select="' Click the LEARN button to access the full details and more.'"/>
			</text>

			<xsl:value-of select="concat(' Call/Text:',//agent[1]/mobile , ' for all your Real Estate Needs')"/>
			<xsl:value-of select="concat('',//agent[1]/marketingName, ', ' , //agent[1]/marketingTitles)"/>
			<xsl:value-of select="concat('',//agent[1]/marketingLicense)"/>

		</xsl:template>

		<xsl:template name="social-cta">
			<xsl:value-of select="'CLICK FOR DETAILS'" />
		</xsl:template>

		<xsl:template name="social-sub-title">
			<xsl:value-of select="'See photos, virtual tour and more'" />
		</xsl:template>
	</xsl:template>

</xsl:stylesheet>