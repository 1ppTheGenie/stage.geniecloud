<?xml version="1.0"?>
<!--
	Asset Name: Ed Kaminsky Address Strip
	Tags:		Direct Mail, Flyer
	Sizes:		Letter
	Supports:	Listing, Area
	Pages:		flyers/address-strip 
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:genie="https://theGenie.ai/hub" version="3.0"
    expand-text="yes">
    <xsl:import href="common.xsl" />

    <xsl:template name="svg-body">

    <text x="0%" y="10%" font-family="var(--theme-heading-font)" fill="var(--theme-heading-color)" font-weight="800"
                    font-size="18em" class="upper">
                    <xsl:value-of select="$listingAddressLine1" />
                </text>
                <xsl:choose>
                    <xsl:when test="count(//openHouse/session) &gt; 0">
                        <text font-family="var(--theme-heading-font)" x="0%" y="10%"
                            fill="var(--theme-sub-heading-color)" font-weight="800" font-size="18em">
                            Open House
                            <tspan style="text-transform: lowercase;">
                                <xsl:call-template name="editable">
                                <xsl:with-param name="id" select="'Open House'" />
                                <xsl:with-param name="default" select="concat(//openHouse/session[1]/@starts, ' - ',//openHouse/session[1]/@ends)" />
                            </xsl:call-template>
                            </tspan>
                        </text>
                    </xsl:when>
                    <xsl:otherwise>
                        <text font-family="var(--theme-heading-font)" x="0%" y="10%"
                            fill="var(--theme-sub-heading-color)" font-weight="800" font-size="18em">
                            Open House <tspan>1pm - 4pm</tspan>
                        </text>
                    </xsl:otherwise>
                </xsl:choose>

                <svg width="900" x="80%" y="0%" height="700" viewBox="0 0 110 221" fill="none"
                    xmlns="http://www.w3.org/2000/svg">
                    <path d="M110 110.5L0 220.5V0.5L110 110.5Z" fill="var(--theme-sub-heading-color)" />
                </svg>
        <g style="font-size: 14px;background-color:red;fill:yellow;">
            <g style="">
                <text font-family="var(--theme-heading-font)" fill="var(--theme-heading-color)" font-weight="800"
                    font-size="18em" class="upper">
                    <xsl:value-of select="$listingAddressLine1" />
                </text>
                <xsl:choose>
                    <xsl:when test="count(//openHouse/session) &gt; 0">
                        <text font-family="var(--theme-heading-font)" x="0%" y="10%"
                            fill="var(--theme-sub-heading-color)" font-weight="800" font-size="18em">
                            Open House
                            <tspan style="text-transform: lowercase;">
                                <xsl:call-template name="editable">
                                <xsl:with-param name="id" select="'Open House'" />
                                <xsl:with-param name="default" select="concat(//openHouse/session[1]/@starts, ' - ',//openHouse/session[1]/@ends)" />
                            </xsl:call-template>
                            </tspan>
                        </text>
                    </xsl:when>
                    <xsl:otherwise>
                        <text font-family="var(--theme-heading-font)" x="0%" y="10%"
                            fill="var(--theme-sub-heading-color)" font-weight="800" font-size="18em">
                            Open House <tspan>1pm - 4pm</tspan>
                        </text>
                    </xsl:otherwise>
                </xsl:choose>

                <svg width="900" x="80%" y="0%" height="700" viewBox="0 0 110 221" fill="none"
                    xmlns="http://www.w3.org/2000/svg">
                    <path d="M110 110.5L0 220.5V0.5L110 110.5Z" fill="var(--theme-sub-heading-color)" />
                </svg>
            </g>
            <g style="transform: translate(180px, 38.5%)">
                <text font-family="var(--theme-heading-font)" fill="var(--theme-heading-color)" font-weight="800"
                    font-size="18em" class="upper">
                    <xsl:value-of select="$listingAddressLine1" />
                </text>
                <xsl:choose>
                    <xsl:when test="count(//openHouse/session) &gt; 0">
                        <text font-family="var(--theme-heading-font)" x="0%" y="10%"
                            fill="var(--theme-sub-heading-color)" font-weight="800" font-size="18em">
                            Open House
                            <tspan style="text-transform: lowercase;">
                                <xsl:call-template name="editable">
                                <xsl:with-param name="id" select="'Open House'" />
                                <xsl:with-param name="default" select="concat(//openHouse/session[1]/@starts, ' - ',//openHouse/session[1]/@ends)" />
                            </xsl:call-template>
                            </tspan>
                        </text>
                    </xsl:when>
                    <xsl:otherwise>
                        <text font-family="var(--theme-heading-font)" x="0%" y="10%"
                            fill="var(--theme-sub-heading-color)" font-weight="800" font-size="18em">
                            Open House <tspan>1pm - 4pm</tspan>
                        </text>
                    </xsl:otherwise>
                </xsl:choose>

                <svg width="900" x="80%" y="0%" height="700" viewBox="0 0 110 221" fill="none"
                    xmlns="http://www.w3.org/2000/svg">
                    <path d="M110 110.5L0 220.5V0.5L110 110.5Z" fill="var(--theme-sub-heading-color)" />
                </svg>
            </g>
            <g style="transform: translate(180px, 73%)">
                <text font-family="var(--theme-heading-font)" fill="var(--theme-heading-color)" font-weight="800"
                    font-size="18em" class="upper">
                    <xsl:value-of select="$listingAddressLine1" />
                </text>
                <xsl:choose>
                    <xsl:when test="count(//openHouse/session) &gt; 0">
                        <text font-family="var(--theme-heading-font)" x="0%" y="10%"
                            fill="var(--theme-sub-heading-color)" font-weight="800" font-size="18em">
                            Open House
                            <tspan style="text-transform: lowercase;">
                                <xsl:call-template name="editable">
                                <xsl:with-param name="id" select="'Open House'" />
                                <xsl:with-param name="default" select="concat(//openHouse/session[1]/@starts, ' - ',//openHouse/session[1]/@ends)" />
                            </xsl:call-template>
                            </tspan>
                        </text>
                    </xsl:when>
                    <xsl:otherwise>
                        <text font-family="var(--theme-heading-font)" x="0%" y="10%"
                            fill="var(--theme-sub-heading-color)" font-weight="800" font-size="18em">
                            Open House <tspan>1pm - 4pm</tspan>
                        </text>
                    </xsl:otherwise>
                </xsl:choose>

                <svg width="900" x="80%" y="0%" height="700" viewBox="0 0 110 221" fill="none"
                    xmlns="http://www.w3.org/2000/svg">
                    <path d="M110 110.5L0 220.5V0.5L110 110.5Z" fill="var(--theme-sub-heading-color)" />
                </svg>
            </g>
        </g>
    </xsl:template>
</xsl:stylesheet>