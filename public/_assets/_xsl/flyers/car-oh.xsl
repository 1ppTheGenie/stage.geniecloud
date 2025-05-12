<?xml version="1.0"?>
<!--
	Asset Name: Car-oh
	Tags:		Flyer
	Sizes:		a5
	Supports:	Reports
	Version:	1.1
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		 <style type="text/css">
      		@import url('/_assets/_css/helvetica-neue.css');
    	</style>
		<g>
			<!-- header -->
			<g x="60" y="60">
				<image x="60" y="60" width="600" height="230">
				<xsl:attribute name="href">
					<xsl:value-of select="'_assets/_img/car-oh-logo.png'" />
				</xsl:attribute>
				</image>
				<text x="1300" y="100" font-family="'Lato', 'sans-serif'" font-size="50" font-weight="700" fill="#0E122F" style="text-transform:uppercase">
					<tspan x="1300" dy="0">Open house visitor non-agency</tspan>
					<tspan x="1390" dy="55">disclosure and sign-in</tspan>
					<tspan x="1480" dy="65" font-size="32">(C.A.R. form OHNA-SI, 7/24)</tspan>
				</text>
			</g>

			<!-- Basic Detail form -->
			<g transform="translate(60, 350)">
				<text font-size="38" font-weight="800" font-family="'Lato', 'sans-serif'" fill="#0e1232"> 
					<tspan x="0">Property address ("Property"):</tspan>  
					<tspan x="560">8615 Skyline Drive, Los Angeles, CA 90046</tspan> 
				</text>

				<line x1="530" y1="60" x2="1980" y2="60" style="stroke:#000;stroke-width:1"></line>

				<text x="2000" font-size="38" font-weight="800" font-family="'Lato', 'sans-serif'" fill="#0E122F">
					<tspan x="2000">Date:</tspan> 
					<tspan x="2130">04/19/2025</tspan> 
				</text>

				<line x1="2110" y1="60" x2="2400" y2="60" style="stroke:#000;stroke-width:1"></line>
			</g>

			<g transform="translate(60, 430)">
				<text font-size="38" font-weight="800" font-family="'Lato', 'sans-serif'" fill="#000">
					<tspan x="0">Real estate agent(s) ("Agent"):</tspan>  
					<tspan x="560">Jelena Pesovic Ed Kaminsky</tspan> 
				</text>

				<line x1="530" y1="60" x2="2400" y2="60" style="stroke:#000;stroke-width:1"></line>
			</g>

			<g transform="translate(60, 510)">
				<text font-size="38" font-weight="800" font-family="'Lato', 'sans-serif'" fill="#000">
					<tspan x="0">Real estate Broker ("Broker"):</tspan>  
					<tspan x="560">eXp Realty of California, Inc</tspan>   
				</text>

				<line x1="530" y1="60" x2="2400" y2="60" style="stroke:#000;stroke-width:1"></line>
			</g>

			<!-- Guidelines section -->
			<g transform="translate(60, 590)">
				<text font-size="46" font-weight="700" font-family="'Lato', 'sans-serif'" fill="#000" style="text-transform:uppercase">Visitor intention to view property: </text>
				<text font-size="44" font-weight="600" font-family="'Lato', 'sans-serif'" fill="#0e1232">
					<tspan x="910" dy="0">Agent is holding an open house or conducting in-person or live virtual tours</tspan>
					<tspan x="0" dy="50">of the Property identified above. Visitor is interested in viewing the Property. Agent agrees to show property to Visitor on</tspan>
					<tspan x="0" dy="50">the following terms and conditions:</tspan>
				</text>
			</g>
			<!-- Guidelines points-->

			<!-- 1 -->
			<g transform="translate(60, 760)">
				<text font-size="46" font-weight="700" font-family="'Lato', 'sans-serif'" fill="#000" style="text-transform:uppercase">
					<tspan x="0" fill="#656463">1. </tspan>
					<tspan x="60">Agent does not represent visitor:</tspan> 
				</text>
				<text font-size="44" font-weight="700" font-family="'Lato', 'sans-serif'" fill="#656463">
					<tspan x="930" dy="3">Unless otherwise agreed in writing, Agent is not working with and</tspan>
					<tspan x="60" dy="50">has not entered into a representation agreement with Visitor that would apply to the Property.</tspan>
				</text>
			</g>
			<!-- 2 -->
			<g transform="translate(60, 875)">
				<text font-size="46" font-weight="700" font-family="'Lato', 'sans-serif'" fill="#000" style="text-transform:uppercase">
					<tspan x="0" fill="#656463">2. </tspan> 
					<tspan x="60">Communication with agent at open house/property tour for benefit of seller:</tspan>
				</text>
				<text font-size="44" font-weight="700" font-family="'Lato', 'sans-serif'" fill="#656463">
					<tspan x="2080" dy="3">Any</tspan>
					<tspan x="60" dy="50">communication or sharing of information that Agent has with Visitor during the open house/property tour regarding the</tspan>
					<tspan x="60" dy="50">Property is for the benefit of the seller. All acts of Agent at the open house/property tour, even those that assist Visitor in</tspan>
					<tspan x="60" dy="50">deciding whether to make an offer on the Property are for the benefit of the seller exclusively.</tspan>
				</text>
			</g>
			<!-- 3 -->
			<g transform="translate(60, 1090)">
				<text font-size="46" font-weight="700" font-family="'Lato', 'sans-serif'" fill="#000" style="text-transform:uppercase">
					<tspan x="0" fill="#656463">3. </tspan> 
					<tspan x="60">Communication with agent are not confidential:</tspan>
				</text>
				<text font-size="44" font-weight="700" font-family="'Lato', 'sans-serif'" fill="#656463">
					<tspan x="1343" dy="3">Any information that Visitor reveals to Agent at the</tspan>
					<tspan x="60" dy="50">open house/property tour may be conveyed to the seller.</tspan>
				</text>
			</g>
			<!-- 4 -->
			<g transform="translate(60, 1205)">
				<text font-size="46" font-weight="700" font-family="'Lato', 'sans-serif'" fill="#000" style="text-transform:uppercase">
					<tspan x="0" fill="#656463">4. </tspan> 
					<tspan x="60">If visitor writes an offer on the property:</tspan>
				</text>
				<text font-size="44" font-weight="700" font-family="'Lato', 'sans-serif'" fill="#656463">
					<tspan x="1150" dy="3">through Agent, at that time Agent will disclose if Agent and</tspan>
					<tspan x="60" dy="50">Agent's Broker represent the seller exclusively or both the seller and the Visitor.</tspan>
				</text>
			</g>
			<!-- 5 -->
			<g transform="translate(60, 1320)">
				<text font-size="46" font-weight="700" font-family="'Lato', 'sans-serif'" fill="#000" style="text-transform:uppercase">
					<tspan x="0" fill="#656463">5. </tspan> 
					<tspan x="60">If visitor wants to be represented by the agent holding the open house:</tspan>
				</text>
				<text font-size="44" font-weight="700" font-family="'Lato', 'sans-serif'" fill="#656463">
					<tspan x="1900" dy="3">Visitor should sign a</tspan>
					<tspan x="60" dy="50">representation agreement with the Agent holding the open house such as a Property Showing and Representation</tspan>
					<tspan x="60" dy="50">Agreement (C.A.R. Form PSRA) or Buyer Representation and Broker Compensation Agreement (C.A.R. Form BRBC). If</tspan>
					<tspan x="60" dy="50">Visitor is in an exclusive relationship with another agent, this is not intended as a solicitation of Visitor.</tspan>
				</text>
			</g>
			<!-- Guidelines point end -->

			<!-- Visitors form -->
			<g transform="translate(60, 1548)">
				<text font-size="46" font-weight="700" font-family="'Lato', 'sans-serif'" fill="#000"> 
					Visitor Name/Email/Phone:
				</text>
				<text x="50%" font-size="46" font-weight="700" font-family="'Lato', 'sans-serif'" fill="#000"> 
					Visitor's Agent, if any:
				</text>				
			</g>

			<g transform="translate(60, 1620)">
				<text font-size="46" font-weight="700" font-family="'Lato', 'sans-serif'" fill="#656463">
					<tspan x="0"> Name: </tspan> 
					<tspan x="49%">Agent, if any:</tspan>
				</text>
				<line x1="160" y1="60" x2="1200" y2="60" style="stroke:#000;stroke-width:1"></line>
				<line x1="1550" y1="60" x2="2400" y2="60" style="stroke:#000;stroke-width:1"></line>

				<text transform="translate(60, 90)" font-size="46" font-weight="700" font-family="'Lato', 'sans-serif'" fill="#656463">
					<tspan x="0"> Email: </tspan> 
					<tspan x="1650">Phone:</tspan>
				</text>
				<line x1="210" y1="150" x2="1650" y2="150" style="stroke:#000;stroke-width:1"></line>
				<line x1="1880" y1="150" x2="2400" y2="150" style="stroke:#000;stroke-width:1"></line>
			</g>
			<g transform="translate(60, 1790)">
				<text font-size="46" font-weight="700" font-family="'Lato', 'sans-serif'" fill="#656463">
					<tspan x="0"> Name: </tspan> 
					<tspan x="49%">Agent, if any:</tspan>
				</text>
				<line x1="160" y1="60" x2="1200" y2="60" style="stroke:#000;stroke-width:1"></line>
				<line x1="1550" y1="60" x2="2400" y2="60" style="stroke:#000;stroke-width:1"></line>

				<text transform="translate(60, 90)" font-size="46" font-weight="700" font-family="'Lato', 'sans-serif'" fill="#656463">
					<tspan x="0"> Email: </tspan> 
					<tspan x="1650">Phone:</tspan>
				</text>
				<line x1="210" y1="150" x2="1650" y2="150" style="stroke:#000;stroke-width:1"></line>
				<line x1="1880" y1="150" x2="2400" y2="150" style="stroke:#000;stroke-width:1"></line>
			</g>
			<g transform="translate(60, 1960)">
				<text font-size="46" font-weight="700" font-family="'Lato', 'sans-serif'" fill="#656463">
					<tspan x="0"> Name: </tspan> 
					<tspan x="49%">Agent, if any:</tspan>
				</text>
				<line x1="160" y1="60" x2="1200" y2="60" style="stroke:#000;stroke-width:1"></line>
				<line x1="1550" y1="60" x2="2400" y2="60" style="stroke:#000;stroke-width:1"></line>

				<text transform="translate(60, 90)" font-size="46" font-weight="700" font-family="'Lato', 'sans-serif'" fill="#656463">
					<tspan x="0"> Email: </tspan> 
					<tspan x="1650">Phone:</tspan>
				</text>
				<line x1="210" y1="150" x2="1650" y2="150" style="stroke:#000;stroke-width:1"></line>
				<line x1="1880" y1="150" x2="2400" y2="150" style="stroke:#000;stroke-width:1"></line>
			</g>
			<g transform="translate(60, 2130)">
				<text font-size="46" font-weight="700" font-family="'Lato', 'sans-serif'" fill="#656463">
					<tspan x="0"> Name: </tspan> 
					<tspan x="49%">Agent, if any:</tspan>
				</text>
				<line x1="160" y1="60" x2="1200" y2="60" style="stroke:#000;stroke-width:1"></line>
				<line x1="1550" y1="60" x2="2400" y2="60" style="stroke:#000;stroke-width:1"></line>

				<text transform="translate(60, 90)" font-size="46" font-weight="700" font-family="'Lato', 'sans-serif'" fill="#656463">
					<tspan x="0"> Email: </tspan> 
					<tspan x="1650">Phone:</tspan>
				</text>
				<line x1="210" y1="150" x2="1650" y2="150" style="stroke:#000;stroke-width:1"></line>
				<line x1="1880" y1="150" x2="2400" y2="150" style="stroke:#000;stroke-width:1"></line>
			</g>
			<g transform="translate(60, 2300)">
				<text font-size="46" font-weight="700" font-family="'Lato', 'sans-serif'" fill="#656463">
					<tspan x="0"> Name: </tspan> 
					<tspan x="49%">Agent, if any:</tspan>
				</text>
				<line x1="160" y1="60" x2="1200" y2="60" style="stroke:#000;stroke-width:1"></line>
				<line x1="1550" y1="60" x2="2400" y2="60" style="stroke:#000;stroke-width:1"></line>

				<text transform="translate(60, 90)" font-size="46" font-weight="700" font-family="'Lato', 'sans-serif'" fill="#656463">
					<tspan x="0"> Email: </tspan> 
					<tspan x="1650">Phone:</tspan>
				</text>
				<line x1="210" y1="150" x2="1650" y2="150" style="stroke:#000;stroke-width:1"></line>
				<line x1="1880" y1="150" x2="2400" y2="150" style="stroke:#000;stroke-width:1"></line>
			</g>
			<g transform="translate(60, 2470)">
				<text font-size="46" font-weight="700" font-family="'Lato', 'sans-serif'" fill="#656463">
					<tspan x="0"> Name: </tspan> 
					<tspan x="49%">Agent, if any:</tspan>
				</text>
				<line x1="160" y1="60" x2="1200" y2="60" style="stroke:#000;stroke-width:1"></line>
				<line x1="1550" y1="60" x2="2400" y2="60" style="stroke:#000;stroke-width:1"></line>

				<text transform="translate(60, 90)" font-size="46" font-weight="700" font-family="'Lato', 'sans-serif'" fill="#656463">
					<tspan x="0"> Email: </tspan> 
					<tspan x="1650">Phone:</tspan>
				</text>
				<line x1="210" y1="150" x2="1650" y2="150" style="stroke:#000;stroke-width:1"></line>
				<line x1="1880" y1="150" x2="2400" y2="150" style="stroke:#000;stroke-width:1"></line>
			</g>
			<g transform="translate(60, 2640)">
				<text font-size="46" font-weight="700" font-family="'Lato', 'sans-serif'" fill="#656463">
					<tspan x="0"> Name: </tspan> 
					<tspan x="49%">Agent, if any:</tspan>
				</text>
				<line x1="160" y1="60" x2="1200" y2="60" style="stroke:#000;stroke-width:1"></line>
				<line x1="1550" y1="60" x2="2400" y2="60" style="stroke:#000;stroke-width:1"></line>

				<text transform="translate(60, 90)" font-size="46" font-weight="700" font-family="'Lato', 'sans-serif'" fill="#656463">
					<tspan x="0"> Email: </tspan> 
					<tspan x="1650">Phone:</tspan>
				</text>
				<line x1="210" y1="150" x2="1650" y2="150" style="stroke:#000;stroke-width:1"></line>
				<line x1="1880" y1="150" x2="2400" y2="150" style="stroke:#000;stroke-width:1"></line>
			</g>
			<g transform="translate(0, 2785)">
			<text font-size="31.15" font-weight="700" font-family="'Helvetica Neue'" fill="#656463">
                  <tspan x="60" dy="50">© 2024, California Association of REALTORS®, Inc. United States copyright law(Title 17 U.S. Code) forbids the unauthorized distribution, display and</tspan>
                  <tspan x="60" dy="50">reproduction of this form, or any portion thereof, by photocopy machine or any other means, including facsimile or computerized formats. THIS FORM HAS
</tspan>
                  <tspan x="60" dy="50">BEEN APPROVED BY THE CALIFORNIA ASSOCIATION OF REALTORS®. NO REPRESENTATION IS MADE AS TO THE LEGAL VALIDITY OR ACCURACY OF</tspan>
                  <tspan x="60" dy="50">ANY PROVISION IN ANY SPECIFIC TRANSACTION. A REAL ESTATE BROKER IS THE PERSON QUALIFIED TO ADVISE ON REAL ESTATE TRANSACTIONS. IF</tspan>
					<tspan x="60" dy="50">YOU DESIRE LEGAL OR TAX ADVICE, CONSULT AN APPROPRIATE PROFESSIONAL. This form is made available to real estate professionals through an</tspan>
					<tspan x="60" dy="50">agreement with or purchase from the California Association of REALTORS®.</tspan>
					<tspan x="60" dy="50">Published and Distributed by: REAL ESTATE BUSINESS SERVICES, LLC. <tspan style="font-style:italic">a subsidiary of the California Association of REALTORS</tspan>®</tspan>
					<tspan x="60" dy="60" font-family="sans-serif" font-size="40" font-weight="800" fill="#000000">OHNA-SI 7/24 (PAGE 1 OF 1)</tspan>
			   </text>
			  <image x="93%" y="320" width="85" height="102" preserveAspectRatio="xMidYMid slice">
				<xsl:attribute name="href">
					<xsl:value-of select="'_assets/_img/equal-housing-opportunity.png'" />
				</xsl:attribute>
			</image>
			</g>
			<!-- Visitors form end -->
		</g>
	</xsl:template>
</xsl:stylesheet>