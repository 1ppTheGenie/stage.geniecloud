<?xml version="1.0"?>
<!-- 
	Asset Name: Cush Single Listing Flyer 2
	Tags:		Direct Mail, Flyer
	Sizes:		Letter
	Supports:	Listing, Area
	Pages:		flyers/cush-single-listing-flyer-1,flyers/cush-single-listing-flyer-2
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<link rel="stylesheet">
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/gotham-embedded.css')" />

		</link>

		<style>
			<xsl:value-of select="'
	        :root{
    		    --theme-color:#2c2f3e
    			--theme-colr:#fff;
			}
			foreignObject#description p {
				--description-line-limit:12;
			}
			
			text{ font-family:&quot;Gotham&quot;; }
		
			p, span, .text-white{
			    color:#fff;
			    font-family:&quot;Gotham&quot;;			    
			}
'" />
		</style>

		<rect x="0" y="0" width="100%" height="100%" fill="var(--theme-color)"></rect>

		<g>
			<image x="51.5%" y="7.7%" width="48.5%" height="19%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="id" select="'image-7'" />
					<xsl:with-param name="idx" select="7" />
				</xsl:call-template>
			</image>

			<svg class="background-shape">
				<polygon points="0,0 600,0 1095,500 0,500" fill="var(--theme-color)" />
				<rect style="transform: rotate(315deg);" x="29%" y="22.5%" width=".2%" height="38%" fill="white"></rect>
			</svg>

			<image x="0%" y="22.5%" width="50%" height="30%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="id" select="'image-8'" />
					<xsl:with-param name="idx" select="8" />
				</xsl:call-template>
			</image>
			<image x="50%" y="22.5%" width="50%" height="30%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="id" select="'image-9'" />
					<xsl:with-param name="idx" select="9" />
				</xsl:call-template>
			</image>
			<!-- SECTION-1 TEXT -->
			<svg viewBox="0 0 5500 5500" fill="#fff" x="96.5%" y="-10%">
				<circle cx="50" cy="50" r="50" />

			</svg>
			<text x="97%" y="4.5%" font-size="35px" data-max-width="30%" class="align-right bold" style="line-height:7%;letter-spacing:4px;" fill="#edaa2a">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'marketreport'" />
						<xsl:with-param name="default" select="'3560 Brunell Drive'" />
					</xsl:call-template>
				</tspan>
				<tspan dy="-2%" font-size="75px">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'marketreport'" />
						<xsl:with-param name="default" select="'.'" />
					</xsl:call-template>
				</tspan>
				<tspan dy="2%" style="font-weight: 400;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'marketreport'" />
						<xsl:with-param name="default" select="'OAKLAND'" />
					</xsl:call-template>
				</tspan>
			</text>
			<text x="30%" y="19.1%" font-size="35px" style="line-height:7%;letter-spacing:4px;" fill="#edaa2a">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'marketreport'" />
						<xsl:with-param name="default" select="'CUSHREALESTATE.COM'" />
					</xsl:call-template>
				</tspan>
			</text>

			<foreignObject x="5%" y="3%" width="45%" height="21%" style="font-size:100%;">
				<xsl:for-each select="//features/feature">
					<xsl:if test="position() &lt;= 5">

						<p style="line-height:130%; margin:1.5% 0;font-size:151%; position:relative; padding-left:14px;">
							<span style="position:absolute; top:0; left:0;">-</span>
							<span style="font-weight:500;">
								<xsl:value-of select="@category" />
							</span>
							<span>
								<xsl:text>: </xsl:text>
								<xsl:value-of select="@description" />
							</span>
						</p>
					</xsl:if>
				</xsl:for-each>
			</foreignObject>

			<!-- SECTION-1 TEXT -->

			<image x="6%" y="55%" width="22%" height="14%" preserveAspectRatio="xMidYMid meet">
				<xsl:attribute name="href">
					<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/tour-img.png' )" />
				</xsl:attribute>
			</image>
			<text x="35%" y="55.5%" class="bold text-white" font-size="30px" style="line-height:7%;letter-spacing:0px;" fill="var(--theme-colr)">
				<tspan >
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'marketreport'" />
						<xsl:with-param name="default" select="'Tour properties online in 3D'" />
					</xsl:call-template>
				</tspan>
				<tspan x="34.4%" dy="2.5%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'marketreport'" />
						<xsl:with-param name="default" select="' with Cush Virtual Reality Glasses'" />
					</xsl:call-template>
				</tspan>
			</text>

			<text x="34.8%" y="60.5%" class="text-white" style="line-height:7%;" font-size="187%" fill="var(--theme-colr)">
				<tspan x="35%" dy="2%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'marketreport'" />
						<xsl:with-param name="default" select="'- Tour Cush properties efficiently from the comforts'" />
					</xsl:call-template>
				</tspan>
				<tspan x="34.4%" dy="2%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'marketreport'" />
						<xsl:with-param name="default" select="' - View the entire home... look out windows, open doors'" />
					</xsl:call-template>
				</tspan>
				<tspan x="34.4%" dy="2%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'marketreport'" />
						<xsl:with-param name="default" select="' - Fly over a 3-D floor plan with a bird’s-eye view'" />
					</xsl:call-template>
				</tspan>
			</text>

			<rect xmlns="" x="0%" y="71.5%" width="36%" height="1" stroke="white"></rect>

			<text x="5%" y="73%" font-size="30px" class="bold" font-family="var(--theme-body-font)" style="line-height:7%;letter-spacing:0px;" fill="var(--theme-colr)">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'marketreport'" />
						<xsl:with-param name="default" select="' Stay ahead of the market 24/7 '" />
					</xsl:call-template>
				</tspan>
				<tspan x="5%" dy="2%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'marketreport'" />
						<xsl:with-param name="default" select="'Download our App today! '" />
					</xsl:call-template>
				</tspan>
			</text>

			<text x="40%" y="97%" class="upper" fill="#edaa2a" font-family="var(--theme-body-font)" style="line-height:7%;letter-spacing:4px;">
				<tspan font-size="21px" class="bold">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'marketreport'" />
						<xsl:with-param name="default" select="'CUSHREALESTATE.COM '" />
					</xsl:call-template>
				</tspan>
			</text>
			<image x="38%" y="74%" width="11%" height="5%" preserveAspectRatio="xMidYMid meet">
				<xsl:attribute name="href">
					<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/app-store.png' )" />
				</xsl:attribute>
			</image>
			<image x="50.5%" y="74%" width="11%" height="5%" preserveAspectRatio="xMidYMid meet">
				<xsl:attribute name="href">
					<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/anroid-store.png' )" />
				</xsl:attribute>
			</image>
			<image x="65%" y="74.5%" width="30%" height="30%" preserveAspectRatio="xMidYMid meet">
				<xsl:attribute name="href">
					<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/mobile-img2.png' )" />
				</xsl:attribute>
			</image>

			<image x="5%" y="91%" width="30%" height="10%" preserveAspectRatio="xMidYMid meet">
				<xsl:attribute name="href">
					<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/cush-logo.png' )" />
				</xsl:attribute>
			</image>
			<rect x="29.4%" y="92.5%" width="36%" height="1" stroke="white"></rect>
			<foreignObject x="5%" y="78%" width="57%" height="13%">
				<p style="color:var(--theme-colr);-webkit-line-clamp:5;font-size:160%;line-height: 148%;text-align:justify;">
					<xsl:call-template name="listing-description" />

				</p>
			</foreignObject>
		</g>
		<!-- <xsl:call-template name="copyright" /> -->
	</xsl:template>
</xsl:stylesheet>