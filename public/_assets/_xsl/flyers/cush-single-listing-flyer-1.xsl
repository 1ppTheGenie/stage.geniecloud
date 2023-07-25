<?xml version="1.0"?>
<!--
	Asset Name: Cush Single Listing Flyer 1
	Tags:		Direct Mail, Flyer
	Sizes:		Letter
	Supports:	Listing, Area
	Pages:		flyers/cush-single-listing-flyer-1,flyers/cush-single-listing-flyer-2
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="svg-body">
		<link rel="stylesheet">
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/gotham-embedded.css')"/>
		</link>

		<style>
			<xsl:value-of select="'
			foreignObject#description p {--description-line-limit:12 }
			font-weight-normal{ font-weight: 600 } 
			 .cush-flyer-header-part-1 {
                padding-right: 150px;
                transform: rotate(-38.1deg);
                -webkit-transform: rotate(-38.1deg);
                height: 1250px;
                position: absolute;
                left: -102px;
                top: -120px;
                width: 82%;
                overflow: hidden;
                border-right: 3px solid #fff;
                z-index: 12;
            }
            .cush-flyer-header-part-1>div{
                background-size: cover;
                background-position: center;
                -webkit-transform: rotate(38deg);
                position: absolute;
                top: 290px;
                left: 194px;
                width: 100%;
                height: 190px;
            }
	         :root{--theme-drk:#2c2f3e; }
		 	:root{ --theme-colr:#ffffff }
	        text{  font-family:&quot;Gotham&quot; }
			p, span, .text-white{
			    color:#fff;
			    font-family:&quot;Gotham&quot;;
			}'" />
		</style>

		<g>
			<rect x="0" y="0" width="100%" height="100%" fill="var(--theme-drk)"></rect>
			<svg viewBox="0 0 5500 5500" fill="#06213f" x="96.5%" y="-10%">
				<circle cx="30" cy="30" r="30"></circle>
			</svg>
			<image x="52%" y="9%" width="48%" height="25%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="id" select="'image-2'" />
					<xsl:with-param name="idx" select="2" />
				</xsl:call-template>
			</image>

			<svg class="background-shape" x="15.2%" y="12.2%">

				<polygon points="0,0 585,0 805,280 0,290" fill="var(--theme-drk)"/>
				<rect style="transform: rotate(321.4deg);" x="31%" y="22.5%" width="4px" height="19%" fill="white"></rect>
			</svg>
			<text x="5%" y="18%" font-size="30px" class="gotham" font-weight="400" style="line-height:7%;" fill="#edaa2a">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'marketreport'" />
						<xsl:with-param name="default" select="'OFFERED AT '" />
					</xsl:call-template>
				</tspan>
				<tspan class="super-bold">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'marketreport'" />
						<xsl:with-param name="default" select="$listingPrice" />
					</xsl:call-template>
				</tspan>
			</text>

			<text x="5%" y="20%" font-size="30px" font-family="var(--theme-body-font)" fill="var(--theme-colr)" style="line-height:7%; font-weight:500;">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'marketreport'" />
						<xsl:with-param name="default" select="'Spectacular Craftsman in the blossoming '" />
					</xsl:call-template>
				</tspan>
				<tspan x="5%" dy="2.3%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'marketreport'" />
						<xsl:with-param name="default" select="'Crocker Highlands/Trestle Glen neighborhood!'" />
					</xsl:call-template>
				</tspan>
			</text>

			<text x="96%" y="5%" font-size="35px" class="align-right gotham" style="line-height:7%;" fill="#edaa2a">
				<tspan class="bold">
					<xsl:value-of select="concat(//single/address/street, ' &#183; ')" />
				</tspan>
				<tspan class="upper">
					<xsl:value-of select="//single/address/city" />
				</tspan>
			</text>

			<!-- SECTION-1 TEXT END-->
			<image x="0%" y="27%" width="100%" height="33%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="id" select="'image-3'" />
					<xsl:with-param name="idx" select="3" />
				</xsl:call-template>
			</image>
			<rect x="0%" y="56.1%" width="100%" height="4%" fill="#000" fill-opacity="60%"/>
			<text x="95%" y="56.8%" class="align-right" font-size="46px" font-family="var(--theme-body-font)" style="line-height:7%;letter-spacing:4px;" fill="#edaa2a">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'marketreport'" />
					<xsl:with-param name="default" select="'CUSHREALESTATE.COM'" />
				</xsl:call-template>
			</text>

			<foreignObject x="5%" y="60%" width="70%" height="25%">
				<p style="color:var(theme-colr);-webkit-line-clamp:11;font-size:140%;line-height: 135%;text-align:justify;">
					<xsl:call-template name="listing-description"/>
				</p>
			</foreignObject>

			<text x="78.5%" y="67%" class="bold" font-size="93px" fill="var(--theme-colr)">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'bedroomscount'" />
					<xsl:with-param name="default" select="//single/bedrooms/@count" />
				</xsl:call-template>
			</text>

			<text x="85%" y="71.7%" class="bold" style="writing-mode: vertical-rl;direction: rtl;" font-size="28.8px" fill="var(--theme-colr)">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'bedroomscount'" />
					<!-- <xsl:with-param name="default" select="//single/bedrooms/@count" /> -->
					<xsl:with-param name="default" select="'BEDS'" />
				</xsl:call-template>
			</text>

			<text x="86%" y="67%" class="bold" font-size="93px" fill="var(--theme-colr)">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'bedroomscount'" />
					<xsl:with-param name="default" select="//single/bathrooms/@full" />
				</xsl:call-template>
			</text>

			<text x="90%" y="67.1%" class="bold" font-size="50px" fill="var(--theme-colr)">
				<xsl:if test="//single/bathrooms/@half != ''">
					<xsl:value-of select="'&#xBD;'" />
				</xsl:if>
			</text>

			<xsl:if test="//single/bathrooms/@half != ''">
				<text x="95.5%" y="71.7%" class="bold" style="writing-mode: vertical-rl;direction: rtl;" font-size="24px" fill="var(--theme-colr)">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'bedroomscount'" />
						<!-- <xsl:with-param name="default" select="//single/bedrooms/@count" /> -->
						<xsl:with-param name="default" select="'BATHS'" />
					</xsl:call-template>
				</text>
			</xsl:if>

			<xsl:if test="//single/bathrooms/@half = ''">
				<text x="92%" y="71.7%" class="bold" style="writing-mode: vertical-rl;direction: rtl;" font-size="24px" fill="var(--theme-colr)">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'bedroomscount'" />
						<!-- <xsl:with-param name="default" select="//single/bedrooms/@count" /> -->
						<xsl:with-param name="default" select="'BATHS'" />
					</xsl:call-template>
				</text>
			</xsl:if>

			<text class="" x="77%" y="73%" style="font-size:180%;" fill="var(--theme-colr)">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'bedroomscount'" />
						<xsl:with-param name="default" select="concat( ' Beds: ', //single/bedrooms/@count)" />
					</xsl:call-template>
				</tspan>
			</text>

			<text class="" x="77%" y="75%" style="font-size:180%;" fill="var(--theme-colr)">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'bedroomscount'" />
						<xsl:with-param name="default" select="concat( ' Baths: ', $listingTotalBathrooms)" />
					</xsl:call-template>
				</tspan>
			</text>

			<text class="" x="77%" y="77%" style="font-size:180%;" fill="var(--theme-colr)">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'bedroomscount'" />
						<xsl:with-param name="default" select="concat( ' Sq. Ft.: ', format-number( //single/squareFeet, '###,###' ) )" />
					</xsl:call-template>
				</tspan>
			</text>

			<svg x="0%" y="85%" width="100%" height="100%">
				<!-- <image x="5%" y="0" width="17%" height="13%" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						 <xsl:value-of select="$personalLogo" />
					</xsl:attribute>
				</image> -->
				<image x="5%" y="5%" width="35%" height="10%" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/cush-new-logo.png' )" />
					</xsl:attribute>
				</image>

				<text x="75%" y="0" class="bold align-right" fill="var(--theme-colr)" style="font-size: 150%;" data-max-width="20%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentname'" />
						<!-- <xsl:with-param name="default" select="concat( //agent[1]/marketingName, '&#160;')" /> -->
						<xsl:with-param name="default" select="'DAVID J. HIGGINS'" />
					</xsl:call-template>
				</text>

				<text x="75%" y="1.8%" class=" align-right" fill="#94949d" style="font-size: 140%;" data-max-width="20%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentname'" />
						<!-- <xsl:with-param name="default" select="concat( //agent[1]/marketingName, '&#160;')" /> -->
						<xsl:with-param name="default" select="'FOUNDER &amp; REALTOR'" />
					</xsl:call-template>
				</text>

				<text x="75%" y="3.4%" class="align-right" fill="#94949d" style="font-size: 125%;" data-max-width="20%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'licenseno'" />
						<!-- <xsl:with-param name="default" select="//agent[1]/marketingLicense" /> -->
						<xsl:with-param name="default" select="'DRE# 01281543'" />
					</xsl:call-template>
				</text>

				<text x="75%" y="5.3%" class="bold align-right" fill="var(--theme-colr)" style="font-size: 150%;" data-max-width="20%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentname'" />
						<!-- <xsl:with-param name="default" select="concat( //agent[1]/marketingName, '&#160;')" /> -->
						<xsl:with-param name="default" select="'ERIKA VEXLER'" />
					</xsl:call-template>
				</text>

				<text x="75%" y="6.9%" class="align-right" fill="#94949d" style="font-size: 140%;" data-max-width="20%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentname'" />
						<!-- <xsl:with-param name="default" select="concat( //agent[1]/marketingName, '&#160;')" /> -->
						<xsl:with-param name="default" select="'REALTOR'" />
					</xsl:call-template>
				</text>

				<text x="75%" y="8.8%" class=" align-right" fill="#94949d" style="font-size: 125%;" data-max-width="20%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'licenseno'" />
						<!-- <xsl:with-param name="default" select="//agent[1]/marketingLicense" /> -->
						<xsl:with-param name="default" select="'DRE# 02088913'" />
					</xsl:call-template>
				</text>

				<text x="75%" y="11.2%" class=" align-right" fill="#fff" style="font-size: 140%;dominant-baseline: middle;" data-max-width="25%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentwebsite'" />
						<xsl:with-param name="default" select="'HELLO@CUSHREALESTATE.COM'" />
					</xsl:call-template>
				</text>

				<text x="75%" y="13.2%" class=" align-right" fill="#cd9e4f" style="font-size: 145%;dominant-baseline: middle;" data-max-width="25%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentmobile'" />
						<xsl:with-param name="default" select="//agent[1]/mobile" />
					</xsl:call-template>
				</text>
			</svg>

			<image x="75%" y="82%" width="24%" height="19%" preserveAspectRatio="xMidYMid meet">
				<xsl:attribute name="href">
					<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/cush-user-img.png' )" />
				</xsl:attribute>
			</image>
		</g>
		<!-- <svg class="background-shape" x="21%" y="19.7%">
			
		<polygon points="0,0 606,0 816,250 0,250" fill="#074360"/>
		  <rect style="transform: rotate(321deg);" x="32.2%" y="22.5%" width=".4%" height="15.2%" fill="white"></rect>
            </svg> -->

		<xsl:variable name="primaryPhoto">
			<xsl:value-of select="//single/photoPrimary" />
		</xsl:variable>
		<foreignObject x="0" y="0" width="70%" height="25%">
			<div class="cush-flyer-header-part-1">

				<!-- <div style="background-image:url(https://cdnparap30.paragonrels.com/ParagonImages/Property/P3/MAXEBRDI/40969663/1/0/0/556791446fc48871db57e48ae2514b9f/107/ee6632370f7326c2844a959726c67b8c/40969663-1.JPG)" alt=""></div> -->

				<div style="background-image:url({$primaryPhoto})" alt=""></div>
			</div>
		</foreignObject>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>