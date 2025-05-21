<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0">
	<xsl:import href="common.xsl" />

	<xsl:template name="svg-scripts">
		<xsl:call-template name="map-files" />

		<script>
			<xsl:text>var listings=[</xsl:text>
			<xsl:for-each select="$mapListingNodes">
				<xsl:sort select="@isAgent" data-type="number" order="descending"/>
				<xsl:sort select="@sortDate" data-type="number" order="descending"/>

				<xsl:if test="position() &lt;= 8">
					<xsl:value-of select="concat( &quot;{state:'&quot;, @state, &quot;',lat:'&quot;, @lat, &quot;',lng:'&quot;, @lon, &quot;', dom:&quot;, @dom, &quot;},&quot; )" />
				</xsl:if>
			</xsl:for-each>
			<xsl:text>];</xsl:text>
		</script>
	</xsl:template>

	<xsl:template name="ed-listings-table">
		<xsl:param name="status" select="'pending'" />
		<xsl:param name="colorScheme" select="'--active-green'" />
		<xsl:param name="totalCount" select="count(//listings/listing[@state=$status])" />
		<xsl:param name="listings" select="//listings/listing[@state=$status]" />

		<xsl:variable name="tableWidth">
			<xsl:choose>
				<xsl:when test="$isFBAd='true'">
					<xsl:value-of select="'95%'" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'86%'" />

				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="tableHeight">
			<xsl:choose>
				<xsl:when test="$isFBAd='true'">
					<xsl:value-of select="'35%'" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'65%'" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="tableX">
			<xsl:choose>
				<xsl:when test="$isFBAd='true'">
					<xsl:value-of select="'0'" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'7%'" />

				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="tableY">
			<xsl:choose>
				<xsl:when test="$isFBAd='true'">
					<xsl:value-of select="'32%'" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'35%'" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<foreignObject>
			<xsl:attribute name="width">
				<xsl:value-of select="$tableWidth" />
			</xsl:attribute>
			<xsl:attribute name="height">
				<xsl:value-of select="$tableHeight" />
			</xsl:attribute>
			<xsl:attribute name="x">
				<xsl:value-of select="$tableX" />
			</xsl:attribute>
			<xsl:attribute name="y">
				<xsl:value-of select="$tableY" />
			</xsl:attribute>

			<table class="listings" style="width:100%;color:#e1e1e1;">
				<thead class="bold" style="margin-bottom:4px;">
					<th>Street Address</th>
					<th>List Price</th>
					<th>SF</th>
					<th>Price Per SF</th>
					<th>Bedrooms</th>
					<th>Bathrooms</th>
					<th >Date Listed</th>
					<th>DOM</th>
				</thead>
				<tbody>
					<xsl:for-each select="$listings">
						<xsl:sort select="@isAgent" data-type="number" order="descending"/>
						<xsl:sort select="@sortDate" data-type="number" order="descending"/>					

						<xsl:if test="position() &lt;= 12">
							<tr>
								<td>
								<xsl:value-of select="concat('test ', //single/address/streetNumber)" />
									<xsl:if test="$status!='sold'">
										<xsl:value-of select="concat('test ', //single/address/streetNumber)" />
									</xsl:if>
									<xsl:if test="$status='sold'">
										<xsl:value-of select="@address" />
									</xsl:if>
									<!-- <xsl:value-of select="@address" /> -->
								</td>
								<td>
									<xsl:value-of select="format-number(@listPrice, '$###,###')" />
								</td>
								<td>
									<xsl:value-of select="format-number(@size, '###,###')" />
								</td>
								<td >
									<xsl:if test="$status!='sold'">
										<xsl:value-of select="format-number(@listPrice div @size, '$###,###')" />
									</xsl:if>
									<xsl:if test="$status='sold'">
										<xsl:value-of select="format-number(@salePrice div @size, '$###,###')" />

									</xsl:if>
								</td>
								<td>
									<xsl:value-of select="@beds" />
								</td>
								<td>
									<xsl:value-of select="@baths" />
								</td>
								<td>
									<xsl:value-of select="genie:format-date( @listedDate, '[M02]-[D]-[Y0001]')" />
								</td>
								<td>
									<xsl:value-of select="@dom" />
								</td>
							</tr>
						</xsl:if>
					</xsl:for-each>
				</tbody>
			</table>
		</foreignObject>

		<style>
			<xsl:value-of select="'
			table.listings th {
    			padding: 1% 0 1%;
	 			border-bottom: 1px solid #b2934e;
	 			margin-bottom:1%;
				font-weight:800;
				}
			table.listings td {
    			border-bottom: none;
				padding:2px 0px;
				}
			table.listings td:nth-child(1), table.listings th:nth-child(1) {
    			text-align: left;
				}
			table.listings td{
				padding-top:2px;
				font-size:16px;
				}
			tbody:before {
   				line-height: 8px;
   				content: `\200C`;
			}
table.listings th, table.listings td {color: #fff;}'" />
		</style>
	</xsl:template>

	<!-- ****************************************** -->
	<xsl:template name="map-listings-table-header">
		<xsl:param name="status" select="'pending'" />
		<xsl:param name="colorScheme" select="'--active-green'" />
		<xsl:param name="totalCount" select="count(//listings/listing[@state=$status])" />
		<xsl:param name="listings" select="//listings/listing[@state=$status]" />

		<style>
			<xsl:value-of select="concat( ':root{ --color-scheme: var(', $colorScheme, ');' )" />

			<xsl:value-of select="' --theme-heading-color: var(--color-scheme); --theme-sub-heading-color: var(--color-scheme); } 
				#genie-wrapper[viewBox=&quot;0 0 555 555&quot;] .hide-small {	display: none; }

				g#headings {transform: translateX(2.5%);}
				g#details text { transform: translateX(50%); text-anchor: middle; }
				#genie-map{border-radius: 12px;} table.listings{font-size:90%;} #genie-wrapper[viewBox=&quot;0 0 555 555&quot;] table.listings{font-size:70%;}

				table.listings td + td {position: relative;	}

				table.listings td + td:nth-child(odd)::before {
					content: &quot;&quot;;
					width: 100%;
					height: 100%;
					position: absolute;
					left: 0;
					top: 0;
					background-color: var(--color-scheme);
					opacity: 0.05;
				}

				table.listings td:first-child {padding: 0px;}

				table.listings td:first-child span {
			    	background-color: var(--color-scheme);
			    	width: 25px;
				    height: 25px;
				    display: inline-block;
				    padding: 0px;
				    line-height: 25px; } svg[viewBox=&quot;0 0 555 555&quot;] table.listings td:first-child span {
			    	width: 15px;
				    height: 15px;
				    line-height: 15px;
			    }
				table.listings td:first-child span.new {background-color: var(--new-blue);	}
			    table.listings th, table.listings td {border-bottom: 1px solid var(--color-scheme);}
				#genie-map-sold { border-radius: 12px;}'" />
		</style>

		<g style="transform: scale(0.8) translate(2.5%, 2.5%);">
			<xsl:call-template name="property-count">
				<xsl:with-param name="icon" select="'home-lock'" />
				<xsl:with-param name="icon-fill" select="'var(--color-scheme)'" />
				<xsl:with-param name="caption" select="$status" />

				<xsl:with-param name="count" select="$totalCount" />
				<xsl:with-param name="description">
					<xsl:value-of select="genie:format-date( //output/@reportDate, '[MNn] [Y0001]')" />
				</xsl:with-param>
			</xsl:call-template>
		</g>

		<g id="headings" fill="var(--color-scheme)">
			<text y="3%" class="large upper bold" font-family="var(--theme-heading-font)" data-max-width="75%">
				<xsl:attribute name="x">
					<xsl:choose>
						<xsl:when test="$isFBAd='true'">
							<xsl:value-of select="'22%'" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'12%'" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<xsl:value-of select="//area/name" />
			</text>

			<text x="12%" class="bold" font-family="var(--theme-sub-heading-font)">
				<xsl:attribute name="font-size">
					<xsl:choose>
						<xsl:when test="$isFBAd='true'">
							<xsl:value-of select="'120%'" />

						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'180%'" />

						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>

				<xsl:attribute name="x">
					<xsl:choose>
						<xsl:when test="$isFBAd='true'">
							<xsl:value-of select="'22%'" />

						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'12%'" />

						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>

				<xsl:attribute name="y">
					<xsl:choose>
						<xsl:when test="$isFBAd='true'">
							<xsl:value-of select="'7.5%'" />

						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'10%'" />

						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<xsl:text>Market Report</xsl:text>
			</text>
		</g>

		<g>
			<text x="97%" text-anchor="end" class="large bold upper" style="font-size:140%" fill="var(--color-scheme)">
				<xsl:attribute name="y">
					<xsl:choose>
						<xsl:when test="$isFBAd='true'">
							<xsl:value-of select="'14%'" />

						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'12%'" />

						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<xsl:choose>
					<xsl:when test="$status='sold'">
						<xsl:value-of select="concat('Recent ', $singularPropertyType, ' Sales')" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat($status, ' ', $singularPropertyType, ' Listings')" />
					</xsl:otherwise>
				</xsl:choose>
			</text>

			<text x="97%" text-anchor="end">
				<xsl:attribute name="y">
					<xsl:choose>
						<xsl:when test="$isFBAd='true'">
							<xsl:value-of select="'19%'" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'18%'" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<xsl:attribute name="font-size">
					<xsl:choose>
						<xsl:when test="$isFBAd='true'">
							<xsl:value-of select="'100%'" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'120%'" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>

				<xsl:value-of select="genie:format-date( //output/@reportDate, '[FNn] [MNn] [D], [Y0001]')" />
			</text>
		</g>
	</xsl:template>

	<xsl:template name="map-listings-table">
		<xsl:param name="status" select="'pending'" />
		<xsl:param name="colorScheme" select="'--active-green'" />
		<xsl:param name="totalCount" select="count(//listings/listing[@state=$status])" />
		<xsl:param name="listings" select="//listings/listing[@state=$status]" />

		<style>
			<xsl:value-of select="concat( ':root{ --color-scheme: var(', $colorScheme, ');' )" />

			<xsl:value-of select="'
 					--theme-heading-color: var(--color-scheme); 
					--theme-sub-heading-color: var(--color-scheme); } #genie-wrapper[viewBox=&quot;0 0 555 555&quot;] .hide-small { display: none; }

				g#headings {transform: translateX(2.5%);}
				g#details text { transform: translateX(50%); text-anchor: middle; }
				#genie-map{border-radius: 12px;} table.listings{font-size:90%;} #genie-wrapper[viewBox=&quot;0 0 555 555&quot;] table.listings{font-size:70%;}

				table.listings td + td { position: relative; }

				table.listings td + td:nth-child(odd)::before {
					content: &quot;&quot;;
					width: 100%;
					height: 100%;
					position: absolute;
					left: 0;
					top: 0;
					background-color: var(--color-scheme);
					opacity: 0.05;
				}

				table.listings td:first-child {
	    			padding: 0px;
				}

				table.listings td:first-child span {
			    	background-color: var(--color-scheme);
			    	width: 25px;
				    height: 25px;
				    display: inline-block;
				    padding: 0px;
				    line-height: 25px; } svg[viewBox=&quot;0 0 555 555&quot;] table.listings td:first-child span {
			    	width: 15px;
				    height: 15px;
				    line-height: 15px;
			    }
				table.listings td:first-child span.new {background-color: var(--new-blue);}
			    table.listings th, table.listings td {border-bottom: 1px solid var(--color-scheme);}
				#genie-map-sold {border-radius: 12px;}'" />
		</style>

		<g style="transform: scale(0.8) translate(2.5%, 2.5%);">
			<xsl:call-template name="property-count">
				<xsl:with-param name="icon" select="'home-lock'" />
				<xsl:with-param name="icon-fill" select="'var(--color-scheme)'" />
				<xsl:with-param name="caption" select="$status" />

				<xsl:with-param name="count" select="$totalCount" />
				<xsl:with-param name="description">
					<xsl:value-of select="genie:format-date( //output/@reportDate, '[MNn] [D], [Y0001]')" />
				</xsl:with-param>
			</xsl:call-template>
		</g>

		<g id="headings" fill="var(--color-scheme)">
			<text y="3%" class="large upper bold" font-family="var(--theme-heading-font)" fill="var(--color-scheme)" data-max-width="75%">
				<xsl:attribute name="x">
					<xsl:choose>
						<xsl:when test="$isFBAd='true'">
							<xsl:value-of select="'22%'" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'12%'" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<xsl:value-of select="//area/name" />
			</text>
	
			<text x="12%" class="bold" font-family="var(--theme-sub-heading-font)" fill="var(--color-scheme)">		
				<xsl:attribute name="font-size">
					<xsl:choose>
						<xsl:when test="$isFBAd='true'">
							<xsl:value-of select="'120%'" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'180%'" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>

				<xsl:attribute name="x">
					<xsl:choose>
						<xsl:when test="$isFBAd='true'">
							<xsl:value-of select="'22%'" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'12%'" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>

				<xsl:attribute name="y">
					<xsl:choose>
						<xsl:when test="$isFBAd='true'">
							<xsl:value-of select="'7.5%'" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'10%'" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<xsl:text>Market Report</xsl:text>
			</text>
		</g>

		<g>
			<text x="97%" text-anchor="end" class="large bold upper" style="font-size:140%" fill="var(--color-scheme)">
				<xsl:attribute name="y">
					<xsl:choose>
						<xsl:when test="$isFBAd='true'">
							<xsl:value-of select="'14%'" />

						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'12%'" />

						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<xsl:choose>
					<xsl:when test="$status='sold'">
						<xsl:value-of select="concat('Recent ', $singularPropertyType, ' Sales')" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat($status, ' ', $singularPropertyType, ' Listings')" />
					</xsl:otherwise>
				</xsl:choose>
			</text>

			<text x="97%" text-anchor="end">
				<xsl:attribute name="y">
					<xsl:choose>
						<xsl:when test="$isFBAd='true'">
							<xsl:value-of select="'19%'" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'18%'" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<xsl:attribute name="font-size">
					<xsl:choose>
						<xsl:when test="$isFBAd='true'">
							<xsl:value-of select="'100%'" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'120%'" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>

				<xsl:value-of select="genie:format-date( //output/@reportDate, '[FNn] [MNn] [D], [Y0001]')" />
			</text>
		</g>

		<xsl:variable name="mapWidth">
			<xsl:choose>
				<xsl:when test="$isFBAd='true'">
					<xsl:value-of select="'95%'" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'30%'" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="mapHeight">
			<xsl:choose>
				<xsl:when test="$isFBAd='true'">
					<xsl:value-of select="'27.5%'" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'58%'" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="tableWidth">
			<xsl:choose>
				<xsl:when test="$isFBAd='true'">
					<xsl:value-of select="'95%'" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'65%'" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="tableHeight">
			<xsl:choose>
				<xsl:when test="$isFBAd='true'">
					<xsl:value-of select="'35%'" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'60%'" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="tableX">
			<xsl:choose>
				<xsl:when test="$isFBAd='true'">
					<xsl:value-of select="'0'" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'30%'" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="tableY">
			<xsl:choose>
				<xsl:when test="$isFBAd='true'">
					<xsl:value-of select="'32%'" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'0'" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="gTransform">
			<xsl:choose>
				<xsl:when test="$isFBAd='true'">
					<xsl:value-of select="'transform: translate(2.5%, 26%);'" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'transform: translate(2.5%, 28%);'" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<g>
			<xsl:attribute name="style">
				<xsl:value-of select="$gTransform" />
			</xsl:attribute>
			<defs>
				<clipPath id="mapClipPath">
					<rect x="0" y="0" rx="1%">
						<xsl:attribute name="width">
							<xsl:value-of select="$mapWidth" />
						</xsl:attribute>
						<xsl:attribute name="height">
							<xsl:value-of select="$mapHeight" />
						</xsl:attribute>
					</rect>
				</clipPath>
			</defs>
			<rect width="85%" x="10%" stroke-width="2" stroke="var(--color-scheme)" fill-opacity="0">
				<xsl:attribute name="height">
					<xsl:value-of select="$mapHeight" />
				</xsl:attribute>
			</rect>

			<g style="clip-path: url(#mapClipPath);">
				<foreignObject>
					<xsl:attribute name="width">
						<xsl:value-of select="$mapWidth" />
					</xsl:attribute>
					<xsl:attribute name="height">
						<xsl:value-of select="$mapHeight" />
					</xsl:attribute>
					<div>
						<xsl:attribute name="data-width">
							<xsl:value-of select="$mapWidth" />
						</xsl:attribute>
						<xsl:attribute name="data-height">
							<xsl:value-of select="$mapHeight" />
						</xsl:attribute>
						<xsl:call-template name="map-output">
							<xsl:with-param name="style" select="'streets-v11'" />
						</xsl:call-template>
					</div>
				</foreignObject>
			</g>

			<foreignObject>
				<xsl:attribute name="width">
					<xsl:value-of select="$tableWidth" />
				</xsl:attribute>
				<xsl:attribute name="height">
					<xsl:value-of select="$tableHeight" />
				</xsl:attribute>
				<xsl:attribute name="x">
					<xsl:value-of select="$tableX" />
				</xsl:attribute>
				<xsl:attribute name="y">
					<xsl:value-of select="$tableY" />
				</xsl:attribute>

				<table class="listings" style="width:100%;color:var(--theme-body-color);">
					<thead class="upper bold">
						<th></th>
						<th>Address</th>
						<th>BR</th>
						<th>BA</th>
						<th>Sq Ft</th>
						<th>List Price</th>
						<xsl:if test="$status='sold'">
							<th>Sold Price</th>
							<th>Sold Date</th>
						</xsl:if>
						<xsl:if test="$status!='sold'">
							<th >Price/SqFt</th>
						</xsl:if>
						<th>DoM</th>
					</thead>
					<tbody>
						<xsl:for-each select="$listings">
							<xsl:sort select="@isAgent" data-type="number" order="descending"/>
							<xsl:sort select="@sortDate" data-type="number" order="descending"/>

							<xsl:if test="position() &lt;= 8">
								<tr>
									<td>
										<span>
											<xsl:attribute name="class">
												<xsl:if test="@state='active' and number(@dom) &lt;= $domNew">
													<xsl:value-of select="'new'" />
												</xsl:if>
											</xsl:attribute>
											<xsl:value-of select="position()" />
										</span>
									</td>
									<td>
										<xsl:value-of select="@address" />
									</td>
									<td>
										<xsl:value-of select="@beds" />
									</td>
									<td>
										<xsl:value-of select="@baths" />
									</td>
									<td>
										<xsl:value-of select="format-number(@size, '###,###')" />
									</td>
									<td>
										<xsl:value-of select="format-number(@listPrice, '$###,###')" />
									</td>
									<xsl:if test="$status='sold'">
										<td>
											<xsl:value-of select="format-number(@salePrice, '$###,###')" />
										</td>
										<td>
											<xsl:value-of select="genie:format-date( @soldDate, '[M02]-[D]-[Y0001]')" />
										</td>
									</xsl:if>
									<xsl:if test="$status!='sold'">
										<td>
											<xsl:if test="$status!='sold'">
												<xsl:value-of select="format-number(@listPrice div @size, '$###,###')" />
											</xsl:if>
											<xsl:if test="$status='sold'">
												<xsl:value-of select="format-number(@salePrice div @size, '$###,###')" />
											</xsl:if>
										</td>
									</xsl:if>
									<td>
										<xsl:value-of select="@dom" />
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>
					</tbody>
				</table>
			</foreignObject>

			<rect rx="1%" stroke-width="3" stroke="var(--color-scheme)" fill-opacity="0">
				<xsl:attribute name="width">
					<xsl:value-of select="$mapWidth" />
				</xsl:attribute>
				<xsl:attribute name="height">
					<xsl:value-of select="$mapHeight" />
				</xsl:attribute>
			</rect>
		</g>
	</xsl:template>
</xsl:stylesheet>