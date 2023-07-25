<?xml version="1.0"?>
<!--
	Asset Name: Ed Kaminsky Brochure 02
	Tags:		Direct Mail
	Sizes:		Ipad Landscape
	Supports:	Listing, Multi-Listing
	Pages:		flyers/open-house-welcome-stand-landscape
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="svg-body">
		<link rel="stylesheet">
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/futura-embedded.css')"/>
		</link>

		<style>
			<xsl:value-of select="'
			foreignObject .head,
			foreignObject p{
				color:#000;
			}'" />
		</style>

		<rect x="0%" y="0%" width="100%" height="100%" fill="#E5E4E2" />
		<rect x="2%" y="2%" width="96%" height="98%" fill="#13182f" />

		<image x="-35%" y="10%" width="28%" height="10%" id="logo" preserveAspectRatio="xMidYMid meet" style="transform: rotate(270deg); -webkit-transform: rotate(270deg);">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/kaminsky-logo01.png' )" />
			</xsl:attribute>
		</image>

		<text x="11%" class=" center futura-text" style="font-size:250%;">
			<tspan x="11%" y="50%" class="bold" fill="#e1e1e1">4</tspan>
			<tspan x="11%" y="52.5%" fill="#b0934c" font-size="100%">beds</tspan>
		</text>

		<text x="11%" class=" center futura-text" style="font-size:250%;">
			<tspan x="11%" y="57%" class="bold" fill="#e1e1e1">4</tspan>
			<tspan x="11%" y="59.5%" fill="#b0934c" font-size="100%">baths</tspan>
		</text>

		<text x="11%" class=" center futura-text" style="font-size:250%;">
			<tspan x="11%" y="66%" class="bold" fill="#e1e1e1">2,100</tspan>
			<tspan x="11%" y="68.5%" fill="#b0934c" font-size="100%">sq ft (btv)</tspan>
		</text>

		<text x="11%" class=" center futura-text" style="font-size:250%;">
			<tspan x="11%" y="74%" class="bold" fill="#e1e1e1">INQUIRE</tspan>
			<tspan x="11%" y="76.5%" fill="#b0934c" font-size="100%">sq ft lot</tspan>
		</text>

		<text x="11%" class=" center futura-text" style="font-size:250%;">
			<tspan x="11%" y="82%" class="bold" fill="#e1e1e1">2011</tspan>
			<tspan x="11%" y="84%" fill="#b0934c" font-size="100%">year built</tspan>
		</text>

		<text x="11%" class=" center futura-text" style="font-size:250%;">
			<tspan x="11%" y="90%" class="bold" fill="#e1e1e1">$1,599,000</tspan>
			<tspan x="11%" y="93%" fill="#b0934c" font-size="100%">Just Sold</tspan>
		</text>

		<rect x="20.8%" y="2%" width="50.5%" height="98%" fill="#fff" />
		<image x="21%" y="2%" width="50%" height="47.5%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-1'" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<foreignObject width="46%" height="50%" x="23%" y="51%">
			<div class="futura-text bold head" style="font-size:40px;">
				15764 Via Montenero, Roundhill Country Club
			</div>
			<p class="futura-text" style="font-size:18px;">
			San Diego Dreaming Stunning Designer home in the heart of Del Sur offers a level of sophistication and refinement,
			rarely offered
			</p>
			<p class="futura-text" style="font-size:18px;">
			Recently renovated, this highly customized Madeira model home will captivate your soul &#38; elevate your lifestyle
			</p>
			<p class="futura-text" style="font-size:18px;">
			Boasting custom upgrades &#38; designer detailing throughout, no detail was overlooked; DuChatuea hardwood floors,
			ultra-luxe Chef’s kitchen, designer fixtures, new fireplace, mantel, integrated AV system, new carpet, LED lighting,
			&#38; so more.
			</p>
			<p class="futura-text" style="font-size:18px;">
			Offering a N/S orientation this exceptional home offers an open design that enjoys tons of natural light &#38; coastal
			breezes, while maximizing privacy.
			</p>
			<p class="futura-text" style="font-size:18px;">
			Upon entering the residence, you are greeted by a spacious interior courtyard entry, offering access to the ensuite
			casita, garages, &#38; main residence.
			</p>
			<p class="futura-text" style="font-size:18px;">
			As you step inside, you’re greeted by a grand great room w/ 2-story vaulted ceilings, &#38; you immediately feel at HOME
			</p>
			<p class="futura-text" style="font-size:18px;">
			Designed for entertaining &#38; everyday livability in mind, you’ll enjoy seamless transitions between the great rm, kitchen, dining rm, &#38; the outdoor entertaining spaces of the main.
			</p>
			<p class="futura-text" style="font-size:18px;">
			Upstairs, you will enjoy a spacious primary retreat, spa inspired bath &#38; custom designer walk-in closet on the southern end of the home.
			</p>
			<p class="futura-text" style="font-size:18px;">
			Just down the hall, as you overlook the grand great room below, you’ll find 2 generous bedrooms that share an
			oversized J&#38;J bath, and the laundry.
			</p>

			<p class="futura-text" style="font-size:18px;">
			Offering an ideal location, this rare gem is just a short walk to the amazing parks, pools, &#38; award-winning schools of Del
			</p>
		</foreignObject>

		<image x="23%" y="93%" width="5%" height="5%" id="logo" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/360-icon.png' )" />
			</xsl:attribute>
		</image>
		<text x="35%" y="94%" fill="#b0934c" class="center futura-text" style="font-size:250%;">
			www.inspired.re
		</text>

		<rect x="71%" y="2%" width="27%" height="70%" fill="#fff" />
		<image x="71.3%" y="2%" width="26.7%" height="23.5%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-2'" />
				<xsl:with-param name="idx" select="2" />
			</xsl:call-template>
		</image>
		<image x="71.3%" y="26%" width="26.7%" height="23.5%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-3'" />
				<xsl:with-param name="idx" select="3" />
			</xsl:call-template>
		</image>
		<image x="71.3%" y="50%" width="26.7%" height="23.5%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-4'" />
				<xsl:with-param name="idx" select="5" />
			</xsl:call-template>
		</image>

		<rect x="71%" y="73.5%" width="27%" height=".5%" fill="#fff" />
		<image x="72%" y="78%" width="5%" height="5%" id="logo" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/360-icon.png' )" />
			</xsl:attribute>
		</image>
		<text x="80%" y="75%" class=" center futura-text super-bold" style="font-size:280%;">
			<tspan x="81%" y="75%" fill="#e1e1e1">Steve</tspan>
			<tspan x="88%" y="75%" fill="#b0934c" class="futura-text"> Hundley</tspan>
		</text>
		<text x="85%" y="78.5%" fill="#e1e1e1" class="center futura-text" style="font-size:200%;">
			CA BRE #: 00905478
		</text>
		<line xmlns="" x1="78.5%" y1="82%" x2="96%" y2="82%" style="stroke:#b0934c;stroke-width:2.5"></line>
		<text x="85%" y="84%" class=" center futura-text" style="font-size:180%;">
			<tspan x="79%" y="84%" fill="#b0934c ">c</tspan>
			<tspan x="84%" y="84%" fill="#e1e1e1">(619) 507.4404</tspan>
		</text>
		<text x="85%" y="87%" class=" center futura-text" style="font-size:180%;">
			<tspan x="79%" y="86%" fill="#b0934c ">e</tspan>
			<tspan x="85%" y="86%" fill="#e1e1e1">steve@Inspired.re</tspan>
		</text>
		<text x="73%" y="89%" fill="#e1e1e1" class="futura-text" style="font-size:150%;">
			Listed by Steve Hundley • CA BRE #: 00905478
		</text>
		<text x="73%" y="" class="futura-text">
			<tspan x="73%" y="91.5%" fill="#e1e1e1" style="font-size:90%;">
				EXP REALTY OF CALIFORNIA, INC LICENSE CA BRE #: 00905478. INFORMATION IS
			</tspan>
			<tspan x="73%" y="92.5%" fill="#e1e1e1" style="font-size:81%;">
				DEEMED RELIABLE, BUT NOT GUARANTEED. BROKER HAS NOT AND WILL NOT INVESTIGATE
			</tspan>
			<tspan x="73%" y="93.5%" fill="#e1e1e1" style="font-size:85%;">
				OR VERIFYTHE ACCURACYOF THIS INFORMATION.
			</tspan>
		</text>

		<rect x="71%" y="98%" width="27%" height="2%" fill="#fff" />
	</xsl:template>
</xsl:stylesheet>