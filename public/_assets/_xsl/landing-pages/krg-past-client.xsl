<?xml version="1.0"?>
<!--
	Asset Name:			KRG Past Client
	Version:			1.0
	Tags:				Landing Page
	Sizes:				Landing Page
	Supports:			Area Funnel
	Permission: 		Funnels
		Default Download:	area-insider-reports/market-insider
	Render Key:			landing-page/TheGenie-Instant-Download-v6-AREASLUG
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="landing-pages.xsl"/>

	<xsl:import href="landing-pages-market-insider.xsl"/>

	<xsl:template name="landing-page">
		<xsl:variable name="description">
			<xsl:value-of select="concat( 'The ', //area/name, ' market is shifting! View the latest market trends and grab your customized report now.' )" />
		</xsl:variable>

		<link rel="stylesheet">
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/futura-embedded.css')"/>
		</link>
		<link rel="stylesheet">
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/landing-pages/css/krg-past-client.css')"/>
		</link>
		<link rel="stylesheet">
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/landing-pages/css/market-insider-common.css')"/>
		</link>

		<xsl:call-template name="standard-header">
			<xsl:with-param name="title" select="concat( 'Market-Insider Report: Instant Download for ', //area/name )" />
			<xsl:with-param name="description" select="$description" />
			<xsl:with-param name="secondaryCSS" select="'market-insider-instant-download-v1'" />
		</xsl:call-template>

		<body>
			<xsl:attribute name="class">
				<xsl:value-of select="concat( 'funnel-market-insider-instant-download ', //output/@theme )" />
			</xsl:attribute>
			<nav class="navbar navbar-inverse">
				<div class="container-fluid">
					<div class="navbar-header">
						<button onclick="toggleFunction()" type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
							<span class="icon-bar">
								<xsl:comment/>
							</span>
							<span class="icon-bar">
								<xsl:comment/>
							</span>
							<span class="icon-bar">
								<xsl:comment/>
							</span>
						</button>
						<a class="navbar-brand" href="https://www.itzsold.com/">
							<image x="0%" y="0%">
								<xsl:attribute name="src">
									<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/ed-logo.png' )" />
								</xsl:attribute>
							</image>
						</a>
					</div>
					<div class="collapse navbar-collapse" id="myNavbar">
						<ul class="nav navbar-nav navbar-right futura-text" id="mobileNave">
							<li>
								<a href="https://www.itzsold.com/" target="_blank">HOME</a>
							</li>
							<li>
								<a href="https://www.itzsold.com/featured-listing" target="_blank">BUY</a>
							</li>
							<li>
								<a href="https://www.itzsold.com/sell" target="_blank">SELL</a>
							</li>
							<li>
								<a href="https://www.itzsold.com/manhattan-beach-real-estate/11217980/manhattan-beach" target="_blank">NEIGHBORHOODS</a>
							</li>
							<li>
								<a href="https://www.itzsold.com/about" target="_blank">ABOUT</a>
							</li>
							<li>
								<a href="https://www.itzsold.com/agents" target="_blank">AGENT</a>
							</li>
							<li>
								<a href="https://www.itzsold.com/snapshot" target="_blank">MARKET SNAPSHOT</a>
							</li>
							<li>
								<a href="https://www.itzsold.com/contact" target="_blank">CONTACT US</a>
							</li>
						</ul>
					</div>
				</div>
			</nav>
			<div class="home-background">
				<div class="container">
					<div class="row">
						<div class="col-12">
							<div class="first-part text-center">
								<p class="futura-text">FOR PAST CLIENTS ONLY:</p>
								<h1 class="futura-text">
									<xsl:text>We’ve been expecting you.</xsl:text>
									<br/>
									<xsl:text>Guard this data with your life.</xsl:text>
								</h1>
<a href="https://myneighborhood.re/wp-content/uploads/2022/10/TheGenie.ai-market-insider-report-for-homes-1665722047.pdf" download="TheGenie.ai-market-insider-report.pdf" class="js-download-report btn btn-primary genie-module-subtitle-color-as-bg genie-module-background-as-color  genie-module-heading-font">MARKET INSIDER &#124; DOWNLOAD NOW</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="comprehensive">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="second-part text-center futura-text">
								<h3 class="text-white">
									<span>Warning: </span>
									<xsl:text>This comprehensive report includes:</xsl:text>
								</h3>
								<p class="text-white">
									<strong>
										<xsl:value-of select="concat( 'Video intro from Security Chief ', //agent[1]/marketingName )"/>
									</strong>
									<xsl:text> • Median sale price • Average sale price • Avg. sale price per square foot High sale price • Number of homes sold • Number of homes for sale • Maps of current, pending, sold homes Details of all currently-listed homes • Details of recently sold homes • Details of currently pending homes Avg. days on market • Avg. length of ownership • 12-month turn over rate</xsl:text>

<a href="https://myneighborhood.re/wp-content/uploads/2022/10/TheGenie.ai-market-insider-report-for-homes-1665722047.pdf" download="TheGenie.ai-market-insider-report.pdf" class="js-download-report btn btn-primary genie-module-subtitle-color-as-bg genie-module-background-as-color  genie-module-heading-font">MARKET INSIDER &#124; DOWNLOAD NOW</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="session">
				<div class="container futura-text">
					<div class="row">
						<div class="col-md-12">
							<div class="text-center first-part">
								<p class="futura-text text-white">JUST INTERCEPTED:</p>
								<h1 class="futura-text text-white">
									<xsl:text>According to our informant,</xsl:text>
									<br/>
									<xsl:text>your home’s price just changed.</xsl:text>
								</h1>
								<button type="button" class="btn futura-text sec-btn fl-user-info">WHAT’S MY HOME’S VALUE TODAY?</button>
							</div>
						</div>
					</div>

					<div class="row mt-150">
						<div class="col-md-9 footer">
							<p class="text-white">
<xsl:value-of select="concat( //agent[1]/marketingName, ' CALIFORNIA DEPARTMENT OF REAL ESTATE ', //agent[1]/marketingLicense, ' &#124; EXP REALTY OF CALIFORNIA, INC. CALIFORNIA DEPARTMENT OF REAL ESTATE #01878277. THE INFORMATION CONTAINED IN THIS DOCUMENT, INCLUDING, BUT NOT LIMITED TO, SQUARE FOOTAGE AND/OR ACREAGE, HAS BEEN PROVIDED BY VARIOUS SOURCES WHICH MAY INCLUDE THE SELLER, PUBLIC RECORDS, THE MULTIPLE LISTING SERVICE OR OTHER SOURCES. BROKER HAS NOT AND WILL NOT INVESTIGATE OR VERIFY THE ACCURACY OF THIS INFORMATION.' )"/>

							</p>
						</div>
						<div class="col-md-3 text-center">
							<image x="0%" y="0%" class="logo2">
								<xsl:attribute name="src">
									<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/kaminskylogo2.png' )" />
								</xsl:attribute>
							</image>
							<image x="0%" y="0%" class="logo1">
								<xsl:attribute name="src">
									<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/explogo1.png' )" />
								</xsl:attribute>
							</image>
						</div>
					</div>
				</div>
			</div>

			<div class="funnel-footer-background">
				<xsl:call-template name="agent-details" />
				<xsl:call-template name="copyright" />
			</div>

			<script>
				<xsl:value-of select="'
				function toggleFunction() {
					var mbtn = document.getElementById(`mobileNave`);
					if (mbtn.style.display === `block`) {
						mbtn.style.display = `none`;
					} else {
						mbtn.style.display = `block`;
					}
				}'"/>
			</script>
		</body>
	</xsl:template>
</xsl:stylesheet>												
