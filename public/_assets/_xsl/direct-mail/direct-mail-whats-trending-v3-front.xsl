<?xml version="1.0"?>
<!--
	Asset Name:	Direct Mail Whats Trending Postage Light 2
	Tags:		Social Marketing Ad
	Sizes:		Postcard
Supports:	Area, QRCode
	Approved: 	False
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />


	<xsl:template name="svg-body">
		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<text x="17%" y="2%" class="center upper" fill="var(--theme-heading-color)" style="font-size:450%;font-weight: 600;font-family: Lato;">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'Hi Neeha!'" />
				<xsl:with-param name="default" select="'Hi Neeha!'" />
			</xsl:call-template>
		</text>

		<image x="83%" y="0%" width="16%" height="16%" id="logo" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="$companyLogo" />
			</xsl:attribute>
		</image>

		<image x="1%" y="28%" width="28%" height="60%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:value-of select="//agent[1]/photo" />
			</xsl:attribute>
		</image>

<rect x="0%" y="88%" width="20%" height="12%" fill="var(--theme-body-background)" />
<rect x="20%" y="88%" width="80%" height="12%" class="heading" />


		<text x="2%" y="90.5%" class="upper" style="font-weight:600;font-size:150%;font-family:Helvetica,Arial,sans-serif;" fill="var(--theme-heading-color)">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'agentname'" />
				<xsl:with-param name="default" select="concat( //agent[1]/marketingName,'')" />
			</xsl:call-template>
		</text>
		<text x="3%" y="94.5%" class="upper" style="font-weight:600;font-size:180%;font-family:Helvetica,Arial,sans-serif;" fill="var(--theme-heading-color)">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'agentmobile'" />
				<xsl:with-param name="default" select="//agent[1]/mobile" />
			</xsl:call-template>
		</text>

		<g style="transform:translate(20%,11%)">
			<svg x="3%" y="71%" width="20%" height="30%" viewBox="0 0 400 210">
				<use x="0%" y="11%" width="23%" height="42%" fill="var(--theme-body-background)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#checkmark-icon' )" />
				</use>
				<text dx="0%" dy="12%" fill="var(--theme-body-background)" style="font-weight:600;font-size:180%">
					<tspan x="25%" y="3%">Community</tspan>
					<tspan x="25%" y="32%">Trends</tspan>
				</text>
			</svg>
			<svg x="19.5%" y="71%" width="20%" height="30%" viewBox="0 0 400 210">
				<use x="0%" y="11%" width="23%" height="42%" fill="var(--theme-body-background)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#checkmark-icon' )" />
				</use>
				<text dx="0%" dy="12%" fill="var(--theme-body-background)" style="font-weight:600;font-size:180%">
					<tspan x="25%" y="3%"> Neighborhood</tspan>
					<tspan x="25%" y="32%">Trends</tspan>
				</text>
			</svg>
			<svg x="38%" y="71%" width="20%" height="30%" viewBox="0 0 400 210">
				<use x="0%" y="11%" width="23%" height="42%" fill="var(--theme-body-background)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#checkmark-icon' )" />
				</use>
				<text dx="0%" dy="12%" fill="var(--theme-body-background)" style="font-weight:600;font-size:180%">
					<tspan x="25%" y="3%">Multi-Year</tspan>
					<tspan x="25%" y="32%">Trends</tspan>
				</text>
			</svg>
			<svg x="54%" y="71%" width="20%" height="30%" viewBox="0 0 400 200">
				<use x="0%" y="11%" width="23%" height="42%" fill="var(--theme-body-background)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#checkmark-icon' )" />
				</use>
				<text dx="0%" dy="12%" fill="var(--theme-body-background)" style="font-weight:600;font-size:180%">
					<tspan x="25%" y="3%">Buyer</tspan>
					<tspan x="25%" y="32%">Trends</tspan>
				</text>
			</svg>
		</g>

		<text class="upper" style="font-weight:600;font-size:150%;" fill="var(--theme-body-background)">
			<tspan x="90%" y="89.5%">Much</tspan>
			<tspan x="90%" y="93.5%">More...</tspan>
		</text>

		<rect x="29%" y="73%" width="60%" height="11%" class="heading" />

		<g style="transform:translate(82.58%, 64.5%)">
			<xsl:call-template name="qr-code">
				<xsl:with-param name="width" select="'19.5%'" />
			</xsl:call-template>
		</g>

		<g style="transform:translate(29%,74%)">
			<text x="1.2%" y="-1.4%" class="upper" fill="var(--theme-body-background)">
				<tspan style="font-weight:600;font-size:320%;font-family: open sans,sans-serif;">why?</tspan>
			</text>
			<svg x="15%" y="0.8%" width="45%" height="9%" fill="var(--theme-body-background)" style="color:var(--theme-body-background)">
				<text class="upper" fill="var(--theme-body-background)" style="font-weight:500;font-size:140%;font-family: Helvetica,Arial,sans-serif;">
					<tspan>
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'Because i believe that an educated'" />
							<xsl:with-param name="default" select="'Because i believe that an educated'" />
						</xsl:call-template>
					</tspan>
					<tspan x="0%" dy="44%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'consumer makes better choices.'" />
							<xsl:with-param name="default" select="'consumer makes better choices.'" />
						</xsl:call-template>
					</tspan>
				</text>
			</svg>
		</g>

		<g style="transform:translate(19%,56%)">
			<svg x="13%" y="0%" width="60%" height="15%" fill="var(--theme-heading-color)" style="color:var(--theme-heading-color)">
				<text class="upper" fill="var(--theme-heading-color)" style="font-weight:600;font-size:130%;font-family: Lato;">
					<tspan >View a sample report or get a free up to the Minute</tspan>
					<tspan x="0%" dy="30%">
<xsl:call-template name="listing-address-line-one" />

						<xsl:text> market insider report</xsl:text>
					</tspan>
				</text>
				<text x="0%" dy="65%" class="upper" fill="var(--theme-heading-color)" style="color:var(--theme-heading-color)">
					<tspan style="font-weight:600;font-size:130%;font-family: Lato;">Point your smart phone camera to scan </tspan>
				</text>
			</svg>
			<use class="center" x="57%" y="4.5%" width="15%" height="15%" fill="var(--theme-heading-color)">
				<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#circle-up-arrow' )" />
			</use>
		</g>
		<g style="transform:translate(12%,40%)">
			<svg x="13%" y="0%" width="72%" height="15%" fill="var(--theme-heading-color)" style="color:var(--theme-heading-color)">
				<text class="upper" fill="var(--theme-heading-color)" style="font-weight:600;font-size:500%;font-family: Lato;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'Would You Like To ?'" />
						<xsl:with-param name="default" select="'Would You Like To ?'" />
					</xsl:call-template>
				</text>
			</svg>
		</g>
		<g style="transform:translate(12%,15%)">
			<svg x="13%" y="2%" width="45%" height="10%" fill="var(--theme-heading-color)" style="color:var(--theme-heading-color)">
				<text class="upper" fill="var(--theme-heading-color)" style="font-weight:600;font-size:150%;line-height:160%;font-family: Lato;">
					<tspan>
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'DO YOU KNOW WHAT IS SO SPECIAL ABOUT '" />
							<xsl:with-param name="default" select="'DO YOU KNOW WHAT IS SO SPECIAL ABOUT '" />
						</xsl:call-template>
					</tspan>
					<tspan x="0%" dy="50%">
<xsl:call-template name="listing-address-line-one" />

					</tspan>
				</text>
			</svg>
			<svg x="13%" y="14%" width="60%" height="10%" fill="var(--theme-heading-color)" style="color:var(--theme-heading-color)">
				<text class="upper" fill="var(--theme-heading-color)" style="font-weight:600;font-size:150%;line-height:160%;font-family: Lato;">
					<tspan>
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'Do you know what the highest home sale price'" />
							<xsl:with-param name="default" select="'Do you know what the highest home sale'" />
						</xsl:call-template>
					</tspan>
					<tspan x="0%" dy="50%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'within the Balboa Island was in the last year?'" />
							<xsl:with-param name="default" select="'within the Balboa Island was in the last year?'" />
						</xsl:call-template>
					</tspan>
				</text>
			</svg>
		</g>
		<text style="font-family: Lato;">
			<tspan x="30%" y="52.5%" style="font-size:300%" class="heading bold">•</tspan>
			<tspan x="30%" y="62.5%" style="font-size:300%" class="heading bold">•</tspan>
			<tspan x="23%" y="16.5%" fill="var(--theme-heading-color)" style="font-size:180%" class="bold">•</tspan>
			<tspan x="23%" y="28.5%" fill="var(--theme-heading-color)" style="font-size:180%" class="bold">•</tspan>
		</text>

		<xsl:call-template name="copyright">
			<xsl:with-param name="disclaimer" select="'direct-mail'" />
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>