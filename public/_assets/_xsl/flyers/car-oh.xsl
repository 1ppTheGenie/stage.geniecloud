<?xml version="1.0"?>
<!--
    Asset Name: Car-oh
    Tags:       Flyer
    Sizes:      us-letter
    Supports:   Reports, AsPDF
    Pages:		flyers/car-oh
    Version:    1.1
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:genie="https://theGenie.ai/hub" version="3.0"
    expand-text="yes">
    <xsl:import href="common.xsl" />

    <xsl:template name="svg-body">
        <style type="text/css">
            @import url("/_assets/_css/helvetica-neue.css");
        </style>
        <rect width="100%" height="100%" x="0" y="0" fill="#ffffff" />
        <g>
            <!-- header -->
            <g x="20" y="20">
                <image x="20" y="20" width="200" height="77">
                    <xsl:attribute name="href">
                        <xsl:value-of select="'/_assets/_img/car-oh-logo.png'" />
                    </xsl:attribute>
                </image>
                <text x="433" y="33" font-family="'Lato', 'sans-serif'" font-size="17" font-weight="700" fill="#0E122F"
                    style="text-transform: uppercase">
                    <tspan x="433" dy="0">Open house visitor non-agency</tspan>
                    <tspan x="463" dy="18">disclosure and sign-in</tspan>
                    <tspan x="493" dy="22" font-size="11">(C.A.R. form OHNA-SI, 7/24)</tspan>
                </text>
            </g>

            <!-- Basic Detail form -->
            <g transform="translate(20, 117)">
                <text font-size="13" font-weight="800" font-family="'Lato', 'sans-serif'" fill="#0e1232">
                    <tspan x="0">Property address ("Property"):</tspan>
                    <tspan x="187">
                        <xsl:call-template name="editable">
				            <xsl:with-param name="id" select="'Property Address'" />
				            <xsl:with-param name="default" select="concat(//single/address/street,' , ',//single/address/city,' , ',//single/address/state,'  ',//single/address/zip )" />
				
			            </xsl:call-template>
                    </tspan>
                </text>

                <line x1="180" y1="17" x2="660" y2="17" style="stroke: #000; stroke-width: 1"></line>

                <!-- <text x="667" font-size="13" font-weight="800" font-family="'Lato', 'sans-serif'" fill="#0E122F">
                    <tspan x="667">Date:</tspan>
                    <tspan x="710">
                        <xsl:if test="count(//openHouse/session) &gt; 0">
                            <xsl:variable name="monthName" select="//openHouse/session[1]/@month" />
                            <xsl:variable name="day" select="format-number(//openHouse/session[1]/@date, '00')" />
                            <xsl:variable name="year" select="//openHouse/session[1]/@year" />
                            <xsl:variable name="monthNumber">
                                <xsl:choose>
                                <xsl:when test="$monthName = 'January'">01</xsl:when>
                                <xsl:when test="$monthName = 'February'">02</xsl:when>
                                <xsl:when test="$monthName = 'March'">03</xsl:when>
                                <xsl:when test="$monthName = 'April'">04</xsl:when>
                                <xsl:when test="$monthName = 'May'">05</xsl:when>
                                <xsl:when test="$monthName = 'June'">06</xsl:when>
                                <xsl:when test="$monthName = 'July'">07</xsl:when>
                                <xsl:when test="$monthName = 'August'">08</xsl:when>
                                <xsl:when test="$monthName = 'September'">09</xsl:when>
                                <xsl:when test="$monthName = 'October'">10</xsl:when>
                                <xsl:when test="$monthName = 'November'">11</xsl:when>
                                <xsl:when test="$monthName = 'December'">12</xsl:when>
                                </xsl:choose>
                            </xsl:variable>
                        <xsl:call-template name="editable">
								<xsl:with-param name="id" select="'LC-OH-INVITE-01'" />
								<xsl:with-param name="default" select="concat($monthNumber, '/', $day, '/', $year)" /> 
							</xsl:call-template>
                        </xsl:if>                   
                    </tspan>
                </text> -->       
                <!-- <text x="667" font-size="13" font-weight="800" font-family="'Lato', 'sans-serif'" fill="#0E122F">
                    <tspan x="667">Date:</tspan>
                    <tspan x="710">
                        	<xsl:if test="count(//openHouse/session) &gt; 0">
                                        <xsl:value-of select="concat(
                                        //openHouse/session[1]/@month, ' ',
                                        //openHouse/session[1]/@date,
                                        ' • ', //openHouse/session[1]/@starts, ' - ',
                                        //openHouse/session[1]/@ends
                                        )" />
                            </xsl:if>
                    </tspan>
                </text> -->

                <text x="667" font-size="13" font-weight="800" font-family="'Lato', 'sans-serif'" fill="#0E122F">
                <tspan x="667">Date:</tspan>
                <xsl:if test="count(//openHouse/session) &gt; 0">
                    <xsl:variable name="monthName" select="//openHouse/session[1]/@month" />
                    <xsl:variable name="day" select="format-number(//openHouse/session[1]/@date, '00')" />
                    <xsl:variable name="year" select="//openHouse/session[1]/@year" />
                    <xsl:variable name="monthNumber">
                        <xsl:choose>
                            <xsl:when test="$monthName = 'January'">01</xsl:when>
                            <xsl:when test="$monthName = 'February'">02</xsl:when>
                            <xsl:when test="$monthName = 'March'">03</xsl:when>
                            <xsl:when test="$monthName = 'April'">04</xsl:when>
                            <xsl:when test="$monthName = 'May'">05</xsl:when>
                            <xsl:when test="$monthName = 'June'">06</xsl:when>
                            <xsl:when test="$monthName = 'July'">07</xsl:when>
                            <xsl:when test="$monthName = 'August'">08</xsl:when>
                            <xsl:when test="$monthName = 'September'">09</xsl:when>
                            <xsl:when test="$monthName = 'October'">10</xsl:when>
                            <xsl:when test="$monthName = 'November'">11</xsl:when>
                            <xsl:when test="$monthName = 'December'">12</xsl:when>
                        </xsl:choose>
                    </xsl:variable>
                    <tspan x="710">
                        <xsl:value-of select="concat($day, '/', $monthNumber, '/', $year)" />
                    </tspan>
                </xsl:if>
            </text>

                <line x1="703" y1="17" x2="800" y2="17" style="stroke: #000; stroke-width: 1"></line>
            </g>

            <g transform="translate(20, 143)">
                <text font-size="13" font-weight="800" font-family="'Lato', 'sans-serif'" fill="#0e1232">
                    <tspan x="0">Real estate agent(s) ("Agent"):</tspan>
                    <tspan x="187"><xsl:value-of select="//agent[1]/marketingName" /></tspan>
                </text>

                <line x1="177" y1="17" x2="800" y2="17" style="stroke: #000; stroke-width: 1"></line>
            </g>

            <g transform="translate(20, 170)">
                <text font-size="13" font-weight="800" font-family="'Lato', 'sans-serif'" fill="#0e1232">
                    <tspan x="0">Real estate Broker ("Broker"):</tspan>
                    <tspan x="187"><xsl:value-of select="//single[1]/listingAgents/listingAgent[1]/@broker" /></tspan>
                </text>

                <line x1="177" y1="17" x2="800" y2="17" style="stroke: #000; stroke-width: 1"></line>
            </g>

            <!-- Guidelines section -->
            <g transform="translate(20, 197)">
                <text font-size="15" font-weight="700" font-family="'Lato', 'sans-serif'" fill="#000"
                    style="text-transform: uppercase">Visitor intention to view property:
                </text>
                <text font-size="15" font-weight="600" font-family="'Lato', 'sans-serif'" fill="#0e1232">
                    <tspan x="303" dy="0">Agent is holding an open house or conducting in-person or live
                        virtual tours</tspan>
                    <tspan x="0" dy="17">of the Property identified above. Visitor is interested in viewing
                        the Property. Agent agrees to show property to Visitor on</tspan>
                    <tspan x="0" dy="17">the following terms and conditions:</tspan>
                </text>
            </g>
            <!-- Guidelines points-->

            <!-- 1 -->
            <g transform="translate(20, 253)">
                <text font-size="15" font-weight="700" font-family="'Lato', 'sans-serif'" fill="#000"
                    style="text-transform: uppercase">
                    <tspan x="0" fill="#656463">1. </tspan>
                    <tspan x="20">Agent does not represent visitor:</tspan>
                </text>
                <text font-size="15" font-weight="700" font-family="'Lato', 'sans-serif'" fill="#656463">
                    <tspan x="310" dy="1">Unless otherwise agreed in writing, Agent is not working with
                        and</tspan>
                    <tspan x="20" dy="17">has not entered into a representation agreement with Visitor that
                        would apply to the Property.</tspan>
                </text>
            </g>
            <!-- 2 -->
            <g transform="translate(20, 292)">
                <text font-size="15" font-weight="700" font-family="'Lato', 'sans-serif'" fill="#000"
                    style="text-transform: uppercase">
                    <tspan x="0" fill="#656463">2. </tspan>
                    <tspan x="20">Communication with agent at open house/property tour for benefit of
                        seller:</tspan>
                </text>
                <text font-size="15" font-weight="700" font-family="'Lato', 'sans-serif'" fill="#656463">
                    <tspan x="693" dy="1">Any</tspan>
                    <tspan x="20" dy="17">communication or sharing of information that Agent has with Visitor
                        during the open house/property tour regarding the</tspan>
                    <tspan x="20" dy="17">Property is for the benefit of the seller. All acts of Agent at the
                        open house/property tour, even those that assist Visitor in</tspan>
                    <tspan x="20" dy="17">deciding whether to make an offer on the Property are for the
                        benefit of the seller exclusively.</tspan>
                </text>
            </g>
            <!-- 3 -->
            <g transform="translate(20, 363)">
                <text font-size="15" font-weight="700" font-family="'Lato', 'sans-serif'" fill="#000"
                    style="text-transform: uppercase">
                    <tspan x="0" fill="#656463">3. </tspan>
                    <tspan x="20">Communication with agent are not confidential:</tspan>
                </text>
                <text font-size="15" font-weight="700" font-family="'Lato', 'sans-serif'" fill="#656463">
                    <tspan x="448" dy="1">Any information that Visitor reveals to Agent at the</tspan>
                    <tspan x="20" dy="17">open house/property tour may be conveyed to the seller.</tspan>
                </text>
            </g>
            <!-- 4 -->
            <g transform="translate(20, 402)">
                <text font-size="15" font-weight="700" font-family="'Lato', 'sans-serif'" fill="#000"
                    style="text-transform: uppercase">
                    <tspan x="0" fill="#656463">4. </tspan>
                    <tspan x="20">If visitor writes an offer on the property:</tspan>
                </text>
                <text font-size="15" font-weight="700" font-family="'Lato', 'sans-serif'" fill="#656463">
                    <tspan x="383" dy="1">through Agent, at that time Agent will disclose if Agent and</tspan>
                    <tspan x="20" dy="17">Agent's Broker represent the seller exclusively or both the seller
                        and the Visitor.</tspan>
                </text>
            </g>
            <!-- 5 -->
            <g transform="translate(20, 440)">
                <text font-size="15" font-weight="700" font-family="'Lato', 'sans-serif'" fill="#000"
                    style="text-transform: uppercase">
                    <tspan x="0" fill="#656463">5. </tspan>
                    <tspan x="20">If visitor wants to be represented by the agent holding the open
                        house:</tspan>
                </text>
                <text font-size="15" font-weight="700" font-family="'Lato', 'sans-serif'" fill="#656463">
                    <tspan x="633" dy="1">Visitor should sign a</tspan>
                    <tspan x="20" dy="17">representation agreement with the Agent holding the open house such
                        as a Property Showing and Representation</tspan>
                    <tspan x="20" dy="17">Agreement (C.A.R. Form PSRA) or Buyer Representation and Broker
                        Compensation Agreement (C.A.R. Form BRBC). If</tspan>
                    <tspan x="20" dy="17">Visitor is in an exclusive relationship with another agent, this is
                        not intended as a solicitation of Visitor.</tspan>
                </text>
            </g>
            <!-- Guidelines point end -->

            <!-- Visitors form -->
            <g transform="translate(20, 516)">
                <text font-size="15" font-weight="800" font-family="'Lato', 'sans-serif'" fill="#000">
                    Visitor Name/Email/Phone:
                </text>
                <text x="50%" font-size="15" font-weight="800" font-family="'Lato', 'sans-serif'" fill="#000">
                    Visitor's Agent, if any:
                </text>
            </g>

            <g transform="translate(20, 540)">
                <text font-size="15" font-weight="700" font-family="'Lato', 'sans-serif'" fill="#656463">
                    <tspan x="0"> Name: </tspan>
                    <tspan x="49%">Agent, if any:</tspan>
                </text>
                <line x1="53" y1="17" x2="400" y2="17" style="stroke: #000; stroke-width: 1"></line>
                <line x1="517" y1="17" x2="800" y2="17" style="stroke: #000; stroke-width: 1"></line>

                <text transform="translate(20, 30)" font-size="15" font-weight="700" font-family="'Lato', 'sans-serif'"
                    fill="#656463">
                    <tspan x="0"> Email </tspan>
                    <tspan x="550">Phone</tspan>
                </text>
                <line x1="70" y1="47" x2="550" y2="47" style="stroke: #000; stroke-width: 1"></line>
                <line x1="627" y1="47" x2="800" y2="47" style="stroke: #000; stroke-width: 1"></line>
            </g>
            <g transform="translate(20, 597)">
                <text font-size="15" font-weight="700" font-family="'Lato', 'sans-serif'" fill="#656463">
                    <tspan x="0"> Name: </tspan>
                    <tspan x="49%">Agent, if any:</tspan>
                </text>
                <line x1="53" y1="17" x2="400" y2="17" style="stroke: #000; stroke-width: 1"></line>
                <line x1="517" y1="17" x2="800" y2="17" style="stroke: #000; stroke-width: 1"></line>

                <text transform="translate(20, 30)" font-size="15" font-weight="700" font-family="'Lato', 'sans-serif'"
                    fill="#656463">
                    <tspan x="0"> Email </tspan>
                    <tspan x="550">Phone</tspan>
                </text>
                <line x1="70" y1="47" x2="550" y2="47" style="stroke: #000; stroke-width: 1"></line>
                <line x1="627" y1="47" x2="800" y2="47" style="stroke: #000; stroke-width: 1"></line>
            </g>
            <g transform="translate(20, 653)">
                <text font-size="15" font-weight="700" font-family="'Lato', 'sans-serif'" fill="#656463">
                    <tspan x="0"> Name: </tspan>
                    <tspan x="49%">Agent, if any:</tspan>
                </text>
                <line x1="53" y1="17" x2="400" y2="17" style="stroke: #000; stroke-width: 1"></line>
                <line x1="517" y1="17" x2="800" y2="17" style="stroke: #000; stroke-width: 1"></line>

                <text transform="translate(20, 30)" font-size="15" font-weight="700" font-family="'Lato', 'sans-serif'"
                    fill="#656463">
                    <tspan x="0"> Email </tspan>
                    <tspan x="550">Phone</tspan>
                </text>
                <line x1="70" y1="47" x2="550" y2="47" style="stroke: #000; stroke-width: 1"></line>
                <line x1="627" y1="47" x2="800" y2="47" style="stroke: #000; stroke-width: 1"></line>
            </g>
            <g transform="translate(20, 710)">
                <text font-size="15" font-weight="700" font-family="'Lato', 'sans-serif'" fill="#656463">
                    <tspan x="0"> Name: </tspan>
                    <tspan x="49%">Agent, if any:</tspan>
                </text>
                <line x1="53" y1="17" x2="400" y2="17" style="stroke: #000; stroke-width: 1"></line>
                <line x1="517" y1="17" x2="800" y2="17" style="stroke: #000; stroke-width: 1"></line>

                <text transform="translate(20, 30)" font-size="15" font-weight="700" font-family="'Lato', 'sans-serif'"
                    fill="#656463">
                    <tspan x="0"> Email </tspan>
                    <tspan x="550">Phone</tspan>
                </text>
                <line x1="70" y1="47" x2="550" y2="47" style="stroke: #000; stroke-width: 1"></line>
                <line x1="627" y1="47" x2="800" y2="47" style="stroke: #000; stroke-width: 1"></line>
            </g>
            <g transform="translate(20, 767)">
                <text font-size="15" font-weight="700" font-family="'Lato', 'sans-serif'" fill="#656463">
                    <tspan x="0"> Name: </tspan>
                    <tspan x="49%">Agent, if any:</tspan>
                </text>
                <line x1="53" y1="17" x2="400" y2="17" style="stroke: #000; stroke-width: 1"></line>
                <line x1="517" y1="17" x2="800" y2="17" style="stroke: #000; stroke-width: 1"></line>

                <text transform="translate(20, 30)" font-size="15" font-weight="700" font-family="'Lato', 'sans-serif'"
                    fill="#656463">
                    <tspan x="0"> Email </tspan>
                    <tspan x="550">Phone</tspan>
                </text>
                <line x1="70" y1="47" x2="550" y2="47" style="stroke: #000; stroke-width: 1"></line>
                <line x1="627" y1="47" x2="800" y2="47" style="stroke: #000; stroke-width: 1"></line>
            </g>
            <g transform="translate(20, 823)">
                <text font-size="15" font-weight="700" font-family="'Lato', 'sans-serif'" fill="#656463">
                    <tspan x="0"> Name: </tspan>
                    <tspan x="49%">Agent, if any:</tspan>
                </text>
                <line x1="53" y1="17" x2="400" y2="17" style="stroke: #000; stroke-width: 1"></line>
                <line x1="517" y1="17" x2="800" y2="17" style="stroke: #000; stroke-width: 1"></line>

                <text transform="translate(20, 30)" font-size="15" font-weight="700" font-family="'Lato', 'sans-serif'"
                    fill="#656463">
                    <tspan x="0"> Email </tspan>
                    <tspan x="550">Phone</tspan>
                </text>
                <line x1="70" y1="47" x2="550" y2="47" style="stroke: #000; stroke-width: 1"></line>
                <line x1="627" y1="47" x2="800" y2="47" style="stroke: #000; stroke-width: 1"></line>
            </g>
            <g transform="translate(20, 880)">
                <text font-size="15" font-weight="700" font-family="'Lato', 'sans-serif'" fill="#656463">
                    <tspan x="0"> Name: </tspan>
                    <tspan x="49%">Agent, if any:</tspan>
                </text>
                <line x1="53" y1="17" x2="400" y2="17" style="stroke: #000; stroke-width: 1"></line>
                <line x1="517" y1="17" x2="800" y2="17" style="stroke: #000; stroke-width: 1"></line>

                <text transform="translate(20, 30)" font-size="15" font-weight="700" font-family="'Lato', 'sans-serif'"
                    fill="#656463">
                    <tspan x="0"> Email </tspan>
                    <tspan x="550">Phone</tspan>
                </text>
                <line x1="70" y1="47" x2="550" y2="47" style="stroke: #000; stroke-width: 1"></line>
                <line x1="627" y1="47" x2="800" y2="47" style="stroke: #000; stroke-width: 1"></line>
            </g>
            <g transform="translate(0, 945)">
                <foreignObject x="20" font-size="10" font-weight="700" font-family="'Helvetica Neue'"
                    style="color: #656463; text-align: justify" width="87%" height="10%">
                    <div>
                        © 2024, California Association of REALTORS®, Inc. United States
                        copyright law (Title 17 U.S. Code) forbids the unauthorized
                        distribution, display and reproduction of this form, or any portion
                        thereof, by photocopy machine or any other means, including
                        facsimile or computerized formats. THIS FORM HAS BEEN APPROVED BY
                        THE CALIFORNIA ASSOCIATION OF REALTORS®. NO REPRESENTATION IS MADE
                        AS TO THE LEGAL VALIDITY OR ACCURACY OF ANY PROVISION IN ANY
                        SPECIFIC TRANSACTION. A REAL ESTATE BROKER IS THE PERSON QUALIFIED
                        TO ADVISE ON REAL ESTATE TRANSACTIONS. IF YOU DESIRE LEGAL OR TAX
                        ADVICE, CONSULT AN APPROPRIATE PROFESSIONAL. This form is made
                        available to real estate professionals through an agreement with or
                        purchase from the California Association of REALTORS®.
                    </div>
                </foreignObject>
                <text y="65" font-size="10" font-weight="700" font-family="'Helvetica Neue'" fill="#656463">
                    <tspan x="20" dy="17">Published and Distributed by: REAL ESTATE BUSINESS SERVICES, LLC.
                        <tspan style="font-style: italic">a subsidiary of the California Association of REALTORS</tspan>
                        ®
                    </tspan>
                    <tspan x="20" dy="20" font-family="sans-serif" font-size="13" font-weight="700" fill="#000000">
                        OHNA-SI 7/24 (PAGE 1 OF 1)</tspan>
                </text>
                <image x="93%" y="65" width="40.32" height="48.51" preserveAspectRatio="xMidYMid slice">
                    <xsl:attribute name="href">
                        <xsl:value-of select="'/_assets/_img/equal-housing-opportunity.png'" />
                    </xsl:attribute>
                </image>
            </g>
            <!-- Visitors form end -->
        </g>
    </xsl:template>
</xsl:stylesheet>