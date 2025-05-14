<?xml version="1.0"?>
<!--
	Asset Name:	Ed Kaminsky Report Cover
	Tags:		Text
	Supports:	Area, Map, Multi-Listing
	Sizes:		Facebook
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:genie="https://theGenie.ai/hub" version="3.0"
	expand-text="yes">
	<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<!-- <link rel="stylesheet">
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/futura-embedded.css')" />
		</link> -->
		<style type="text/css">
			@import url("/_assets/_css/futura-embedded.css");
		</style>

		<image x="0" y="0" width="100%" height="100%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-1'" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<svg class="background-shape">
			<clipPath id="myPolygon">
				<polygon points="0,0 540,0 840,630 0,630" fill="#12142d" />
			</clipPath>

			<image x="0" y="0" width="100%" height="100%" clip-path="url(#myPolygon)"
				preserveAspectRatio="xMidYMin slice">
				<xsl:attribute name="href">
					<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/blue-back-image.jpg' )" />
				</xsl:attribute>
			</image>

			<rect style="transform: rotate(334deg)" x="40%" y="35%" width=".5%" height="117%" fill="#fff"></rect>
		</svg>

		<image x="4.5%" y="15%" width="27%" height="13%" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/kaminsky-white.png' )" />
			</xsl:attribute>
		</image>

		<text x="5%" y="46%" class="futura-text" font-size="165%" fill="#b0934c">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'FOR YOUR EYES ONLY:'" />
				<xsl:with-param name="default" select="'FOR YOUR EYES ONLY:'" />
			</xsl:call-template>
		</text>

		<text x="5%" y="51%" class="futura-text super-bold" font-size="280%" fill="#b0934c">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'12 Month Insider Report:'" />
				<xsl:with-param name="default" select="'12 Month Insider Report:'" />
			</xsl:call-template>
		</text>

		<text x="5%" y="60.7%" class="super-bold futura-text" fill="#fff" font-size="280%" data-max-width="50%">
			<xsl:call-template name="editable">
				<xsl:with-param name="default" select="concat(//area/name ,' ', $singularPropertyType,'s')" />
			</xsl:call-template>
		</text>

		<xsl:choose>
			<xsl:when test="$hasMultipleAgents">
				<g>
					<g style="transform: translate(8%, 86%)">
						<defs>
							<clipPath id="circleClip1">
								<circle r="5%" />
							</clipPath>
							<clipPath id="circleClip2">
								<circle cx="9%" r="5%" />
							</clipPath>
						</defs>
						<g>
							<!-- background circle behind image 1 -->
							<circle r="5%" fill="#69657a" />

							<!-- Circular image 1 -->
							<image x="-5%" y="-7%" width="120" height="120" clip-path="url(#circleClip1)">
								<xsl:attribute name="href">
									<xsl:value-of select="//agent[1]/photo" />
								</xsl:attribute>
							</image>

							<!-- background circle behind image 2 -->
							<circle cx="9%" r="5%" fill="#69657a" />

							<!-- Circular image 2 -->
							<image x="4%" y="-7%" width="120" height="120" clip-path="url(#circleClip2)">
								<xsl:attribute name="href">
									<xsl:value-of select="//agent[2]/photo" />
								</xsl:attribute>
							</image>
						</g>
					</g>
					<text x="22.5%" y="80%" class="bold futura-text" font-size="105%" fill="#b0934c">
						<xsl:value-of select="genie:format-date( //output/@reportDate, '[MNn] [D], [Y0001]')" />
					</text>

					<rect xmlns="" x="38.6%" y="86.2%" width="7%" height="4%" fill="#d1232a" style="
              transform: translate(-25px, 15px) rotate(-3deg);
              -webkit-transform: translate(-15px, 15px) rotate(-3deg);
              width: 7%;
              height: 4%;
            ">
					</rect>

					<text xmlns="" x="22.5%" y="84.3%" class="futura-text" font-size="103%" fill="#fff">
						<tspan>Confidentially prepared for </tspan>
					</text>
					<text xmlns="" x="47.5%" y="84.3%" class="futura-text" font-size="103%" fill="#fff">
						<tspan>by</tspan>
					</text>
					<text xmlns="" x="39.2%" y="86%" class="futura-text" font-size="95%" fill="#fff" style="
              transform: translate(-25px, 15px) rotate(-3deg);
              -webkit-transform: translate(-32px, 22px) rotate(-3deg);
            ">
						<tspan dx="1.5%" class="bold" font-size="85%">REDACTED </tspan>
					</text>

					<text xmlns="" x="22%" y="88.6%" class="futura-text" font-size="103%" fill="#fff">
						<tspan fill="#b0934c" class="bold">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'agentFirstName'" />
								<xsl:with-param name="default" select="//agent[1]/firstName" />
							</xsl:call-template>
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'agentLastName'" />
								<xsl:with-param name="default" select="concat(' ',//agent[1]/lastName)" />
							</xsl:call-template>
						</tspan>
						<tspan dx="0.5%">and </tspan>
						<tspan fill="#b0934c" class="bold">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'agentFirstName'" />
								<xsl:with-param name="default" select="//agent[2]/firstName" />
							</xsl:call-template>
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'agentLastName'" />
								<xsl:with-param name="default" select="concat(' ',//agent[2]/lastName)" />
							</xsl:call-template>
						</tspan>
					</text>
				</g>
			</xsl:when>
			<xsl:otherwise>
				<g>
					<image x="0.1%" y="78%" width="11.5%" height="22%" preserveAspectRatio="xMidYMin slice">
						<xsl:attribute name="href">
							<xsl:value-of select="//agent[1]/photo" />
						</xsl:attribute>
					</image>

					<text x="12%" y="83.3%" class="bold futura-text" font-size="105%" fill="#b0934c">
						<xsl:value-of select="genie:format-date( //output/@reportDate, '[MNn] [D], [Y0001]')" />
					</text>

					<rect xmlns="" x="28.6%" y="88.2%" width="7%" height="4%" fill="#d1232a" style="
              transform: translate(-25px, 15px) rotate(-3deg);
              -webkit-transform: translate(-15px, 15px) rotate(-3deg);
              width: 7%;
              height: 4%;
            ">
					</rect>

					<text xmlns="" x="12%" y="87.3%" class="futura-text" font-size="103%" fill="#fff">
						<tspan>Confidentially prepared for </tspan>
					</text>
					<text xmlns="" x="29.5%" y="88%" class="futura-text" font-size="95%" fill="#fff" style="
              transform: translate(-25px, 15px) rotate(-3deg);
              -webkit-transform: translate(-32px, 22px) rotate(-3deg);
            ">
						<tspan dx="1.5%" class="bold" font-size="85%">REDACTED </tspan>
					</text>

					<text xmlns="" x="37%" y="87.3%" class="futura-text" font-size="103%" fill="#fff">
						<tspan dx="0.5%">by </tspan>
						<tspan fill="#b0934c" class="bold">Ed Kaminsky</tspan>
					</text>
				</g>
			</xsl:otherwise>
		</xsl:choose>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>