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

		<xsl:if test="number(//single/statusTypeID) = 1">
			<xsl:value-of select="concat('NEW TO MARKET in ', //area/name , ' | This ' , //single/bedrooms/@count , ' BR, ', $listingTotalBathrooms, ' BA, ', format-number( //single/squareFeet, '###,###' ), ' SF ' , $singularPropertyType , ' is it! ' )" />
			<xsl:value-of select="substring-before(//single/description, '.')"/>
			<xsl:value-of select="'. Click the LEARN button: for photos, details, pricing and more.'"/>
		</xsl:if>

		<xsl:if test="number(//single/statusTypeID) = 2">
			<xsl:if test="(//single/salePrice - //single/salePrice) &lt;= 0 ">
				<xsl:value-of select="'JUST SOLD!! '" />
			</xsl:if>
			<xsl:if test="(//single/salePrice - //single/salePrice) &gt; 0 ">
				<xsl:value-of select="concat('Sold for ', $listingPrice , ' OVER Asking Price in ' , //single/daysOnMarket, ' days on market!! ')" />
			</xsl:if>
			<xsl:value-of select="concat('If you’re looking to sell, there is no question that your real estate team matters. Work with a team who has proven success in the ', //area/name , ' market.')"/>
		</xsl:if>

		<xsl:if test="(//single/statusTypeID=3) or (//single/statusTypeID=4) or (//single/statusTypeID=12)">
			<xsl:value-of select="concat('Now Pending! If you’re looking to sell, there is no question that your real estate team matters. Work with a team who has proven success in the ' ,  //area/name ,  ' market.')"/>
		</xsl:if>

		<xsl:text>&#xa;</xsl:text>
		<xsl:text>&#xa;</xsl:text>
		<xsl:value-of select="concat('Call/Text &#128241; ',//agent[1]/mobile , ' for all your Real Estate Needs') "/>

		<xsl:text>. &#xa;</xsl:text>
		<xsl:value-of select="//agent[1]/marketingName"/>
		<xsl:if test="//agent[1]/address/company">
			<xsl:value-of select="concat(', ',//agent[1]/address/company)"/>

		</xsl:if>
		<xsl:text>&#xa;</xsl:text>
		<xsl:value-of select="//agent[1]/marketingLicense"/>

	</xsl:template>

	<xsl:template name="social-cta">
		<xsl:value-of select="'CLICK FOR DETAILS'" />
	</xsl:template>

	<xsl:template name="social-sub-title">
		<xsl:value-of select="'See photos, virtual tour and more'" />
	</xsl:template>

</xsl:stylesheet>