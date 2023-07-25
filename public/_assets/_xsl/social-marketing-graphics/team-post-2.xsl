<?xml version="1.0"?>
<!--
	Asset Name:	TEAM POST 2
	Tags:		Social Marketing Ad, LC
	Sizes:		Facebook Post, Facebook Ad, Instagram-Square
	Supports:	Listing, Area
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
    <xsl:import href="common.xsl"/>
    <xsl:import href="lc-social-media.xsl"/>

    <xsl:template name="svg-body">
        <link rel="stylesheet">
            <xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/futura-embedded.css')"/>
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
        <!-- I’VE JUST
			JOINED THE
			#9 RANKED
			REAL ESTATE
			TEAM IN
			AMERICA.
			REALTRENDS / WSJ (“TOP MEDIUM-SIZED TEAMS,” 2021)
 		-->
        <text x="5%" y="31%" class="futura-text bold" font-size="188%" font-weight="700" fill="#fff">
            <tspan x="5.2%">
                <xsl:call-template name="editable">
                    <xsl:with-param name="id" select="'I’VE JUST'" />
                    <xsl:with-param name="default" select="'I’VE JUST '" />
                </xsl:call-template>
            </tspan>
            <tspan x="5.2%" dy="5.5%">
                <xsl:call-template name="editable">
                    <xsl:with-param name="id" select="'JOINED THE'" />
                    <xsl:with-param name="default" select="'JOINED THE'" />
                </xsl:call-template>
            </tspan>
            <tspan x="5.2%" dy="5.5%">
                <xsl:call-template name="editable">
                    <xsl:with-param name="id" select="'#9 RANKED'" />
                    <xsl:with-param name="default" select="'#9 RANKED'" />
                </xsl:call-template>
            </tspan>
            <tspan x="5.2%" dy="5.5%">
                <xsl:call-template name="editable">
                    <xsl:with-param name="id" select="'REAL ESTATE'" />
                    <xsl:with-param name="default" select="'REAL ESTATE'" />
                </xsl:call-template>
            </tspan>
            <tspan x="5.2%" dy="5.5%">
                <xsl:call-template name="editable">
                    <xsl:with-param name="id" select="'TEAM IN'" />
                    <xsl:with-param name="default" select="'TEAM IN'" />
                </xsl:call-template>
            </tspan>
            <tspan x="5.2%" dy="5.5%">
                <xsl:call-template name="editable">
                    <xsl:with-param name="id" select="'AMERICA.'" />
                    <xsl:with-param name="default" select="'AMERICA.'" />
                </xsl:call-template>
            </tspan>
        </text>
        <image x="5.2%" y="84.5%" width="40%" height="8.3%" id="logo" preserveAspectRatio="xMinYMid meet">
            <xsl:attribute name="href">
                <xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/exp-white.png' )" />
            </xsl:attribute>
        </image>

        <image x="50%" y="30%" width="50%" height="70%" preserveAspectRatio="xMidYMid slice">
            <xsl:attribute name="href">
                <xsl:value-of select="//agent[1]/photo" />

            </xsl:attribute>
        </image>
        <text x="5%" y="94%" class="futura-text" font-size="57%" font-weight="100" fill="#fff">
            <xsl:call-template name="editable">
                <xsl:with-param name="id" select="'REAL TRENDS / WSJ (“TOP MEDIUM-SIZED TEAMS,” 2021)'" />
                <xsl:with-param name="default" select="'REAL TRENDS / WSJ (“TOP MEDIUM-SIZED TEAMS,” 2021) '" />
            </xsl:call-template>
        </text>

    </xsl:template>
</xsl:stylesheet>