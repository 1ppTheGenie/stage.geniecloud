<?xml version="1.0"?>
<!--
	Asset Name:	Home Sold By Bedroom
	Tags:		Text
	Supports:	Area
	Sizes:		Facebook
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<xsl:call-template name="svg-defs" />

		<style>
			<xsl:value-of select="'
		 	g#icons {
				transform: translate( 0, 70% );
			}
			g#icons text {
				fill: #555;
}'" />
		</style>

		<g style="transform: translate(0%, 0%)">
			<xsl:call-template name="area-heading">
				<xsl:with-param name="default" select="'Whats Hot by Bedroom'" />
				<xsl:with-param name="id" select="'market-update-title'" />
			</xsl:call-template>
		</g>

		<g style="transform: translate(0%, 0%);">
			<linearGradient id="bar1">
<stop offset="0" style="stop-color:var(--vivid-color-1)" />
<stop offset="0.20" style="stop-color:var(--vivid-color-1)" />
<stop offset="0.20" style="stop-color:var(--vivid-dark-1)" />
<stop offset="0.30" style="stop-color:var(--vivid-color-1)" />
<stop offset="1" style="stop-color:var(--vivid-end-1)" />

			</linearGradient>
			<path style="fill:url(#bar1);" d="m 520.5, 185 c 0, 17.673 -14.327, 32 -32, 32 h -420 c -17.673,0 -32 -14.327 -32 -32 v-0  c0-17.673,14.327-32,32-32h420c17.673,0,32,14.327,32,32V45.5z"></path>

<rect x="38%" y="-43%" width="70" height="70" stroke-width="5" style="fill: #fff;stroke: #1699dd;transform: rotate(45deg);" />


			<text x="5%" y="27%" class="medium" fill="var(--theme-body-background)" fill-opacity="0.5">
			2br</text>

			<text x="20%" y="27%" class="medium upper" fill="var(--theme-body-background)" fill-opacity="0.5">Sales</text>

			<text x="42%" y="26%" class="large upper" style="fill: #1699dd;" dominant-baseline="middle">2</text>
		</g>

		<g style="transform: translate(0%, 14%);">
			<linearGradient id="bar2">
<stop offset="0" style="stop-color:var(--vivid-color-2)" />
<stop offset="0.18" style="stop-color:var(--vivid-color-2)" />
<stop offset="0.18" style="stop-color:var(--vivid-dark-2)" />
<stop offset="0.28" style="stop-color:var(--vivid-color-2)" />
<stop offset="1" style="stop-color:var(--vivid-end-2)" />

			</linearGradient>
			<path style="fill:url(#bar2);" d="m 570.5, 185 c 0, 17.673 -14.327, 32 -32, 32 h -470 c -17.673,0 -32 -14.327 -32 -32 v-0  c0-17.673,14.327-32,32-32h470c17.673,0,32,14.327,32,32V45.5z"></path>

<rect x="41%" y="-48%" width="70" height="70" stroke-width="5" style="fill: #fff;stroke: #63cbfe;transform: rotate(45deg);" />


			<text x="5%" y="27%" class="medium" fill="var(--theme-body-background)" fill-opacity="0.5">
			3br</text>

			<text x="20%" y="27%" class="medium upper" fill="var(--theme-body-background)" fill-opacity="0.5">Sales</text>

			<text x="45.2%" y="26.5%" class="large upper" style="fill: #52c0ff;">30</text>
		</g>

		<g style="transform: translate(0%, 29%);">
			<linearGradient id="bar3">
<stop offset="0" style="stop-color:var(--vivid-color-3)" />
<stop offset="0.15" style="stop-color:var(--vivid-color-3)" />
<stop offset="0.15" style="stop-color:var(--vivid-dark-3)" />
<stop offset="0.25" style="stop-color:var(--vivid-color-3)" />
<stop offset="1" style="stop-color:var(--vivid-end-3)" />

			</linearGradient>
			<path style="fill:url(#bar3);" d="m 670.5, 185 c 0, 17.673 -14.327, 32 -32, 32 h -570 c -17.673,0 -32 -14.327 -32 -32 v-0  c0-17.673,14.327-32,32-32h570c17.673,0,32,14.327,32,32V45.5z"></path>

<rect x="47%" y="-59%" width="70" height="70" stroke-width="5" style="fill: #fff;stroke: #f76991;transform: rotate(45deg);" />


			<text x="5%" y="27%" class="medium" fill="var(--theme-body-background)" fill-opacity="0.5">4br</text>

			<text x="20%" y="27%" class="medium upper" fill="var(--theme-body-background)" fill-opacity="0.5">Sales</text>

			<text x="53.5%" y="26.5%" class="large upper" style="fill: #ff2f69;">118</text>
		</g>

		<g style="transform: translate(0%, 44%);">
			<linearGradient id="bar4">
<stop offset="0" style="stop-color:var(--vivid-color-4)" />
<stop offset="0.13" style="stop-color:var(--vivid-color-4)" />
<stop offset="0.13" style="stop-color:var(--vivid-dark-4)" />
<stop offset="0.23" style="stop-color:var(--vivid-color-4)" />
<stop offset="1" style="stop-color:var(--vivid-end-4)" />

			</linearGradient>
			<path style="fill:url(#bar4);" d="m 750.5, 185 c 0, 17.673 -14.327, 32 -32, 32 h -650 c -17.673,0 -32 -14.327 -32 -32 v-0  c0-17.673,14.327-32,32-32h650c17.673,0,32,14.327,32,32V45.5z"></path>

<rect x="52%" y="-69%" width="70" height="70" stroke-width="5" style="fill: #fff;stroke: #28ff04;transform: rotate(45deg);" />


			<text x="5%" y="27%" class="medium" fill="var(--theme-body-background)" fill-opacity="0.5">5br</text>

			<text x="20%" y="27%" class="medium upper" fill="var(--theme-body-background)" fill-opacity="0.5">Sales</text>

			<text x="60.2%" y="26.5%" class="large upper" style="fill: #24dc00;">126</text>
		</g>

		<g style="transform: translate(0%, 59%);">
			<linearGradient id="bar5">
<stop offset="0" style="stop-color:var(--vivid-color-5)" />
<stop offset="0.20" style="stop-color:var(--vivid-color-5)" />
<stop offset="0.20" style="stop-color:var(--vivid-dark-5)" />
<stop offset="0.30" style="stop-color:var(--vivid-color-5)" />
<stop offset="1" style="stop-color:var(--vivid-end-5)" />

			</linearGradient>
			<path style="fill:url(#bar5);" d="m 490.5, 185 c 0, 17.673 -14.327, 32 -32, 32 h -390 c -17.673,0 -32 -14.327 -32 -32 v-0  c0-17.673,14.327-32,32-32h390c17.673,0,32,14.327,32,32V45.5z"></path>

<rect x="36.7%" y="-39%" width="70" height="70" stroke-width="5" style="fill: #fff;stroke: #d39b3e;transform: rotate(45deg);" />


			<text x="5%" y="27%" class="medium" fill="var(--theme-body-background)" fill-opacity="0.5">6br</text>

			<text x="20%" y="27%" class="medium upper" fill="var(--theme-body-background)" fill-opacity="0.5">Sales</text>

			<text x="39%" y="26.5%" class="large upper" style="fill: #e9aa41;">39</text>
		</g>

		<g style="transform: translate(77%, 45%);">
			<polyline style="fill:#fff;" filter="url(#blurred-shadow)" points="-20,55 0,40 0,0 200,0 200,110 0,110 0,70"></polyline>

			<text x="8%" y="3%" style="font-size:380%" class="center">
				<xsl:value-of select="//statistics/@averageDaysOnMarket" />
			</text>

			<text x="8%" y="20%" class="medium center" style="">
				<tspan>Average Days</tspan>
				<tspan x="8%" dy="5%">on Market</tspan>
			</text>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>