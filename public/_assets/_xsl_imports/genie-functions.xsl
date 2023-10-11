<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">

	<xsl:function name="genie:pick">
		<xsl:param name="default" />
		<xsl:param name="choices" />

		<xsl:param name="size" />

		<xsl:variable name="choicesArray">
			<xsl:choose>
				<xsl:when test="string($choices)">
					<xsl:value-of select="concat($choices, ',')" />
				</xsl:when>
				<xsl:otherwise>,</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="choicesList" select="tokenize($choicesArray, ',')" />

		<xsl:variable name="adjustedDefault" select="$default - 1" />

		<xsl:variable name="r">
			<xsl:choose>
				<xsl:when test="$choicesList[$adjustedDefault + 1]">
					<xsl:value-of select="$choicesList[$adjustedDefault + 1]" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$default" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="finalR">
			<xsl:choose>
<xsl:when test="$r > $assetSize">
					<xsl:value-of select="$default * -1" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$r" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:value-of select="$finalR" />
	</xsl:function>

	<xsl:function name="genie:split-to-paras">
		<xsl:param name="split_str" />
		<xsl:value-of select="'ToDo'" />
	</xsl:function>

	<xsl:function name="genie:maybe-not-number">
		<xsl:param name="var" />
		<!-- <xsl:if test="//single/lotSize!='' and string(number(//single/lotSize))!='NaN'"> 
		
		<xsl:when test="//single/lotSize castable as xs:double">
														
		-->
		<xsl:choose>
			<xsl:when test="number($var) > 0">
<xsl:value-of select="format-number($var, '###,###')" />

			</xsl:when>
			<xsl:otherwise>
<xsl:value-of select="$var" />

			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>

	<xsl:function name="genie:area-price-change">
		<xsl:param name="context" />
		<xsl:param name="pricePercent" />
		<xsl:param name="precision" />

		<xsl:choose>
			<xsl:when test="$pricePercent='price'">
				<xsl:value-of select="number($context/@medianSalePrice) - number($context/previous/@medianSalePrice)" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="round( (( number($context/@medianSalePrice) div number($context/previous/@medianSalePrice) ) - 1) * 100 )" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>

	<xsl:function name="genie:area-price-change-message">
		<xsl:param name="areaId" />
		<xsl:param name="change" />
		<xsl:param name="pricePercent" />

		<xsl:choose>
			<xsl:when test="$change > 0">
				<xsl:variable name="increase">
					<xsl:choose>
						<xsl:when test="$pricePercent = 'price'">
							<xsl:value-of select="genie:currency-format( $change, 0 )" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="format-number( $change, '#.#' )" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>

				<xsl:value-of select="concat(  //areas/area[id = $areaId]/name, ' ', lower-case( $propertyType ),' are up',  $increase, ' in the past ', //statistics/@lookbackMonths,' months' )" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="concat( 'Prices for ', lower-case( $propertyType ), ' in ', //areas/area[id = $areaId]/name, ' have shifted in the past ', //statistics/@lookbackMonths, ' months' )" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>

	<xsl:function name="genie:indefinite-article">
		<xsl:param name="strg" as="xs:string" />

		<xsl:variable name="firstChar" select="substring($strg, 1, 1)" />

		<xsl:choose>
			<xsl:when test="index-of( ('A', 'E', 'I', 'O', 'U'), upper-case($firstChar) ) != -1">
				<xsl:value-of select="'An'" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'A'" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>

	<xsl:function name="genie:currency-format">
<xsl:param name="value" as="xs:double" />
<xsl:param name="precision" as="xs:integer" />
<xsl:variable name="suffixes" select="('', 'k', 'm')" />
<xsl:variable name="base" select="math:log($value) div math:log(1000)" />

		<xsl:choose>
			<xsl:when test="string(number($base)) = 'NaN'">
<xsl:value-of select="$value" />

			</xsl:when>
			<xsl:otherwise>
<xsl:value-of select="concat('$', round(math:pow(1000, $base - floor($base)) * 100, $precision), $suffixes[floor($base)])" />

			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>

	<xsl:function name="genie:format-date">
		<xsl:param name="date" />
		<xsl:param name="format" as="xs:string" />

		<xsl:variable name="ts" as="xs:dateTime">
			<xsl:choose>
				<xsl:when test="$date = ''">
					<xsl:value-of select="current-dateTime()" />
				</xsl:when>
				<xsl:when test="number($date) = number($date)">
					<xsl:value-of select="xs:dateTime('1970-01-01T00:00:00Z') + xs:dayTimeDuration(concat('PT', $date, 'S'))" />
				</xsl:when>
				<xsl:otherwise>
<xsl:value-of select="xs:dateTime($date)" />

				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:value-of select="format-dateTime( $ts, $format )" />
	</xsl:function>
</xsl:stylesheet>