<?xml version="1.0"?>
<!--
	Asset Name: Address Strip
	Tags:		Flyer
	Sizes:		tabloid-flyer
	Supports:	Listing
	Pages:		flyers/address-strip-01,flyers/address-strip-02
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:genie="https://theGenie.ai/hub" version="3.0"
    expand-text="yes">
    <xsl:import href="common.xsl" />

    <xsl:template name="svg-body">
        <rect width="100%" height="100%" fill="#ffffff"></rect>
        <g>
            <g style="transform: translate(4%, 4%)">
                <text font-family="var(--theme-heading-font)" fill="#0f1132" font-weight="800"
                    font-size="85" class="upper" data-max-width="80%">
                    <xsl:value-of select="$listingAddressLine1" />
                </text>
                <xsl:choose>
                    <xsl:when test="count(//openHouse/session) &gt; 0">
                        <text font-family="var(--theme-heading-font)" x="0%" y="10%"
                            fill="#d2232a" font-weight="800" font-size="85">
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
                            fill="#d2232a" font-weight="800" font-size="85">
                            Open House <tspan>1pm - 4pm</tspan>
                        </text>
                    </xsl:otherwise>
                </xsl:choose>

                <svg width="120" x="85%" y="-39.5%" viewBox="0 0 110 221" fill="none"
                    xmlns="http://www.w3.org/2000/svg">
                    <path d="M110 110.5L0 220.5V0.5L110 110.5Z" fill="#d2232a" />
                </svg>
            </g>
            <g style="transform: translate(4%, 38.5%)">
                <text font-family="var(--theme-heading-font)" fill="#0f1132" font-weight="800"
                    font-size="85" class="upper" data-max-width="80%">
                    <xsl:value-of select="$listingAddressLine1" />
                </text>
                <xsl:choose>
                    <xsl:when test="count(//openHouse/session) &gt; 0">
                        <text font-family="var(--theme-heading-font)" x="0%" y="10%"
                            fill="#d2232a" font-weight="800" font-size="85">
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
                            fill="#d2232a" font-weight="800" font-size="85">
                            Open House <tspan>1pm - 4pm</tspan>
                        </text>
                    </xsl:otherwise>
                </xsl:choose>

                <svg width="120" x="85%" y="-39.5%" viewBox="0 0 110 221" fill="none"
                    xmlns="http://www.w3.org/2000/svg">
                    <path d="M110 110.5L0 220.5V0.5L110 110.5Z" fill="#d2232a" />
                </svg>
            </g>
            <g style="transform: translate(4%, 73%)">
                <text font-family="var(--theme-heading-font)" fill="#0f1132" font-weight="800"
                    font-size="85" class="upper" data-max-width="80%">
                    <xsl:value-of select="$listingAddressLine1" />
                </text>
                <xsl:choose>
                    <xsl:when test="count(//openHouse/session) &gt; 0">
                        <text font-family="var(--theme-heading-font)" x="0%" y="10%"
                            fill="#d2232a" font-weight="800" font-size="85">
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
                            fill="#d2232a" font-weight="800" font-size="85">
                            Open House <tspan>1pm - 4pm</tspan>
                        </text>
                    </xsl:otherwise>
                </xsl:choose>

                <svg width="120" x="85%" y="-39.5%" viewBox="0 0 110 221" fill="none"
                    xmlns="http://www.w3.org/2000/svg">
                    <path d="M110 110.5L0 220.5V0.5L110 110.5Z" fill="#d2232a" />
                </svg>
            </g>
        </g>
    </xsl:template>
</xsl:stylesheet>