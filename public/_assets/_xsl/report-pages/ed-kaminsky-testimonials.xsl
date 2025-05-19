<?xml version="1.0"?>
<!--
	Asset Name: Ed Kaminsky Testimonials
	Tags: 		Map, Listings, Infographic
	Sizes:		Facebook, Facebook Ad, Facebook Post
	Supports:	Area, Multi-Listing, ListingStatus
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<!-- <link rel="stylesheet">
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/futura-embedded.css')" />
		</link> -->
		<style type="text/css">
			@import url("/_assets/_css/futura-embedded.css");
		</style>
		<style>
			<xsl:value-of select="'
			.testimonial-comma{
				font-size: 60px;
			    font-weight: 800;
			    color: #b0934c;
			    font-style: italic;
			    height: 50px;
			    width: 50px;
			    text-align: center;
			    line-height: 80px;
			    margin: 0 auto;
			    transform: rotate(180deg);
			    -webkit-transform: rotate(180deg);
			}	
			.para-text{
				color: #fff;
			    text-align: center;
			    margin-bottom: 0;
			    font-size: 14px;
			    line-height: 120%!important;
			    margin:0;
}'" />
		</style>

		<image x="0" y="0" width="100%" height="100%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/blue-back-image.jpg' )" />
			</xsl:attribute>
		</image>

		<text x="50%" y="8%" fill="#fff" class="center futura-text" font-size="160%" style="letter-spacing:5px; ">
			JUST DECLASSIFIED:
		</text>

		<text x="50%" y="10%" class="center futura-text super-bold" font-size="438%">
			<tspan x="31%" y="13%" fill="#e1e1e1">Client</tspan>
			<tspan x="59.5%" y="13%" fill="#b0934c" class="futura-text">Testimonials</tspan>
		</text>

		<foreignObject width="27%" height="40%" x="7.5%" y="26.5%">
			<div class="futura-text testimonial-comma">"</div>
			<p class="futura-text para-text" style="height: 67%;font-size: 87%;">
				I want to express my sincere thanks for the
                impeccable quality of your team. You had me at
                your ad campaign. Your pics were awesome, too.
                What a closing we got. I’m grateful for every email
                I received with status updates, changes or progress
                reports on the sale of the house. You’re efficient,
                friendly, technology savvy and on top of your
                game. Thank you all. <br/>
			<span style="line-height:42px; font-size:15px;">- Steve Ohab, Jr.</span>
		</p>
	</foreignObject>

	<foreignObject width="27%" height="35%" x="7.5%" y="61%">
		<div class="futura-text testimonial-comma">"</div>
		<p class="futura-text para-text" style="height:67%; font-size: 87%; margin:0;">
				It was great working with Ed and his entire team! We have bought and sold many homes in Manhattan Beach over the past 20 years. Super Ed exceeded our expectations in every way! His creativity,enthusiasm and professionalism are over the top. Ed is the only agent for us!!! Thank you! <br/>
		<span style="line-height:30px; font-size:15px; margin-left:10px">- Lori Chase</span>
	</p>
</foreignObject>

<foreignObject width="27%" height="70%" x="37%" y="26.5%">
	<div class="futura-text testimonial-comma">"</div>
	<p class="futura-text para-text" style="height:75%; font-size: 87%;">
				The only thing we regret, regarding Ed and his
                team,is that we have not ‘Yelped’ them sooner! Ed
                and his team did an amazing job selling our family
                home in Palos Verdes Estates in 20 days on the
                ‘Prestigious Paseo Del Mar!’ We cannot begin to
                say how much we appreciated all that Ed and his
                team has done for our family. Our situation was a
                very complicated and unusual one and we know
                that it tested all of Ed’s patience. We interviewed
                numerous of realtors before we decided to use Ed
                and his team and they definitely amounted up to
                our expectations and then some. Ed was very very
                professional, knowledgeable, smart, pleasant and
                yet he was very personable. Whenever we needed
                to reach Ed or someone on his team we would
                always receive an immediate call back. Thank you
                Ed! You guys will always have a special place in
                our hearts! <br/>
	<span style="line-height:30px; font-size:15px;">Pamela Sanders &#38; Mary Cohen</span>
</p>

</foreignObject>

<foreignObject width="27%" height="35%" x="66%" y="26.5%">
<div class="futura-text testimonial-comma">"</div>
<p class="futura-text para-text" style="height:67%; font-size: 87%;">
				Ed and his team have done an AWESOME job for
                me as a buyer and a seller. Ed and his team are a
                force to be reckoned with! He has made a process
                that could have been horribly stressful and
                frustrating into an adventure! I told him this
                morning that I was almost disappointed that the
                ride was over! Thank you for everything! <br/>
<span style="line-height:44px; font-size:15px;">- Dawn Hunkin</span>
</p>
</foreignObject>

<foreignObject width="27%" height="35%" x="66%" y="58%">
<div class="futura-text testimonial-comma">"</div>
<p class="futura-text para-text" style="height:67%; font-size: 87%;">
				My wife and I are pleased to share the very
                successful experience we had working with Ed. As
                business people, we were often disappointed with
                the lack of real value brought by residential
                Realtors. With Ed and his team, we certainly did
                see and benefit from what he brought to the
                transaction <br/>
<span style="line-height:30px; font-size:15px;">- Michael &#38; Dorothy Don</span>
</p>
</foreignObject>
<xsl:call-template name="copyright" />
</xsl:template>
</xsl:stylesheet>