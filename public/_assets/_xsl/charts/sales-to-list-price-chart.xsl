<?xml version="1.0"?>
<!--
	Asset Name: Sales to List Price
	Tags:		Infographic, Chart
	Sizes:		Facebook
	Supports:	Area
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-scripts">
		<xsl:call-template name="chart-files" />
		<style>
			<xsl:value-of select="'
                .ct-axis-title+.ct-axis-title{
                    transform: translateY(-10px);
}'" />
		</style>
		<script>
<xsl:value-of select="'var content = { labels: ['" />

			<xsl:for-each select="//area/statistics/history/period">
				<xsl:value-of select="concat( &quot;'&quot;, @periodName ,&quot;',&quot;)" />
			</xsl:for-each>
<xsl:value-of select="'], series: ['" />

			<xsl:for-each select="//area/statistics/history/period">
				<xsl:value-of select="concat( @averageSalePrice div @averageListPrice ,&quot;, &quot;)" />
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
						labelInterpolationFnc: genieChart.percent,
						scaleLabel: `Sales to Listing Price Ratio`,
					},
				},
			};
			document.addEventListener(`DOMContentLoaded`, function () {
				genieChart.draw( `90%`, `70%`, overrides );
});'" />
		</script>
	</xsl:template>

	<xsl:template name="svg-body">
		<xsl:call-template name="chart-header">
			<xsl:with-param name="title" select="'Sales to List Price'" />
		</xsl:call-template>

		<g id="svgChart" style="transform:translate(5%,18%)"></g>

		<xsl:call-template name="agent-contact-g" />

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>