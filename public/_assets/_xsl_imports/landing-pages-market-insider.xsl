<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">

	<xsl:template name="download-button">
		<xsl:param name="hasCustomPopup" select="'false'" />

		<xsl:variable name="link">
			<xsl:choose>
				<xsl:when test="//output/@isLeadCapture!='false'">
					<xsl:value-of select="'#'" />
				</xsl:when>
				<xsl:when test="//output/@downloadUrl!=''">
					<xsl:value-of select="//output/@downloadUrl" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="//agent[1]/website" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<div class="get-my-report-info-btn">
			<a class="btn subtitle-color-as-bg background-as-color heading-font" data-genie-tags="DownloadMarketReport,ClickCta">
				<xsl:attribute name="href">
					<xsl:value-of select="$link" />
				</xsl:attribute>
				<xsl:if test="//output/@isLeadCapture!='false'">
					<xsl:attribute name="data-download-url">
						<xsl:choose>
							<xsl:when test="//output/@downloadUrl!=''">
								<xsl:value-of select="//output/@downloadUrl" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="//agent[1]/website" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</xsl:if>

				<xsl:if test="//output/@isLeadCapture='false'">
					<xsl:attribute name="target">
						<xsl:value-of select="'_blank'" />
					</xsl:attribute>
				</xsl:if>

				<xsl:text>Download My Report</xsl:text>

				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 512 512" style="margin-left: 10px;" class="background-svg">
					<path d="M313.941 216H12c-6.627 0-12 5.373-12 12v56c0 6.627 5.373 12 12 12h301.941v46.059c0 21.382 25.851 32.09 40.971 16.971l86.059-86.059c9.373-9.373 9.373-24.569 0-33.941l-86.059-86.059c-15.119-15.119-40.971-4.411-40.971 16.971V216z" />
				</svg>
			</a>
		</div>

		<xsl:if test="$hasCustomPopup='false'">
			<xsl:call-template name="download-report" />
		</xsl:if>
	</xsl:template>

	<xsl:template name="download-report">
		<div id="download-report" class="popup-dialog">
			<div class="heading-font heading-color">
				<button class="close-popup" style="position:absolute;top:0.25rem;right:1rem;font-size:150%;border-style:none;padding:0;margin:0;color:var(--theme-body-color);background-color:transparent; cursor:pointer;">×</button>
				<div class="modal-header">
					<h2 style="margin: 2rem 3rem;">Just a step away, enter your details to download the report</h2>
				</div>
				<div>
					<div class="modal-body body-color" style="margin: 1rem; text-align: left;">
						<label for="popup-email" style="font-weight: bold;">Email *</label>
						<input type="email" name="contact_email" id="popup-email" value="" />
						<em id="popup-valid-email" style="font-size:80%;color:red;display:none;">Please enter a valid email address</em>
						<em style="font-size: 80%;">* we keep your email private, no one else gets to see it</em>
					</div>
					<button id="download-report-submit">Submit</button>
				</div>
			</div>
		</div>
	</xsl:template>

	<xsl:template name="interested-button">
		<div class="background">
			<section class="home-value-request-for-report">
				<div class="container">
					<div class="row">
						<div class="col-md-12 text-center">
							<div class="home-value-other-text-info">
								<div class="home-value-knowning-info heading-font heading-color">
									<p id="home-value-knowning-info" class="editable" data-default="Interested in knowing your home's TRUE value?">Interested in knowing your home's TRUE value?</p>
								</div>
								<a href="#" class="request-home-value subtitle-color-as-bg background-as-color">
									<div class="heading-font btn-content-info editable">Yes, I'm interested!</div>
								</a>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</xsl:template>

	<xsl:template name="title-section">
		<div class="fl-listing-wrapper">
			<h1 class="main-title-info heading-font background-as-color" data-key="funnel_title_area_info" data-type="text" data-default="Anaheim Hills Market Report Instant&#160;Download">
				<xsl:value-of select="concat( 'Get Customized Market Report for ', //area/name, ' ', $propertyType )" />
			</h1>

			<p class="background-as-color opening-text">
				<xsl:value-of select="concat('The ', //area/name, ' ', lower-case( $singularPropertyType ), ' market is shifting! View the latest market trends and grab your customized report now.')" />
			</p>

			<h4 class="body-font background-as-color fw-500">INCLUDES:</h4>

			<ul class="fl-listing body-font background-as-color">
				<li>Average Sales Price</li>
				<li>Average List Price to Sales Price %</li>
				<li>Average Price Per Square Foot</li>
				<li>Number of Sales by Bedrooms</li>
				<li>Active and New Listings</li>
			</ul>

			<xsl:call-template name="download-button" />
		</div>
	</xsl:template>
</xsl:stylesheet>
