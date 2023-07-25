<?xml version="1.0"?>
<!--
	Asset Name:	Listing Ad 04
	Tags:		Social Marketing Ad
	Sizes:		Facebook Post, Facebook Ad, Instagram-Square
	Supports:	Listing
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
    <xsl:import href="common.xsl"/>
    <xsl:template name="svg-body">

        <clipPath id="clipCircle">
            <circle r="30%" cx="50%" cy="50%"></circle>
        </clipPath>
        <image x="0" y="0" width="100%" height="100%" preserveAspectRatio="xMidYMid slice" clip-path="url(#clipCircle)">
            <xsl:call-template name="switch-image">
                <xsl:with-param name="idx" select="1" />
            </xsl:call-template>
        </image>

        <rect x="72%" y="0" width="22%" height="17%" fill="var(--theme-heading-color)"/>
        <g style="transform: translate(79%, 0);">

            <text x="4%" y="3%" class="medium center bold theme-body">
                <xsl:choose>
                    <xsl:when test="(number(//single/statusTypeID)=3) or (number(//single/statusTypeID)=4) or (number(//single/statusTypeID)=12)">
                        <tspan >
                            <xsl:value-of select="'In'" />
                        </tspan>
                        <tspan dy="5%" x="4%">
                            <xsl:value-of select="' Escrow'" />
                        </tspan>
                    </xsl:when>
                    <xsl:when test="number(//single/statusTypeID)=2">
                        <tspan >
                            <xsl:value-of select="'Just'" />
                        </tspan>
                        <tspan dy="5%" x="4%">
                            <xsl:value-of select="' Sold'" />
                        </tspan>
                    </xsl:when>
                    <xsl:when test="number(//single/statusTypeID)=14">
                        <tspan >
                            <xsl:value-of select="'Coming'" />
                        </tspan>
                        <tspan dy="5%" x="4%">
                            <xsl:value-of select="' Soon'" />
                        </tspan>
                    </xsl:when>
                    <xsl:otherwise>
                        <tspan >
                            <xsl:value-of select="'Just'" />
                        </tspan>
                        <tspan dy="5%" x="4%">
                            <xsl:value-of select="' Listed'" />
                        </tspan>
                    </xsl:otherwise>
                </xsl:choose>
            </text>
        </g>

        <image x="79%" y="86%" width="21%" height="11%" id="logo" preserveAspectRatio="xMidYMid meet">
            <xsl:attribute name="href">
                <xsl:value-of select="$companyLogo" />
            </xsl:attribute>
        </image>

        <rect x="3%" y="78%" width="13%" height="13%" fill="var(--theme-heading-color)"/>
        <image x="4%" y="79%" width="13%" height="13%" preserveAspectRatio="xMidYMid slice">
            <xsl:attribute name="href">
                <xsl:value-of select="//agent[1]/photo" />

            </xsl:attribute>
        </image>

    </xsl:template>
</xsl:stylesheet>