<?xml version="1.0"?>
<!--
	Asset Name: Price per Square Foot Chart
	Tags:		Infographic, Chart
	Sizes:		Facebook, Instagram
	Supports:	Area
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-scripts">
		<xsl:call-template name="chart-files" />
		<script>
<xsl:value-of select="'var content = { labels: ['" />

			<xsl:for-each select="//area/statistics/history/period">
				<xsl:value-of select="concat( &quot;'&quot;, @periodName ,&quot;',&quot;)" />
			</xsl:for-each>
<xsl:value-of select="'], series: ['" />

			<xsl:for-each select="//area/statistics/history/period">
				<xsl:value-of select="concat( @averagePricePerSqFt, ', ' )" />
			</xsl:for-each>
<xsl:value-of select="']};'" />


			<xsl:value-of select="'
			const overrides = {
				data: {
					labels: content.labels,
					series: [ content.series ]
				},
				options: {
					axisX: { scaleLabel: `Month` },
					axisY: {
						offset: 60,
						labelInterpolationFnc: genieChart.dollar,
						scaleLabel: `Price`,
					},
				},
			};
			document.addEventListener(`DOMContentLoaded`, function () {
				genieChart.draw( `90%`, `70%`, overrides );
});'" />
		</script>
	</xsl:template>

	<xsl:template name="body">
		<style>
			<xsl:value-of select="'
			g#svgChart { transform:translate(5%,18%);}
			body.instagram g#svgChart { transform:translate( 1%,5%); }
			.ct-axis-title+.ct-axis-title{
			    transform: translateY(-10px);
}'" />
		</style>

		<xsl:call-template name="svg-wrapper" />
	</xsl:template>

	<xsl:template name="svg-body">
		<xsl:call-template name="chart-header">
			<xsl:with-param name="title" select="'Price per Square Foot'" />
		</xsl:call-template>

		<g id="svgChart"></g>

		<xsl:call-template name="agent-contact-g" />

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>