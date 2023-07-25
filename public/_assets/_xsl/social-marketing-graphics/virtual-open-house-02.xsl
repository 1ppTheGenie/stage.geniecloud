<?xml version="1.0"?>
<!--
	Asset Name:	Virtual Open House - Style 2
	Tags:		Social Marketing Ad
	Sizes:		Facebook Post, Facebook Ad, Instagram-Square
	Supports:	Open House, Listing
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="svg-body">
		<style>
			<xsl:value-of select="'
				.box-fade:before {
					content: &quot;&quot;;
					position: absolute;
					width: 100%;
					height: 100%;
					left: 0;
					top: 0;
					background: var(--theme-body-background);
					z-index: -1;
					opacity: 80%;
				}'"/>
		</style>

		<image x="0.5%" y="0.5%" width="49.25%" height="49.25%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<image x="50.25%" y="0.5%" width="49.25%" height="49.25%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="2" />
			</xsl:call-template>
		</image>

		<image x="0.5%" y="50.25%" width="49.25%" height="49.25%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="3" />
			</xsl:call-template>
		</image>

		<image x="50.25%" y="50.25%" width="49.25%" height="49.25%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="4" />
			</xsl:call-template>
		</image>

		<foreignObject style="position:relative;height: 100%;width:100%;" x="0%" y="0%">
			<div class="box-fade" style="transform:translate(-50%,-50%);padding:15px;width: auto;min-width: 325px;top:50%; min-height:100px;left:50%;position:absolute;text-align:center;">
				<div style="font-family:var(--theme-heading-font);font-size:29px;color:var(--theme-heading-color);font-weight:600;letter-spacing:2px;margin-bottom: 5px;">
					<span>
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'invited'" />
							<xsl:with-param name="default" select="'YOU’RE INVITED'" />
						</xsl:call-template>
					</span>
				</div>

				<div style="font-family:var(--theme-heading-font);font-size:22px;color:var(--theme-heading-color);margin-bottom:6px;margin-top: -7px;text-transform:uppercase;letter-spacing:2px;display:inline-block;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'openhouse'" />
						<xsl:with-param name="default" select="'Open House'" />
					</xsl:call-template>
				</div>

				<xsl:if test="//single/openHouse != ''">
					<div style="font-size:13px;height:auto;dominant-baseline: middle;background:var(--theme-body-color);color:var(--theme-body-background);text-align:center;padding:15px 15px;margin:0 auto;" fill="var(--theme-body-color)">
						<span style="display:block;">
							<xsl:value-of select="//single/openHouse" />
						</span>
					</div>
				</xsl:if>

				<div style="font-family:var(--theme-sub-heading-font);text-transform:uppercase;display:inline-block;">
					<div style="font-size:13px;color:var(--theme-heading-color);display:block;margin-top:5px;font-weight:700;white-space:nowrap;">
						<xsl:call-template name="listing-address-line-one"/>
					</div>

					<span style="font-size:15px;color:var(--theme-heading-color);display:block;">
						<xsl:call-template name="listing-address-line-two"/>
					</span>
				</div>
			</div>
		</foreignObject>

		<textArea width="150" style="font-size:150%;" height="auto">
			<xsl:text>Text goes here</xsl:text>
		</textArea>
	</xsl:template>
</xsl:stylesheet>