<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">

	<xsl:template name="social-button-caption">
		<div class="fa-button">
			<span data-msg="social-post" data-name="ctaButton">
				<xsl:value-of select="'Learn More'" />
			</span>
		</div>
	</xsl:template>

	<xsl:template name="social-caption">
		<xsl:if test="count(//openHouse/session) &gt;= 1">
			<xsl:value-of select="concat('JOIN US ', //openHouse/session[1]/@dow, ', ', //openHouse/session[1]/@month, ' ', //openHouse/session[1]/@date, ' - ', //openHouse/session[1]/@starts, ' to ',//openHouse/session[1]/@ends, ' to see this ' , //single/bedrooms/@count , ' BR, ', $listingTotalBathrooms, ' BA, ', format-number(//single/squareFeet, '###,###'), ' SF ', //area/name, ' ' , $singularPropertyType, '. Located at: ', $listingAddressLine1, ', ' , $listingAddressLine2, '. ' )" />
		</xsl:if>

		<xsl:if test="count(//openHouse/session) &lt; 1">
			<xsl:value-of select="concat('JOIN US to see this ' , //single/bedrooms/@count , ' BR, ', $listingTotalBathrooms, ' BA, ', format-number(//single/squareFeet, '###,###'), ' SF ', //area/name, ' ' , $singularPropertyType, '. Located at: ', $listingAddressLine1, ', ' , $listingAddressLine2, '. ' )" />
		</xsl:if>

		<xsl:text>&#xa;</xsl:text>
		<xsl:text>&#xa;</xsl:text>

<xsl:value-of select="'Click the LEARN button to access the full details and more.'" />


		<xsl:text>&#xa;</xsl:text>
		<xsl:text>&#xa;</xsl:text>

<xsl:value-of select="concat('Call/Text &#128241; ',//agent[1]/mobile , ' for all your Real Estate Needs') " />


		<xsl:text>. &#xa;</xsl:text>
<xsl:value-of select="//agent[1]/marketingName" />

		<xsl:if test="//agent[1]/address/company">
<xsl:value-of select="concat(', ',//agent[1]/address/company)" />


		</xsl:if>
		<xsl:text>&#xa;</xsl:text>
<xsl:value-of select="//agent[1]/marketingLicense" />


	</xsl:template>

	<xsl:template name="social-cta">
		<xsl:value-of select="'CLICK FOR DETAILS'" />
	</xsl:template>

	<xsl:template name="social-sub-title">
		<xsl:value-of select="'See photos, virtual tour and more'" />
	</xsl:template>

</xsl:stylesheet>