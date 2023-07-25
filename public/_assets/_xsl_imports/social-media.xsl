<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:preserve-space elements="*" />

	<xsl:template name="social-caption">
		<xsl:value-of select="concat( 'Zillow CAN&#8217;T show you this.', '' )" />

	</xsl:template>

	<xsl:template name="social-ad-name">
		<xsl:value-of select="concat( genie:format-date( number(//output/@reportDate), '[MNn]' ), ' ', //area/name, ' Lead Gen' )" />
	</xsl:template>

	<xsl:template name="social-cta">
		<xsl:value-of select="'Get YOUR Insider Report'" />
	</xsl:template>

	<xsl:template name="social-sub-title">
		<xsl:value-of select="'COMPLIMENTARY instant DOWNLOAD'" />
	</xsl:template>

	<xsl:template name="social-button-caption">
		<div class="fa-button">
			<span data-msg="social-post" data-name="ctaButton">
				<xsl:value-of select="'Download'" />
			</span>
		</div>
	</xsl:template>

	<xsl:template name="social-header">
		<div id="editor" style="width:100%;height:100%;background-color:#fff;display:flex;align-items:center;">
			<div class="facebook-share-simulator">
				<div class="facebook-share-header">
					<div class="facebook-share-simulator-profile">
						<div class="profile-img">
							<img>
								<xsl:attribute name="src">
									<xsl:value-of select="//agent[1]/photo" />

								</xsl:attribute>
							</img>
						</div>
						<div class="profile-title">
							<h5 style="margin:0;">
								<xsl:value-of select="//agent[1]/marketingName" />

								<span style="float:right;">...</span>
							</h5>
							<h6 style="margin:0;">
								<span>22 hrs - </span>
							</h6>
						</div>
					</div>
					<div id="facebook-message">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'caption'" />
							<xsl:with-param name="data-element" select="'p'" />
							<xsl:with-param name="data-msg" select="'true'" />
							<xsl:with-param name="default">
								<xsl:call-template name="social-caption" />
							</xsl:with-param>
						</xsl:call-template>
					</div>
				</div>

				<div class="facebook-share-img">
					<xsl:attribute name="style">
						<xsl:choose>
							<xsl:when test="//output/@isSimulator='facebook-ad'">
								<xsl:value-of select="'height:460px;'" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="'height:550px;'" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>

					<xsl:call-template name="svg-wrapper" />
				</div>

				<xsl:if test="//output/@isSimulator='facebook-ad'">
					<div class="facebook-ad-simulator">
						<span style="display:none;" data-msg="social-post" data-name="adName">
							<xsl:call-template name="social-ad-name"/>
						</span>
						<h2 class="facebook-title">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'adCTA'" />
								<xsl:with-param name="data-element" select="'span'" />
								<xsl:with-param name="data-msg" select="'true'" />
								<xsl:with-param name="default">
									<xsl:call-template name="social-cta" />
								</xsl:with-param>
							</xsl:call-template>
						</h2>

						<xsl:call-template name="social-button-caption" />

						<h4 class="facebook-description">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'adSubTitle'" />
								<xsl:with-param name="data-element" select="'span'" />
								<xsl:with-param name="data-msg" select="'true'" />
								<xsl:with-param name="default">
									<xsl:call-template name="social-sub-title" />
								</xsl:with-param>
							</xsl:call-template>
						</h4>
					</div>
				</xsl:if>
				<div class="facebook-react-post">
					<span>
						<img src="/_assets/_img/fb-react-emoji.webp" />
						<xsl:text>&#160;13k</xsl:text>
					</span>
					<span>
						<xsl:text>&#160;174 Comments&#160;3.3k Share</xsl:text>
					</span>
				</div>
				<div class="facebook-share-like-comment-icon">
					<span>
						<img src="/_assets/_img/like-icon.webp"/>
						<xsl:text>&#160;Like</xsl:text>
					</span>
					<span>
						<img src="/_assets/_img/comment-icon.webp"/>
						<xsl:text>&#160;Comment</xsl:text>
					</span>
					<span>
						<img src="/_assets/_img/share-icon.webp"/>
						<xsl:text>&#160;Share</xsl:text>
					</span>
					<img style="width: 16px; height: 16px">
						<xsl:attribute name="src">
							<xsl:value-of select="//agent[1]/photo" />

						</xsl:attribute>
					</img>
					<span class="caret">
						<xsl:comment/>
					</span>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>