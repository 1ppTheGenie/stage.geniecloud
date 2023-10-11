<?xml version="1.0"?>
<!--
	Asset Name:	TEAM POST 1
	Tags:		Social Marketing Ad, LC
	Sizes:		Facebook Post, Facebook Ad, Instagram-Square
	Supports:	Listing, Area
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />
<xsl:import href="lc-social-media.xsl" />


    <xsl:template name="svg-body">
        <link rel="stylesheet">
<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/futura-embedded.css')" />

        </link>

        <image preserveAspectRatio="xMidYMid slice" width="100%" height="100%">
            <xsl:attribute name="href">
                <xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/Twilight-17.jpg' )" />
            </xsl:attribute>
        </image>

        <rect x="0%" y="0%" width="100%" height="100%" opacity="0.96" fill="#b2934e" />

        <image x="4%" y="3.8%" width="43.4%" height="13%" id="logo" preserveAspectRatio="xMinYMid meet">
            <xsl:attribute name="href">
                <xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/kaminsky-white.png' )" />
            </xsl:attribute>
        </image>

        <text x="5%" y="28.5%" class="futura-text bold" font-size="178%" font-weight="700" fill="#fff">
            <tspan x="5%">
                <xsl:call-template name="editable">
                    <xsl:with-param name="id" select="'YOUR-FACE'" />
                    <xsl:with-param name="default" select="'YOUR FACE '" />
                </xsl:call-template>
            </tspan>
            <tspan x="5%" dy="5%">
                <xsl:call-template name="editable">
                    <xsl:with-param name="id" select="'WOULD-LOOK'" />
                    <xsl:with-param name="default" select="'WOULD LOOK'" />
                </xsl:call-template>
            </tspan>
            <tspan x="5%" dy="5%">
                <xsl:call-template name="editable">
                    <xsl:with-param name="id" select="'AMAZING'" />
                    <xsl:with-param name="default" select="'AMAZING'" />
                </xsl:call-template>
            </tspan>
            <tspan x="5%" dy="5%">
                <xsl:call-template name="editable">
                    <xsl:with-param name="id" select="'ON-THIS-POST.'" />
                    <xsl:with-param name="default" select="'ON THIS POST.'" />
                </xsl:call-template>
            </tspan>
        </text>
        <text x="5%" y="53%" class="futura-text bold" font-size="178%" font-weight="700" fill="#fff">
            <tspan x="5%" fill="#fff">
                <xsl:call-template name="editable">
                    <xsl:with-param name="id" select="'IF YOU AGREE,'" />
                    <xsl:with-param name="default" select="'IF YOU AGREE, '" />
                </xsl:call-template>
            </tspan>
            <tspan x="5%" dy="5%">
                <xsl:call-template name="editable">
                    <xsl:with-param name="id" select="'COME JOIN'" />
                    <xsl:with-param name="default" select="'COME JOIN'" />
                </xsl:call-template>
            </tspan>
            <tspan x="5%" dy="5%">
                <xsl:call-template name="editable">
                    <xsl:with-param name="id" select="'ME AT EXP.'" />
                    <xsl:with-param name="default" select="'ME AT EXP.'" />
                </xsl:call-template>
            </tspan>
        </text>
        <image x="5.2%" y="86.3%" width="40%" height="8.3%" id="logo" preserveAspectRatio="xMinYMid meet">
            <xsl:attribute name="href">
                <xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/exp-white.png' )" />
            </xsl:attribute>
        </image>

        <image x="50%" y="30%" width="50%" height="70%" preserveAspectRatio="xMidYMid slice">
            <xsl:attribute name="href">
                <xsl:value-of select="//agent[1]/photo" />

            </xsl:attribute>
        </image>

    </xsl:template>
</xsl:stylesheet>