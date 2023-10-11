<?xml version="1.0"?>
<!--
	Asset Name:			Single Property Website - Simple
	Version:			1.0
	Tags:				Landing Page
	Sizes:				Landing Page
	Supports:			Listing
	Permission: 		Funnels
		Render Key:			landing-page/TheGenie-Property-Website-MLSNUMBER
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="landing-pages.xsl" />


	<xsl:template name="landing-page">
		<xsl:variable name="head-description">
			<xsl:value-of select="concat( 'The ', //area/name, ' market is shifting! View the latest market trends and grab your customized report now.' )" />
		</xsl:variable>

		<xsl:variable name="pageTitle">
<xsl:call-template name="listing-address-line-one" />

			<xsl:text>,&#160;</xsl:text>
<xsl:call-template name="listing-address-line-two" />

		</xsl:variable>

		<xsl:variable name="listing-caption">
			<xsl:choose>
				<xsl:when test="number(//single/statusTypeID) = 2">
					<xsl:text>Sold</xsl:text>
				</xsl:when>
				<xsl:when test="number(//single/statusTypeID) = 1">
					<xsl:text> Active </xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text> Pending </xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:call-template name="standard-header">
			<xsl:with-param name="title" select="concat( 'Get Customized Market Report for ', //area/name )" />
			<xsl:with-param name="description" select="$head-description" />
			<xsl:with-param name="seoImage" select="//single/photoPrimary" />
			<xsl:with-param name="secondaryCSS" select="'single-property-website-simple'" />
		</xsl:call-template>

		<body>
			<xsl:attribute name="class">
				<xsl:value-of select="//output/@theme" />
			</xsl:attribute>
			<script>
				<xsl:value-of select="concat( &quot;const listing = [{caption: 'HH', state:'&quot;, //single/listingStatus, &quot;',lat:&quot;, //single/latitude, &quot;,lng:&quot;, //single/longitude, &quot;}]; &quot; )" />
				<xsl:value-of select="concat( &quot;const options = { mapStyle: `&quot;, //output/@mapStyle, &quot;`, zoom: 21, center: { lat:&quot;, //single/latitude, &quot;,lng:&quot;, //single/longitude, &quot;}}; &quot; )" />
				<xsl:value-of select="'document.addEventListener( `genie-landing-loaded`, function() { window.gg.makeMap( `genie-map`, options, { listings:listing } ); });'" />
			</script>
			<div class="single-property-website-simple background">
				<div class="main-banner-section">
					<xsl:attribute name="style">
<xsl:value-of select="concat( 'background-image: url(', $primaryImage, ')' )" />

					</xsl:attribute>

					<div class="banner-content-box">
						<h1 class="main-heading heading-fontt">
<xsl:call-template name="listing-address-line-one" />

						</h1>
						<p class="body-font property-address">
<xsl:call-template name="listing-address-line-two" />

						</p>
					</div>
				</div>
				<section class="offered-section" id="overview">
					<div class="container">
						<div class="row">
							<div class="col-md-12">
								<div class="offered-box">
									<h2 class="property-price heading-font heading-color editable">
										<xsl:choose>
											<xsl:when test="number(//single/statusTypeID)=2">
												<span class="span-text">Sold for</span>
												<br/>
												<xsl:value-of select="concat('$',format-number( //single/salePrice, '###,###') )" />
											</xsl:when>
											<xsl:otherwise>
												<span class="span-text">List for</span>
												<br/>
												<xsl:value-of select="concat('$',//single/price)" />
											</xsl:otherwise>
										</xsl:choose>
									</h2>
								</div>
							</div>
						</div>
						<div class="row offered-row genie-module-outline">
							<div class="col-lg-3 col-md-6 col-sm-6 col-6 full-width">
								<div class="property-amenity-list">
									<span class="count body-font subtitle-color">
<xsl:value-of select="//single/bedrooms/@count" />

									</span>
									<span class="amenity-name body-font subtitle-color">Beds</span>
								</div>
							</div>
							<div class="col-lg-3 col-md-6 col-sm-6 col-6 full-width">
								<div class="property-amenity-list">
									<span class="count body-font subtitle-color">
<xsl:value-of select="$listingTotalBathrooms" />

									</span>
									<span class="amenity-name body-font subtitle-color">Baths</span>
								</div>
							</div>
							<div class="col-lg-3 col-md-6 col-sm-6 col-6 full-width">
								<div class="property-amenity-list">
									<span class="count body-font subtitle-color">
<xsl:value-of select="//single/squareFeet" />

									</span>
									<span class="amenity-name body-font subtitle-color">SQFT</span>
								</div>
							</div>
							<div class="col-lg-3 col-md-6 col-sm-6 col-6 full-width">
								<div class="property-amenity-list">
									<span class="count body-font subtitle-color">44431</span>
									<span class="amenity-name body-font subtitle-color">SF LOT</span>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="property-description-box body-font body-color editable">
									<xsl:copy-of select="//single/description" />
								</div>
							</div>
						</div>
					</div>
				</section>
				<section class="gallery-section">
					<div class="property-gallery row lightgallery editable">
						<xsl:call-template name="gallery" />
					</div>
				</section>
				<section class="amenity-section" id="amenities">
					<div class="container">
						<div class="row">
							<div class="col-md-12">
								<div class="title-box">
									<h2 class="heading-font heading-color">Amenities</h2>
									<div class="line-separtor">
										<span class="septr separtor-line1 genie-module-outline"></span>
										<span class="septr-dot genie-module-outline"></span>
										<span class="septr separtor-line1 genie-module-outline"></span>
									</div>
								</div>
								<div class="amenities-list-box genie-module-outline">
									<ul class="amenities-list subtitle-color">
										<li class="body-font">Horse Trails</li>
										<li class="body-font">Central Forced Air</li>
										<li class="body-font"> Zoned Area(s)</li>
										<li class="body-font">Horse Allowed</li>
										<li class="body-font"> Horse Facilities</li>
										<li class="body-font">On-Site Parking</li>
										<li class="body-font">Gated</li>
										<li class="body-font">Below Ground</li>
										<li class="body-font"> Private</li>
										<li class="body-font">Gated Community</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</section>
				<xsl:call-template name="agent-about" />
				<div class="row contact-form-row">
					<div class="col-md-6">
						<div class="title-box">
							<h4 class="samll-gray-text subtitle-color">Connect</h4>
							<h2 class="heading-font heading-color">Get in Touch</h2>
							<div class="line-separtor">
								<span class="septr separtor-line1"></span>
								<span class="septr-dot"></span>
								<span class="septr separtor-line1"></span>
							</div>
						</div>
						<div class="contact-form-box">
							<form id="form_step1" class="funnel-create-lead" data-callback="simple_listing_step1">
								<div class="form-group">
<input type="text" name="fullName" placeholder="Name*" class="heading-font" />

								</div>
								<div class="form-group">
<input type="email" name="emailAddress" placeholder="Email*" class="heading-font" />

								</div>
								<div class="form-group">
<input type="text" name="phoneNumber" placeholder="Phone*" class="heading-font phone" id="phonenumber" />

								</div>
								<div class="form-group">
									<textarea name="note" placeholder="Message" class="heading-font form-control" cols="60" rows="5">
										&#160;</textarea>
								</div>
								<div class="form-group">

									<div class="fl-btn-value">
										<button class="btn btn-value-info heading-font heading-color-as-bg background-as-color btn-submit step1-button">
											<span class="editable">
                                            Send Inquiry </span>
										</button>
									</div>
								</div>
							</form>
							<div class="address genie-module-heading-color-as-bg background-as-color heading-color-as-bg">
								<p class="genie-module-heading-font genie-module-background-as-color">
									<strong>7844 Vista Lazanja</strong>
									<sapn class="address-divider genie-module-background"></sapn>
									<span>San Diego, CA 92127</span>
								</p>
							</div>
						</div>
					</div>
				</div>
				<div id="genie-map" style="height:370px;" />
			</div>
		</body>
	</xsl:template>
</xsl:stylesheet>
