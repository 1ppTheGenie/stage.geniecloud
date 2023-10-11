<?xml version="1.0"?>
<!--
	Asset Name: Tracy Phillips Qr Code Postage Side
	Tags: 		Direct Mail
	Sizes:		Postcard
	Supports:	Area, Print, Listing, QRCode
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<link rel="stylesheet" type="text/css">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_css/trecy-font.css' )" />
			</xsl:attribute>
		</link>
		<link rel="stylesheet">
<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/compass-sans.css')" />

		</link>
		<link rel="stylesheet">
<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/compass-serif.css')" />

		</link>
		<link rel="stylesheet">
<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/gotham-embedded.css')" />

		</link>

		<style>
<xsl:value-of select="'text {dominant-baseline: middle;}'" />

		</style>

		<rect x="0" y="0" width="100%" height="100%" fill="#fff" />
		<rect x="0" y="0" width="50%" height="60%" fill="#000" />

		<image x="51%" y="20%" width="100%" height="40%" preserveAspectRatio="xMinYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/light-grey-swirl-background.jpg' )" />
			</xsl:attribute>
		</image>
		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">

		<g style="transform:translate(45.2%, 55.5%)">
			<xsl:call-template name="qr-code">
				<xsl:with-param name="width" select="'11.5%'" />
				<xsl:with-param name="height" select="'19.5%'" />
			</xsl:call-template>
		</g>

		<text x="25%" y="7%" class="center bold serif" style="font-size:255%; fill:white;" data-max-width="38%">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'Tracy’s'" />

				<xsl:with-param name="default" select="concat('Tracy Sells ', //area/name, '!' )" />
			</xsl:call-template>
		</text>
		<text x="25%" y="14%" class="center sans" style="font-size: 130%;letter-spacing: 2px;font-weight: 600;fill:white;">
			<tspan>
<xsl:value-of select="format-number(//statistics/@soldPropertyTypeCount, '###,###')" />

			</tspan>
			<tspan>
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'Selling'" />
					<xsl:with-param name="default" select="' SOLD ON THE SAME STREET'" />
				</xsl:call-template>
			</tspan>
		</text>

		<line stroke="#ffffff" stroke-width="0.2%" x1="16%" x2="33%" y1="20%" y2="20%" height="50%" />
		<foreignObject width="40%" height="18%" x="5%" y="24%" class="center upper sans">
			<p style="margin:0;color:#fff;font-size:135%;font-weight:600;line-height: 140%;  letter-spacing: 3px;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'recent '" />
					<xsl:with-param name="default" select="'theres a reason why your neighbors are putting their trust in Tracy. Call today.'" />
				</xsl:call-template>
			</p>
		</foreignObject>

		<line stroke="#ffffff" stroke-width="0.2%" x1="16%" x2="33%" y1="43%" y2="43%" height="50%" />

		<foreignObject width="40%" height="18%" x="5%" y="45%" class="center serif">
			<p style="margin:0;color:#fff;font-size:135%;font-weight:600;line-height: 140%;">
				<span>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'list '" />
						<xsl:with-param name="default" select="'List with us by '" />
					</xsl:call-template>
				</span>
				<span>
					<xsl:value-of select="genie:format-date( //output/@reportDate, '[MNn] [D]')" />
				</span>
				<span>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'list '" />
						<xsl:with-param name="default" select="' &amp; we’ll spend UP TO &#36;15,000 to enhance your property. '" />
					</xsl:call-template>
				</span>
			</p>
		</foreignObject>

		<image x="3%" y="63%" width="13.5%" height="25.1%" preserveAspectRatio="xMinYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/tracy-phillips-agent.png' )" />
			</xsl:attribute>
		</image>
		<text x="16%" y="68%" class="upper gotham-bold" style="fill:black;font-size: 110%;" data-max-width="15%">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'marketingName'" />
				<xsl:with-param name="default" select="//agent[1]/marketingName" />
			</xsl:call-template>
		</text>
		<text x="16%" y="71%" style="font-size: 64%;font-weight: 600;fill:#9b8678;" class="gotham-bold">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'Selling'" />
				<xsl:with-param name="default" select="'Certified Probate Real Estate (CPRES)'" />
			</xsl:call-template>
		</text>

		<svg x="11.6%" y="69.5%">
			<circle cy="6%" r="7" fill="#9b8678" cx="5%"></circle>
			<text x="5%" y="6%" class="center gotham-bold" style="font-size:85%;" fill="#fff">c</text>
			<text x="6.5%" y="6.1%" class="gotham-bold" style="font-size: 120%;" fill="#000" data-max-width="10%">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentmobile'" />
						<xsl:with-param name="default" select="//agent[1]/mobile" />
					</xsl:call-template>
				</tspan>
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'ext'" />
						<xsl:with-param name="default" select="' ext 105'" />
					</xsl:call-template>
				</tspan>
			</text>
		</svg>
		<svg x="11.6%" y="73.3%">
			<circle cy="6%" r="7" fill="#9b8678" cx="5%"></circle>
			<text x="5%" y="6%" class="center gotham-bold" style="font-size:85%;" fill="#fff">e</text>
			<text x="6.5%" y="6.1%" class="gotham-bold" style="font-size: 120%;" fill="#000" data-max-width="15%">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentmarketingEmail'" />
					<xsl:with-param name="default" select="//agent[1]/marketingEmail" />
				</xsl:call-template>
			</text>
		</svg>
		<svg x="11.6%" y="77%">
			<circle cy="6%" r="7" fill="#9b8678" cx="5%"></circle>
			<text x="5%" y="6.1%" class="center gotham-bold" style="font-size:73%;" fill="#fff">w</text>
			<text x="6.5%" y="6.1%" class="bold gotham" style="font-size: 120%;" fill="#9b8678" data-max-width="15%">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentwebsite'" />
					<xsl:with-param name="default" select="//agent[1]/website" />
				</xsl:call-template>
			</text>
		</svg>

		<image x="33%" y="63%" width="12%" height="15%" preserveAspectRatio="xMinYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/tracy_phillips_logo.png' )" />
			</xsl:attribute>
		</image>

		<foreignObject width="40%" height="9%" x="3%" y="90%">
			<p style="margin:0;color:#000;font-size:64%;line-height: 140%;" class="gotham-light">
				<span>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'data '" />
						<xsl:with-param name="default" select="'Data from Sandicor '" />
					</xsl:call-template>
				</span>
				<span>
					<xsl:value-of select="genie:format-date( //output/@reportDate, 'd/m/y')" />
				</span>
				<span>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'list '" />
						<xsl:with-param name="default" select="'. If your property is listed this is not intended as a solicitation.
                            Information deemed reliable but not guaranteed. Amount of money spent will vary from
                            property to property, all info to be confirmed with Broker prior to&#160;agreement. '" />
					</xsl:call-template>
				</span>
			</p>
		</foreignObject>
		<image x="46%" y="88%" width="10%" height="9%" preserveAspectRatio="xMinYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/CPO_collar.png' )" />
			</xsl:attribute>
		</image>

		<text x="75%" y="25%" class="center bold serif" style="font-size:185%; fill:#000000;">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'Tracy’s'" />
				<xsl:with-param name="default" select="'Tracy’s Track Record...'" />
			</xsl:call-template>
		</text>

		<text x="63%" y="32%" style="font-size:100%; fill:#000000;font-weight: 500;" class="sans">
			<tspan>
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'Tracy’s'" />
					<xsl:with-param name="default" select="'Our homes sell for'" />
				</xsl:call-template>
			</tspan>
			<tspan fill="#ac1a1f" class="bold upper">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'Tracy’s'" />
					<xsl:with-param name="default" select="' 6% MORE'" />
				</xsl:call-template>
			</tspan>
			<tspan>
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'Tracy’s'" />
					<xsl:with-param name="default" select="' than the average agent'" />
				</xsl:call-template>
			</tspan>
		</text>
		<text x="63%" y="36%" style="font-size:100%; fill:#ac1a1f;font-weight: bold;font-family: 'Compass Sans';">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'Tracy’s'" />
				<xsl:with-param name="default" select="'$750,000 home = $45,000 more in your pocket!'" />
			</xsl:call-template>
		</text>
		<text x="63%" y="42%" style="font-size:98%; fill:#000000;font-weight: 500;font-family: 'Compass Sans';">
			<tspan>
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'Tracy’s'" />
					<xsl:with-param name="default" select="'Our homes sell for'" />
				</xsl:call-template>
			</tspan>
			<tspan fill="#ac1a1f" class="bold upper">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'Tracy’s'" />
					<xsl:with-param name="default" select="' 15 DAYS SOONER'" />
				</xsl:call-template>
			</tspan>
			<tspan>
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'Tracy’s'" />
					<xsl:with-param name="default" select="' than other homes.'" />
				</xsl:call-template>
			</tspan>
		</text>

		<text x="63%" y="48%" style="font-size:100%; fill:#000000;font-weight: 500;font-family: 'Compass Sans';">
			<tspan>
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'Tracy’s'" />
					<xsl:with-param name="default" select="'Our homes sell for'" />
				</xsl:call-template>
			</tspan>
			<tspan fill="#ac1a1f" class="bold uuper">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'Tracy’s'" />
					<xsl:with-param name="default" select="' 104%'" />
				</xsl:call-template>
			</tspan>

			<tspan>
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'Tracy’s'" />
					<xsl:with-param name="default" select="' of original list price.'" />
				</xsl:call-template>
			</tspan>
		</text>
		<text x="63%" y="52%" style="font-size:100%; fill:#ac1a1f;font-family: 'Compass Sans';" class="bold">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'Tracy’s'" />
				<xsl:with-param name="default" select="'$750,000 home = $30,000 more in your pocket!'" />
			</xsl:call-template>
		</text>
	</xsl:template>
</xsl:stylesheet>
