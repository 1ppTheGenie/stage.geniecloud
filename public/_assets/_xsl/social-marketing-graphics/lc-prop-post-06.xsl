<?xml version="1.0"?>
<!--
	Asset Name:	LC-PROP-POST-06
	Tags:		Social Marketing Ad, LC
	Sizes:		Facebook Post, Facebook Ad, Instagram-Square
	Supports:	Listing, Area
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />
<xsl:import href="lc-social-media.xsl" />


    <xsl:template name="svg-body">
        <clipPath id="polyClip1" clipPathUnits="objectBoundingBox">
            <polygon points="0,0 0,.94 .69,1 1,.96 1,0" />
        </clipPath>

        <image preserveAspectRatio="xMidYMid slice" width="100%" height="75%" clip-path="url(#polyClip1)">
            <xsl:call-template name="switch-image">
                <xsl:with-param name="idx" select="1" />
                <xsl:with-param name="preferPrimary" select="'true'" />
            </xsl:call-template>
        </image>

        <filter x="-0.1" y="-0.4" width="1.2" height="1.8" id="solid">
<feFlood flood-color="var(--theme-sub-heading-color)" />

            <feComposite in="SourceGraphic" operator="xor" />
        </filter>

        <text x="5%" y="75%" class="bold upper" font-size="160%" font-family="var(--theme-heading-font)" fill="var(--theme-sub-heading-color)">
            <xsl:choose>
                <xsl:when test="(number(//single/statusTypeID)=3) or (number(//single/statusTypeID)=4) or (number(//single/statusTypeID)=12) or number(//single/statusTypeID)=14">
                    <xsl:value-of select="'NOW PENDING'" />
                </xsl:when>
                <xsl:when test="number(//single/statusTypeID)=2">
                    <xsl:value-of select="'Just Sold'" />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="'Just Listed'" />
                </xsl:otherwise>
            </xsl:choose>
        </text>

        <text x="5%" y="80%" class="bold  heading" data-max-width="60%" font-size= "200%">
<xsl:value-of select="$singularPropertyType" />

        </text>

        <text x="5%" y="87.9%" class="" font-family="var(--theme-heading-font)" font-size="70%" font-weight="300" fill="var(--theme-heading-color)">
            <xsl:call-template name="editable">
                <xsl:with-param name="id" select="'Presented by:'" />
                <xsl:with-param name="default" select="'Presented by:'" />
            </xsl:call-template>
        </text>

        <image x="74%" y="60.5%" width="22%" height="26%" preserveAspectRatio="xMidYMid slice">
            <xsl:attribute name="href">
                <xsl:value-of select="//agent[1]/photo" />
            </xsl:attribute>
        </image>

        <text x="85%" y="87%" class=" center" font-family="var(--theme-heading-font)" font-size="118%" font-weight="300" fill="var(--theme-heading-color)" data-max-width="14.5%">
            <xsl:call-template name="editable">
                <xsl:with-param name="id" select="'marketingName'" />
                <xsl:with-param name="default" select="//agent[1]/marketingName" />
            </xsl:call-template>
        </text>

        <text x="85%" y="91.3%" class=" center" font-family="var(--theme-heading-font)" font-size="118%" font-weight="400" fill="var(--theme-sub-heading-color)">
            <xsl:call-template name="editable">
                <xsl:with-param name="id" select="'marketingmobile'" />
                <xsl:with-param name="default" select="translate(//agent[1]/mobile, '-', '.')" />
            </xsl:call-template>
        </text>

        <xsl:choose>
            <xsl:when test="$companyLogo='' or $personalLogo=''">
                <image x="5%" y="90%" width="20%" height="7%" id="logo" preserveAspectRatio="xMinYMid meet">
                    <xsl:attribute name="href">
                        <xsl:choose>
                            <xsl:when test="$personalLogo=''">
                                <xsl:value-of select="$companyLogo" />
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="$personalLogo" />
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
                </image>
            </xsl:when>
            <xsl:otherwise>
                <image x="5%" y="90%" width="30%" height="7%" class="" preserveAspectRatio="xMinYMid meet">
                    <xsl:attribute name="href">
                        <xsl:value-of select="$personalLogo" />
                    </xsl:attribute>
                </image>
                <image x="36%" y="90%" width="11%" height="7%" class="" preserveAspectRatio="xMidYMid meet">
                    <xsl:attribute name="href">
                        <xsl:value-of select="$companyLogo" />
                    </xsl:attribute>
                </image>
            </xsl:otherwise>
        </xsl:choose>

        <g id="agent-contact" style="transform: translate( -31%, 0.6%);">
            <xsl:call-template name="copyright" />
        </g>
    </xsl:template>
</xsl:stylesheet>