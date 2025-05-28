<?xml version="1.0"?>
<!--
Asset Name:	Multi-Step Area/Listing Command
Size:		Landing Page
Tags:		Listing Command, Area Command
Supports:	Collection	
Version:	1.1
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0">
	<xsl:import href="listing-commands.xsl" />

	<xsl:template name="template-folders">
		<xsl:value-of select="'[`Step One:`, `Step Two`]'" />
	</xsl:template>
	
	<xsl:template name="asset-box">
		<xsl:param name="asset" />

		<div class="asset-container">
			<xsl:attribute name="data-title">
				<xsl:value-of select="$asset/@name" />
			</xsl:attribute>

			<xsl:attribute name="data-renderkey">
				<xsl:value-of select="$asset/@renderKey" />
			</xsl:attribute>

			<xsl:if test="$asset/@pageCount!=''">
				<xsl:attribute name="data-pagecount">
					<xsl:value-of select="$asset/@pageCount" />
				</xsl:attribute>
			</xsl:if>

			<h4>
				<span class="rendering-spinner">
					<xsl:comment/>
				</span>
			</h4>	
		</div>
	</xsl:template>


	<xsl:template name="listing-command">
		<xsl:variable name="description">
			<xsl:call-template name="overridable">
				<xsl:with-param name="id" select="'seo-description'" />
				<xsl:with-param name="default" select="''" />
			</xsl:call-template>
		</xsl:variable>

		<xsl:call-template name="standard-header">
			<xsl:with-param name="description">
				<xsl:choose>
					<xsl:when test="$hasMultipleAgents">
						<xsl:value-of select="concat(//agent[1]/firstName, ' ', //agent[1]/lastName, $apos, 's', ' &amp; ', //agent[2]/firstName, ' ', //agent[2]/lastName, $apos, 's')" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat( //agent[1]/firstName, ' ', //agent[1]/lastName, $apos, 's' )" />
					</xsl:otherwise>
				</xsl:choose>
				<xsl:value-of select="concat( //collection/@name, ' ', 'for', ' ' )" />
				<xsl:value-of select="concat($listingAddressLine1, ' ', 'in' , ' ' , //area/name, 'on')" />
				
				<xsl:value-of select="//openHouse/session[1]/@dow" />, 
				<xsl:value-of select="//openHouse/session[1]/@month" /> 
				<xsl:value-of select="//openHouse/session[1]/@date" />
				<xsl:variable name="date" select="number(//openHouse/session[1]/@date)" />
				<xsl:choose>
					<xsl:when test="$date mod 10 = 1 and $date != 11">st</xsl:when>
					<xsl:when test="$date mod 10 = 2 and $date != 12">nd</xsl:when>
					<xsl:when test="$date mod 10 = 3 and $date != 13">rd</xsl:when>
					<xsl:otherwise>th</xsl:otherwise>
				</xsl:choose>
				<xsl:text> • </xsl:text>
				<xsl:value-of select="//openHouse/session[1]/@starts" /> - 
				<xsl:value-of select="//openHouse/session[1]/@ends" />
                                    
			</xsl:with-param>
			<!-- <xsl:with-param name="title">
				<xsl:choose>
					<xsl:when test="not(//single)">
						<xsl:value-of select="concat( //areas/area[1]/name, ' &#124; ' ,//agent[1]/marketingName, ' ' , //agent[1]/address/company )" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat( $listingAddressLine1, ', ' , $listingAddressLine2, ' &#124; ' , //agent[1]/marketingName, ' ' , //agent[1]/address/company )" />
						<xsl:value-of select="concat( $listingAddressLine1, ', ' , $listingAddressLine2, ' &#124; ' , //agent[1]/marketingName, ' ' , //agent[1]/address/company )" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:with-param> -->
			<xsl:with-param name="title" select="concat( //collection/@name, ' ', ' &#124; ', 'Powered by TheGenie.ai' )" />
		</xsl:call-template>

		<body class="marketing-steps">
			<link href="https://fonts.googleapis.com" rel="preconnect" />
			<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;700&amp;display=swap" rel="stylesheet" />
			
			<!-- Futura Font -->
			<link rel="stylesheet">
				<xsl:attribute name="href">
					<xsl:value-of select="'/_assets/_css/futura-embedded.css'" />
				</xsl:attribute>
			</link>

			<link rel="stylesheet">
				<xsl:attribute name="href">
					<xsl:value-of select="'/_assets/_css/helvetica-neue.css'" />
				</xsl:attribute>
			</link>

			<link rel="stylesheet">
				<xsl:attribute name="href">
					<xsl:value-of select="'/_assets/listing-commands/css/marketing-steps-lc1.css'" />
				</xsl:attribute>
			</link>

			<script type="module" crossorigin="crossorigin" src="/_assets/listing-commands/js/common.js">
				<xsl:value-of select="';'" />
			</script>

			<main>
				<div class="landing-page-banner">					
					<xsl:attribute name="style">
						<xsl:if test="$primaryImageNoDefault != ''">
							<xsl:value-of select="concat( 'background-image: url(', $primaryImageNoDefault, ')' )" />
						</xsl:if>
					</xsl:attribute>

					<xsl:if test="not(//single)">
						<!-- Is Area Command -->
						<xsl:variable name="arrow" select="'=>'" />
						<script>
							<xsl:value-of select="concat('const polygon =', //area[1]/geojson,';' )" />
							<xsl:value-of select="concat('const options = { mapStyle: `', //output/@mapStyle,'`, zoom: 17 };' )" />
							<xsl:value-of select="concat( 'window.ghUrl = `', //output/@siteUrl, '_assets`; ' )" />
							<xsl:value-of disable-output-escaping="yes" select="'document.addEventListener( `genie-landing-loaded`, function() { return window.gHub.makeMap( `genie-map`, options, { geoJson: polygon } ); })'" />
						</script>
						<div id="genie-map" style="width:100vw;height:100%;position:absolute;top:0;">
							<xsl:comment />
						</div>

						<script async="async" src="{concat( //output/@siteUrl, '_assets/landing-pages/_global.js' )}">
							<xsl:comment><!-- Genie Global JS --></xsl:comment>
						</script>

					</xsl:if>

					<div class="container">
						<div class="company-logo">
							<xsl:if test="//agent[1]/personalLogoDark != ''">
                                <img title="Company Logo">
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="//agent[1]/personalLogoDark" />
                                    </xsl:attribute>
                                </img>
                            </xsl:if>
						</div>	
						<h1>
							<span>
								<!--<xsl:value-of select="concat( //agent[1]/firstName, $apos, 's' )" />-->
								<xsl:choose>
									<xsl:when test="$hasMultipleAgents">
										<xsl:value-of select="concat(//agent[1]/firstName, ' ', //agent[1]/lastName, $apos, 's', ' &amp; ', //agent[2]/firstName, ' ', //agent[2]/lastName, $apos, 's')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="concat( //agent[1]/firstName, ' ', //agent[1]/lastName, $apos, 's' )" />
									</xsl:otherwise>
								</xsl:choose>
							</span>
							<br/>
							<xsl:call-template name="overridable">
								<xsl:with-param name="id" select="'page-title'" />
								<xsl:with-param name="default" select="//collection/@name" />
							</xsl:call-template>
						</h1>
						<xsl:if test="$listingAddressLine1 !=''">
							<div class="address">
								<p>
									<xsl:value-of select="//area/name" />
								<br/>
									<xsl:value-of select="$listingAddressLine1" />
									<xsl:if test="count(//openHouse/session) &gt; 0">
                                        <xsl:value-of select="concat(
                                        ' • ', //openHouse/session[1]/@dow, ', ',
                                        //openHouse/session[1]/@month, ' ',
                                        //openHouse/session[1]/@date,
                                        ' • ', //openHouse/session[1]/@starts, ' - ',
                                        //openHouse/session[1]/@ends
                                        )" />
                                    </xsl:if>
								</p>
								
							</div>
						</xsl:if>
						<div class="genie-logo">
							<span>Powered by: </span>
							<image title="The Genie AI" preserveAspectRatio="xMidYMid slice" src="/_assets/_img/genie-logo-1.png" />
						</div>	
					</div>					
				</div>

				<section>
					<div class="container">
						<xsl:choose>
							<xsl:when test="$hasMultipleAgents">
								<div class="agent-profiles multi-agent">
									<div class="partner-agent">
										<img>
											<xsl:attribute name="src">
												<xsl:copy-of select="//agent[1]/photo" />
											</xsl:attribute>
										</img>
									</div>
									<div class="partner-agent">
										<img>
											<xsl:attribute name="src">
												<xsl:copy-of select="//agent[2]/photo" />
											</xsl:attribute>
										</img>
									</div>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="agent-profiles">
									<div class="partner-agent">
										<img>
											<xsl:attribute name="src">
												<xsl:copy-of select="//agent[1]/photo" />
											</xsl:attribute>
										</img>
									</div>
								</div>
							</xsl:otherwise>
						</xsl:choose>	
					</div>
				</section>

				<xsl:for-each select="//collection/sections/section">
					<xsl:sort select="number(@sort)" data-type="number" order="ascending" />
					<xsl:sort select="@name" />
					
					<!-- Capture position -->
					<xsl:variable name="pos" select="position()" />

					<!-- Section Output -->
					<div class="container section assets-steps">
						<div class="section-heading">
														 
							<xsl:if test="number(@sort) = 1">
								<p class="steps-count"> Step one: </p>
							</xsl:if>

							<xsl:if test="number(@sort) = 2">
								<p class="steps-count"> Step two: </p>
							</xsl:if>
							
							<h2 class="steps-heading">
								<xsl:value-of select="@name" />
							</h2>

							<!-- <xsl:if test="@caption != ''">
								<h3>
									<xsl:value-of select="@caption" />
								</h3>
							</xsl:if> -->

							<xsl:if test="@description != ''">
								<p>
									<xsl:value-of select="@description" />
								</p>
							</xsl:if>

							<div class="golden-border">
								<span><xsl:comment/></span>
								<span><xsl:comment/></span>
							</div>

							<xsl:if test="@caption != ''">
								<p class="asset-box-title">
									<xsl:value-of select="@caption" />
								</p>
							</xsl:if>

						</div>

						<div class="section-grid">
							<!-- Loop over assets -->
							<xsl:for-each select="./asset">
								<xsl:sort select="number(@sort)" data-type="number" order="ascending" />
								<xsl:call-template name="asset-box">
									<xsl:with-param name="asset" select="." />
								</xsl:call-template>
							</xsl:for-each>

							<!-- Loop over docs -->
							<xsl:for-each select="./doc">
								<xsl:call-template name="asset-box">
									<xsl:with-param name="asset" select="." />
								</xsl:call-template>
							</xsl:for-each>
						</div>
					</div>

					<!-- Insert Open House Checklist after the FIRST section -->
					<xsl:if test="$pos = 1">
						<section class="open-house-checklist">
							<div class="container">
								<h1>
									<span class="text-gold">But wait, there’s more!</span>
									<br/>Don’t forget your open house checklist.
								</h1>
								<div class="arrow-container">
									<svg width="65px" height="75px" viewBox="0 0 21 21"
										xmlns="http://www.w3.org/2000/svg">
										<g fill="none" fill-rule="evenodd" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" transform="translate(6 4)">
											<path d="m.5 9.499 4 4.001 4-4.001"></path>
											<path d="m4.5.5v13" transform="matrix(-1 0 0 -1 9 14)"></path>
										</g>
									</svg>
									<svg width="65px" height="75px" viewBox="0 0 21 21"
										xmlns="http://www.w3.org/2000/svg">
										<g fill="none" fill-rule="evenodd" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" transform="translate(6 4)">
											<path d="m.5 9.499 4 4.001 4-4.001"></path>
											<path d="m4.5.5v13" transform="matrix(-1 0 0 -1 9 14)"></path>
										</g>
									</svg>
									<svg width="65px" height="75px" viewBox="0 0 21 21"
										xmlns="http://www.w3.org/2000/svg">
										<g fill="none" fill-rule="evenodd" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" transform="translate(6 4)">
											<path d="m.5 9.499 4 4.001 4-4.001"></path>
											<path d="m4.5.5v13" transform="matrix(-1 0 0 -1 9 14)"></path>
										</g>
									</svg>
								</div>
							</div>	
						</section>
					</xsl:if>

					<!-- Insert Visitor Section after the SECOND section -->
					<xsl:if test="$pos = 2">
						<section class="visitor-sec">
							<div class="container">
								<h1>Every visitor signs in.<br/> Every time. No exceptions.</h1>
								<span class="up-arrow">↑</span>
								<p class="bordered-button">This isn't a button. Read the above again.</p>
							</div>	
						</section>
					</xsl:if>
				</xsl:for-each>


				<!-- footer -->
				<section>
					<div class="container">
						<div class="grid-col-3 marketing-footer">
							<div>
								<xsl:if test="//single/mlsNumber != ''">
									<p>
										<b>Property: </b>
										<xsl:value-of select="concat($listingAddressLine1, ' ', //single/address/city)" />
									</p>
									<p>
										<b>Hosted By:&#160;</b>
										<xsl:value-of select="//agent[1]/marketingName" />
									</p>
									<p>
										<b>Area Name:&#160;</b>
										<xsl:value-of select="//areas/area[1]/name" />
									</p>
									<p class="download-pdf-link">                       
										<a href="#" target="_blank"> About this collection
											<span class="link-icon">
												<svg width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg">
													<path d="M6.66665 0L8.86198 2.19533L4.19531 6.862L5.13798 7.80467L9.80465 3.138L12 5.33333V0H6.66665Z" fill="#195386"></path>
													<path d="M10.6667 10.6667H1.33333V1.33333H6L4.66667 0H1.33333C0.598 0 0 0.598 0 1.33333V10.6667C0 11.402 0.598 12 1.33333 12H10.6667C11.402 12 12 11.402 12 10.6667V7.33333L10.6667 6V10.6667Z" fill="#195386"></path>
												</svg>
											</span>
										</a>
									</p>									
								</xsl:if>
							</div>

							<div>
								<p>
									<b>Collection:&#160;</b>
									<xsl:value-of select="//collection/@name" />
								</p>
								<p>
									<b>Listing Agent: </b>
									<xsl:choose>
										<xsl:when test="//single/listingAgent != ''">
											<xsl:value-of select="//single/listingAgent" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="'n/a'" />
										</xsl:otherwise>
									</xsl:choose>
								</p>
								<p>
									<b>MLS: </b>
									<xsl:value-of select="//single/mlsNumber" />
								</p>
								<p class="download-pdf-link">                       
									<a href="#" target="_blank"> Marketing Kit
										<span class="link-icon">
											<svg width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg">
												<path d="M6.66665 0L8.86198 2.19533L4.19531 6.862L5.13798 7.80467L9.80465 3.138L12 5.33333V0H6.66665Z" fill="#195386"></path>
												<path d="M10.6667 10.6667H1.33333V1.33333H6L4.66667 0H1.33333C0.598 0 0 0.598 0 1.33333V10.6667C0 11.402 0.598 12 1.33333 12H10.6667C11.402 12 12 11.402 12 10.6667V7.33333L10.6667 6V10.6667Z" fill="#195386"></path>
											</svg>
										</span>
									</a>
								</p>

								
								<!-- <p>
									<b>Prepared For:&#160;</b>
									<xsl:value-of select="//agent[1]/marketingName" />
								</p> -->
								
							</div>

							<div>
								<p>
									<b>Created On:&#160;</b>
									<xsl:value-of select="genie:format-date( //collection/@assembled, '[M02]-[D]-[Y0001]' )" />
								</p>

								<p>
									<b>Open House Date:&#160;</b>
									<xsl:if test="count(//openHouse/session) &gt; 0">
                                        <xsl:value-of select="concat(
                                        //openHouse/session[1]/@month, ' ',
                                        //openHouse/session[1]/@date,
                                        ' • ', //openHouse/session[1]/@starts, ' - ',
                                        //openHouse/session[1]/@ends
                                        )" />
                                    </xsl:if>
									
								</p>
								
								<p>
									<b>Collection ID:&#160;</b>
									<xsl:value-of select="//collection/@id" />
								</p>
								<!-- <p>
									<b>Re-render this kit:&#160;</b>
									<a>
										<xsl:attribute name="href">
											<xsl:value-of select="concat( //output/@apiUrl, 're-render?renderId=', //collection/@id )" />
										</xsl:attribute>
										<xsl:text>Click to re-render</xsl:text>
									</a>
								</p> -->
							</div>
						</div>
					</div>	
				</section>
			</main>
		</body>

		<!-- <footer>
			<xsl:if test="$personalLogo!=''">
				<img>
					<xsl:attribute name="src">
						<xsl:value-of select="$personalLogo" />
					</xsl:attribute>
				</img>
			</xsl:if>
			<xsl:if test="$companyLogo!=''">
				<img>
					<xsl:attribute name="src">
						<xsl:value-of select="$companyLogo" />
					</xsl:attribute>
				</img>
			</xsl:if>
		</footer> -->
		<footer>
			<div class="container">
				<div class="grid-col-3 footer">
					<div>
						<p><b>Copyright © 2025</b> 1parkplace, Inc.. All rights reserved.</p>
					</div>
					<div class="footer-middle">
						<a href="#" target="_blank">TheGenie.ai.</a>
						
						<img class="footer-middle-img" src="/_assets/_img/made-with-love.png" alt="Made with Love in San Diego - pV, aV" />
						
						<p><strong>US Patent #:</strong> 10,713,325</p>
					</div>
					<div>
						<p><b>Power Tools</b> for your Real Estate Business!</p>
					</div>
				</div>
			</div>
		</footer>
	</xsl:template>
</xsl:stylesheet>												
