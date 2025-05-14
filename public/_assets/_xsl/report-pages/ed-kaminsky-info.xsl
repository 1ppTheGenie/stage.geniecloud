<?xml version="1.0"?>
<!--
	Asset Name:	Ed Kaminsky Info
	Tags:		Text
	Supports:	Area, Multi-Listing
	Sizes:		Facebook
-->

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="3.0"
  expand-text="yes"
>
  <xsl:import href="common.xsl" />

  <xsl:template name="svg-scripts">
    <xsl:call-template name="map-files" />

    <script>
      			<xsl:text>var listings=[</xsl:text>
      			<xsl:for-each select="//listings/listing[@salePrice!='']">
      <xsl:sort select="@salePrice" data-type="number" order="descending" />

      				<xsl:if test="position()=1">
      					<xsl:value-of select="concat( &quot;{caption: 'HH', state:'&quot;, @state, &quot;',lat:'&quot;, @lat, &quot;',lng:'&quot;, @lon, &quot;'},&quot; )" />
      				</xsl:if>
      			</xsl:for-each>
      			<xsl:text>];</xsl:text>
    </script>
  </xsl:template>

  <xsl:template name="svg-body">
    <!-- <link rel="stylesheet">
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/futura-embedded.css')" />
		</link> -->
    <style type="text/css">
      @import url("/_assets/_css/futura-embedded.css");
    </style>
    <image
      x="0"
      y="0"
      width="100%"
      height="100%"
      preserveAspectRatio="xMidYMid slice"
    >
      <xsl:attribute name="href">
        <xsl:value-of
          select="concat( //output/@siteUrl, '_assets/_img/blue-back-image.jpg' )"
        />
      </xsl:attribute>
    </image>

    <image
      x="28%"
      y="27%"
      width="42%"
      height="17%"
      preserveAspectRatio="xMidYMid meet"
    >
      <xsl:attribute name="href">
        <xsl:value-of
          select="concat( //output/@siteUrl, '_assets/_img/kaminsky-logo.png' )"
        />
      </xsl:attribute>
    </image>

    <image
      x="14%"
      y="58%"
      width="4%"
      height="6.5%"
      preserveAspectRatio="xMidYMin slice"
    >
      <xsl:attribute name="href">
        <xsl:value-of
          select="concat( //output/@siteUrl, '_assets/_img/award-icon.png' )"
        />
      </xsl:attribute>
    </image>

    <image
      x="37%"
      y="58%"
      width="4%"
      height="6.5%"
      preserveAspectRatio="xMidYMin slice"
    >
      <xsl:attribute name="href">
        <xsl:value-of
          select="concat( //output/@siteUrl, '_assets/_img/award-icon.png' )"
        />
      </xsl:attribute>
    </image>

    <image
      x="59.5%"
      y="58%"
      width="4%"
      height="6.5%"
      preserveAspectRatio="xMidYMin slice"
    >
      <xsl:attribute name="href">
        <xsl:value-of
          select="concat( //output/@siteUrl, '_assets/_img/award-icon.png' )"
        />
      </xsl:attribute>
    </image>

    <image
      x="82%"
      y="58%"
      width="4%"
      height="6.5%"
      preserveAspectRatio="xMidYMin slice"
    >
      <xsl:attribute name="href">
        <xsl:value-of
          select="concat( //output/@siteUrl, '_assets/_img/award-icon.png' )"
        />
      </xsl:attribute>
    </image>

    <text
      x="7%"
      y="66%"
      class="upper futura-text"
      fill="#fff"
      font-size="130%"
      style="font-weight: 800"
      data-max-width="20%"
    >
      TOP 1.5% OF AGENTS
      <tspan x="8%" dy="4%">IN AMERICA, 2022</tspan>
    </text>

    <text
      x="9%"
      y="75%"
      class="futura-text"
      fill="#afadad"
      font-style="italic"
      font-size="80%"
      style="font-weight: 600"
    >
      Source: RealTrends / WSJ
    </text>

    <text
      x="32%"
      y="66%"
      class="upper futura-text"
      fill="#fff"
      font-size="130%"
      style="font-weight: 800"
      data-max-width="20%"
    >
      $292,947,681 IN
      <tspan x="30%" dy="4%">2021 SALES VOLUME</tspan>
    </text>

    <text
      x="31%"
      y="75%"
      class="futura-text"
      fill="#afadad"
      font-style="italic"
      font-size="80%"
      style="font-weight: 600"
    >
      Source: Multiple Listing Service
    </text>

    <text
      x="53%"
      y="66%"
      class="upper futura-text"
      fill="#fff"
      font-size="130%"
      style="font-weight: 800"
      data-max-width="20%"
    >
      $2,000,000,000 IN
      <tspan x="51%" dy="4%">LIFETIME SALES VOLUME</tspan>
    </text>

    <text
      x="53%"
      y="75%"
      class="futura-text"
      fill="#afadad"
      font-style="italic"
      font-size="80%"
      style="font-weight: 600"
    >
      Source: Multiple Listing Service
    </text>

    <text
      x="75%"
      y="66%"
      class="upper futura-text"
      fill="#fff"
      font-size="130%"
      style="font-weight: 800"
      data-max-width="20%"
    >
      #9 TOP PRODUCING
      <tspan x="76%" dy="4%">TEAM IN AMERICA</tspan>
    </text>

    <text
      x="77%"
      y="75%"
      class="futura-text"
      fill="#afadad"
      font-style="italic"
      font-size="80%"
      style="font-weight: 600"
    >
      Source: RealTrends / WSJ
    </text>

    <xsl:choose>
      <xsl:when test="$hasMultipleAgents">
        <line
          x1="5%"
          y1="80.5%"
          x2="26%"
          y2="80.5%"
          style="stroke: #b0934c; stroke-width: 2"
        ></line>
        <text
          class="futura-text"
          x="28%"
          y="79%"
          fill="#fff"
          font-size="100%"
          style="font-weight: 800"
        >
          <tspan x="" dy="0%">
            <xsl:call-template name="editable">
              <xsl:with-param name="id" select="'marketingName'" />
              <xsl:with-param
                name="default"
                select="//agent[1]/marketingName"
              />
            </xsl:call-template>
          </tspan>
          <tspan dx="2" dy="0%" fill="#b0934c">•</tspan>
          <tspan dx="2" dy="0%">
            <xsl:call-template name="editable">
              <xsl:with-param name="id" select="'agentmobile'" />
              <xsl:with-param
                name="default"
                select="translate(//agent[1]/mobile,'-','.')"
              />
            </xsl:call-template>
          </tspan>
          <tspan dx="2" dy="0%" fill="#b0934c">•</tspan>
          <tspan dx="2" dy="0%">
            <xsl:call-template name="editable">
              <xsl:with-param name="id" select="'agentwbsite'" />
              <xsl:with-param name="default" select="'itzsold.com'" />
            </xsl:call-template>
          </tspan>
          <tspan dx="2" dy="0%" fill="#b0934c">•</tspan>
          <tspan dx="2" dy="0%">
            <xsl:call-template name="editable">
              <xsl:with-param name="id" select="'agentlicense'" />
              <xsl:with-param
                name="default"
                select="//agent[1]/marketingLicense"
              />
            </xsl:call-template>
          </tspan>
        </text>
        <line
          x1="75%"
          y1="80.5%"
          x2="95%"
          y2="80.5%"
          style="stroke: #b0934c; stroke-width: 2"
        ></line>

        <line
          x1="5%"
          y1="84%"
          x2="26%"
          y2="84%"
          style="stroke: #b0934c; stroke-width: 2"
        ></line>
        <text
          class="futura-text"
          x="28%"
          y="82.5%"
          fill="#fff"
          font-size="100%"
          style="font-weight: 800"
        >
          <tspan x="" dy="0%">
            <xsl:call-template name="editable">
              <xsl:with-param name="id" select="'marketingName'" />
              <xsl:with-param
                name="default"
                select="//agent[2]/marketingName"
              />
            </xsl:call-template>
          </tspan>
          <tspan dx="2" dy="0%" fill="#b0934c">•</tspan>
          <tspan dx="2" dy="0%">
            <xsl:call-template name="editable">
              <xsl:with-param name="id" select="'agentmobile'" />
              <xsl:with-param
                name="default"
                select="translate(//agent[2]/mobile,'-','.')"
              />
            </xsl:call-template>
          </tspan>
          <tspan dx="2" dy="0%" fill="#b0934c">•</tspan>
          <tspan dx="2" dy="0%">
            <xsl:call-template name="editable">
              <xsl:with-param name="id" select="'agentwbsite'" />
              <xsl:with-param name="default" select="'itzsold.com'" />
            </xsl:call-template>
          </tspan>
          <tspan dx="2" dy="0%" fill="#b0934c">•</tspan>
          <tspan dx="2" dy="0%">
            <xsl:call-template name="editable">
              <xsl:with-param name="id" select="'agentlicense'" />
              <xsl:with-param
                name="default"
                select="//agent[2]/marketingLicense"
              />
            </xsl:call-template>
          </tspan>
        </text>
        <line
          x1="75%"
          y1="84%"
          x2="95%"
          y2="84%"
          style="stroke: #b0934c; stroke-width: 2"
        ></line>
      </xsl:when>
      <xsl:otherwise>
        <line
          x1="5%"
          y1="84%"
          x2="26%"
          y2="84%"
          style="stroke: #b0934c; stroke-width: 2"
        ></line>
        <text
          class="futura-text"
          x="28%"
          y="82.5%"
          fill="#fff"
          font-size="100%"
          style="font-weight: 800"
        >
          <tspan x="" dy="0%">
            <xsl:call-template name="editable">
              <xsl:with-param name="id" select="'marketingName'" />
              <xsl:with-param
                name="default"
                select="//agent[1]/marketingName"
              />
            </xsl:call-template>
          </tspan>
          <tspan dy="0%" fill="#b0934c">•</tspan>
          <tspan x="" dy="0%">
            <xsl:call-template name="editable">
              <xsl:with-param name="id" select="'agentmobile'" />
              <xsl:with-param
                name="default"
                select="translate(//agent[1]/mobile,'-','.')"
              />
            </xsl:call-template>
          </tspan>
          <tspan dy="0%" fill="#b0934c">•</tspan>
          <tspan x="" dy="0%">
            <xsl:call-template name="editable">
              <xsl:with-param name="id" select="'agentwbsite'" />
              <xsl:with-param name="default" select="'itzsold.com'" />
            </xsl:call-template>
          </tspan>
          <tspan x="" dy="0%" fill="#b0934c">•</tspan>
          <tspan x="" dy="0%">
            <xsl:call-template name="editable">
              <xsl:with-param name="id" select="'agentlicense'" />
              <xsl:with-param
                name="default"
                select="//agent[1]/marketingLicense"
              />
            </xsl:call-template>
          </tspan>
        </text>
        <line
          x1="75%"
          y1="84%"
          x2="95%"
          y2="84%"
          style="stroke: #b0934c; stroke-width: 2"
        ></line>
      </xsl:otherwise>
    </xsl:choose>
    <foreignObject x="5%" y="86%" width="80%" height="10%">
      <div>
        <p
          class="futura-text"
          style="
            line-height: 11px;
            color: #7c8994;
            font-size: 8px;
            text-align: justify;
            font-weight: 400;
            letter-spacing: -0.2;
          "
        >
          EXP Realty of California, Inc. Real Estate CA DRE #01878277. The
          information contained in this document, including, but not limited to,
          square footage and/or acreage, has been provided by various sources
          which may include the Seller, public records, the Multiple Listing
          Service or other sources. Broker has not and will not investigate or
          verify the accuracy of this information. @2021 Kaminsky Real Estate
          Group. All rights reserved under United States and international
          copyright conventions. No part of this informational document may be
          reproduced in any form or by any means without permission in writing
          from Kaminsky Real Estate Group. this document is authorized for
          viewing by the direct recipient(s) only; Unauthorized reproduction or
          distribution of this copyrighted work is illegal. Criminal copyright
          infringment, including infringement without monetary gain, is
          investigated by the FBI and is punishable by up to 5 years in prison
          and a fine of $250,000.
        </p>
      </div>
    </foreignObject>

    <image
      x="89%"
      y="88%"
      width="6%"
      height="6%"
      preserveAspectRatio="xMidYMin slice"
    >
      <xsl:attribute name="href">
        <xsl:value-of
          select="concat( //output/@siteUrl, '_assets/_img/agent-logo.png' )"
        />
      </xsl:attribute>
    </image>

    <xsl:call-template name="copyright" />
  </xsl:template>
</xsl:stylesheet>
