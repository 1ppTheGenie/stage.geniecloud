<?xml version="1.0"?>
<!--
	Asset Name:	Need Sell Before Ads
	Tags:		Social Marketing Ad
	Sizes:		Facebook, Postcard
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>

	<xsl:template name="svg-body">
		<g>
			<image x="0" y="10%" width="100%" height="12%" id="logo" preserveAspectRatio="xMidYMid meet">
				<xsl:attribute name="href">
					<xsl:value-of select="$companyLogo" />
				</xsl:attribute>
			</image>
			<g>
				<text x="50%" y="32%" class="center large" fill="var(--theme-body-color)" style=" font-weight:600;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'Need to Sell Before You Buy?'" />
						<xsl:with-param name="default" select="'Need to Sell Before You Buy?'" />
					</xsl:call-template>
				</text>
			</g>
			<g>
				<foreignObject x="15%" y="42%" width="70%" height="17%">
					<p style="color:var(--theme-body-color);-webkit-line-clamp:10; line-height:160%; text-align:center; font-size:120%; margin:0">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'Among our other seller solutions is the option to have us buy your home at market value through for cash within 7 days so you can buy your next home!'" />
							<xsl:with-param name="default" select="'Among our other seller solutions is the option to have us buy your home at market value through for cash within 7 days so you can buy your next home!'" />
						</xsl:call-template>
					</p>
				</foreignObject>
			</g>
			<g>
				<svg x="20%" y="2%"
					xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100">
					<line x1="0" y1="55" x2="10" y2="55" stroke="var(--theme-body-color)" stroke-width="0.5"></line>
				</svg>
			</g>
			<g>
				<foreignObject x="15%" y="62%" width="70%" height="17%">
					<p style="color:var(--theme-body-color);-webkit-line-clamp:10; line-height:160%; text-align:center; font-size:120%;margin:0">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'We can get your home sold without upfront prep work, showings and open houses and with a quick close and offer you cash to purchase with as long as you have equity in your home.'" />
							<xsl:with-param name="default" select="'We can get your home sold without upfront prep work, showings and open houses and with a quick close and offer you cash to purchase with as long as you have equity in your home.'" />
						</xsl:call-template>
					</p>
				</foreignObject>
			</g>
		</g>
		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>