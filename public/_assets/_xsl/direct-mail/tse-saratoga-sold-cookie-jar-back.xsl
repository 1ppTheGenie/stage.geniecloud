<?xml version="1.0"?>
<!--
	Asset Name: TSE Saratoga SOLD Cookie Jar
	Tags: 		Direct Mail
	Sizes:		Postcard
Supports:	Area, Print, Listing, QRCode
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
<rect x="63.5%" y="0%" width="36.5%" height="100%" fill="#fff" />
<rect x="43.5%" y="0%" width="20%" height="100%" fill="#f6f6f6" />
<rect x="0%" y="80%" width="63.5%" height="20%" fill="#434c50" />


		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<link rel="stylesheet">
<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/premium-ultra.css')" />

		</link>
		<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;500;600;700;800" />

		<style>
<xsl:value-of select="'	.open-sans{ font-family: &quot;Open Sans&quot;, sans-serif !important; }'" />

		</style>

		<xsl:variable name="textSize">
			<xsl:choose>
				<xsl:when test="number(//output/@withBleed)=1">
					<xsl:value-of select="'15.5px'" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'15px'" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<g style="transform:translate(45.2%, 55.5%)">
			<xsl:call-template name="qr-code">
				<xsl:with-param name="width" select="'11.5%'" />
				<xsl:with-param name="height" select="'19.5%'" />
			</xsl:call-template>
		</g>
		<image x="57.5%" y="57.5%" width="4.5%" height="16%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/mobile_qr_code.png' )" />
			</xsl:attribute>
		</image>

		<svg x="42.5%" y="0%" fill="#434c50" width="22%" height="22%" version="3.0" id="Layer_1"
			xmlns="http://www.w3.org/2000/svg"
			xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 472.615 472.615" style="enable-background:new 0 0 472.615 472.615;" xml:space="preserve">
			<g>
<polygon points="332.955,266.833 332.955,0 139.662,0 139.662,266.833 30.525,266.833 236.308,472.615 442.09,266.833 		" />

			</g>
		</svg>

		<foreignObject width="18%" height="18%" x="44.5%" y="26%" style="">
			<p class="upper open-sans" style="margin: 0;font-size:125%;color:#fdb913;font-weight:800;">
				<span>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'curious'" />
						<xsl:with-param name="default" select="'CURIOUS ABOUT HOW YOUR '" />
					</xsl:call-template>
				</span>
				<span>
					<xsl:call-template name="property-type-caption">
						<xsl:with-param name="short" select="'true'" />
						<xsl:with-param name="singular" select="'true'" />
					</xsl:call-template>
				</span>
				<span>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'curious'" />
						<xsl:with-param name="default" select="' COMPARES?'" />
					</xsl:call-template>
				</span>
			</p>
		</foreignObject>

		<foreignObject width="18%" height="18%" x="44.5%" y="41%" style="">
			<p class="open-sans" style="margin: 0;font-size:94%;color:#434c50;font-weight:400;">
				<span>
					<xsl:choose>
						<xsl:when test="(number(//single/statusTypeID)=3) or (number(//single/statusTypeID)=4) or (number(//single/statusTypeID)=12)">
							<xsl:value-of select="'In Escrow '" />
						</xsl:when>
						<xsl:when test="number(//single/statusTypeID)=2">
							<xsl:value-of select="'I just sold '" />
						</xsl:when>
						<xsl:when test="number(//single/statusTypeID)=14">
							<xsl:value-of select="'Coming Soon '" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'I just listed '" />
						</xsl:otherwise>
					</xsl:choose>
				</span>
				<span class="bold">
<xsl:call-template name="listing-address-line-one" />

				</span>
				<span>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'scanqr'" />
						<xsl:with-param name="default" select="'. Scan the QR code for the details.'" />
					</xsl:call-template>
				</span>
			</p>
		</foreignObject>

		<text x="15%" y="83.5%">
			<tspan font-size="165%" class="upper open-sans" fill="#fff" style="letter-spacing:4px;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentname'" />
					<xsl:with-param name="default" select="concat( //agent[1]/marketingName,'')" />
				</xsl:call-template>
			</tspan>
			<tspan dx="2.5%" dy="-2%" fill="#bec0c2" style="font-size:240%;font-weight:600;" class="open-sans ">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentmobile'" />
					<xsl:with-param name="default" select="//agent[1]/mobile" />
				</xsl:call-template>
			</tspan>
		</text>

		<foreignObject width="47%" height="10%" x="15%" y="89.5%" style="">
			<p class="open-sans" style="margin:0;font-size:125%;color:#fdb913;font-weight:700;">
				<span>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'areaname'" />
						<xsl:with-param name="default" select="concat( '#1 ', //area/name , ' AGENT ' )" />
					</xsl:call-template>
				</span>
				<span style="border-left: 2px solid #fdb913;padding-left:10px;margin-left:10px;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'dates'" />
						<xsl:with-param name="default" select="concat( ' 2018 - 2019 - 2020 - 2021 - 2022' , '' )" />
					</xsl:call-template>
				</span>
			</p>
		</foreignObject>

		<image x="65.5%" y="2%" width="20%" height="8%" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="$personalLogo" />
			</xsl:attribute>
		</image>
		<image x="81%" y="11%" width="10%" height="8%" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="$companyLogo" />
			</xsl:attribute>
		</image>
		<text x="65.5%" y="12%" class="small" fill="#000" style="font-weight:500;font-size:100%;">
			<tspan >
				<xsl:value-of select="//agent[1]/address/street" />

				<xsl:text>,</xsl:text>
			</tspan>
			<tspan x="65.5%" dy="3%">
				<xsl:value-of select="//agent[1]/address/city" />

				<xsl:text>, </xsl:text>
				<xsl:value-of select="//agent[1]/address/state" />

				<xsl:text>&#160;</xsl:text>
				<xsl:value-of select="//agent[1]/address/zip" />
			</tspan>
		</text>
<rect x="65.5%" y="21.5%" width="32%" height="0.1%" fill="#434c50" />

		<text x="81.5%" y="22.5%" class="small center open-sans" fill="#000" style="font-weight:400;font-size:40%;font-style: italic;">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'homealready'" />
				<xsl:with-param name="default" select="'If your home is already listed with a real estate agent, this is not a solicitation to list your home.'" />
			</xsl:call-template>
		</text>

		<foreignObject width="41%" height="80%" x="1.5%" y="5%">
			<xsl:attribute name="style">
				<xsl:value-of select="concat('font-size:' , $textSize )" />
			</xsl:attribute>
			<p class="premiumultra-font" style="color:#3c60bc;margin: 0 0 6px 0;font-size:89%;font-weight:700;display: block;padding:0 2px;">
				<span>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'home'" />
						<xsl:with-param name="default" select="'&#160;'" />
					</xsl:call-template>
				</span>
			</p>

			<p class="premiumultra-font" style="color:#3c60bc;margin: 0 0 6px 0;font-size:89%;font-weight:700;display: block;padding:0 2px;">
				<span>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'home'" />
						<xsl:with-param name="default" select="concat( 'Selling a home for the prices currently being seen in the ', //area/name , ' market could feel a bit like getting caught with your hand in the proverbial cookie jar. But rest assured, they are your cookies and you deserve EVERY ONE OF THEM!' )" />
					</xsl:call-template>
				</span>
			</p>
			<p class="premiumultra-font" style="color:#3c60bc;margin: 0 0 6px 0;font-size:89%;font-weight:700;display: block;padding:0 2px;">
				<span>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'scanqr'" />
						<xsl:with-param name="default" select="concat( 'I’m writing today to share that I’ve sold another home in the ', //area/name , ' for a record price and that the market is indeed moving very fast. I received multiple offers for qualified buyers and all but one missed their opportunity to buy this home. That’s where you come in.' )" />
					</xsl:call-template>
				</span>
			</p>
			<p class="premiumultra-font" style="color:#3c60bc;margin: 0 0 6px 0;font-size:89%;font-weight:700;display: block;padding:0 2px;">
				<span>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'scanqr'" />
						<xsl:with-param name="default" select="'If you are considering a move I may be able to put a very lucrative deal together without you even having to go live on the market. I an seeing quick closers, lots of cash, and months of rent backs to aid sellers in finding a new home of their own. I am able to create very favourable terms for selling to make your move much more comfortable. Maybe you’re worried about having too much clutter laying around, or your home needing repairs or staging? Please let me handle all of those concerns. I am here to serve you and make your move happen on your terms. Just give me a call, or shoot me a text.'" />
					</xsl:call-template>
				</span>
			</p>
			<p class="premiumultra-font center" style="color:#3c60bc;margin: 0 0 6px 80px;font-size:89%;font-weight:700;display: block;padding:0 2px;">
				<span>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'warm'" />
						<xsl:with-param name="default" select="'Warm Regards,'" />
					</xsl:call-template>
				</span>
			</p>
		</foreignObject>

		<text x="42%" y="3.3%" class="premiumultra-font bold align-right" fill="#3c60bc" style="font-size:83%;font-weight:700;">
			<xsl:value-of select="genie:format-date( //output/@reportDate, '[MNn] [Y0001]')" />
		</text>

		<image x="1%" y="73%" width="13%" height="27%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:value-of select="//agent[1]/photo" />
			</xsl:attribute>
		</image>
		<image x="32%" y="74%" width="8%" height="8%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/andy-sign.png' )" />
			</xsl:attribute>
		</image>

		<xsl:call-template name="copyright">
			<xsl:with-param name="disclaimer" select="'direct-mail'" />
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>
