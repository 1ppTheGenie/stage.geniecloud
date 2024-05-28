<?xml version="1.0"?>
<!--
	Asset Name:	QR Code Postcard 2022 Postage Side 1
	Tags:		Social Marketing Ad
	Sizes:		Postcard
	Supports:	Area, Listing, UserID, QRCode
	Approved: 	True
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />

	<xsl:template name="body">
		<xsl:call-template name="svg-wrapper" />
	</xsl:template>

	<xsl:template name="svg-body">
		<rect x="63.5%" y="0%" width="36.5%" height="100%" fill="#fff" />

		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<xsl:variable name="min_sale_price" select="//area/statistics/@minSalePrice" />
		<xsl:variable name="prev_min_sale_price" select="//area/statistics/previous/@medianSalePrice" />
		<xsl:variable name="price_change" select="number(//areas/area/statistics/previous/@medianSalePrice) - number(//areas/area/statistics/@medianSalePrice)" />

		<text x="4%" y="5%" width="55%" height="15%" fill="var(--theme-sub-heading-color)" style="font-family:var(--theme-body-font);font-size: 220%; font-weight: 600; letter-spacing: 3px;text-transform: uppercase;" data-max-width="48%">
			<tspan>
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'areaname'" />
					<xsl:with-param name="default" select="concat( //area/name , ' ' )" />
				</xsl:call-template>
			</tspan>
			<tspan>
				<xsl:call-template name="property-type-caption">
					<xsl:with-param name="short" select="'true'" />
					<xsl:with-param name="singular" select="'true'" />
				</xsl:call-template>
			</tspan>
			<tspan>
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'areaname'" />
					<xsl:with-param name="default" select="concat( ' VALUES ARE MOVING...', '' )" />
				</xsl:call-template>
			</tspan>
		</text>

		<image x="52%" y="81%" width="10%" height="12%" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="$companyLogo" />
			</xsl:attribute>
		</image>
		<text x="57%" y="94%" data-max-width="8%" class="center" fill="var(--theme-heading-color)" style="font-size: 90%;letter-spacing: 0.5px;font-weight: 500;font-family:var(--theme-body-font);">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'licenseno'" />
				<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
			</xsl:call-template>
		</text>

		<g style="transform:translate(45.2%, 55.5%)">
			<xsl:call-template name="qr-code">
				<xsl:with-param name="width" select="'11.5%'" />
			</xsl:call-template>
		</g>

		<rect x="4.1%" y="57.1%" width="9.8%" height="17.8%" stroke="var(--theme-body-color)" stroke-width="1" rx="70" ry="70" fill="#ffffff" />
		<clipPath id="clipCircle">
			<circle r="6%" cx="9%" cy="66%" fill="var(--theme-emphasis-color)"></circle>
		</clipPath>
		<image x="3%" y="60%" width="12%" height="12%" preserveAspectRatio="xMidYMid slice" clip-path="url(#clipCircle)">
			<xsl:attribute name="href">
				<xsl:value-of select="//agent\[1\]/photo" />
			</xsl:attribute>
		</image>

		<text x="16%" y="57.5%" class="upper" style="font-weight:600;font-size:175%;letter-spacing:1px;font-family:var(--theme-body-font);" fill="var(--theme-heading-color)" data-max-width="25%">
			<xsl:value-of select="//agent[1]/marketingName" />
		</text>
		<text x="16%" y="57%">
			<tspan x="16%" dy="5.3%" fill="var(--theme-heading-color)" style="font-size:110%;font-family:var(--theme-body-font);">
				<xsl:value-of select="//agent[1]/marketingTitle" />
			</tspan>
			<tspan x="16%" dy="3.8%" fill="var(--theme-heading-color)" style="font-size:110%;font-family:var(--theme-body-font);">
				<xsl:value-of select="//agent[1]/marketingEmail" />
			</tspan>
			<tspan x="16%" dy="3.7%" class="bold" fill="var(--theme-sub-heading-color)" style="font-size:255%;font-family:var(--theme-body-font);">
				<xsl:value-of select="//agent[1]/mobile" />
			</tspan>
		</text>

		<g style="transform:translate(4%, -3%)">
			<svg width="58%" height="56%" fill="var(--theme-sub-heading-color)" style="opacity:0.4" viewBox="0 0 1093.28 266.73">
				<xsl:choose>
					<xsl:when test="$price_change &lt; 0">
						<polygon points="12.88 138.71 0 138.71 0 266.74 12.88 266.74 12.88 138.71 12.88 138.71" />
						<polygon points="37.43 128.61 24.55 128.61 24.55 266.74 37.43 266.74 37.43 128.61 37.43 128.61" />
						<polygon points="61.99 121.47 49.11 121.47 49.11 266.74 61.99 266.74 61.99 121.47 61.99 121.47" />
						<polygon points="86.54 116.45 73.67 116.45 73.67 266.74 86.54 266.74 86.54 116.45 86.54 116.45" />
						<polygon points="111.1 119.9 98.22 119.9 98.22 266.74 111.1 266.74 111.1 119.9 111.1 119.9" />
						<polygon points="135.65 127.45 122.77 127.45 122.77 266.74 135.65 266.74 135.65 127.45 135.65 127.45" />
						<polygon points="160.21 141.31 147.33 141.31 147.33 266.74 160.21 266.74 160.21 141.31 160.21 141.31" />
						<polygon points="184.76 156.5 171.88 156.5 171.88 266.74 184.76 266.74 184.76 156.5 184.76 156.5" />
						<polygon points="209.32 168.93 196.44 168.93 196.44 266.74 209.32 266.74 209.32 168.93 209.32 168.93" />
						<polygon points="233.87 179.93 220.99 179.93 220.99 266.74 233.87 266.74 233.87 179.93 233.87 179.93" />
						<polygon points="258.43 188.04 245.55 188.04 245.55 266.74 258.43 266.74 258.43 188.04 258.43 188.04" />
						<polygon points="282.98 193.32 270.1 193.32 270.1 266.74 282.98 266.74 282.98 193.32 282.98 193.32" />
						<polygon points="307.53 196.09 294.66 196.09 294.66 266.74 307.53 266.74 307.53 196.09 307.53 196.09" />
						<polygon points="332.09 193.32 319.21 193.32 319.21 266.74 332.09 266.74 332.09 193.32 332.09 193.32" />
						<polygon points="356.64 189.77 343.77 189.77 343.77 266.74 356.64 266.74 356.64 189.77 356.64 189.77" />
						<polygon points="381.2 184.95 368.32 184.95 368.32 266.74 381.2 266.74 381.2 184.95 381.2 184.95" />
						<polygon points="405.75 177.23 392.88 177.23 392.88 266.74 405.75 266.74 405.75 177.23 405.75 177.23" />
						<polygon points="430.31 167.16 417.43 167.16 417.43 266.74 430.31 266.74 430.31 167.16 430.31 167.16" />
						<polygon points="454.86 153.59 441.98 153.59 441.98 266.74 454.86 266.74 454.86 153.59 454.86 153.59" />
						<polygon points="479.42 141.54 466.54 141.54 466.54 266.74 479.42 266.74 479.42 141.54 479.42 141.54" />
						<polygon points="503.97 132.08 491.09 132.08 491.09 266.74 503.97 266.74 503.97 132.08 503.97 132.08" />
						<polygon points="528.53 126.03 515.65 126.03 515.65 266.74 528.53 266.74 528.53 126.03 528.53 126.03" />
						<polygon points="553.08 122.63 540.2 122.63 540.2 266.74 553.08 266.74 553.08 122.63 553.08 122.63" />
						<polygon points="577.63 121.08 564.76 121.08 564.76 266.74 577.63 266.74 577.63 121.08 577.63 121.08" />
						<polygon points="602.19 122.63 589.31 122.63 589.31 266.74 602.19 266.74 602.19 122.63 602.19 122.63" />
						<polygon points="626.75 126.03 613.87 126.03 613.87 266.74 626.75 266.74 626.75 126.03 626.75 126.03" />
						<polygon points="651.3 131.17 638.42 131.17 638.42 266.74 651.3 266.74 651.3 131.17 651.3 131.17" />
						<polygon points="675.85 134.59 662.98 134.59 662.98 266.74 675.85 266.74 675.85 134.59 675.85 134.59" />
						<polygon points="700.41 138.25 687.53 138.25 687.53 266.74 700.41 266.74 700.41 138.25 700.41 138.25" />
						<polygon points="724.96 139.61 712.08 139.61 712.08 266.74 724.96 266.74 724.96 139.61 724.96 139.61" />
						<polygon points="749.52 138.25 736.64 138.25 736.64 266.74 749.52 266.74 749.52 138.25 749.52 138.25" />
						<polygon points="774.07 137.1 761.19 137.1 761.19 266.74 774.07 266.74 774.07 137.1 774.07 137.1" />
						<polygon points="798.63 133.76 785.75 133.76 785.75 266.74 798.63 266.74 798.63 133.76 798.63 133.76" />
						<polygon points="823.18 126.67 810.3 126.67 810.3 266.74 823.18 266.74 823.18 126.67 823.18 126.67" />
						<polygon points="847.74 115.3 834.86 115.3 834.86 266.74 847.74 266.74 847.74 115.3 847.74 115.3" />
						<polygon points="872.29 101.21 859.41 101.21 859.41 266.74 872.29 266.74 872.29 101.21 872.29 101.21" />
						<polygon points="896.85 82.49 883.97 82.49 883.97 266.74 896.85 266.74 896.85 82.49 896.85 82.49" />
						<polygon points="921.4 61.85 908.52 61.85 908.52 266.74 921.4 266.74 921.4 61.85 921.4 61.85" />
						<polygon points="945.96 45.45 933.08 45.45 933.08 266.74 945.96 266.74 945.96 45.45 945.96 45.45" />
						<polygon points="970.51 31.94 957.63 31.94 957.63 266.74 970.51 266.74 970.51 31.94 970.51 31.94" />
						<polygon points="995.07 21.91 982.19 21.91 982.19 266.74 995.07 266.74 995.07 21.91 995.07 21.91" />
						<polygon points="1019.62 14 1006.74 14 1006.74 266.74 1019.62 266.74 1019.62 14 1019.62 14" />
						<polygon points="1044.17 7.63 1031.3 7.63 1031.3 266.74 1044.17 266.74 1044.17 7.63 1044.17 7.63" />
						<polygon points="1068.73 3.19 1055.85 3.19 1055.85 266.74 1068.73 266.74 1068.73 3.19 1068.73 3.19" />
						<polygon points="1093.28 0 1080.4 0 1080.4 266.74 1093.28 266.74 1093.28 0 1093.28 0" />
					</xsl:when>
					<xsl:otherwise>
						<polygon points="1080.93 134.55 1081.43 262.58 1094.31 262.53 1093.81 134.5 1080.93 134.55 1080.93 134.55" />
						<polygon points="1056.34 124.55 1056.88 262.68 1069.76 262.63 1069.22 124.5 1056.34 124.55 1056.34 124.55" />
						<polygon points="1031.76 117.5 1032.32 262.77 1045.2 262.72 1044.63 117.45 1031.76 117.5 1031.76 117.5" />
						<polygon points="1007.19 112.58 1007.77 262.87 1020.64 262.82 1020.06 112.53 1007.19 112.58 1007.19 112.58" />
						<polygon points="982.64 116.12 983.21 262.96 996.09 262.91 995.52 116.07 982.64 116.12 982.64 116.12" />
						<polygon points="958.12 123.77 958.66 263.06 971.54 263.01 971 123.72 958.12 123.77 958.12 123.77" />
						<polygon points="933.61 137.72 934.1 263.15 946.98 263.1 946.49 137.68 933.61 137.72 933.61 137.72" />
						<polygon points="909.12 153.01 909.55 263.25 922.43 263.2 922 152.96 909.12 153.01 909.12 153.01" />
						<polygon points="884.61 165.54 884.99 263.35 897.87 263.3 897.49 165.49 884.61 165.54 884.61 165.54" />
						<polygon points="860.1 176.63 860.44 263.44 873.32 263.39 872.98 176.58 860.1 176.63 860.1 176.63" />
						<polygon points="835.58 184.84 835.88 263.54 848.76 263.49 848.46 184.79 835.58 184.84 835.58 184.84" />
						<polygon points="811.05 190.21 811.33 263.63 824.21 263.58 823.93 190.16 811.05 190.21 811.05 190.21" />
						<polygon points="786.51 193.08 786.78 263.73 799.65 263.68 799.38 193.03 786.51 193.08 786.51 193.08" />
						<polygon points="761.94 190.4 762.22 263.82 775.1 263.77 774.82 190.35 761.94 190.4 761.94 190.4" />
						<polygon points="737.37 186.95 737.67 263.92 750.54 263.87 750.24 186.9 737.37 186.95 737.37 186.95" />
						<polygon points="712.79 182.23 713.11 264.01 725.99 263.96 725.67 182.18 712.79 182.23 712.79 182.23" />
						<polygon points="688.22 174.6 688.56 264.11 701.43 264.06 701.09 174.55 688.22 174.6 688.22 174.6" />
						<polygon points="663.62 164.63 664 264.21 676.88 264.16 676.5 164.58 663.62 164.63 663.62 164.63" />
						<polygon points="639.01 151.15 639.45 264.3 652.33 264.25 651.89 151.1 639.01 151.15 639.01 151.15" />
						<polygon points="614.41 139.2 614.89 264.4 627.77 264.35 627.29 139.15 614.41 139.2 614.41 139.2" />
						<polygon points="589.82 129.83 590.34 264.49 603.22 264.44 602.7 129.78 589.82 129.83 589.82 129.83" />
						<polygon points="565.24 123.88 565.78 264.59 578.66 264.54 578.12 123.83 565.24 123.88 565.24 123.88" />
						<polygon points="540.67 120.58 541.24 264.68 554.12 264.63 553.55 120.53 540.67 120.58 540.67 120.58" />
						<polygon points="516.12 119.12 516.68 264.78 529.55 264.73 528.99 119.07 516.12 119.12 516.12 119.12" />
						<polygon points="491.56 120.77 492.13 264.88 505 264.82 504.44 120.72 491.56 120.77 491.56 120.77" />
						<polygon points="467.02 124.26 467.56 264.97 480.44 264.92 479.9 124.21 467.02 124.26 467.02 124.26" />
						<polygon points="442.49 129.5 443.01 265.07 455.89 265.02 455.37 129.45 442.49 129.5 442.49 129.5" />
						<polygon points="417.95 133.01 418.47 265.16 431.34 265.11 430.82 132.96 417.95 133.01 417.95 133.01" />
						<polygon points="393.4 136.77 393.91 265.26 406.79 265.21 406.29 136.72 393.4 136.77 393.4 136.77" />
						<polygon points="368.86 138.22 369.36 265.35 382.24 265.3 381.74 138.18 368.86 138.22 368.86 138.22" />
						<polygon points="344.3 136.96 344.8 265.45 357.68 265.4 357.18 136.91 344.3 136.96 344.3 136.96" />
						<polygon points="319.74 135.91 320.25 265.55 333.13 265.5 332.62 135.86 319.74 135.91 319.74 135.91" />
						<polygon points="295.17 132.66 295.69 265.64 308.57 265.59 308.05 132.61 295.17 132.66 295.17 132.66" />
						<polygon points="270.59 125.67 271.14 265.74 284.02 265.69 283.47 125.62 270.59 125.67 270.59 125.67" />
						<polygon points="245.99 114.39 246.58 265.83 259.46 265.78 258.87 114.34 245.99 114.39 245.99 114.39" />
						<polygon points="221.38 100.4 222.03 265.93 234.91 265.88 234.26 100.35 221.38 100.4 221.38 100.4" />
						<polygon points="196.75 81.78 197.47 266.02 210.35 265.97 209.63 81.72 196.75 81.78 196.75 81.78" />
						<polygon points="172.12 61.23 172.92 266.12 185.8 266.07 185 61.18 172.12 61.23 172.12 61.23" />
						<polygon points="147.5 44.93 148.36 266.21 161.24 266.16 160.38 44.88 147.5 44.93 147.5 44.93" />
						<polygon points="122.89 31.51 123.81 266.31 136.69 266.26 135.77 31.46 122.89 31.51 122.89 31.51" />
						<polygon points="98.3 21.58 99.25 266.41 112.13 266.36 111.17 21.53 98.3 21.58 98.3 21.58" />
						<polygon points="73.71 13.76 74.7 266.5 87.58 266.45 86.59 13.71 73.71 13.76 73.71 13.76" />
						<polygon points="49.14 7.49 50.15 266.6 63.02 266.55 62.01 7.44 49.14 7.49 49.14 7.49" />
						<polygon points="24.56 3.15 25.59 266.69 38.47 266.64 37.44 3.09 24.56 3.15 24.56 3.15" />
						<polygon points="0 0.05 1.04 266.79 13.92 266.74 12.88 0 0 0.05 0 0.05" />
					</xsl:otherwise>
				</xsl:choose>
			</svg>

			<text x="41%" y="17%" class="bold align-right" style="line-height: 90%; opacity:0.9;" fill="var(--theme-heading-color)" data-max-width="40%">
				<tspan style="font-family:var(--theme-sub-heading-font);font-size:380%;">$</tspan>
				<tspan class="myriad-pro" style="font-size:600%;margin:0; line-height: 50%;">
					<xsl:choose>
						<xsl:when test="$price_change &lt; 0">
							<xsl:value-of select="format-number( $price_change * -1, '###,###')" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="format-number( $price_change, '###,###')" />
						</xsl:otherwise>
					</xsl:choose>
				</tspan>
			</text>

			<text x="27.5%" y="35%" fill="var(--theme-heading-color)" style="font-family:var(--theme-sub-heading-font);font-weight:600;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="$month_type" />
					<xsl:with-param name="default" select="concat( 'in the past ' , $month_type )" />
				</xsl:call-template>
			</text>
		</g>

		<svg width="10%" height="17%" x="46%" y="16.8%" fill="var(--theme-sub-heading-color)" viewBox="0 0 500 500">
			<xsl:choose>
				<xsl:when test="$price_change &lt; 0">
					<path d="M126.1,246c7,7,18.3,7,25.3,0l84.8-84.6l0,229.2c0,9.8,8,17.8,17.9,17.8c9.9,0,17.9-8,17.9-17.8l0-229.3 l84.8,84.7c7,7,18.3,7,25.3,0c7-7,7-18.2,0-25.2L254.1,93.1l-128,127.7C119.2,227.8,119.2,239.1,126.1,246L126.1,246z" />
					<path d="M250,478.7c-126.6,0-229.5-102.7-229.5-229c0-126.3,103-229,229.5-229c126.6,0,229.5,102.7,229.5,229C479.5,375.9,376.5,478.7,250,478.7L250,478.7z M250,49.2c-110.7,0-200.8,89.9-200.8,200.4c0,110.5,90.1,200.4,200.8,200.4 c110.7,0,200.8-89.9,200.8-200.4C450.8,139.1,360.7,49.2,250,49.2L250,49.2z" />
				</xsl:when>
				<xsl:otherwise>
					<path d="M382.2,255.5c-7-7-18.3-7-25.3,0l-84.8,84.6V110.9c0-9.8-8-17.8-17.9-17.8c-9.9,0-17.9,8-17.9,17.8v229.3l-84.8-84.7c-7-7-18.3-7-25.3,0c-7,7-7,18.2,0,25.2l128,127.7l128-127.7C389.1,273.7,389.1,262.4,382.2,255.5L382.2,255.5z" />
					<path d="M250,478.7c-126.6,0-229.5-102.7-229.5-229s103-229,229.5-229c126.6,0,229.5,102.7,229.5,229C479.5,375.9,376.5,478.7,250,478.7L250,478.7z M250,49.2c-110.7,0-200.8,89.9-200.8,200.4S139.3,450,250,450s200.8-89.9,200.8-200.4S360.7,49.2,250,49.2L250,49.2z" />
				</xsl:otherwise>
			</xsl:choose>
		</svg>

		<rect x="1%" y="40%" width="62%" height="14%" fill="var(--theme-heading-color)" />

		<text x="3%" y="41%" class="upper bold" fill="var(--theme-body-background)" style="font-size:170%;letter-spacing:1px;font-family:var(--theme-body-font);">
			<tspan>
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'areaname'" />
					<xsl:with-param name="default" select="concat( 'HOW DOES YOUR ' , '' )" />
				</xsl:call-template>
			</tspan>
			<tspan fill="var(--theme-body-background)">
				<xsl:call-template name="property-type-caption">
					<xsl:with-param name="short" select="'true'" />
					<xsl:with-param name="singular" select="'true'" />
				</xsl:call-template>
			</tspan>
			<tspan>
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'areaname'" />
					<xsl:with-param name="default" select="concat( ' COMPARE?', '' )" />
				</xsl:call-template>
			</tspan>
		</text>

		<foreignObject x="3%" y="46.5%" width="59%" height="6%" style="line-height:100%;">
			<p class="" style="font-size:85%;margin:0;color:var(--theme-body-background);font-family:var(--theme-body-font);font-weight:300;">
				<span>
					<xsl:if test="//single/statusTypeID!=''">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'streetaddress'" />
							<xsl:with-param name="default" select="concat( 'The property at ', //single/address/street )" />
						</xsl:call-template>
					</xsl:if>
				</span>
				<span>
					<xsl:if test="number(//single/statusTypeID)=1">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'listed'" />
							<xsl:with-param name="default" select="concat( ' just listed', ' for sale. ' )" />
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="number(//single/statusTypeID)=2">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'sold'" />
							<xsl:with-param name="default" select="concat( ' just sold', '. ')" />
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="(number(//single/statusTypeID)=3) or (number(//single/statusTypeID)=4) or (number(//single/statusTypeID)=12)">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'pending'" />
							<xsl:with-param name="default" select="concat( ' is now in escrow', '. ' )" />
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="number(//single/statusTypeID)=14">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'pending'" />
							<xsl:with-param name="default" select="concat( ' is coming soon', '. ' )" />
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="//single/statusTypeID=''">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="''" />
							<xsl:with-param name="default" select="''" />
						</xsl:call-template>
					</xsl:if>
				</span>
				<span>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'scanqr'" />
						<xsl:with-param name="default" select="concat( 'Scan the QR code below to see all the listing photos and details, so you can compare how your home stacks up.' , '')" />
					</xsl:call-template>
				</span>
			</p>
		</foreignObject>

		<foreignObject x="4%" y="90%" width="45%" height="9%">
			<p class="" style="font-size:80%;margin:0;color:var(--theme-heading-color);font-family:var(--theme-body-font);">
				<xsl:call-template name="solicitation-disclaimer" />
			</p>
		</foreignObject>

		<image x="57.5%" y="63%" width="6.5%" height="10%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/scan-qr.svg' )" />
			</xsl:attribute>
		</image>

		<text x="59.6%" y="67.4%" class="align-right" fill="var(--theme-heading-color)" style="font-size:40%;">
			<tspan>Scan the</tspan>
			<tspan x="59.6%" dy="1%">QR Code</tspan>
			<tspan x="59.6%" dy="1%">with your</tspan>
			<tspan x="59.6%" dy="1%">camera</tspan>
		</text>

		<text class="small" fill="#181818" style="font-weight:500;font-size:100%;font-family:var(--theme-body-font);">
			<tspan x="66%" y="5%">
				<xsl:value-of select="//agent[1]/address/street" />
			</tspan>
			<tspan x="66%" y="8%">
				<xsl:value-of select="//agent[1]/address/city" />
				<xsl:text>, </xsl:text>
				<xsl:value-of select="//agent[1]/address/state" />
				<xsl:text>&#160;</xsl:text>
				<xsl:value-of select="//agent[1]/address/zip" />
			</tspan>
		</text>

		<xsl:call-template name="copyright">
			<xsl:with-param name="disclaimer" select="'direct-mail'" />
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>