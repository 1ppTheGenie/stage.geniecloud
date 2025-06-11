<?xml version="1.0"?>
<!--
	Asset Name:	Listing Ad 03
	Tags:		Social Marketing Ad
	Sizes:		Facebook Post, Facebook Ad, Instagram-Square
	Supports:	Listing
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />
<xsl:import href="genie-functions.xsl" />


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

<xsl:value-of select="substring-before(substring-after(//single/description, '.'), '.')" />
<xsl:value-of select="'Click the LEARN button: for photos, details, pricing and more'" />

		</xsl:if>

		<xsl:if test="number(//single/statusTypeID) = 2">
			<xsl:value-of select="concat('Sold for ', $listingPrice , ' OVER Listing Price in ' , //single/daysOnMarket, ' days on market!!')" />

<xsl:value-of select="'If you’re looking to sell, there is no question that your real estate team matters. Work with a team who has proven success in the Crest market.'" />

		</xsl:if>

		<xsl:if test="(number(//single/statusTypeID)=3) or (number(//single/statusTypeID)=4) or (number(//single/statusTypeID)=12)">
<xsl:value-of select="'Now Pending! If you’re looking to sell, there is no question that your real estate team matters. Work with a team who has proven success in the Crest market.'" />

		</xsl:if>

<xsl:value-of select="concat(' Call/Text:',//agent[1]/mobile , ' for all your Real Estate Needs')" />
<xsl:value-of select="concat('',//agent[1]/marketingName, ', ' , //agent[1]/marketingTitles)" />
<xsl:value-of select="concat('',//agent[1]/marketingLicense)" />

	</xsl:template>

	<xsl:template name="svg-body">
		<image x="0" y="0" width="100%" height="70%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="image-1" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

<rect stroke="var(--theme-body-color)" stroke-width="0" fill-opacity="1" x="5%" y="66%" width="90%" height="8%" />


		<text x="50%" y="70%" class="upper center middle" fill="var(--theme-body-background)" font-size="110%">
			<tspan>
				<xsl:choose>
					<xsl:when test="number(//single/statusTypeID) = 2">
<xsl:value-of select="concat( 'Just Sold! ', ' CLICK TO SEE MORE DETAILS' )" />

					</xsl:when>
					<xsl:when test="(number(//single/statusTypeID)=3) or (number(//single/statusTypeID)=4) or (number(//single/statusTypeID)=12)">
						<xsl:value-of select="concat( 'Entered Escrow Listed at ', genie:currency-format( number(//single/price), 2 ) )" />
					</xsl:when>
					<xsl:when test="number(//single/statusTypeID)=14">
						<xsl:value-of select="concat( 'COMING SOON', ' ')" />
					</xsl:when>
					<xsl:when test="number(//single/statusTypeID)=1">
						<xsl:value-of select="concat( 'For Sale at ', genie:currency-format( number(//single/price), 0 ) )" />
					</xsl:when>
				</xsl:choose>
			</tspan>
		</text>

		<text x="50%" y="76%" class="sub-heading center upper" fill="var(--theme-body-background)" style="font-weight:600;font-size:120%;" data-max-width="60%">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'listing-ad3-claim'" />
				<xsl:with-param name="default" select="concat( ' Top Producing ', //area/name , ' REALTOR ')" />
			</xsl:call-template>
		</text>

		<text x="50%" y="81.5%" class="upper center" style="font-weight:600;font-size:85%;">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'agentwebsite'" />
				<xsl:with-param name="default" select="//agent[1]/website" />
			</xsl:call-template>
		</text>

		<text x="50%" y="85.5%" class="upper center" style="font-weight:600;font-size:125%;">
<xsl:call-template name="listing-address-line-one" />

		</text>
		<text x="50%" y="90%" class="upper center" style="font-weight:600;font-size:125%;">
<xsl:call-template name="listing-address-line-two" />

		</text>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>