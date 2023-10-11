<?xml version="1.0"?>
<!--
	Asset Name:			KRG Market Insider
	Version:			1.0
	Tags:				Landing Page
	Sizes:				Landing Page
	Supports:			Area Funnel
	Permission: 		Funnels
		Default Download:	area-insider-reports/market-insider
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="landing-pages.xsl"/>
	<xsl:import href="landing-pages-market-insider.xsl"/>

	<xsl:template name="landing-page">
		<xsl:variable name="description">
			<xsl:value-of select="concat( 'The ', //area/name, ' market is shifting! View the latest market trends and grab your customized report now.' )" />
		</xsl:variable>

		<link rel="stylesheet">
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/landing-pages/css/krg-market-insider.css')"/>
		</link>
		<link rel="stylesheet">
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/futura-embedded.css')"/>
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
				<div class="container">
					<div class="navbar-header">
						<!-- <button type="button" class="navbar-toggle" id="mobileNaveButton" data-toggle="collapse" data-target="#myNavbar"> -->
						<!-- onclick ="toggleFunction()" -->
						<!-- <span class="icon-bar"><xsl:comment/></span>
							<span class="icon-bar"><xsl:comment/></span>
							<span class="icon-bar"><xsl:comment/></span>
						</button> -->
						<a class="navbar-brand" href="https://www.itzsold.com/">
							<image x="0%" y="0%">
								<xsl:attribute name="src">
									<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/kaminsky-logo.png' )" />
								</xsl:attribute>
							</image>
							<!-- <img src="https://myneighborhood.re/wp-content/themes/stuff-rentals/content-modules/funnels/kaminsky-market-insider/image/kaminsky-logo.png" /> -->
						</a>
					</div>
				</div>
			</nav>

			<div class="home-background">
				<div class="container">
					<div class=" title text-center">
						<h1 class="futura-text ">
							<xsl:text>Whoa, did you feel that?</xsl:text>
							<br />
							<xsl:text>Your home's price just changed.</xsl:text>
						</h1>
						<div class="title-button futura-text">
							<button type="button" class="btn home-button ml-3 fl-user-info button1 futura-text">WHAT'S MY HOME'S VALUE TODAY?</button>
							<button type="button" class="btn home-button button2 futura-text worth-me-btn" data-toggle="modal" data-target="#myModal" data-backdrop="static" data-keyboard="false">WHAT WILL IT BE WORTH TOMORROW?</button>
						</div>
					</div>
				</div>
			</div>

			<div class="session">
				<div class="container">
					<div class="first-part text-center">
						<p class="futura-text">FOR YOUR EYES ONLY:</p>
						<h1 class="futura-text">
							<xsl:text>Want the </xsl:text>
							<i>real</i>
							<xsl:text>34102?</xsl:text>
							<br />
							<xsl:text>Become an insider (but keep it to yourself).</xsl:text>
						</h1>
						<a download="TheGenie.ai-market-insider-report.pdf" class="js-download-report btn btn-primary futura-text genie-module-subtitle-color-as-bg genie-module-background-as-color genie-module-heading-font">
							<xsl:attribute name="href" select="//output/@downloadUrl" />
							<xsl:text>Download My Report </xsl:text>
							<i class="fa fa-long-arrow-right" aria-hidden="true"></i>
						</a>
					</div>
					<div class="second-part text-center futura-text">
						<h3 class="futura-text">Your custom (and free) 34102 report includes:</h3>
						<p>
							<span class="span-text">
								<xsl:value-of select="concat( 'Market prediction video from ', //agent[1]/marketingName )" />
							</span>
							<xsl:text>• Median sale price • Average sale price • Avg. sale price per square foot High sale price • Number of homes sold • Number of homes for sale • Maps of current, pending, sold homes Details of all currently-listed homes • Details of recently sold homes • Details of currently pending homes Avg. days on market • Avg. length of ownership • 12-month turn over rate</xsl:text>
						</p>
						<a download="TheGenie.ai-market-insider-report.pdf" class="js-download-report btn btn-primary futura-text genie-module-subtitle-color-as-bg genie-module-background-as-color genie-module-heading-font">
							<xsl:attribute name="href" select="//output/@downloadUrl" />
							<xsl:text>Download My Report </xsl:text>
							<i class="fa fa-long-arrow-right" aria-hidden="true"></i>
						</a>
					</div>
					<div class="footer futura-text">
						<div class="row">
							<div class="col-md-9">
								<p>
<xsl:value-of select="concat( //agent[1]/marketingName, ' CALIFORNIA DEPARTMENT OF REAL ESTATE ', //agent[1]/marketingLicense, ' &#124; EXP REALTY OF CALIFORNIA, INC. CALIFORNIA DEPARTMENT OF REAL ESTATE #01878277. THE INFORMATION CONTAINED IN THIS DOCUMENT, INCLUDING, BUT NOT LIMITED TO, SQUARE FOOTAGE AND/OR ACREAGE, HAS BEEN PROVIDED BY VARIOUS SOURCES WHICH MAY INCLUDE THE SELLER, PUBLIC RECORDS, THE MULTIPLE LISTING SERVICE OR OTHER SOURCES. BROKER HAS NOT AND WILL NOT INVESTIGATE OR VERIFY THE ACCURACY OF THIS INFORMATION.' )" />

								</p>
							</div>
							<div class="col-md-3 text-center">
								<image class="logo2" x="0%" y="0%">
									<xsl:attribute name="src">
										<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/kaminsky-footer-logo.png' )" />
									</xsl:attribute>
								</image>
							</div>
						</div>
					</div>
				</div>
				<div class="top-secret">
					<image x="0%" y="0%">
						<xsl:attribute name="src">
							<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/top-secret.png' )" />
						</xsl:attribute>
					</image>
				</div>

				<xsl:call-template name="agent-details" />
				<xsl:call-template name="copyright" />

				<!-- modal start -->
				<div class="modal fade contact-modal" id="contact-me" tabindex="-1" role="dialog" aria-labelledby="fl-thankyou-message" aria-hidden="false">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 490 490" data-dismiss="modal">
							<polygon fill="#000" stroke-width="40px" stroke="#000" points="11.387,490 245,255.832 478.613,490 489.439,479.174 255.809,244.996 489.439,10.811 478.613,0 245,234.161 11.387,0 0.561,10.811 234.191,244.996 0.561,479.174 "/>
						</svg>

						<div class="modal-content">
							<div class="modal-body">
								<div class="modal-background-img futura-text">
									<h1 class="modal_title futura-text">FILL YOUR DETAILS BELOW</h1>
									<p class="modal_subtitle futura-text">Our team will get in touch with you within 24 hours</p>
									<form class="funnel-create-lead futura-text">
										<input type="hidden" name="genieTags" value="ClickCta,RequestMoreInfo"/>

										<div class="form-group">
											<input type="text" placeholder="NAME*" name="fullName" class="form-control phone" id="name" required=""/>
										</div>
										<div class="form-group">
											<input type="email" placeholder="EMAIL*" name="emailAddress" class="form-control step1-input" id="email" />
										</div>
										<div class="form-group">
											<input type="text" placeholder="PHONE NUMBER*" name="phoneNumber" class="form-control step1-input" id="phonenumber" required=""/>
										</div>
										<div class="form-group">
											<input type="text" placeholder="HOME ADDRESS*" name="propertyAddress" class="form-control step1-input" id="propertyAddress" required=""/>
										</div>
										<div class="modal-checkbox">
											<div class="spn">
												<span style="color:#000;">Preferred contact*:</span>
											</div>
											<div class="che_box receive-type">
												<label class="futura-text">
													<input type="checkbox" name="preferred_contact" value="text"/>
													<xsl:text>Text</xsl:text>
												</label>
												<label>
													<input type="checkbox" class="futura-text" name="preferred_contact" value="email"/>
													<xsl:text>Email</xsl:text>
												</label>
											</div>
										</div>

										<div class="fl-btn-value text-center">
											<button class="btn btn-value-info widget heading-font heading-color-as-bg background-as-color">Submit</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- modal ends -->
			</div>

			<!-- Responsive Menu Code -->
			<style>
				<xsl:value-of select="'
					.modal.contact-modal .modal-content{
						background:#fff;
					}
					.modal.contact-modal .form-group input {
					    height: 40px;
					    border-radius: 0;
					    box-shadow: none;
					    border: 1px solid #000;
					    font-size: 16px;
					    color: #000;
					    background: transparent;
					}
					.modal.contact-modal .form-group input:focus{
						border: 1px solid #000;
					}
					.modal.contact-modal .form-group input::placeholder{
						color: #999;
					}
					.modal.contact-modal svg {
						width: 15px;
						position: absolute;
						top: 17px;
						right: 20px;
						stroke-width: 25;
						cursor: pointer;
						z-index: 1;
					}
					.modal.contact-modal .modal-checkbox .spn {
					    margin-right: 15px !important;
					    text-transform: capitalize;
					    margin-top: 0;
					    margin-bottom: 0;
					    font-size: 14px;
					    color: #333;
					}
					.modal.contact-modal .modal-checkbox {
					    display: flex;
					    justify-content: center;
					    margin-bottom: 15px;
					}
					.modal.contact-modal .modal-checkbox label {
					    margin-right: 15px;
					    margin-bottom: 0px;
					    text-transform: uppercase;
					    font-weight: 500;
					    cursor: pointer;
					    color: #333;
					    font-size:14px;
					}
					.modal.contact-modal .modal-checkbox input[type=&quot;checkbox&quot;] {
					    width: 15px;
					    height: 15px;
					    cursor: pointer;
					    background: transparent;
					    margin: 0 5px;
					    accent-color: unset;
					   	position: relative;
					    top: 2px;
					    left: 0;
					}

					@media only screen and (max-width: 768px){
						nav.navbar.navbar-inverse .collapse {
    						display: block !important;
						    transform: translateX(0%) !important;
							position:relative;
							z-index:999;
						}
						nav.navbar.navbar-inverse{
							z-index:999
						}
						#mobileNave {
            		    display: none;
            		    width: 100%;
            		    padding: 20px 0;
            		    background-color: #222;
						margin-top:55px
            			}
						.navbar-nav, .navbar-nav > li {
    						padding: 5px;
						}
						body .navbar li a{
    						font-size:16px !important;
						}
					}'"/>
			</style>
			<script>
				<xsl:value-of select="'
            		function toggleFunction() {
            		    var mbtn = document.getElementById(`mobileNave`);
            		   
            		    if (mbtn.style.display === `none`) {
            		        mbtn.style.display = `block`;
            		    } else {
            		        mbtn.style.display = `none`;
            		    } 
            		}

            		document.querySelector(`.worth-me-btn`).addEventListener(`click`, function() {
                    		document.querySelector(`#contact-me`).style.display = `block`;
                     		document.querySelector(`#contact-me`).classList.add(`in`);
                	})        

	                document.querySelector(`#contact-me svg`).addEventListener(`click`, function() {
	                     document.querySelector(`#contact-me`).style.display = `none`;
	                      document.querySelector(`#contact-me`).classList.remove(`in`);
	                });'"/>
			</script>
		</body>
	</xsl:template>
</xsl:stylesheet>