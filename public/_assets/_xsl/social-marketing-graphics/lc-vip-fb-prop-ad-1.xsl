<?xml version="1.0"?>
<!--
	Asset Name:	LC-VIP-FB-PROP-AD-1
	Tags:		Social Marketing Ad, LC
	Sizes:		Facebook Post, Facebook Ad, Instagram-Square
	Supports:	Listing, Area
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:import href="lc-social-media.xsl"/>

	<xsl:template name="svg-body">
		<style>
			<xsl:value-of select="'
			g#footer{
				font-size:35%;
				transform:translate(2.5%,98.5%);
			}
			text {
			    dominant-baseline: middle;
			}'" />
		</style>

		<image x="0" y="0" width="100%" height="81%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-1'" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<svg x="3%" y="4%" width="30%" height="30%" viewBox="0 0 295 298" fill="none"
			xmlns="http://www.w3.org/2000/svg">

			<ellipse cx="147.5" cy="149" rx="147.5" ry="149" fill="url(#paint0_linear_103_46)"/>

			<path d="M280 147C280 221.017 220.667 281 147.5 281C74.3328 281 15 221.017 15 147C15 72.9833 74.3328 13 147.5 13C220.667 13 280 72.9833 280 147Z" stroke="white" stroke-width="2"/>
			<line x1="50" y1="163" x2="248" y2="163" stroke="white" stroke-width="2"/>
			<path d="M77.5527 198.718L69.6668 199.597C69.3824 199.632 69.1309 199.823 69.0366 200.114C68.9423 200.405 69.0366 200.708 69.2462 200.899C71.5904 203.052 75.1127 206.276 75.1127 206.276C75.1097 206.276 74.1457 210.965 73.505 214.094C73.4744 214.236 73.4855 214.383 73.5368 214.519C73.588 214.654 73.6773 214.772 73.7938 214.857C73.9102 214.942 74.0488 214.992 74.1926 214.999C74.3364 215.006 74.4793 214.972 74.6037 214.899C77.3641 213.32 81.4987 210.946 81.4987 210.946L88.3906 214.9C88.6421 215.039 88.9565 215.036 89.2005 214.857C89.3165 214.771 89.4058 214.654 89.4576 214.519C89.5093 214.384 89.5214 214.237 89.4924 214.096L87.8891 206.276L93.7557 200.904C93.8619 200.806 93.938 200.68 93.9749 200.541C94.0118 200.401 94.0079 200.254 93.9637 200.116C93.9195 199.978 93.8368 199.857 93.7255 199.765C93.6143 199.674 93.4792 199.617 93.3365 199.6C90.181 199.245 85.4491 198.718 85.4491 198.718L82.1813 191.441C82.122 191.31 82.0263 191.198 81.9057 191.12C81.785 191.042 81.6445 191 81.5009 191C81.3574 191 81.2168 191.042 81.0962 191.12C80.9755 191.198 80.8798 191.31 80.8206 191.441L77.5527 198.718Z" fill="white"/>
			<path d="M114.553 198.718L106.667 199.597C106.382 199.632 106.131 199.823 106.037 200.114C105.942 200.405 106.037 200.708 106.246 200.899C108.59 203.052 112.113 206.276 112.113 206.276C112.11 206.276 111.146 210.965 110.505 214.094C110.474 214.236 110.485 214.383 110.537 214.519C110.588 214.654 110.677 214.772 110.794 214.857C110.91 214.942 111.049 214.992 111.193 214.999C111.336 215.006 111.479 214.972 111.604 214.899C114.364 213.32 118.499 210.946 118.499 210.946L125.391 214.9C125.642 215.039 125.956 215.036 126.2 214.857C126.317 214.771 126.406 214.654 126.458 214.519C126.509 214.384 126.521 214.237 126.492 214.096L124.889 206.276L130.756 200.904C130.862 200.806 130.938 200.68 130.975 200.541C131.012 200.401 131.008 200.254 130.964 200.116C130.919 199.978 130.837 199.857 130.726 199.765C130.614 199.674 130.479 199.617 130.337 199.6C127.181 199.245 122.449 198.718 122.449 198.718L119.181 191.441C119.122 191.31 119.026 191.198 118.906 191.12C118.785 191.042 118.644 191 118.501 191C118.357 191 118.217 191.042 118.096 191.12C117.976 191.198 117.88 191.31 117.821 191.441L114.553 198.718Z" fill="white"/>
			<path d="M148.553 198.718L140.667 199.597C140.382 199.632 140.131 199.823 140.037 200.114C139.942 200.405 140.037 200.708 140.246 200.899C142.59 203.052 146.113 206.276 146.113 206.276C146.11 206.276 145.146 210.965 144.505 214.094C144.474 214.236 144.485 214.383 144.537 214.519C144.588 214.654 144.677 214.772 144.794 214.857C144.91 214.942 145.049 214.992 145.193 214.999C145.336 215.006 145.479 214.972 145.604 214.899C148.364 213.32 152.499 210.946 152.499 210.946L159.391 214.9C159.642 215.039 159.956 215.036 160.2 214.857C160.317 214.771 160.406 214.654 160.458 214.519C160.509 214.384 160.521 214.237 160.492 214.096L158.889 206.276L164.756 200.904C164.862 200.806 164.938 200.68 164.975 200.541C165.012 200.401 165.008 200.254 164.964 200.116C164.919 199.978 164.837 199.857 164.726 199.765C164.614 199.674 164.479 199.617 164.337 199.6C161.181 199.245 156.449 198.718 156.449 198.718L153.181 191.441C153.122 191.31 153.026 191.198 152.906 191.12C152.785 191.042 152.644 191 152.501 191C152.357 191 152.217 191.042 152.096 191.12C151.976 191.198 151.88 191.31 151.821 191.441L148.553 198.718Z" fill="white"/>
			<path d="M184.553 198.718L176.667 199.597C176.382 199.632 176.131 199.823 176.037 200.114C175.942 200.405 176.037 200.708 176.246 200.899C178.59 203.052 182.113 206.276 182.113 206.276C182.11 206.276 181.146 210.965 180.505 214.094C180.474 214.236 180.485 214.383 180.537 214.519C180.588 214.654 180.677 214.772 180.794 214.857C180.91 214.942 181.049 214.992 181.193 214.999C181.336 215.006 181.479 214.972 181.604 214.899C184.364 213.32 188.499 210.946 188.499 210.946L195.391 214.9C195.642 215.039 195.956 215.036 196.2 214.857C196.317 214.771 196.406 214.654 196.458 214.519C196.509 214.384 196.521 214.237 196.492 214.096L194.889 206.276L200.756 200.904C200.862 200.806 200.938 200.68 200.975 200.541C201.012 200.401 201.008 200.254 200.964 200.116C200.919 199.978 200.837 199.857 200.726 199.765C200.614 199.674 200.479 199.617 200.337 199.6C197.181 199.245 192.449 198.718 192.449 198.718L189.181 191.441C189.122 191.31 189.026 191.198 188.906 191.12C188.785 191.042 188.644 191 188.501 191C188.357 191 188.217 191.042 188.096 191.12C187.976 191.198 187.88 191.31 187.821 191.441L184.553 198.718Z" fill="white"/>
			<path d="M220.553 198.718L212.667 199.597C212.382 199.632 212.131 199.823 212.037 200.114C211.942 200.405 212.037 200.708 212.246 200.899C214.59 203.052 218.113 206.276 218.113 206.276C218.11 206.276 217.146 210.965 216.505 214.094C216.474 214.236 216.485 214.383 216.537 214.519C216.588 214.654 216.677 214.772 216.794 214.857C216.91 214.942 217.049 214.992 217.193 214.999C217.336 215.006 217.479 214.972 217.604 214.899C220.364 213.32 224.499 210.946 224.499 210.946L231.391 214.9C231.642 215.039 231.956 215.036 232.2 214.857C232.317 214.771 232.406 214.654 232.458 214.519C232.509 214.384 232.521 214.237 232.492 214.096L230.889 206.276L236.756 200.904C236.862 200.806 236.938 200.68 236.975 200.541C237.012 200.401 237.008 200.254 236.964 200.116C236.919 199.978 236.837 199.857 236.726 199.765C236.614 199.674 236.479 199.617 236.337 199.6C233.181 199.245 228.449 198.718 228.449 198.718L225.181 191.441C225.122 191.31 225.026 191.198 224.906 191.12C224.785 191.042 224.644 191 224.501 191C224.357 191 224.217 191.042 224.096 191.12C223.976 191.198 223.88 191.31 223.821 191.441L220.553 198.718Z" fill="white"/>
			<defs>
				<linearGradient id="paint0_linear_103_46" x1="147.5" y1="0" x2="147.5" y2="298" gradientUnits="userSpaceOnUse">
					<stop stop-color="#EFAC29"/>
					<stop offset="0.25" stop-color="#EFAC29"/>
					<stop offset="0.71875" stop-color="#E8A729"/>
					<stop offset="1" stop-color="#C0842C"/>
				</linearGradient>
			</defs>
		</svg>

		<text class="upper center middle" x="18%" y="12%" font-size="150%" font-weight="300" fill="#ffffff">
			<xsl:choose>
				<xsl:when test="(number(//single/statusTypeID)=3) or (number(//single/statusTypeID)=4) or (number(//single/statusTypeID)=12)">
					<xsl:text>In</xsl:text>
				</xsl:when>
				<xsl:when test="number(//single/statusTypeID)=14">
					<xsl:text>Coming</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>Just</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</text>

		<text class="upper center middle" x="18%" y="17%" font-size="150%" font-weight="300" fill="#ffffff">
			<xsl:choose>
				<xsl:when test="number(//single/statusTypeID)=2">
					<xsl:text>Sold</xsl:text>
				</xsl:when>
				<xsl:when test="(number(//single/statusTypeID)=3) or (number(//single/statusTypeID)=4) or (number(//single/statusTypeID)=12)">
					<xsl:text>Escrow</xsl:text>
				</xsl:when>
				<xsl:when test="number(//single/statusTypeID)=14">
					<xsl:text>Soon</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>Listed</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</text>
		<rect fill="var(--theme-body-background)" x="0%" y="80%" width="100%" height="20%"/>

		<xsl:choose>
			<xsl:when test="$companyLogo='' or $personalLogo=''">
				<image x="70%" y="86%" width="25%" height="10%" id="logo" preserveAspectRatio="xMaxYMid meet">
					<xsl:attribute name="href">
						<xsl:choose>
							<xsl:when test="$personalLogo=''">
								<xsl:value-of select="$companyLogo" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$personalLogo" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</image>
			</xsl:when>
			<xsl:otherwise>
				<image x="50%" y="86%" width="30%" height="12%" class="center" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="$personalLogo" />
					</xsl:attribute>
				</image>
				<image x="82%" y="86.5%" width="14%" height="12%" class="center" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="$companyLogo" />
					</xsl:attribute>
				</image>
			</xsl:otherwise>
		</xsl:choose>

		<text x="95%" y="84%" class="align-right" fill="var(--theme-sub-heading-color)" data-max-width="50%" font-weight="600" font-size="115%" letter-spacing="0.25">
			<tspan>
				<xsl:value-of select="//single/address/street" />
			</tspan>
			<tspan font-weight="100">
				<xsl:text> | </xsl:text>
			</tspan>
			<tspan>
				<xsl:value-of select="//single/address/city" />
			</tspan>
		</text>
		<!-- <text x="95%" y="92%" class="upper center align-right" fill="var(theme-heading-color)" data-max-width="33%" font-weight="600" font-size="110%">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'agentwebsite'" />
<xsl:with-param name="default" select="//agent[1]/website" />
			</xsl:call-template>
		</text> -->

		<text x="17.5%" y="88%" class="left" style="font-family:var(--theme-heading-font); font-size:80%;font-weight:300;" fill="var(--theme-heading-color)">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'Presented by:'" />
				<xsl:with-param name="default" select="'Presented by:'" />
			</xsl:call-template>
		</text>

		<text x="17.5%" y="91%" class="left" style="font-family:var(--theme-heading-font); font-size:120%;font-weight:300;" fill="var(--theme-heading-color)">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'marketingName'" />
				<xsl:with-param name="default" select="//agent[1]/marketingName" />
			</xsl:call-template>
		</text>

		<text x="17.5%" y="95%" class="left" style="font-family:var(--theme-heading-font); font-size:130%;font-weight:300;" fill="var(--theme-sub-heading-color)">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'mobile'" />
				<xsl:with-param name="default" select="translate(//agent[1]/mobile, '-', '.')" />
			</xsl:call-template>
		</text>

		<text x="95%" y="98%" class="upper heading align-right" fill="var(--theme-body-color)" data-max-width="33%" fill-opacity="0.75" font-weight="500" font-size="50%">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'licenseno'" />
				<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
			</xsl:call-template>
		</text>

		<image x="3%" y="86%" width="12%" height="14%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:value-of select="//agent[1]/photo" />
			</xsl:attribute>
		</image>
		<g id="agent-contact" style="transform: translateX(-37.5%);">
			<xsl:call-template name="copyright" />
		</g>
	</xsl:template>
</xsl:stylesheet>