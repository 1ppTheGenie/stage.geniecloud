<?xml version="1.0"?>
<!--
	Asset Name:	Open House - No.1
	Tags: 		Open House
	Sizes:		Facebook
	Supports:	Listing, Print
	Approved: 	False
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<image preserveAspectRatio="xMidYMid slice" width="100%" height="100%">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<xsl:if test="number(//single/statusTypeID)=2">
			<g style="transform:translate(0%,23%);fill:var(--theme-body-background);">
<rect width="30%" height="55%" y="11%" fill="var(--theme-body-background)" fill-opacity="80%" />


				<g style="transform:translate(2.5%,2%);">
					<text x="0" y="12%" class="sub-heading medium" style="font-weight:600;">
						<tspan>
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'singleaddressstreet'" />
								<xsl:with-param name="default" select="//single/address/street" />
							</xsl:call-template>
						</tspan>
					</text>

					<text x="0" y="17%" class="sub-heading medium" style="font-weight:600;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'singleaddressscity'" />
							<xsl:with-param name="default" select="concat( //single/address/city, '&#160; ', //single/address/zip )" />
						</xsl:call-template>
					</text>

					<g style="transform: translatey(0.3%);">
						<foreignObject x="0%" y="22%" height="40%" width="40%" fill="#0000">
							<div style="padding:10px;border:8px solid var(--theme-heading-color);display:inline-block;font-weight:600;font-size:380%;color:var(--theme-sub-heading-color);margin: 0 0;line-height:140%;">
								<p class="upper" style="display:block;font-weight:600;color:var(--theme-sub-heading-color);margin: 0 0;">
	                            	Open
								</p>
								<p class="upper" style="display:block;font-weight:600;color:var(--theme-sub-heading-color);margin: 0 0;">
	                            	house
								</p>
							</div>
						</foreignObject>
					</g>
					<g style="transform: translate(0, 54%);">
						<text x="0" y="0" class="sub-heading" style="font-size:120%; font-weight:600;">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'Tuesday, August 3rd'" />
								<xsl:with-param name="default" select="'Tuesday, August 3rd'" />
							</xsl:call-template>
						</text>
						<text x="0" y="4%" class="sub-heading" style="font-size:120%; font-weight:600;">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'11:47pm - 11:47pm'" />
								<xsl:with-param name="default" select="'11:47pm - 11:47pm'" />
							</xsl:call-template>
						</text>
					</g>
				</g>
			</g>
		</xsl:if>
		<xsl:if test="number(//single/statusTypeID)=1">
			<g style="transform:translate(0%,23%);fill:var(--theme-body-background);">
<rect width="30%" height="55%" y="11%" fill="var(--theme-body-background)" fill-opacity="80%" />


				<g style="transform:translate(2.5%,2%);">
					<text x="0" y="12%" class="sub-heading medium" style="font-weight:600;">
						<tspan>
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'singleaddressstreet'" />
								<xsl:with-param name="default" select="//single/address/street" />
							</xsl:call-template>
						</tspan>
					</text>

					<text x="0" y="17%" class="sub-heading medium" style="font-weight:600;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'singleaddressscity'" />
							<xsl:with-param name="default" select="concat( //single/address/city, '&#160; ', //single/address/zip )" />
						</xsl:call-template>
					</text>
					<g style="transform: translatey(0.3%);">
						<foreignObject x="0%" y="22%" height="40%" width="40%" fill="#0000">
							<div style="padding:10px;border:8px solid var(--theme-heading-color);display:inline-block;font-weight:600;font-size:380%;color:var(--theme-sub-heading-color);margin: 0 0;line-height:140%;">
								<p class="upper" style="display:block;font-weight:600;color:var(--theme-sub-heading-color);margin: 0 0;">
	                            	Open
								</p>
								<p class="upper" style="display:block;font-weight:600;color:var(--theme-sub-heading-color);margin: 0 0;">
	                            	house
								</p>
							</div>
						</foreignObject>
					</g>
					<g style="transform: translate(0, 54%);">
						<text x="0" y="0" class="sub-heading" style="font-size:120%; font-weight:600;">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'Tuesday, August 3rd'" />
								<xsl:with-param name="default" select="'Tuesday, August 3rd'" />
							</xsl:call-template>
						</text>
						<text x="0" y="4%" class="sub-heading" style="font-size:120%; font-weight:600;">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'11:47pm - 11:47pm'" />
								<xsl:with-param name="default" select="'11:47pm - 11:47pm'" />
							</xsl:call-template>
						</text>
					</g>
				</g>
			</g>
		</xsl:if>
		<xsl:if test="number(//single/statusTypeID)=3">
			<g style="transform:translate(0%,21%);fill:var(--theme-body-background);">
<rect width="40%" height="50%" y="21%" fill="var(--theme-body-background)" fill-opacity="80%" />


				<g style="transform:translate(2.5%,2%);">
					<text x="0" y="22%" class="sub-heading bold medium">
						<tspan>
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'singleaddressstreet'" />
								<xsl:with-param name="default" select="//single/address/street" />
							</xsl:call-template>
						</tspan>
						<tspan x="0" dy="4.7%">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'singleaddressscity'" />
								<xsl:with-param name="default" select="concat( //single/address/city, '&#160; ', //single/address/zip )" />
							</xsl:call-template>
						</tspan>
					</text>

					<g style="transform: translatey(0.3%);">
						<foreignObject x="0%" y="32%" height="30%" width="60%" fill="#0000">
							<p class="upper" style="padding:16px;border:8px solid var(--theme-heading-color);display:inline-block;font-weight:600;font-size:380%;color:var(--theme-sub-heading-color);margin: 0 0;">
								<xsl:call-template name="editable">
									<xsl:with-param name="id" select="'escrow'" />
									<xsl:with-param name="default" select="'IN ESCROW'" />
								</xsl:call-template>
							</p>
						</foreignObject>
					</g>

					<g style="transform: translate(0, 53%);">
						<text x="0" y="0" class="sub-heading" style="font-size:125%; font-weight:700;">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'havebuys'" />
								<xsl:with-param name="default" select="'We have buyers ready to go'" />
							</xsl:call-template>
						</text>
						<text x="0" y="4.5%" class="sub-heading" style="font-size:125%; font-weight:700;">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'curious'" />
								<xsl:with-param name="default" select="'Curious how YOUR home compares?'" />
							</xsl:call-template>
						</text>
						<text x="0" y="9%" class="sub-heading" style="font-size:125%; font-weight:700;">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'scanqr'" />
								<xsl:with-param name="default" select="'Scan the QR code on the back to find out!'" />
							</xsl:call-template>
						</text>
					</g>
				</g>
			</g>
		</xsl:if>

		<g id="footer" style="transform: translate(57.5%, 97.5%);">
			<text fill="var(--theme-heading-color)" style="transform: none;">Recipients to verify all information.</text>
		</g>
	</xsl:template>
</xsl:stylesheet>