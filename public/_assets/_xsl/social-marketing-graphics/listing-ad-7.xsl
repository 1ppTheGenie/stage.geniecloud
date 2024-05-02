<?xml version="1.0"?>
<!--
	Asset Name:	Listing Ad 7
	Tags:		Social Marketing Ad
	Sizes:		Facebook Post, Facebook Ad, Instagram-Square
	Supports:	Listing, Area
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />


	<xsl:template name="svg-body">
		<xsl:param name="min_sale_price" select="//area/statistics/@minSalePrice" />
		<xsl:param name="prev_min_sale_price" select="//area/statistics/previous/@medianSalePrice" />
		<xsl:param name="min_sale_price_change" select="($min_sale_price - $prev_min_sale_price) div $prev_min_sale_price * 100" />

		<xsl:param name="sale_price" select="//single/salePrice" />
		<xsl:param name="price" select="//single/price" />
		<xsl:param name="price_status" select="($sale_price - $price) div $price * 100" />

		<g style="transform:translate(49%, 3%);">
			<text class="center" fill="var(--theme-heading-color)" style="font-size:170%;line-height:120%;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="' Boost your equity... overnight! '" />
					<xsl:with-param name="default" select="' Boost your equity... overnight! '" />
				</xsl:call-template>
			</text>
			<text class="center" x="0%" y="7%" fill="var(--theme-heading-color)" data-max-width="60%">
				<tspan style="font-size:120%;line-height:120%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentname'" />
						<xsl:with-param name="default" select="concat( 'Learn how some ', //area/name , ' sellers gained' )" />
					</xsl:call-template>
				</tspan>
				<tspan style="font-size:120%;line-height:120%;">
					<xsl:choose>
						<xsl:when test="$min_sale_price_change > 0">
							<xsl:value-of select="concat( ' ',  format-number( $min_sale_price_change, '#.00') , '%' )" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="' 0% '" />
								<xsl:with-param name="default" select="' 0% '" />
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</tspan>
			</text>
		</g>
		<rect fill="var(--theme-heading-color)" x="7.5%" y="16%" width="85%" height="67%" />

		<image x="8.5%" y="16.8%" width="83%" height="40%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="image-1" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<svg x="38%" y="77%" width="50%" height="30%" viewBox="0 0 800 200">
			<rect width="50%" height="140" fill="var(--theme-sub-heading-color)" rx="70" ry="100" />

			<g style="transform: translate(2.2%, 0.5%);">
				<text class="bold center" dx="24%" dy="20%" font-size="300%" fill="var(--theme-heading-color)">See How</text>
			</g>
		</svg>

		<g style="transform:translate(9%, 60%);">
			<use class="center" x="10%" y="0" width="10%" height="10%" fill="var(--theme-body-background)">
				<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#home-dollar' )" />
			</use>
			<text x="15%" y="12%" fill="var(--theme-body-background)" class="center">
				<tspan style="font-size:70%;line-height:120%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="' Original Value '" />
						<xsl:with-param name="default" select="' Original Value '" />
					</xsl:call-template>
				</tspan>
			</text>
			<text x="15%" y="15%" fill="var(--theme-body-background)" class="center">
				<tspan style="font-size:55%;line-height:120%;">
					<xsl:value-of select="format-number( //single/price, '$###,###')" />

				</tspan>
			</text>
		</g>
		<g style="transform:translate(35%, 60%);">

			<use class="center" x="10%" y="0" width="10%" height="10%" fill="var(--theme-body-background)">
				<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#listing-7-clock' )" />
			</use>
			<text x="15%" y="12%" fill="var(--theme-body-background)" class="center">
				<tspan style="font-size:70%;line-height:120%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="' Sold For '" />
						<xsl:with-param name="default" select="' Sold For '" />
					</xsl:call-template>
				</tspan>
			</text>
			<text x="15%" y="15%" fill="var(--theme-body-background)" class="center">
				<tspan style="font-size:55%;line-height:120%;color:var(--theme-body-background)">
					<xsl:choose>
						<xsl:when test="//single/salePrice!=''">
							<xsl:value-of select="format-number( //single/salePrice, '$###,###')" />

						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="' - '" />
								<xsl:with-param name="default" select="' - '" />
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</tspan>
			</text>
		</g>
		<g style="transform:translate(61%, 60%);">
			<xsl:choose>
				<xsl:when test="//single/salePrice!=''">
					<xsl:choose>
						<xsl:when test="$price_status > 0">
							<use class="center" x="10%" y="0" width="10%" height="10%" fill="var(--theme-body-background)">
								<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#increase-graph' )" />
							</use>
						</xsl:when>
						<xsl:otherwise>
							<use class="center" x="10%" y="0" width="10%" height="10%" fill="var(--theme-body-background)">
								<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#decrease-graph' )" />
							</use>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="' - '" />
						<xsl:with-param name="default" select="' - '" />
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>

			<text x="15%" y="12%" fill="var(--theme-body-background)" class="center">
				<tspan style="font-size:70%;line-height:120%;">
					<xsl:choose>
						<xsl:when test="//single/salePrice!=''">
							<xsl:choose>
								<xsl:when test="$price_status > 0">
									<xsl:call-template name="editable">
										<xsl:with-param name="id" select="' Increase '" />
										<xsl:with-param name="default" select="' Increase '" />
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="editable">
										<xsl:with-param name="id" select="' Decrease '" />
										<xsl:with-param name="default" select="' Decrease '" />
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="' - '" />
								<xsl:with-param name="default" select="' - '" />
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</tspan>
			</text>

			<foreignObject x="0%" y="15%" width="30%" height="5%" class="center" style="color:var(--theme-body-background)">
				<text style="font-size:55%;line-height:120%;color:var(--theme-body-background)">
					<xsl:choose>
						<xsl:when test="//single/salePrice!=''">
							<xsl:value-of select="concat( ' ', format-number( $price_status, '#.00'), '%' )" />

						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="' - '" />
								<xsl:with-param name="default" select="' - '" />
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</text>
			</foreignObject>

			<text x="15%" y="15%" fill="var(--theme-body-background)" class="center" style="font-size:55%;line-height:120%;">
				<xsl:choose>
					<xsl:when test="//single/salePrice!=''">
						<xsl:value-of select="concat( ' ', format-number( $price_status, '#.00'), '%' )" />

					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="' - '" />
							<xsl:with-param name="default" select="' - '" />
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</text>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>