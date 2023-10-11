<?xml version="1.0"?>
<!--
	Asset Name:	LC-OH-POST-02
	Tags:		Social Marketing Ad
	Sizes:		Facebook Ad, Instagram, LinkedIn
	Supports:	Open House, Listing, Area
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />


	<xsl:template name="svg-body">
		<image x="0.5%" y="0.5%" width="49.25%" height="49.25%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<image x="50.25%" y="0.5%" width="49.25%" height="49.25%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="2" />
			</xsl:call-template>
		</image>

		<image x="0.5%" y="50.25%" width="49.25%" height="49.25%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="3" />
			</xsl:call-template>
		</image>

		<image x="50.25%" y="50.25%" width="49.25%" height="49.25%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="4" />
			</xsl:call-template>
		</image>

		<rect x="10%" y="30%" width="80%" height="40%" fill="var(--theme-body-background)" fill-opacity="80%" />

		<text x="50%" y="30.5%" class="upper heading" text-anchor="middle" font-size="250%" letter-spacing="2" font-weight="600">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'you-are-invited'" />
				<xsl:with-param name="default" select="'You’re Invited'" />
			</xsl:call-template>
		</text>

		<text x="50%" y="37.5%" class="upper heading" text-anchor="middle" font-size="220%" letter-spacing="2" font-weight="400">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'openhouse'" />
				<xsl:with-param name="default" select="'Open House'" />
			</xsl:call-template>
		</text>

		<xsl:choose>
			<!-- Open House Example -->
			<xsl:when test="count(//openHouse/session) = 1">
				<rect x="12.5%" y="46%" width="75%" height="10%" fill="var(--theme-body-color)" />
				<text x="50%" y="51%" class="center middle bold" font-size="100%" font-family="var(--theme-sub-heading-font)" fill="var(--theme-body-background)">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'open-date-01'" />
						<xsl:with-param name="default" select="concat( //openHouse/session[1]/@dow, ', ', //openHouse/session[1]/@month, ' ', //openHouse/session[1]/@date, ' - ', //openHouse/session[1]/@starts, ' to ',//openHouse/session[1]/@ends)" />
					</xsl:call-template>
				</text>
			</xsl:when>
			<xsl:when test="count(//openHouse/session) &gt; 1">
				<rect x="20%" y="45%" width="60%" height="10%" fill="var(--theme-body-color)" />
				<text x="50%" y="47.5%" class="sub-heading center middle bold" font-size="115%" fill="var(--theme-body-background)">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'open-date-01'" />
						<xsl:with-param name="default" select="concat( //openHouse/session[1]/@dow, ', ', //openHouse/session[1]/@month, ' ', //openHouse/session[1]/@date, ' - ', //openHouse/session[1]/@starts, ' to ',//openHouse/session[1]/@ends)" />
					</xsl:call-template>
				</text>
				<text x="50%" y="52.5%" class="sub-heading center middle bold" font-size="115%" fill="var(--theme-body-background)">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'open-date-02'" />
						<xsl:with-param name="default" select="concat( //openHouse/session[2]/@dow, ', ', //openHouse/session[2]/@month, ' ', //openHouse/session[2]/@date, ' - ', //openHouse/session[2]/@starts, ' to ',//openHouse/session[2]/@ends)" />
					</xsl:call-template>
				</text>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>

		<text x="50%" y="57.5%" class="large medium upper center" fill="var(--theme-heading-color)" font-size="120%" font-weight="600" data-max-width="40%">
<xsl:call-template name="listing-address-line-one" />

		</text>
		<text x="50%" y="63.5%" class="large medium center" fill="var(--theme-heading-color)" font-size="120%" font-weight="600" data-max-width="50%">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'areanmae'" />
				<xsl:with-param name="default" select="concat( 'in ', upper-case(//area/name) )" />
			</xsl:call-template>
		</text>
	</xsl:template>
</xsl:stylesheet>