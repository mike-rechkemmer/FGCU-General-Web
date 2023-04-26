<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
<!ENTITY amp   "&#38;">
<!ENTITY copy   "&#169;">
<!ENTITY gt   "&#62;">
<!ENTITY hellip "&#8230;">
<!ENTITY laquo  "&#171;">
<!ENTITY lsaquo   "&#8249;">
<!ENTITY lsquo   "&#8216;">
<!ENTITY lt   "&#60;">
<!ENTITY nbsp   "&#160;">
<!ENTITY quot   "&#34;">
<!ENTITY raquo  "&#187;">
<!ENTITY rsaquo   "&#8250;">
<!ENTITY rsquo   "&#8217;">
<!ENTITY rdquo   "&#8221;">
]>
<!-- 
  Implementations Skeleton - 01/10/2017
  
  SNIPPET XSL
  Place snippet XSL template matches in this file.
  
  Contributors: cwilson
  Last Updated: 5/2017
  
-->
<xsl:stylesheet version="3.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:ou="http://omniupdate.com/XSL/Variables"
  xmlns:fn="http://omniupdate.com/XSL/Functions"
  xmlns:ouc="http://omniupdate.com/XSL/Variables"
				xmlns:ousupp="http://ousupport"
  exclude-result-prefixes="xs ou fn ouc ousupp">
  
  <!-- snippets -->
  
  <!-- Table Transformations -->
  
  <!-- 
    College Landing
  -->
  
  <!-- [College Landing] Student Highlight Slider -->
  <xsl:template match="table[@class='ou-stories-slider']">
    <xsl:if test="tbody/tr[1]/td[1]/descendant::img">
      <xsl:variable name="image" select="tbody/tr[1]/td[1]/descendant::img/@src" />    
      <xsl:variable name="extension" select="substring-after($image, '.')" />		
      <xsl:variable name="tablet-image" select="concat(replace($image, $extension, ''), '-tablet.', $extension) " />
      <xsl:variable name="mobile-image" select="concat(replace($image, $extension, ''), '-mobile.', $extension) " />      
      <section class="meet-fgcu-testimonial desktop-banner" data-z-index="auto" data-parallax="scroll" data-image-src="{$image}">
        <div class="tablet-banner" style="background-image: url({$tablet-image})">
          <div class="mobile-banner" style="background-image: url({$mobile-image})">
            <div class="container">
              <xsl:if test="ou:textual-content(tbody/tr[1]/td[2]) != ''"><h2 class="intro-text"><xsl:value-of select="tbody/tr[1]/td[2]/node()"/></h2></xsl:if>
              <div class="story-carousel">
                <xsl:for-each select="tbody/tr[position() gt 1]">
                  <div class="story-bubble-wrapper">
                    <div class="bubble-graphic">
                      <div class="arrows-wrapper">
                        <div class="arrows"></div>
                        <div class="portrait-wrapper">
                          <div class="portrait">
                            <img src="{td[2]/descendant::img/@src}" alt="{td[2]/descendant::img/@alt}" class="initial-portrait"/>
                            <img src="{td[3]/descendant::img/@src}" alt="{td[3]/descendant::img/@alt}" class="active-state"/>
                            <div class="testimonial-content">
                              <div class="mentorship-content">
                                <xsl:apply-templates select="td[4]/node()"/>
                              </div>
                              <div class="engagement-content">
                                <xsl:apply-templates select="td[7]/node()"/>                               
                              </div>
                            </div>
                            <div class="overlay"></div>
                          </div>
                        </div>  <!-- .portrait-wrapper -->
                        <button class="icon-wrapper engagement">
                          <span class="icon">
                            <span class="para"><span class="label"><xsl:value-of select="concat(td[8], ' ')"/> </span><span class="active-state"><xsl:value-of select="td[9]"/></span></span>
                          </span> 
                        </button>
                        <button class="icon-wrapper mentorship">
                          <span class="icon">
                            <span class="para"><span class="label"><xsl:value-of select="td[6]"/> </span><span class="active-state"><xsl:value-of select="td[5]"/></span></span>
                          </span>
                        </button>
                      </div>
                      <xsl:if test="ou:textual-content(td[1]) != ''">
                        <div class="quote">
                          <p class="intro-text"><xsl:value-of select="td[1]/node()"/></p>
                        </div>
                      </xsl:if>
                    </div>
                    <div class="links">
                      <div class="top">
                        <a class="button green solid main-link">
                          <xsl:apply-templates select="td[10]/descendant::a/attribute()[not(name() = 'class')]"/>                          
                          <xsl:value-of select="td[10]/descendant::a/text()"/>
                        </a>
                      </div>
                      <xsl:apply-templates select="td[11]/node()"/>
                    </div>
                  </div>
                </xsl:for-each>                
              </div>
              <xsl:if test="ou:textual-content(tbody/tr[1]/td[3]) != ''"><h2><xsl:value-of select="tbody/tr[1]/td[3]/node()"/></h2></xsl:if>
            </div><!-- .row -->
          </div>
        </div>
      </section><!-- .meet-fgcu -->
    </xsl:if>
  </xsl:template>
  
  <!-- [College Landing] Columns: 2 Up, Image -->
  <xsl:template match="table[@class='ou-columns-two-up']">
    <section class="living-laboratory">
      <div class="row container">
        <div class="col-sm-12">
          <div class="thumbnail">
            <xsl:apply-templates select="tbody/tr[1]/td[1]/descendant::img[1]"/>
            <xsl:apply-templates select="tbody/tr[2]/td[1]/descendant::img[1]"/>
          </div>
          <div class="content">
            <xsl:apply-templates select="tbody/tr[3]/td[1]/node()"/>
          </div>
        </div>
        <div class="col-sm-12">
          <div class="thumbnail">
            <xsl:apply-templates select="tbody/tr[1]/td[2]/descendant::img[1]"/>
            <xsl:apply-templates select="tbody/tr[2]/td[2]/descendant::img[1]"/>
          </div>
          <div class="content">
            <xsl:apply-templates select="tbody/tr[3]/td[2]/node()"/>
          </div>
        </div>
      </div>
    </section><!-- .living-laboratory -->
  </xsl:template>
	
<!-- FGCUTEAM [College Landing] Columns: 3 Up, Image Large-->
  <xsl:template match="table[@class='ou-columns-three-up-large']">
  	<xsl:variable name="options-used" select="lower-case(ou:textual-content(caption[2]/node()))"/>

    <section class="living-laboratory living-lab-small">
      <div class="row">
      <xsl:choose>
      <xsl:when test="contains($options-used, '4column')">
                <div class="col-sm-6">
                <div class="thumbnail">
                    <xsl:apply-templates select="tbody/tr[1]/td[1]/descendant::img[1]"/>
                    <xsl:apply-templates select="tbody/tr[2]/td[1]/descendant::img[1]"/>
                </div>
                <div class="content">
                    <xsl:apply-templates select="tbody/tr[3]/td[1]/node()"/>
                </div>
                </div>
                <div class="col-sm-6">
                <div class="thumbnail">
                    <xsl:apply-templates select="tbody/tr[1]/td[2]/descendant::img[1]"/>
                    <xsl:apply-templates select="tbody/tr[2]/td[2]/descendant::img[1]"/>
                </div>
                <div class="content">
                    <xsl:apply-templates select="tbody/tr[3]/td[2]/node()"/>
                </div>
                </div>
                <div class="col-sm-6">
                <div class="thumbnail">
                    <xsl:apply-templates select="tbody/tr[1]/td[3]/descendant::img[1]"/>
                    <xsl:apply-templates select="tbody/tr[2]/td[3]/descendant::img[1]"/>
                </div>
                <div class="content">
                    <xsl:apply-templates select="tbody/tr[3]/td[3]/node()"/>
                </div>
                </div>
                    <div class="col-sm-6">
                <div class="thumbnail">
                    <xsl:apply-templates select="tbody/tr[1]/td[4]/descendant::img[1]"/>
                    <xsl:apply-templates select="tbody/tr[2]/td[4]/descendant::img[1]"/>
                </div>
                <div class="content">
                    <xsl:apply-templates select="tbody/tr[3]/td[4]/node()"/>
                </div>
                </div>

            </xsl:when>
          	<xsl:otherwise>

                <div class="col-sm-8">
                <div class="thumbnail">
                    <xsl:apply-templates select="tbody/tr[1]/td[1]/descendant::img[1]"/>
                    <xsl:apply-templates select="tbody/tr[2]/td[1]/descendant::img[1]"/>
                </div>
                <div class="content">
                    <xsl:apply-templates select="tbody/tr[3]/td[1]/node()"/>
                </div>
                </div>
                <div class="col-sm-8">
                <div class="thumbnail">
                    <xsl:apply-templates select="tbody/tr[1]/td[2]/descendant::img[1]"/>
                    <xsl:apply-templates select="tbody/tr[2]/td[2]/descendant::img[1]"/>
                </div>
                <div class="content">
                    <xsl:apply-templates select="tbody/tr[3]/td[2]/node()"/>
                </div>
                </div>
                    <div class="col-sm-8">
                <div class="thumbnail">
                    <xsl:apply-templates select="tbody/tr[1]/td[3]/descendant::img[1]"/>
                    <xsl:apply-templates select="tbody/tr[2]/td[3]/descendant::img[1]"/>
                </div>
                <div class="content">
                    <xsl:apply-templates select="tbody/tr[3]/td[3]/node()"/>
                </div>
                </div>
           
      	</xsl:otherwise>
      </xsl:choose>
       </div>
    </section><!-- .living-laboratory -->
  </xsl:template>

	 <!-- Infotext 3 Up Simple - fgcuteam-mike -->
	<!-- https://stackoverflow.com/questions/4885300/how-to-remove-all-tags-except-for-some-using-nokogiri   https://stackoverflow.com/questions/11868331/strip-tags-from-xml-using-xslt-all-except-some-negate-condition -->
  <xsl:template match="table[@class='ou-infotext-simple']">
    <section class="container-flex infotext simple">
      <div class="row">
        <div class="infotext-col col-sm-8">
          <div class="h6 color-blue-text title-bottom-border"><xsl:value-of select="ou:textual-content(tbody/tr[1]/td[1]/node())"/></div>
          <div class="infotext-text font-size-s"><xsl:apply-templates select="tbody/tr[1]/td[2]/node()"/></div>
		  <div class="infotext-link"><xsl:if test="ou:textual-content(tbody/tr[1]/td[3]) != ''"><a class="font-type-regular {tbody/tr[1]/td[3]/descendant::a/@class}" href="{tbody/tr[1]/td[3]/descendant::a/@href}"><xsl:value-of select="tbody/tr[1]/td[3]/node()"/></a></xsl:if></div>
        </div>
        <div class="infotext-col col-sm-8 color-lightgrey-background">
          <div class="h6 color-blue-text title-bottom-border"><xsl:value-of select="ou:textual-content(tbody/tr[2]/td[1]/node())"/></div>
          <div class="infotext-text font-size-s"><xsl:apply-templates select="tbody/tr[2]/td[2]/node()"/></div>
		  <div class="infotext-link"><xsl:if test="ou:textual-content(tbody/tr[2]/td[3]) != ''"><a class="font-type-regular {tbody/tr[2]/td[3]/descendant::a/@class}" href="{tbody/tr[2]/td[3]/descendant::a/@href}"><xsl:value-of select="tbody/tr[2]/td[3]/node()"/></a></xsl:if></div>
        </div>
        <div class="infotext-col col-sm-8 col-last">
          <div class="h6 color-blue-text title-bottom-border"><xsl:value-of select="ou:textual-content(tbody/tr[3]/td[1]/node())"/></div>
          <div class="infotext-text font-size-s"><xsl:apply-templates select="tbody/tr[3]/td[2]/node()"/></div>
		  <div class="infotext-link"><xsl:if test="ou:textual-content(tbody/tr[3]/td[3]) != ''"><a class="font-type-regular {tbody/tr[3]/td[3]/descendant::a/@class}" href="{tbody/tr[3]/td[3]/descendant::a/@href}"><xsl:value-of select="tbody/tr[3]/td[3]/node()"/></a></xsl:if></div>
        </div>
      </div>
    </section>
  </xsl:template>
	
  <!-- Infotext | Promo - fgcuteam-mike -->
  <xsl:template match="table[@class='ou-infotext-promo']">
	  <xsl:variable name="options-used" select="lower-case(ou:textual-content(caption[2]/node()))"/>
	  <xsl:variable name="rows" select="count(tbody/tr)"/>
	  <xsl:variable name="title-size" select="if ($rows > 2) then 'h5' else 'h4'"/>
	<div class="container-flex">
	   <section class="text-container blue gradientpromo">
		  <div class="container-flex">
			 <div class="container-flex row-alt">
				 <xsl:variable name="lengths">
				 	<xsl:for-each select="tbody/tr/td[2]"><xsl:copy-of select="string-length(.)"/>,</xsl:for-each>					 
				 </xsl:variable>				
				 <xsl:variable name="biggest"><xsl:value-of select="ousupp:biggest($lengths, 0)"></xsl:value-of></xsl:variable>
				 
				 <xsl:for-each select="tbody/tr">
					<xsl:variable name="current-length" select="string-length(td[2])"></xsl:variable>
					<xsl:variable name="footer-class" select="''"></xsl:variable>
					<div class="col-sm">
									<xsl:choose>
									<xsl:when test="contains($options-used, 'override')">
										<xsl:apply-templates select="td[1]/node()"/>
										<xsl:apply-templates select="td[2]/node()"/>
										<p class="{$footer-class}"><a class="button solid-outline white" href="{td[3]/descendant::a/@href}">
										<xsl:value-of select="ou:textual-content(td[3]/node())"/></a></p>
									</xsl:when>
									<xsl:otherwise>
										<p class="{$title-size}"><xsl:value-of select="ou:textual-content(td[1]/node())"/></p>
										<p class="text-description"><xsl:value-of select="ou:textual-content(td[2]/node())"/></p>
										<p class="{$footer-class}"><a class="button solid-outline white" href="{td[3]/descendant::a/@href}">
										<xsl:value-of select="ou:textual-content(td[3]/node())"/></a></p>
									</xsl:otherwise>										
		  							</xsl:choose>
					</div>
				 </xsl:for-each>
			 </div>
		  </div>
	   </section>
	</div>
  </xsl:template>
	
		
  <!-- Infotext 2 Up Simple - fgcuteam-mike -->	
  <xsl:template match="table[@class='ou-infotext-2up-simple']">
	  <xsl:variable name="rows" select="count(tbody/tr)"/>
	  <xsl:variable name="title-size" select="if ($rows > 2) then 'h5' else 'h4'"/>
	  <xsl:variable name="body-size" select="if ($rows > 2) then 'text-caption' else ''"/>
	  <section class="container-flex">
		  <div class="row-alt bordercontainer">
			  <xsl:for-each select="tbody/tr">
				  <div class="col-sm">
					  <div class="{$title-size} bordercontainer-title"><xsl:value-of select="ou:textual-content(td[1]/node())"/></div>
					  <div class="{$body-size} bordercontainer-content"><xsl:apply-templates select="td[2]/node()"/></div>		  
				  </div>
			  </xsl:for-each>
		  </div>
	  </section>
  </xsl:template>	
	
  <!-- Infotext Contact - fgcuteam-mike -->	
  <xsl:template match="table[@class='ou-infotext-contact']">
	  <div>                     
            <div class="title-bottom-border small h5"><xsl:value-of select="ou:textual-content(tbody/tr[1]/td[1]/node())"/></div>                     
            <p class="h5"><xsl:value-of select="ou:textual-content(tbody/tr[1]/td[2]/node())"/></p>
			<div class="font-size-s">
				<xsl:apply-templates select="tbody/tr[1]/td[3]/node()"/>
				<!--<xsl:choose>
                    	<xsl:when test="tbody/tr[1]/td[3]/child::p"><xsl:apply-templates select="tbody/tr[1]/td[3]/child::p"/></xsl:when>
						<xsl:otherwise><xsl:apply-templates select="tbody/tr[1]/td[3]/node()"/></xsl:otherwise>
				</xsl:choose>-->
		  	</div>
			<p class="font-size-s">	
				<xsl:for-each select="tbody/tr">
					<xsl:if test="ou:textual-content(td[4]/node()) != ''"><span class="icon-phone"></span>&nbsp;<xsl:value-of select="ou:textual-content(td[4]/node())"/><br/></xsl:if>
				</xsl:for-each>
				<xsl:for-each select="tbody/tr">
					<xsl:if test="ou:textual-content(td[5]/node()) != ''"><span class="icon-mail-close"></span>&nbsp;<xsl:apply-templates select="td[5]/descendant::a"/><br/></xsl:if>
				</xsl:for-each>
			</p>
      </div>	  
  </xsl:template>
	
  <!-- Infotext Column Title - fgcuteam-mike -->	
  <xsl:template match="table[@class='ou-infotext-column-title']">
	  <div>                     
            <div class="title-bottom-border small h5"><xsl:value-of select="ou:textual-content(tbody/tr[1]/td[1]/node())"/></div>                                 
			<div class="font-size-s">
				<xsl:apply-templates select="tbody/tr[1]/td[2]/node()"/>				
		  	</div>			
      </div>	  
  </xsl:template>
	
  <!-- Infotext Quick Note - fgcuteam-mike -->	
  <xsl:template match="table[@class='ou-infotext-quicknote']">	  
	  <div class="quicknote">
		  	<div>
				<div class="h5"><xsl:value-of select="ou:textual-content(tbody/tr[1]/td[1]/node())"/></div>                                 
				<div class="font-size-s">
					<xsl:apply-templates select="tbody/tr[1]/td[2]/node()"/>
				</div>
			  	<xsl:if test="ou:textual-content(tbody/tr[1]/td[3]/node()) != ''">
				<div>
					<xsl:apply-templates select="tbody/tr[1]/td[3]/node()"/>
				</div>
		  		</xsl:if>
			</div>
      </div>	  
  </xsl:template>		

  <!-- Infographics Plain - fgcuteam-mike -->
  <xsl:template match="table[@class='ou-infographics-plain']">	  
	<xsl:variable name="iconbox-size" select="if( contains(lower-case(ou:textual-content(caption[2]/node())), 'large') )  then 'large-box' else if( contains(lower-case(ou:textual-content(caption[2]/node())), 'horizontal') ) then '' else ''" />
	<xsl:variable name="iconbox-title-size" select="if( contains(lower-case(ou:textual-content(caption[2]/node())), 'large') )  then 'h3' else if( contains(lower-case(ou:textual-content(caption[2]/node())), 'horizontal') ) then 'h6' else 'h6'" />
	<xsl:variable name="iconbox-subtitle-size" select="if( contains(lower-case(ou:textual-content(caption[2]/node())), 'large') )  then 'h5' else if( contains(lower-case(ou:textual-content(caption[2]/node())), 'horizontal') ) then 'subtitle' else 'subtitle'" />
	<xsl:variable name="iconbox-container1-size" select="if( contains(lower-case(ou:textual-content(caption[2]/node())), 'horizontal') ) then 'col-sm-8' else ''" />
	<xsl:variable name="iconbox-container2-size" select="if( contains(lower-case(ou:textual-content(caption[2]/node())), 'horizontal') ) then 'col-sm-16' else ''" />
	<xsl:variable name="feature-box-style" select="if( contains(lower-case(ou:textual-content(caption[2]/node())), 'horizontal') ) then 'horizontal' else ''" />
    <section class="container-flex feature-box-container row-alt {$iconbox-size}">
              <xsl:for-each select="tbody/tr">
				  <xsl:variable name="iconbox-style" select="if(replace(td[1]/descendant::a/@href, '#', '') != '' or td[1]/descendant::a/@data-toggle = 'modal') then 'fbox-border fbox-effect noborder' else 'fbox-border noborder'" />
				  <xsl:variable name="iconbox-content">
					  <div class="feature-box fbox-center fbox-dark {$iconbox-style} {$feature-box-style}">
						  <div class="{$iconbox-container1-size} fbox-icon">
							   <xsl:choose>
                    			<xsl:when test="td[1]/descendant::a/@class">
							  		<div class="{td[1]/descendant::a/@class}" aria-hidden="true"></div>
							  	</xsl:when>
								<xsl:otherwise>
									<div aria-hidden="true"><xsl:value-of select="ou:textual-content(td[1]/node())"/></div>
								</xsl:otherwise>
					  			</xsl:choose>
						  </div>
						  <div class="{$iconbox-container2-size}">
						  	<p class="{$iconbox-title-size}"><xsl:value-of select="td[2]/node()"/></p>
							  <xsl:if test="ou:textual-content(td[3]/node()) != ''"><span class="{$iconbox-subtitle-size}"><xsl:value-of select="td[3]/node()"/></span></xsl:if>
						  </div>
					  </div>
				  </xsl:variable>
				  <div class="col-sm">
					  <xsl:variable name="iconbox-link" select="if( replace(td[1]/descendant::a/@href, '#', '') != '' )  then td[1]/descendant::a/@href else ''" />
					  <xsl:choose>
                    	<xsl:when test="replace(td[1]/descendant::a/@href, '#', '') != '' or td[1]/descendant::a/@data-toggle = 'modal'">
							<a href="{$iconbox-link}"><xsl:apply-templates select="td[1]/descendant::a/@*[name()!='class' and name()!='href']" /><!-- add any properties/attributes added by the user with a select@* -->
								<xsl:copy-of select="$iconbox-content" />
							</a>
						</xsl:when>
						<xsl:otherwise>								
								<xsl:copy-of select="$iconbox-content" />												
						</xsl:otherwise>
					  </xsl:choose>
					</div>
              </xsl:for-each>
    </section>   
  </xsl:template>	

	<!-- Infographics Box - fgcuteam-mike -->
  	<xsl:template match="table[@class='ou-infographics-box']">
	<xsl:variable name="options-used" select="lower-case(ou:textual-content(caption[2]/node()))"/>
	<xsl:variable name="title-size" select="if( contains($options-used, 'big') ) then 'h2' else 'h6'" />	
	<xsl:variable name="title-style" select="if( contains($options-used, 'big') ) then 'color: inherit;     margin-top: -20px;' else ''" />
	<xsl:variable name="iconbox-container1-size" select="if( contains($options-used, 'horizontal') ) then 'col-sm-8' else ''" />
	<xsl:variable name="iconbox-container2-size" select="if( contains($options-used, 'horizontal') ) then 'col-sm-16' else ''" />
	<xsl:variable name="feature-box-style" select="if( contains($options-used, 'horizontal') ) then 'horizontal' else ''" />
	<xsl:variable name="background-color" select="if( contains($options-used, 'gray') or contains($options-used, 'grey')) then 'gray' else if( contains($options-used, 'blue') ) then 'blue' else if( contains($options-used, 'original') ) then 'originalblue' else if( contains($options-used, 'modern') ) then 'modernblue' else if( contains($options-used, 'opaque') ) then 'blue modernwhite' else ''" />
    <section class="infographics-box {$background-color}">
		<div class="container-flex feature-box-container row-alt">
              <xsl:for-each select="tbody/tr">
				  <xsl:variable name="iconbox-link" select="if( replace(td[4]/descendant::a/@href, '#', '') != '' )  then td[4]/descendant::a/@href else ''" />
				  <xsl:variable name="iconbox-style" select="if( $feature-box-style = 'horizontal') then 'fbox-border noborder' else 'fbox-border noborder transparent-border'" />
				  <xsl:variable name="iconbox-content">
					  <div class="feature-box fbox-center fbox-dark {$iconbox-style} {$feature-box-style}">
						  <div class="{$iconbox-container1-size} fbox-icon ">
							   <xsl:choose>
                    			<xsl:when test="td[1]/descendant::a/@class">
							  		<div class="{td[1]/descendant::a/@class}" aria-hidden="true"></div>
							  	</xsl:when>
								<xsl:otherwise>
									<div aria-hidden="true"><xsl:value-of select="ou:textual-content(td[1]/node())"/></div>
								</xsl:otherwise>
					  			</xsl:choose>
						  </div>
						  <div class="{$iconbox-container2-size}">
						  	<p class="{$title-size}" style="{$title-style}"><xsl:value-of select="td[2]/node()"/></p><span class="subtitle"><xsl:value-of select="td[3]/node()"/></span>
							<xsl:if test="replace(td[4]/descendant::a/@href, '#', '') != '' or td[4]/descendant::a/@data-toggle = 'modal'">
								<p>
									<a href="{$iconbox-link}"><xsl:apply-templates select="td[4]/descendant::a/@*[name()!='class' and name()!='href']" /><!-- add any properties/attributes added by the user with a select@* -->
										<xsl:copy-of select="ou:textual-content(td[4]/node())" />
									</a>
								</p>
							</xsl:if>
						  </div>
					  </div>
				  </xsl:variable>
				  	<div class="col-sm border-box">					  
					  <xsl:copy-of select="$iconbox-content" />
					</div>
              </xsl:for-each>
  		</div>
	</section>   
  </xsl:template>
	
  <!-- Infographics Blue Icon - fgcuteam-mike -->
  <xsl:template match="table[@class='ou-infographics-icon-blue']">
    <section class="stats bordered blue">
      <div class="container">
        <div class="scrollable-wrapper">
          <div class="scrollable">
            <button class="scroll-right">scroll right</button>  
            <button class="scroll-left">scroll left</button> 
            <div class="medium-slider stat-wrapper">
              <xsl:for-each select="tbody/tr">
                <!--<xsl:if test="position() != last()">-->
                <div class="slide">
                  <div class="stat">
                    <div class="content">
                      <div class="icon-positioner {td[1]/descendant::a/@class}">                        
                      </div>
                      <xsl:apply-templates select="td[2]/node()"/>
                    </div>
                    <div class="overlay"></div>
                  </div>
                </div>
                <!--</xsl:if>-->
              </xsl:for-each>
            </div>
          </div>
        </div>
      </div>
		

		
      <!--<xsl:if test="tbody/tr[4]/td[1]/descendant::a">
        <div class="more-fast-facts">
        <xsl:apply-templates select="tbody/tr[4]/td[1]/descendant::a"/>                                 
        </div>
        </xsl:if>-->
    </section><!-- .stats -->    
  </xsl:template>	
  
  <!-- [College Landing] Infographics Icon -->
  <xsl:template match="table[@class='ou-infographics-icon']">
    <section class="stats bordered">
      <div class="container">
        <div class="scrollable-wrapper">
          <div class="scrollable">
            <button class="scroll-right">scroll right</button>  
            <button class="scroll-left">scroll left</button> 
            <div class="medium-slider stat-wrapper">
              <xsl:for-each select="tbody/tr">
                <!--<xsl:if test="position() != last()">-->
                <div class="slide">
                  <div class="stat" style="background-image: url({td[1]/descendant::img/@src})">
                    <div class="content">
                      <div class="icon-positioner {td[2]/descendant::a/@class}">                        
                      </div>
                      <xsl:apply-templates select="td[3]/node()"/>
                    </div>
                    <div class="overlay"></div>
                  </div>
                </div>
                <!--</xsl:if>-->
              </xsl:for-each>
            </div>
          </div>
        </div>
      </div>
      <!--<xsl:if test="tbody/tr[4]/td[1]/descendant::a">
        <div class="more-fast-facts">
        <xsl:apply-templates select="tbody/tr[4]/td[1]/descendant::a"/>                                 
        </div>
        </xsl:if>-->
    </section><!-- .stats -->    
  </xsl:template>
	
<!-- fgcuteam-Mike Infographics Buttons -->
  <xsl:template match="table[@class='ou-infographics-buttons']">
	<xsl:variable name="iconbutton-max-width" select="lower-case(ou:textual-content(caption[2]/node()))"/>		
	<xsl:variable name="rows" select="count(tbody/tr)"/>
		<xsl:if test="($rows >= 3)">
		<div class="hideonmobile">
			<xsl:for-each select="tbody/tr">
				<a class="{td[1]/descendant::a/@class} icon button outline blue" style="max-width:{$iconbutton-max-width}px;" href="{td[1]/descendant::a/@href}">
                <p><xsl:value-of select="td[2]/node()"/></p></a>
			</xsl:for-each>
		</div>
		<div class="showonmobile">
			<div class="iconbuttons-dropdown">
				<select class="select-picker {td[1]/descendant::a/@class}" data-width="100%" data-stretch="true" title="{ou:textual-content(tbody/tr[1]/td[2]/node())}">
				<xsl:for-each select="tbody/tr">
					<option value="{td[1]/descendant::a/@href}" data-target="{td[1]/descendant::a/@target}" class="{td[1]/descendant::a/@class}"><xsl:value-of select="ou:textual-content(td[2]/node())"/></option>	
				</xsl:for-each>
				</select>
			</div>
		</div>
		</xsl:if>
		<xsl:if test="($rows lt 2)">
			<xsl:for-each select="tbody/tr">
				<a class="{td[1]/descendant::a/@class} icon button outline blue" style="max-width:{$iconbutton-max-width}px;" href="{td[1]/descendant::a/@href}">
                <p><xsl:value-of select="td[2]/node()"/></p></a>
			</xsl:for-each>
		</xsl:if>
  </xsl:template>

<!-- fgcuteam-Mike Web Component | Mobile Hider -->
  <xsl:template match="table[@class='ou-mobile-hider']">
	  <xsl:variable name="options-used" select="lower-case(ou:textual-content(caption[2]/node()))"/>
	  <xsl:variable name="HideDesktop" select="if( contains($options-used, 'desktop') ) then 'hideondesktop' else ''"/>
	  <xsl:variable name="HideTablet" select="if( contains($options-used, 'tablet') ) then 'hideontablet' else ''"/>
	  <xsl:variable name="HideMobile" select="if( contains($options-used, 'mobile') ) then 'hideonmobile' else ''"/>
	  <section class="{$HideDesktop} {$HideTablet} {$HideMobile}">
		<xsl:apply-templates select="tbody/tr[1]/td[1]/node()"/>
	  </section>
  </xsl:template>
	
<!-- fgcuteam-Mike Web Component | Media Query -->
  <xsl:template match="table[@class='ou-media-query']">
	  <section class="hideontablet hideonmobile">
		<xsl:apply-templates select="tbody/tr[1]/td[1]/node()"/>
	  </section>
	  	  <section class="hideondesktop hideonmobile">
		<xsl:apply-templates select="tbody/tr[1]/td[2]/node()"/>
	  </section>
	  <section class="hideondesktop hideontablet">
		<xsl:apply-templates select="tbody/tr[1]/td[3]/node()"/>
	  </section>
  </xsl:template>
  
  <!-- [College Landing] Put Your Knowledge to Work -->
  <xsl:template match="table[@class='ou-knowledge-to-work']">
    <section class="put-to-work">
      <div class="container section-head">
        <xsl:if test="ou:textual-content(tbody/tr[1]/td[1]) != ''"><h2><xsl:value-of select="tbody/tr[1]/td[1]/node()"/></h2></xsl:if>
        <xsl:if test="ou:textual-content(tbody/tr[1]/td[2]) != ''"><p><xsl:value-of select="tbody/tr[1]/td[2]/node()"/></p></xsl:if>
      </div>
      <div class="row image-grid" style="background-image: url({tbody/tr[1]/td[3]/descendant::img/@src});">
		<a href="{tbody/tr[2]/td[1]/descendant::a/@href}">
        <div class="col-sm-8 match-grid">
          <div class="inner-wrapepr">
			  <h3><xsl:value-of select="tbody/tr[2]/td[1]/node()"/></h3> 
            <div class="overlay"></div>
          </div>
        </div>
		</a>
		<a href="{tbody/tr[2]/td[2]/descendant::a/@href}">
        <div class="col-sm-8 match-grid">
          <div class="inner-wrapepr">
			   <h3><xsl:value-of select="tbody/tr[2]/td[2]/node()"/></h3> 
            <div class="overlay"></div>
          </div>
        </div>
		</a>
        <a href="{tbody/tr[2]/td[3]/descendant::a/@href}">
		<div class="col-sm-8 match-grid">
          <div class="inner-wrapepr">
			   <h3><xsl:value-of select="tbody/tr[2]/td[3]/node()"/></h3> 
            <div class="overlay"></div>
          </div>  
        </div>
		  </a>
      </div>
    </section>
  </xsl:template>
  
  <!-- [College Landing] Three Up Simple -->
  <xsl:template match="table[@class='ou-columns-three-up']">
    <section class="circle-listing three-up" >
      <div class="content-container">        
        <xsl:if test="ou:textual-content(tbody/tr[1]/td[1]) != ''"><h2><xsl:value-of select="tbody/tr[1]/td[1]/node()"/></h2></xsl:if>
        <xsl:if test="ou:textual-content(tbody/tr[1]/td[2]) != ''"><p class="intro-text"><xsl:value-of select="tbody/tr[1]/td[2]/node()"/></p></xsl:if>
      </div>
      <div class="container">
        <div class="scrollable-wrapper">
          <div class="scrollable  slider-wrapper">
            <!--<button class="scroll-right">scroll right</button>  
            <button class="scroll-left">scroll left</button>  -->
            <!--<div class="medium-slider slider medium-scroll">-->
			<div class="news-slider slider medium-scroll">
              <xsl:for-each select="tbody/tr[position() gt 1]">
                <xsl:if test="position() != last()">
                  <div class="article-wrapper">
                    <div class="circle-tile">
                      <div class="thumbnail">
                        <a>
                          <xsl:apply-templates select="td[2]/descendant::a/attribute()"/>
                          <xsl:apply-templates select="td[3]/descendant::img"/>
                        </a>
                        <div class="icon"><a><xsl:apply-templates select="td[2]/descendant::a/attribute()"/>View More</a></div>
                      </div>
                      <div class="lower-content">
                        <p class="h4"><a><xsl:apply-templates select="td[2]/descendant::a/attribute()"/><xsl:value-of select="td[1]/node()"/></a></p>
                        <xsl:if test="ou:textual-content(td[4]) != ''"><p class="role"><xsl:value-of select="td[4]/node()"/></p></xsl:if>
                        <xsl:if test="ou:textual-content(td[5]) != ''"><p class="description"><xsl:value-of select="td[5]/node()"/></p></xsl:if>
						<xsl:if test="ou:textual-content(td[6]) != ''"><a class="link-arrow blue small" href="{td[6]/descendant::a/@href}"><xsl:value-of select="td[6]/node()"/></a></xsl:if>
                      </div>
                    </div> 
                  </div>
                </xsl:if>
              </xsl:for-each>
            </div> 
          </div>
        </div>
        <!--<div class="additional-links">
          <xsl:apply-templates select="tbody/tr[5]/td[1]/node()"/>
        </div>-->
      </div>
    </section><!-- .circle-listing -->
  </xsl:template>
	
	 <!-- fgcuteam-mike Image Circle Columns X number -->
  <xsl:template match="table[@class='ou-circle-image-columns']">
	  <xsl:variable name="columns" select="ou:textual-content(caption[2]/node())"/>
	  <xsl:variable name="rows" select="count(tbody/tr)"/>
    <section class="circle-listing circle-listing-flex" >
      <div class="container">		  
              <xsl:for-each select="tbody/tr">
				  <xsl:if test="(position() = 1)"> 				  
					  <xsl:text disable-output-escaping="yes">&lt;div class="row"&gt;</xsl:text>
				  </xsl:if>
				  <xsl:if test="( ((position()-1) mod ($columns)) = 0 and position() != (last()+1) and position() != 1 )">
					  <xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
					  <xsl:text disable-output-escaping="yes">&lt;div class="row"&gt;</xsl:text>
				  </xsl:if>				  
					  <div class="article-wrapper col-sm-{round(24 div $columns)}"><!-- .col-sm boostrap 24 cols based-->
						<div class="circle-tile">
						  <div class="thumbnail">  
							  <xsl:choose>
							  		<xsl:when test="td[3]/descendant::a"><a href="{td[3]/descendant::a/@href}"><xsl:apply-templates select="td[3]/descendant::a/@*" /><!-- add any properties/attributes added by the user with a select@* --><xsl:apply-templates select="td[1]/node()"/></a></xsl:when>
								  	<xsl:otherwise><xsl:apply-templates select="td[1]/node()"/></xsl:otherwise>
							  </xsl:choose>
						  </div>						
						  <div class="lower-content">
							  <xsl:choose>
							  		<xsl:when test="td[3]/descendant::a"><a href="{td[3]/descendant::a/@href}"><xsl:apply-templates select="td[3]/descendant::a/@*" /><!-- add any properties/attributes added by the user with a select@* --><xsl:apply-templates select="td[2]/node()"/></a></xsl:when>
								  	<xsl:otherwise><xsl:apply-templates select="td[2]/node()"/></xsl:otherwise>
							  </xsl:choose>								
						  </div>						
						</div> 
					  </div>
				  <xsl:if test="(position() = last())"> 				  
					  <xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
				  </xsl:if>
              </xsl:for-each>            
          </div>
    </section><!-- .circle-listing -->
  </xsl:template>	
	
		
<!-- fgcuteam-mike Featured Circle Images 2021 OLD NOT IN USE -->
  <xsl:template match="table[@class='ou-featured-circle-images-2']">
	  <xsl:variable name="options-used" select="lower-case(ou:textual-content(caption[2]/node()))"/>
	  <xsl:variable name="columns" select="if (contains($options-used, '4column')) then 4 else 3" />
	  <xsl:variable name="align" select="if (contains($options-used, 'center')) then 'center' else 'left'" />
	  <xsl:variable name="rows" select="count(tbody/tr)"/>	  
              <xsl:for-each select="tbody/tr">
				  <xsl:if test="(position() = 1)"> 				  
					  <xsl:text disable-output-escaping="yes">&lt;div class="circleblocks  container-flex row"&gt;</xsl:text>
				  </xsl:if>
				  <xsl:if test="( ((position()-1) mod ($columns)) = 0 and position() != (last()+1) and position() != 1 )">
					  <xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
					  <xsl:text disable-output-escaping="yes">&lt;div class="circleblocks  container-flex row </xsl:text><xsl:value-of select="if($align = 'center' and $columns = 3 and ($rows mod 5) = 0 and ($rows - position()) = 1 ) then 'twocircles' else ''"/><xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
					  
				  </xsl:if>	
				  	<!-- 4 column necesary fill column when centered -->
				  	  <xsl:if test="($align = 'center' and $columns = 4 and ($rows mod 6) = 0 and ($rows - position()) = 1 )  "> 	
				  			<div class="col-sm-{round(24 div $columns)}"></div>
					  </xsl:if>
				  	<!-- a -->
				  	  <xsl:if test="td[4]/descendant::a and not(td[4]/descendant::a/@href = '#') "> 				  
					  	<xsl:text disable-output-escaping="yes">&lt;a href="</xsl:text><xsl:value-of select="td[4]/descendant::a/@href"/><xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
				  	  </xsl:if>
				  	  
					  <div class="col-sm-{ if($align = 'center' and $columns = 3 and ($rows mod 5) = 0 and ($rows - position()) &lt; 2 ) then '12' else round(24 div $columns)     }"><!-- .col-sm boostrap 24 cols based-->
						<div class="circleitem">
						  <div class="thumb" style="background-image: url('{td[1]/descendant::img/@src}');" ></div>
						  <xsl:if test="td[4]/descendant::a and not(td[4]/descendant::a/@href = '#') "> <div class="icon"><span>Arrow</span></div> </xsl:if>
						  <div class="lower-content">
							  <xsl:if test="td[2]"><div class="title {if(td[3]) then '' else 'titleonly'}"><xsl:value-of select="ou:textual-content(td[2]/node())"/></div></xsl:if>
							  <xsl:if test="td[3]"><div class="description"><xsl:apply-templates select="td[3]/node()"/></div></xsl:if>
						  </div>						
						</div> 
					  </div>
				  	  <xsl:if test="td[4]/descendant::a and not(td[4]/descendant::a/@href = '#') "> 						  
					  	<xsl:text disable-output-escaping="yes">&lt;/a&gt;</xsl:text>
				  	  </xsl:if>
				  <xsl:if test="(position() = last())"> 				  
					  <xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
				  </xsl:if>
              </xsl:for-each>            
          
  </xsl:template>	
	
	<!-- fgcuteam-mike Featured Circle Images 2022 FIX -->
  <xsl:template match="table[@class='ou-featured-circle-images']">
	  <xsl:variable name="options-used" select="lower-case(ou:textual-content(caption[2]/node()))"/>
	  <xsl:variable name="columns" select="if (contains($options-used, '2column')) then '12' else if (contains($options-used, '3column')) then '8' else 6" />
	  <xsl:variable name="align" select="if(contains($options-used, 'center') and contains($options-used, '2column')) then 'twocircles' else ''" />
	  <xsl:variable name="size" select="if (contains($options-used, 'small')) then 'smallcircles' else ''" />
	  <xsl:variable name="noicon" select="if (contains($options-used, 'noicon')) then 'noicon' else ''" />
	  <div class="circleblocks {$size} {$align} container-flex row">
		  <xsl:for-each select="tbody/tr">
			<xsl:choose>
			<xsl:when test="td[4]/descendant::a and not(td[4]/descendant::a/@href = '#')">		  
				<a href="{td[4]/descendant::a/@href}">
                  <div class="col-sm-{$columns} circlecontainer">
                     <div class="circleitem">
                        <div class="thumb" style="background-image: url('{td[1]/descendant::img/@src}');"></div>
							<xsl:if test="$noicon != 'noicon'">  
					  			<div class="icon"><span>Arrow</span></div>
				  	 	 	</xsl:if>
                        <div class="lower-content">
                           <p class="title"><xsl:value-of select="ou:textual-content(td[2]/node())"/></p>
                           <p class="description"><xsl:value-of select="ou:textual-content(td[3]/node())"/></p>
                        </div>
                     </div>
				   </div></a>
			</xsl:when>	
				<xsl:otherwise>
                  <div class="col-sm-{$columns} circlecontainer">
                     <div class="circleitem">
                        <div class="thumb" style="background-image: url('{td[1]/descendant::img/@src}');"></div>
                        <div class="lower-content">
                           <p class="title"><xsl:value-of select="ou:textual-content(td[2]/node())"/></p>
                           <p class="description"><xsl:value-of select="ou:textual-content(td[3]/node())"/></p>
                        </div>
                     </div>
				   </div>
				</xsl:otherwise>
               </xsl:choose>
		  </xsl:for-each>            
	  </div>
  </xsl:template>	
	

	
	  <!-- fgcuteam-mike - Gallery Simple -->
  <xsl:template match="table[@class='ou-gallery-simple']">
	<xsl:variable name="group-name-random" select="generate-id(.)"/>
	<xsl:variable name="params" select="ou:textual-content(caption[2]/node())"/>
	<xsl:variable name="thumb-groups-count" select="count(tbody/tr[td[5]/text()!=''])"/>
	<xsl:variable name="rows" select="tbody/tr"/>
	<xsl:variable name="columns" select="if (contains($params, '1column')) then '24' else if (contains($params, '2column')) then '12' else if (contains($params, '3column')) then '8' else if (contains($params, '4column')) then '6' else '6'" />
    <section class="gallery-container simple container-flex">
		<div class="row-alt">
		<xsl:for-each select="tbody/tr">
			<xsl:variable name="group-name" select="ou:textual-content(td[5]/node())"/>
			<xsl:variable name="row-position" select="position()"/>
			<xsl:variable name="caption-value"  >
				<xsl:apply-templates select="td[4]/node()" mode="mostly-text" />
			</xsl:variable>	
			
				<xsl:choose>
					<xsl:when test="$group-name != ''">
						<xsl:choose>
							<xsl:when  test="$group-name != preceding-sibling::*[1]/td[5] or position() = 1">
								<div class="col-sm-{$columns} thumbnail">
								<a href="{if(td[3]/descendant::img/@src) then td[3]/descendant::img/@src else td[3]/descendant::a/@href}" title="{td[2]/descendant::img/@alt}" data-fancybox="{$group-name}" data-gallerytype="simple" data-caption='{$caption-value}'>
									<div class="thumb-image"><img src="{td[2]/descendant::img/@src}" alt="{td[2]/descendant::img/@alt}" /><div class="thumb-cover"></div><div class="thumb-overlay"></div></div>
									<div class="caption-html" style="display:none;"><xsl:apply-templates select="td[4]/node()"/></div>
								</a>
									<xsl:if test="ou:textual-content(td[1]) != ''"><a href="javascript:;" data-fancybox-trigger="{$group-name}"><span><xsl:value-of select="td[1]/node()"/></span></a></xsl:if>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<a href="{if(td[3]/descendant::img/@src) then td[3]/descendant::img/@src else td[3]/descendant::a/@href}" title="{td[2]/descendant::img/@alt}" data-fancybox="{$group-name}" data-gallerytype="simple" data-caption='{$caption-value}' data-thumb="{td[2]/descendant::img/@src}" aria-label="{td[2]/descendant::img/@alt}" ></a>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<div class="col-sm-{$columns} thumbnail">
						<a href="{if(td[3]/descendant::img/@src) then td[3]/descendant::img/@src else td[3]/descendant::a/@href}" title="{td[2]/descendant::img/@alt}" data-fancybox="{$group-name-random}" data-gallerytype="simple" >
							<xsl:attribute name='data-caption'><xsl:apply-templates select="$caption-value" mode="asEscapedString" /></xsl:attribute>
							<div class="thumb-image"><img src="{td[2]/descendant::img/@src}" alt="{td[2]/descendant::img/@alt}" /><div class="thumb-cover"></div><div class="thumb-overlay"></div></div>
							<div class="caption-html" style="display:none;"><xsl:apply-templates select="td[4]/node()"/></div>
						</a>
							<xsl:if test="ou:textual-content(td[1]) != ''"><a href="javascript:;" data-fancybox-trigger="{$group-name-random}" data-fancybox-index="{$row-position - count(../../tbody/tr[position() &lt;= $row-position][ou:textual-content(td[5]/node())!='']) - 1}"><span><xsl:value-of select="td[1]/node()"/></span></a></xsl:if>
						</div>
					</xsl:otherwise>
				</xsl:choose>
			
		</xsl:for-each>	
		</div>
    </section>
  </xsl:template>
	
<!-- FGCUTEAM Mike Flickr Gallery -->
<xsl:template match="table[@class='ou-gallery-flickr']">
 
 <xsl:variable name="galleryid" select="tbody/tr/td[1]/node()" /> 
 <xsl:variable name="theme" select="if( contains(lower-case(ou:textual-content(tbody/tr/td[2]/node() )), 'grid') ) then 'tiles_nested' else 'default' " /> 
 <xsl:variable name="photolimit" select="tbody/tr/td[3]/node()" /> 
 <xsl:variable name="transitiondelay" select="tbody/tr/td[4]/node()" />
 <div class="container-flex">
<iframe style="position: relative; top: 0; left: 0; width: 100%; height: 100%;" class="flickrsnippet" src="https://flickrembed.com/cms_embed.php?source=flickr&amp;layout=responsive&amp;input={$galleryid}&amp;sort=0&amp;by=album&amp;theme=default&amp;scale=fill&amp;speed=3000&amp;limit=10&amp;skin=default&amp;autoplay=true" scrolling="no" frameborder="0" allowFullScreen="true" webkitallowfullscreen="true" mozallowfullscreen="true"><p><a  href="https://www.vouchersort.co.uk">voucher codes listed here</a></p><small>Powered by <a href="https://flickrembed.com">flickr embed</a>.</small></iframe><script type="text/javascript">function showpics(){var a=$("#box").val();$.getJSON("http://api.flickr.com/services/feeds/photos_public.gne?tags="+a+"&amp;tagmode=any&amp;format=json&amp;jsoncallback=?",function(a){$("#images").hide().html(a).fadeIn("fast"),$.each(a.items,function(a,e){$("<img/>").attr("src",e.media.m).appendTo("#images")})})}</script>	 
	 
	 <!--
	 <div id="flickrembed_74"></div>
	 <script src='https://flickrembed.com/embed_v2.js.rand.php?container=flickrembed_74&amp;source=flickr&amp;layout=responsive&amp;input={$galleryid}&amp;sort=3&amp;by=album&amp;theme={$theme}&amp;scale=fill&amp;speed={$transitiondelay}000&amp;limit={$photolimit}&amp;skin=default-light&amp;autoplay=true'></script>
	 <script type="text/javascript">
		 	//fgcuteam-mike Add a dynamic injection of alt tag if not set to avoid ADA error at render time
		 	$("body").on('DOMSubtreeModified', "#flickrembed_74", function() {
					$('#flickrembed_74 img').each(function( index ) {
						if($(this).attr("alt") == "" || $(this).attr("alt")  === undefined || $(this).attr("alt")  === 'undefined'){
							$(this).attr("alt", "Photo Gallery Image");
					}
				});
			});
					 
		 function showpics(){var a=$("#box").val();$.getJSON("http://api.flickr.com/services/feeds/photos_public.gne?tags="+a+"&amp;tagmode=any&amp;format=json&amp;jsoncallback=?",function(a){$("#images").hide().html(a).fadeIn("fast"),$.each(a.items,function(a,e){$("<img/>").attr("src",e.media.m).appendTo("#images")})})}
	 </script>
	 <small style="display: block; text-align: right; margin: 0 auto; font-size: .6rem; color: #9a9a9a; max-width: 900px;"><a href="https://flickrembed.com">Powered by flickr embed</a></small>-->
</div>
 </xsl:template>	
	
  
  <!-- [College Landing] Carousel: Text Prominent -->
  <xsl:template match="table[@class='ou-text-prominent']">
    <section class="carousel-text">
      <div class="carousel-text-wrapper">
        <xsl:for-each select="tbody/tr">
          <div class="slide">
            <div class="top">
              <img src="{td[3]/descendant::img/@src}" alt="{td[3]/descendant::img/@alt}"/>
              <div class="slick-arrow-container"></div>
            </div>
            <div class="content-wrapper" style="background-image: url({td[3]/descendant::img/@src});">
              <div class="content">
                <xsl:if test="ou:textual-content(td[1]) != ''"><p class="h3"><xsl:value-of select="td[1]/node()"/></p></xsl:if>
                <xsl:apply-templates select="td[2]/node()"/>
                <div class="slick-arrow-container"></div>
              </div>
            </div>
          </div>
        </xsl:for-each>        
      </div><!-- .carousel-wrapper -->
    </section>
  </xsl:template>
	
  <!-- fgcuteam-mike - Carousel Auto Slider - based on ou-text-prominent -->
  <xsl:template match="table[@class='ou-carousel-autoslider']">
    <section class="carousel-text auto">
      <div class="carousel-text-wrapper auto" data-auto="true" data-speed="{ou:textual-content(caption[2])}">
		  <xsl:attribute name="data-auto"><!-- conditional attribute parametter -->
				<xsl:choose>
				  <xsl:when test="string-length(ou:textual-content(caption[2]/node())) > 0 and ou:textual-content(caption[2]/node())!='0'">true</xsl:when>
				  <xsl:otherwise>false</xsl:otherwise>
				</xsl:choose>
		  </xsl:attribute>
        <xsl:for-each select="tbody/tr">
          <div class="slide">
            <div class="top">
              <img src="{td[3]/descendant::img/@src}" alt="{td[3]/descendant::img/@alt}"/>
              <div class="slick-arrow-container"></div>
            </div>
            <div class="content-wrapper" style="background-image: url({td[3]/descendant::img/@src});">
              <div class="content">
				  <div class="content-auto">
					<xsl:if test="ou:textual-content(td[1]) != ''"><p class="h3"><xsl:value-of select="td[1]/node()"/></p></xsl:if>
					<xsl:apply-templates select="td[2]/node()"/>
					<div class="slick-arrow-container"></div>
				</div>
              </div>
            </div>
          </div>
        </xsl:for-each>        
      </div><!-- .carousel-wrapper -->
    </section>
  </xsl:template>
	
	 <!-- fgcuteam-mike - Carousel Custom Auto Slider - based on ou-text-prominent -->
  <xsl:template match="table[@class='ou-carousel-custom']">
  <xsl:variable name="options-used" select="lower-case(ou:textual-content(caption[2]/node()))"/>
  <!--<xsl:variable name="speed" select="substring(ou:textual-content(caption[2]/node()), 1, 1)" />-->
  <xsl:variable name="speed" select="translate($options-used, translate($options-used, '0123456789', ''), '')" />
  <xsl:variable name="buttons" select="if( contains($options-used, 'arrow') ) then 'arrows' else 'dots'" />
   <xsl:variable name="border" select="if( contains($options-used, 'border') ) then 'bordered' else ''" />
    <section class="container-flex "> <!--carousel - event-listing carousel-custom -->
		<!-- event-wrapper slider -->
      <div class="carousel-custom-wrapper" data-auto="true" data-speed="{$speed}">
		  <xsl:attribute name="data-auto"><!-- conditional attribute parametter -->
				<xsl:choose>
				  <xsl:when test="string-length($options-used) > 0 and $options-used !='0'">true</xsl:when>
				  <xsl:otherwise>false</xsl:otherwise>
				</xsl:choose>
		  </xsl:attribute>	
				<xsl:for-each select="tbody/tr">
				  <div class="slide">            
					<div class="top {$border}">
					  <xsl:apply-templates select="td[1]/node()"/>					  
					</div>			
				  </div>
        		</xsl:for-each>       
			
		<!--
        <xsl:for-each select="tbody/tr">
          <div class="slide">            
			<div class="top {$border}">
              <xsl:apply-templates select="td[1]/node()"/>
              <div class="slick-arrow-container"></div>
            </div>
			
			
            <div class="content-wrapper">
              <div class="content">
				  <div class="content-auto">
					<xsl:apply-templates select="td[1]/node()"/>
					<div class="slick-arrow-container"></div>
				</div>
              </div>
            </div>
			
          </div>
        </xsl:for-each>     -->   
      </div><!-- .carousel-wrapper -->
	  <div class="slider-controls">			
			<button type="button" data-role="none" class="slick-prev slick-arrow" aria-label="Previous" role="button" >Previous</button>
			<div class="slick-simple-dots">
				<ul class="slick-dots">
					<li role="presentation" class="slick-active"><button type="button" aria-label="Previous Slide Item" tabindex="-1"></button></li>
					<li role="presentation"><button type="button"  aria-label="Current Slide Item"   tabindex="-1"></button></li>
					<li role="presentation"><button type="button"  aria-label="Next Slide Item" tabindex="-1"></button></li>
				</ul>				
			</div>
			<button type="button" data-role="none" class="slick-next slick-arrow" aria-label="Next" role="button" >Next</button>
	 </div>
		
		
		
	<!--</div>-->
	  <!-- <div class="slick-arrow-container"></div> -->
	  <!--
	  <a href="#" class="prev-slide">&lt;</a>
	  <div class="dots"></div>
	  <a href="#" class="next-slide">&gt;</a>
	  -->
    </section>
  </xsl:template>	
	
  <!-- fgcuteam-christian - Testimonials | Vertical -->
  <xsl:template match="table[@class='ou-testimonial-vertical']">
    <section>
      <div class="container-flex row skyblockquote">      
		<div class="col-sm-24">
		  <img src="{tbody/tr/td[1]/descendant::img/@src}" alt="{tbody/tr/td[1]/descendant::img/@alt}"/>
		</div>
		<div class="col-sm-24">
		  <blockquote>
			<span class="quote"><xsl:value-of select="tbody/tr/td[2]/node()"/>&rdquo;</span>
			<br/>
			<br/>
			<strong class="name"><xsl:value-of select="tbody/tr/td[3]/node()"/></strong>
			<br/>
		    <em class="subtext"><xsl:value-of select="tbody/tr/td[4]/node()"/></em>
		  </blockquote>
	    </div>                                              
      </div>
	</section>		
  </xsl:template>	  
	
  <!-- fgcuteam-mike - Carousel Text Auto Slider - based on ou-text-prominent -->
  <xsl:template match="table[@class='ou-carousel-text']">
    <section class="testimonial-text-carousel">
      <div class="container-flex carousel-text-wrapper auto" data-auto="true" data-speed="{ou:textual-content(caption[2])}">
        <xsl:for-each select="tbody/tr">
          <div class="slide">
			  <div class="quote-container">
				  <blockquote class="faculty-quote-callout-text"><xsl:value-of select="td[1]/node()"/></blockquote>
				  <p class="h6 margin-bottom-zero"><xsl:value-of select="td[2]/node()"/></p>
				  <xsl:if test="ou:textual-content(td[3]) != ''"><p class="margin-top-zero"><xsl:value-of select="td[3]/node()"/></p></xsl:if>									      
			  </div>
          </div>
        </xsl:for-each>        
      </div><!-- .carousel-wrapper -->
    </section>
  </xsl:template>	
  
  <!-- [College Landing] News -->
  <xsl:template match="table[@class='ou-news-parallax']">    
    <xsl:variable name="feed-source" select="lower-case(tbody/tr/td[2]/node())"/>
    <xsl:variable name="feed">
      <xsl:if test="$feed-source = 'external'"><xsl:value-of select="tbody/tr/td[3]/descendant::a/@href"/></xsl:if>
      <xsl:if test="$feed-source = 'omniupdate'"><xsl:value-of select="concat($domain,tbody/tr/td[3]/descendant::a/@href)"/></xsl:if>
    </xsl:variable>
    <xsl:variable name="items" select="'6'"/>			    
    <xsl:variable name="filters" select="if(ou:textual-content(tbody/tr/td[4]) = '') then 'All' else tbody/tr/td[4]/node()" />
    <xsl:variable name="news-config">		
      <categories>
        <category><xsl:value-of select="$filters"/></category>								
      </categories> 			
    </xsl:variable>  
    <xsl:if test="tbody/tr/td[5]/descendant::img">
      <xsl:variable name="image" select="tbody/tr/td[5]/descendant::img/@src" />    
      <xsl:variable name="extension" select="substring-after($image, '.')" />		
      <xsl:variable name="tablet-image" select="concat(replace($image, $extension, ''), '-tablet.', $extension) " />
      <xsl:variable name="mobile-image" select="concat(replace($image, $extension, ''), '-mobile.', $extension) " />
      <section class="news-listing desktop-banner parallax" data-z-index="auto" data-parallax="scroll" data-image-src="{$image}" data-speed="0.7">    
        <div class="tablet-banner" style="background-image: url({$tablet-image})">
          <div class="mobile-banner" style="background-image: url({$mobile-image})">
            <xsl:if test="ou:textual-content(tbody/tr/td[1]) != ''"><h2><xsl:value-of select="tbody/tr/td[1]/node()"/></h2></xsl:if>
            <div class="container">
              <div class="slide-wrapper">
                <div class="news-slider slider medium-scroll">
                  <xsl:choose>
                    <xsl:when test="$ou:action = 'pub'">
                      <xsl:text disable-output-escaping="yes">&lt;%</xsl:text>
                      <xsl:if test="$feed-source = 'omniupdate'">
                        string filter = "<xsl:value-of select="$news-config/categories/category"/>";
                        Response.Write(OUC.WnlDisplayMethods.displayNewsParallax("<xsl:value-of select="$feed"/>", "rss/channel/item", <xsl:value-of select="$items"/>, filter, 0));
                      </xsl:if>
                      <xsl:if test="$feed-source = 'external'">
                        Response.Write(OUC.GetNews.displayNewsListParallax("<xsl:value-of select="$feed"/>", "rss/channel/item", <xsl:value-of select="$items"/>, 0));
                      </xsl:if>
                      <xsl:text disable-output-escaping="yes">%&gt;</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                      <div class="article-wrapper">
                        <article class="news-tile">
                          <figure>
                            <a href="#"><img src="{{f:15924742}}" alt="News image 1"/></a>
                          </figure>
                          <div class="icon"><a href="#">View Article</a></div>
                          <time datetime="2016-10-21">Number of Items: <xsl:value-of select="$items"/></time>
                          <h2 class="h4"><a href="#">RSS Feed: <xsl:value-of select="$feed"/></a></h2>
                          <p>Feed Type: <xsl:value-of select="$feed-source"/></p>
                          <xsl:if test="$feed-source = 'omniupdate'">
                            <p>Active Filter(s): <xsl:value-of select="$news-config/categories/category"/></p>
                          </xsl:if>
                        </article> 
                      </div>                     
                    </xsl:otherwise>
                  </xsl:choose>
                </div>
              </div><!-- .slide-wrapper -->
            </div>
          </div>  
        </div>
        <xsl:apply-templates select="tbody/tr/td[6]/descendant::a"/>
      </section><!-- .news -->
    </xsl:if>
  </xsl:template>
  
  <!--
    FGCU Effect
  -->
  
  <!-- [FGCU Effect] Department Carousel -->
  <xsl:template match="table[@class='ou-faculty-parallax']">
    
      <xsl:variable name="image" select="if(tbody/tr/td[1]/descendant::img) then tbody/tr/td[1]/descendant::img/@src else ''" />    
      <xsl:variable name="extension" select="if($image != '') then substring-after($image, '.') else ''" />		
      <xsl:variable name="tablet-image" select="if($image != '') then concat(replace($image, $extension, ''), '-tablet.', $extension) else ''" />
      <xsl:variable name="mobile-image" select="if($image != '') then concat(replace($image, $extension, ''), '-mobile.', $extension) else ''" />
      <section class="meet-fgcu no-blend desktop-banner parallax" data-z-index="auto" data-parallax="scroll" data-image-src="{$image}" data-speed="0.7">
        <div class="tablet-banner" style="background-image: url({$tablet-image})">
          <div class="mobile-banner" style="background-image: url({$mobile-image})">
            <div class="row container">
              <xsl:if test="ou:textual-content(tbody/tr/td[2]/node()) != ''">                
                    <h2><xsl:value-of select="tbody/tr/td[2]/node()"/></h2>                  
              </xsl:if>              
              <div class="scrollable-wrapper">
                <div class="scrollable">
                  <button class="scroll-right">scroll right</button>
                  <button class="scroll-left">scroll left</button>                               
                    <!-- Scripting To Do Placeholder Asset -->     
                  <div class="stories-wrapper medium-slider" id="stories-slider">
                    <xsl:choose>
                      <xsl:when test="ou:textual-content(tbody/tr/td[4]) != ''">
                        <xsl:choose>
                          <xsl:when test="$ou:action = 'pub'">
                            <xsl:text disable-output-escaping="yes">&lt;%</xsl:text>                                                                                                
                              Response.Write(OUC.GetStories.displayParallax("<xsl:value-of select="concat($domain, $story-xml)"/>", "<xsl:value-of select="tbody/tr/td[4]/node()"/>"));                
                            <xsl:text disable-output-escaping="yes">%&gt;</xsl:text>      
                          </xsl:when>
                          <xsl:otherwise>
                            <div style="{$message-styling-info}">Stories to appear on publish from <xsl:value-of select="concat($domain, $story-xml)"/></div>
                          </xsl:otherwise>
                        </xsl:choose>                        
                      </xsl:when>
                      <xsl:otherwise>                      
                        <xsl:variable name="story-1">
                          <xsl:choose>
                            <xsl:when test="doc-available(concat($domain, tbody/tr/td[5]/descendant::a/@href))">
                              <xsl:copy-of select="doc(concat($domain, tbody/tr/td[5]/descendant::a/@href))"/>
                            </xsl:when>
                            <xsl:otherwise><xsl:if test="$ou:action!='pub'">System Message: Story Data Not Found 1</xsl:if></xsl:otherwise>
                          </xsl:choose>	
                        </xsl:variable>              
                        <xsl:variable name="story-2">
                          <xsl:choose>
                            <xsl:when test="doc-available(concat($domain, tbody/tr/td[6]/descendant::a/@href))">
                              <xsl:copy-of select="doc(concat($domain, tbody/tr/td[6]/descendant::a/@href))"/>
                            </xsl:when>
                            <xsl:otherwise><xsl:if test="$ou:action!='pub'">System Message: Story Data Not Found 2</xsl:if></xsl:otherwise>
                          </xsl:choose>	
                        </xsl:variable>
                        <xsl:variable name="story-3">
                          <xsl:choose>
                            <xsl:when test="doc-available(concat($domain, tbody/tr/td[7]/descendant::a/@href))">
                              <xsl:copy-of select="doc(concat($domain, tbody/tr/td[7]/descendant::a/@href))"/>
                            </xsl:when>
                            <xsl:otherwise><xsl:if test="$ou:action!='pub'">System Message: Story Data Not Found 3</xsl:if></xsl:otherwise>
                          </xsl:choose>	
                        </xsl:variable>                        
                        <div class="story-wrapper col-sm-8">
                          <div class="story">
                            <div class="spotlight-image-wrapper">
                              <img src="{$story-1/story-content/image/img/@src}" alt="{$story-1/story-content/image/img/@alt}" class="portrait"/>
                            </div>
                            <div class="content">
                              <div class="hide-on-hover match">
                                <div class="inner-content">
                                  <img src="{{f:15920855}}" alt="quote-image"/>
                                  <div class="spotlight-intro-text">
                                    <p><xsl:value-of select="$story-1/story-content/quote"/>&rdquo;</p>
                                  </div>
                                </div>
                                <div class="footer-content">
                                  <div class="spotlight-author-text">
                                    <p><xsl:value-of select="concat($story-1/story-content/prefix, ' ', $story-1/story-content/firstname, ' ', $story-1/story-content/lastname, ' ', $story-1/story-content/suffix)"/></p>
                                  </div>
                                  <div class="spotlight-field-of-study-text">
                                    <p><xsl:value-of select="$story-1/story-content/title"/></p>
                                  </div>
                                </div>
                              </div>
                              <div class="show-on-hover">
                                <div class="award-text">
                                  <p><xsl:value-of select="$story-1/story-content/additional"/></p>
                                </div>
                              </div>
                              <div class="story-overlay"></div>
                              <div class="story-overlay-bottom"></div>
                            </div>
                            <a href="{$story-1/story-content/@href}" class="button green solid"><xsl:value-of select="concat('MEET ', $story-1/story-content/firstname)"/></a>
                          </div>
                        </div>
                        <div class="story-wrapper col-sm-8">
                          <div class="story">
                            <div class="spotlight-image-wrapper">
                              <img src="{$story-2/story-content/image/img/@src}" alt="{$story-2/story-content/image/img/@alt}" class="portrait"/>
                            </div>
                            <div class="content">
                              <div class="hide-on-hover match">
                                <div class="inner-content">
                                  <img src="{{f:15920855}}" alt="Quote Text"/>
                                  <div class="spotlight-intro-text">
                                    <p><xsl:value-of select="$story-2/story-content/quote"/>&rdquo;</p>
                                  </div>
                                </div>
                                <div class="footer-content">
                                  <div class="spotlight-author-text">
                                    <p><xsl:value-of select="concat($story-2/story-content/prefix, ' ', $story-2/story-content/firstname, ' ', $story-2/story-content/lastname, ' ', $story-2/story-content/suffix)"/></p>
                                  </div>
                                  <div class="spotlight-field-of-study-text">
                                    <p><xsl:value-of select="$story-2/story-content/title"/></p>
                                  </div>
                                </div>
                              </div>
                              <div class="show-on-hover">
                                <p><xsl:value-of select="$story-2/story-content/additional"/></p>
                              </div>
                              <div class="story-overlay"></div>
                              <div class="story-overlay-bottom"></div>
                            </div>
                            <a href="{$story-2/story-content/@href}" class="button green solid"><xsl:value-of select="concat('MEET ', $story-2/story-content/firstname)"/></a>
                          </div>
                        </div>
                        <div class="story-wrapper col-sm-8">
                          <div class="story">
                            <div class="spotlight-image-wrapper">
                              <img src="{$story-3/story-content/image/img/@src}" alt="{$story-3/story-content/image/img/@alt}" class="portrait"/>
                            </div>
                            <div class="content">
                              <div class="hide-on-hover match">
                                <div class="inner-content">
                                  <img src="{{f:15920855}}" alt="Quote Text"/>
                                  <div class="spotlight-intro-text">
                                    <p><xsl:value-of select="$story-3/story-content/quote"/>&rdquo;</p>
                                  </div>
                                </div>
                                <div class="footer-content">
                                  <div class="spotlight-author-text">
                                    <p><xsl:value-of select="concat($story-3/story-content/prefix, ' ', $story-3/story-content/firstname, ' ', $story-3/story-content/lastname, ' ', $story-3/story-content/suffix)"/></p>
                                  </div>
                                  <div class="spotlight-field-of-study-text">
                                    <p><xsl:value-of select="$story-3/story-content/title"/></p>
                                  </div>
                                </div>
                              </div>
                              <div class="show-on-hover">
                                <p><xsl:value-of select="$story-3/story-content/additional"/></p>
                              </div>
                              <div class="story-overlay"></div>
                              <div class="story-overlay-bottom"></div>
                            </div>
                            <a href="{$story-3/story-content/@href}" class="button green solid"><xsl:value-of select="concat('MEET ', $story-3/story-content/firstname)"/></a>
                          </div>
                        </div>
                      </xsl:otherwise>
                    </xsl:choose>
                    </div><!-- .stories-wrapper -->
                </div>
              </div>  
            </div><!-- .row -->
          </div>
        </div>
      </section><!-- .meet-fgcu -->
    
  </xsl:template>
  
  <!-- [FGCU Effect] Topical Carousel -->
  <xsl:template match="table[@class='ou-topical-carousel']">
    <section class="topical-carousel">
      <xsl:if test="tbody/tr[1]/td[1]/descendant::img"><xsl:attribute name="style">background-image: url(<xsl:value-of select="tbody/tr[1]/td[1]/descendant::img/@src"/>);</xsl:attribute></xsl:if>
      <xsl:if test="ou:textual-content(tbody/tr[1]/td[2]) != '' or ou:textual-content(tbody/tr[1]/td[3]) != ''">
      <div class="content-container">
        <xsl:if test="ou:textual-content(tbody/tr[1]/td[2]) != ''"><h2 class="h3"><xsl:value-of select="tbody/tr[1]/td[2]/node()"/></h2></xsl:if>
        <xsl:if test="ou:textual-content(tbody/tr[1]/td[3]) != ''" ><xsl:apply-templates select="tbody/tr[1]/td[3]/node()"/></xsl:if>
      </div>
      </xsl:if>
      <div class="topics">
        <xsl:for-each select="tbody/tr[position() gt 1]">
          <div class="slide" style="background-image: url({td[3]/descendant::img/@src});">
            <div class="top">
              <xsl:apply-templates select="td[3]/descendant::img"/>
              <div class="slick-arrow-container"></div>
            </div>
            <div class="content-wrapper">
              <div class="content">
                <xsl:choose>
                  <xsl:when test="ou:textual-content(td[1]) != ''"><p class="h3"><xsl:value-of select="td[1]/node()"/></p></xsl:when>
                  <xsl:otherwise><span class="about"></span></xsl:otherwise>
                </xsl:choose>
                <xsl:if test="ou:textual-content(td[2]) != ''"><xsl:apply-templates select="td[2]/node()"/></xsl:if>
              </div>
            </div>
          </div>
        </xsl:for-each>
        <div class="slide-controls">
          <div class="icon-container">                                    
              <button class="icon-wrapper one" aria-label="show details">
                <div id="{lower-case(tbody/tr[3]/td[4]/descendant::a/text())}" class="{lower-case(tbody/tr[3]/td[4]/descendant::a/text())} icon">
                  <span class="{lower-case(tbody/tr[3]/td[4]/descendant::a/@class)}"></span>
                  <span class="close"></span>
                </div>
              </button>
            <button class="icon-wrapper two" aria-label="show details">
              <div id="{lower-case(tbody/tr[4]/td[4]/descendant::a/text())}" class="{lower-case(tbody/tr[4]/td[4]/descendant::a/text())} icon">
                <span class="{lower-case(tbody/tr[4]/td[4]/descendant::a/@class)}"></span>
                <span class="close"></span>
              </div>
            </button>
            <button class="icon-wrapper three" aria-label="show details">
              <div id="{lower-case(tbody/tr[5]/td[4]/descendant::a/text())}" class="{lower-case(tbody/tr[5]/td[4]/descendant::a/text())} icon">
                <span class="{lower-case(tbody/tr[5]/td[4]/descendant::a/@class)}"></span>
                <span class="close"></span>
              </div>
            </button>
          </div>
        </div>
      </div><!-- .carousel-text-wrapper -->
    </section><!-- .topical-carousel -->
  </xsl:template>
	
	 <!-- FGCUTEAM Mike [FGCU Effect] Topical Text Section -->
  <xsl:template match="table[@class='ou-topical-text-section']">
    <section class="topical-carousel remove-margin">
      <xsl:if test="tbody/tr[1]/td[1]/descendant::img"><xsl:attribute name="style">background-image: url(<xsl:value-of select="tbody/tr[1]/td[1]/descendant::img/@src"/>);</xsl:attribute></xsl:if>
      <xsl:if test="ou:textual-content(tbody/tr[1]/td[2]) != '' or ou:textual-content(tbody/tr[1]/td[3]) != ''">
      <div class="container lightpaddingcontainer topicalcontainer">
        <xsl:if test="ou:textual-content(tbody/tr[1]/td[2]) != ''"><h2 class="h3"><xsl:value-of select="tbody/tr[1]/td[2]/node()"/></h2></xsl:if>
        <xsl:if test="ou:textual-content(tbody/tr[1]/td[3]) != ''" ><xsl:apply-templates select="tbody/tr[1]/td[3]/node()"/></xsl:if>
      </div>
      </xsl:if>
    </section><!-- .topical-carousel -->
  </xsl:template>
	
 <!-- fgcuteam-mike  Feed | News | Block -->
  <xsl:template match="table[@class='ou-news-block']">    
    <xsl:variable name="feed-source" select="lower-case(tbody/tr/td[2]/node())"/>
    <xsl:variable name="feed">
      <xsl:if test="$feed-source = 'external'"><xsl:value-of select="tbody/tr/td[3]/descendant::a/@href"/></xsl:if>
      <xsl:if test="$feed-source = 'omniupdate'"><xsl:value-of select="concat($domain,tbody/tr/td[3]/descendant::a/@href)"/></xsl:if>
    </xsl:variable>
    <xsl:variable name="items" select="'6'"/>			    
    <xsl:variable name="filters" select="if(ou:textual-content(tbody/tr/td[4]) = '') then 'All' else tbody/tr/td[4]/node()" />
    <xsl:variable name="news-config">		
      <categories>
        <category><xsl:value-of select="$filters"/></category>								
      </categories> 			
    </xsl:variable>  
      
		<section class="text-container inthenews">
		   <div class="container-flex">
			  <h3><xsl:value-of select="tbody/tr/td[1]/node()"/><a class="button red outline flat small" href="{tbody/tr/td[5]/descendant::a/@href}"><xsl:value-of select="ou:textual-content(tbody/tr/td[5]/node())"/></a></h3>
		   </div>
			<div class="container-flex row-alt">
				<xsl:choose>
                    <xsl:when test="$ou:action = 'pub'">
                      <xsl:text disable-output-escaping="yes">&lt;%</xsl:text>
                      <xsl:if test="$feed-source = 'omniupdate'">
                        string filter = "<xsl:value-of select="$news-config/categories/category"/>";
                        Response.Write(OUC.WnlDisplayMethods.displayNewsParallax("<xsl:value-of select="$feed"/>", "rss/channel/item", <xsl:value-of select="$items"/>, filter, 0));
                      </xsl:if>
                      <xsl:if test="$feed-source = 'external'">
                        Response.Write(OUC.GetNews.displayNewsListParallax("<xsl:value-of select="$feed"/>", "rss/channel/item", <xsl:value-of select="$items"/>, 0, "box"));
                      </xsl:if>
                      <xsl:text disable-output-escaping="yes">%&gt;</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                      <div class="article-wrapper">  
                          <p>Number of Items: <xsl:value-of select="$items"/></p>
                          <p><a href="#">RSS Feed: <xsl:value-of select="$feed"/></a></p>
                          <p>Feed Type: <xsl:value-of select="$feed-source"/></p>
                          <xsl:if test="$feed-source = 'omniupdate'">
                            <p>Active Filter(s): <xsl:value-of select="$news-config/categories/category"/></p>
                          </xsl:if>
                      </div>                     
                    </xsl:otherwise>
                  </xsl:choose>
			</div>
		</section><!-- .news -->
    
  </xsl:template>	
	
	
 <!-- fgcuteam-mike - Infographics | Billboard -->
  <xsl:template match="table[@class='ou-infographics-billboard']">
	  <xsl:variable name="options-used" select="lower-case(ou:textual-content(caption[2]/node()))"/>
	  <xsl:variable name="columns" select="if( contains($options-used, '2column') ) then 'col-md-12' else if( contains($options-used, '3column') ) then 'col-md-8' else if( contains($options-used, '4column') ) then 'col-md-6' else 'col'" />
	  <xsl:variable name="layout-style-left" select="if( contains($options-used, 'horizontal') ) then 'horizontal' else 'col-md-12 col-md-pull-12'" />
	  <xsl:variable name="layout-style-right" select="if( contains($options-used, 'horizontal') ) then 'horizontal' else 'col-md-12 col-md-push-12'" />
	  <xsl:variable name="modal-description" select="if( contains($options-used, 'popup-description') ) then 'popup-description' else ''" />
	  <xsl:variable name="background-texture" select="if( contains($options-used, 'rock') ) then 'overlay-texture rock' else if( contains($options-used, 'sea') ) then 'overlay-texture sea' else if( contains($options-used, 'waterfall') ) then 'overlay-texture waterfall' else ''" />

	  <section class="infographics-billboard {if (contains($options-used, 'nobackground') )then 'nobackground' else ''}">
		   <div class="container lightpaddingcontainer">
			  <div class="row-alt">
				 <div class="col-sm-24 {$layout-style-right} description-container">
					 <xsl:if test="ou:textual-content(tbody/tr[1]/td[4]/node()) != ''"> 
						<div id="defaultinfobillboard" class="defaultinfobillboard-show-content" style="display:inherit;" data-type="show-content">
							   <div class="container-flex ">
								   <xsl:apply-templates select="tbody/tr[1]/td[4]/node()"/>
							   </div>
						</div>
					 </xsl:if>
				 </div>				  
				 <div class="col-sm-24 {$layout-style-left} graphics-container">
					 <xsl:for-each select="tbody/tr[position() gt 1]">
						 			<xsl:choose>
									<xsl:when test="contains($options-used, 'popup-description')">
											<a href="{td[3]/descendant::a/@href}-open-popup">
											   <div class="col-xs-12 col-sm-6 {$columns}"><!-- DISABLED due to extra tabbing causing accesibility issue tabindex="0" role="button" aria-pressed="false"-->
												  <div class="col-sm-24 graphicsbox">
													  <!--no need for img alt since p bellow is inside a tag to avoid double tabbing on accesibility softwares-->
													 <div class="graphicsbox-img">
													<xsl:choose>
													<xsl:when test="contains($options-used, 'nobackground')">
														<img src="/_resources/icons/svg/blue/{ou:textual-content(td[1]/node())}.svg" alt="" />
													</xsl:when>
													<xsl:otherwise>
														<img src="/_resources/icons/svg/white/{ou:textual-content(td[1]/node())}.svg" alt="" />
													</xsl:otherwise>										
													</xsl:choose>

													  </div>
													 <div class="graphicsbox-txt">
														<p><xsl:value-of select="ou:truncate(ou:textual-content(td[2]/node()),64,'')"/></p>
													 </div>
												  </div>
											   </div>
											</a>
									
									<xsl:variable name="ref-name" select="concat(td[3]/descendant::a/@href, '-open-popup')"/>
									<div id="{replace($ref-name, '#', '')}" class="quick-popup-window">
										
									  <div>
										<a href="#" title="Close" class="close-quick-popup">Close X</a>
										<div><xsl:apply-templates select="td[4]/node()"/></div>

										</div>
									</div>

									</xsl:when>
									<xsl:otherwise>
											<a href="{td[3]/descendant::a/@href}">
											   <div class="col-xs-12 col-sm-6 {$columns}"><!-- DISABLED due to extra tabbing causing accesibility issue tabindex="0" role="button" aria-pressed="false"-->
												  <div class="col-sm-24 graphicsbox">
													  <!--no need for img alt since p bellow is inside a tag to avoid double tabbing on accesibility softwares-->
													 <div class="graphicsbox-img">
													<xsl:choose>
													<xsl:when test="contains($options-used, 'nobackground')">
														<img src="/_resources/icons/svg/blue/{ou:textual-content(td[1]/node())}.svg" alt="" />
													</xsl:when>
													<xsl:otherwise>
														<img src="/_resources/icons/svg/white/{ou:textual-content(td[1]/node())}.svg" alt="" />
													</xsl:otherwise>										
													</xsl:choose>

													  </div>
													 <div class="graphicsbox-txt">
														<p><xsl:value-of select="ou:truncate(ou:textual-content(td[2]/node()),64,'')"/></p>
													 </div>
												  </div>
											   </div>
											</a>
									</xsl:otherwise>										
		  							</xsl:choose>
					 </xsl:for-each>
				 </div>

			  </div>
		   </div>
		</section>
  </xsl:template>		
	
  <!-- fgcuteam-mike  Infographics | Line Icon -->
  <xsl:template match="table[@class='ou-infographics-lineicon']">
	  <xsl:variable name="options-used" select="lower-case(ou:textual-content(caption[2]/node()))"/>
	  <xsl:variable name="background-texture" select="if( contains($options-used, 'rock') ) then 'overlay-texture rock' else if( contains($options-used, 'sea') ) then 'overlay-texture sea' else if( contains($options-used, 'waterfall') ) then 'overlay-texture waterfall' else ''" />
	  <xsl:variable name="background-color" select="if( contains($options-used, 'green') ) then 'green' else ''" />
		<section class="text-container lineicon {$background-texture} {$background-color}">
			<div class="container">
				<div class="container-flex row-alt">
					<xsl:for-each select="tbody/tr">
						<div class="col-sm">
							<a href="{td[2]/descendant::a/@href}" target="{td[2]/descendant::a/@target}">
								<!--no need for img alt since p bellow is inside a tag to avoid double tabbing on accesibility softwares-->
								<xsl:choose>
									<xsl:when test="contains($background-texture, 'texture')">
										<img class="" src="/_resources/icons/svg/white/{ou:textual-content(td[1]/node())}.svg" alt="{ou:textual-content(td[1]/node())} ifographic" role="presentation" aria-hidden="true" />
									</xsl:when>
									<xsl:otherwise>
										<img class="" src="/_resources/icons/svg/green/{ou:textual-content(td[1]/node())}.svg" alt="{ou:textual-content(td[1]/node())} ifographic" role="presentation" aria-hidden="true" />
										<img class="" src="/_resources/icons/svg/blue/{ou:textual-content(td[1]/node())}.svg" alt="{ou:textual-content(td[1]/node())} ifographic" role="presentation" aria-hidden="true" />
									</xsl:otherwise>
		  						</xsl:choose>
								<p class="line-icon-title"><xsl:value-of select="ou:textual-content(td[3]/node())"/></p>
								<p><xsl:value-of select="ou:textual-content(td[4]/node())"/></p>
							</a>
						</div>
					</xsl:for-each>
				</div>
			</div>
		</section>
  </xsl:template>	
	
		 <!-- fgcuteam-mike  Infotext | Quick Facts -->
  <xsl:template match="table[@class='ou-infotext-quickfacts']">
	<xsl:variable name="options-used" select="lower-case(ou:textual-content(caption[2]/node()))"/>
	<section class="text-container quickfacts">
	   <div class="container-flex row-alt">
		  <xsl:choose>
				<xsl:when test="contains($options-used, 'invert')">
					<xsl:if test="ou:textual-content(tbody/tr[1]/td[1]/node()) != ''">
					  <div class="col-sm col-xs-12">
						  <xsl:choose>
							  <xsl:when test="tbody/tr[2]/td[1]/descendant::a/@href"><a href="{tbody/tr[2]/td[1]/descendant::a/@href}"><p><xsl:value-of select="ou:truncate(ou:textual-content(tbody/tr[2]/td[1]/node()),30,'')"/></p>
								  <h2><xsl:value-of select="ou:truncate(ou:textual-content(tbody/tr[1]/td[1]/node()), 6, '')"/></h2></a></xsl:when>
							  <xsl:otherwise><p><xsl:value-of select="ou:truncate(ou:textual-content(tbody/tr[2]/td[1]/node()),30,'')"/></p>
							  <h2><xsl:value-of select="ou:truncate(ou:textual-content(tbody/tr[1]/td[1]/node()), 6, '')"/></h2></xsl:otherwise>
							  </xsl:choose>
					  </div>
					</xsl:if>
					<xsl:if test="ou:textual-content(tbody/tr[1]/td[2]/node()) != ''">
					  <div class="col-sm col-xs-12">
						   <xsl:choose>
							  <xsl:when test="tbody/tr[2]/td[2]/descendant::a/@href"><a href="{tbody/tr[2]/td[2]/descendant::a/@href}"><p><xsl:value-of select="ou:truncate(ou:textual-content(tbody/tr[2]/td[2]/node()),30,'')"/></p>
								  <h2><xsl:value-of select="ou:truncate(ou:textual-content(tbody/tr[1]/td[2]/node()), 6, '')"/></h2></a></xsl:when>
							  <xsl:otherwise><p><xsl:value-of select="ou:truncate(ou:textual-content(tbody/tr[2]/td[2]/node()),30,'')"/></p>
							  <h2><xsl:value-of select="ou:truncate(ou:textual-content(tbody/tr[1]/td[2]/node()), 6, '')"/></h2></xsl:otherwise>
							  </xsl:choose>
					  </div>
						</xsl:if>
					  <xsl:if test="ou:textual-content(tbody/tr[1]/td[3]/node()) != ''"> 
						  <div class="col-sm col-xs-12">
							   <xsl:choose>
							  <xsl:when test="tbody/tr[2]/td[3]/descendant::a/@href"><a href="{tbody/tr[2]/td[3]/descendant::a/@href}"><p><xsl:value-of select="ou:truncate(ou:textual-content(tbody/tr[2]/td[3]/node()),30,'')"/></p>
								  <h2><xsl:value-of select="ou:truncate(ou:textual-content(tbody/tr[1]/td[3]/node()), 6, '')"/></h2></a></xsl:when>
							  <xsl:otherwise><p><xsl:value-of select="ou:truncate(ou:textual-content(tbody/tr[2]/td[3]/node()),30,'')"/></p>
							  <h2><xsl:value-of select="ou:truncate(ou:textual-content(tbody/tr[1]/td[3]/node()), 6, '')"/></h2></xsl:otherwise>
							  </xsl:choose>
					  </div>
					</xsl:if>
					 <xsl:if test="ou:textual-content(tbody/tr[1]/td[4]/node()) != ''"> 
						 <div class="col-sm col-xs-12">
							  <xsl:choose>
							  <xsl:when test="tbody/tr[2]/td[4]/descendant::a/@href"><a href="{tbody/tr[2]/td[4]/descendant::a/@href}"><p><xsl:value-of select="ou:truncate(ou:textual-content(tbody/tr[2]/td[4]/node()),30,'')"/></p>
								  <h2><xsl:value-of select="ou:truncate(ou:textual-content(tbody/tr[1]/td[4]/node()), 6, '')"/></h2></a></xsl:when>
							  <xsl:otherwise><p><xsl:value-of select="ou:truncate(ou:textual-content(tbody/tr[2]/td[4]/node()),30,'')"/></p>
							  <h2><xsl:value-of select="ou:truncate(ou:textual-content(tbody/tr[1]/td[4]/node()), 6, '')"/></h2></xsl:otherwise>
							  </xsl:choose>
					  </div>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:if test="ou:textual-content(tbody/tr[1]/td[1]/node()) != ''">
					  <div class="col-sm col-xs-12">
						  <xsl:choose>
							  <xsl:when test="tbody/tr[2]/td[1]/descendant::a/@href"><a href="{tbody/tr[2]/td[1]/descendant::a/@href}"><h2><xsl:value-of select="ou:truncate(ou:textual-content(tbody/tr[1]/td[1]/node()), 6, '')"/></h2>
								  <p><xsl:value-of select="ou:truncate(ou:textual-content(tbody/tr[2]/td[1]/node()),30,'')"/></p>
								  </a></xsl:when>
							  <xsl:otherwise>
								  <h2><xsl:value-of select="ou:truncate(ou:textual-content(tbody/tr[1]/td[1]/node()), 6, '')"/></h2>
								  <p><xsl:value-of select="ou:truncate(ou:textual-content(tbody/tr[2]/td[1]/node()),30,'')"/></p>
							  </xsl:otherwise>
							  </xsl:choose>
					  </div>
						</xsl:if>
					<xsl:if test="ou:textual-content(tbody/tr[1]/td[2]/node()) != ''"> 
					  <div class="col-sm col-xs-12">
						  <xsl:choose>
							  <xsl:when test="tbody/tr[2]/td[2]/descendant::a/@href"><a href="{tbody/tr[2]/td[2]/descendant::a/@href}"><h2><xsl:value-of select="ou:truncate(ou:textual-content(tbody/tr[1]/td[2]/node()), 6, '')"/></h2>
								  <p><xsl:value-of select="ou:truncate(ou:textual-content(tbody/tr[2]/td[2]/node()),30,'')"/></p>
								  </a></xsl:when>
							  <xsl:otherwise>
								   <h2><xsl:value-of select="ou:truncate(ou:textual-content(tbody/tr[1]/td[2]/node()), 6, '')"/></h2>
								  <p><xsl:value-of select="ou:truncate(ou:textual-content(tbody/tr[2]/td[2]/node()),30,'')"/></p>
							 </xsl:otherwise>
							  </xsl:choose>
					  </div>
						 </xsl:if>
					<xsl:if test="ou:textual-content(tbody/tr[1]/td[3]/node()) != ''"> 
						  <div class="col-sm col-xs-12">
							  <xsl:choose>
							  <xsl:when test="tbody/tr[2]/td[3]/descendant::a/@href"><a href="{tbody/tr[2]/td[3]/descendant::a/@href}"><h2><xsl:value-of select="ou:truncate(ou:textual-content(tbody/tr[1]/td[3]/node()), 6, '')"/></h2>
								  <p><xsl:value-of select="ou:truncate(ou:textual-content(tbody/tr[2]/td[3]/node()),30,'')"/></p>
								  </a></xsl:when>
							  <xsl:otherwise>
								   <h2><xsl:value-of select="ou:truncate(ou:textual-content(tbody/tr[1]/td[3]/node()), 6, '')"/></h2>
								  <p><xsl:value-of select="ou:truncate(ou:textual-content(tbody/tr[2]/td[3]/node()),30,'')"/></p>
							 </xsl:otherwise>
							  </xsl:choose>
					  </div>
						</xsl:if>
					  <xsl:if test="ou:textual-content(tbody/tr[1]/td[4]/node()) != ''"> 
						  <div class="col-sm col-xs-12">
							   <xsl:choose>
							  <xsl:when test="tbody/tr[2]/td[4]/descendant::a/@href"><a href="{tbody/tr[2]/td[4]/descendant::a/@href}"><h2><xsl:value-of select="ou:truncate(ou:textual-content(tbody/tr[1]/td[4]/node()), 6, '')"/></h2>
								  <p><xsl:value-of select="ou:truncate(ou:textual-content(tbody/tr[2]/td[4]/node()),30,'')"/></p>
								  </a></xsl:when>
							  <xsl:otherwise>
								   <h2><xsl:value-of select="ou:truncate(ou:textual-content(tbody/tr[1]/td[4]/node()), 6, '')"/></h2>
								  <p><xsl:value-of select="ou:truncate(ou:textual-content(tbody/tr[2]/td[4]/node()),30,'')"/></p>
							 </xsl:otherwise>
							  </xsl:choose>
					  </div>
					</xsl:if>
				</xsl:otherwise>
		  </xsl:choose>		   
	   
	   </div>
	</section>	  
  </xsl:template>	
	
	
	 <!-- fgcuteam-mike  Billboard | Multi Color-Texture | Overlay -->
  <xsl:template match="table[@class='ou-multi-color-texture']">
	  <xsl:variable name="options-used" select="lower-case(ou:textual-content(caption[2]/node()))"/>
	  <xsl:variable name="background-texture" select="if( contains($options-used, 'rock') ) then 'rock' else if( contains($options-used, 'sea') ) then 'sea' else if( contains($options-used, 'waterfall') ) then 'waterfall' else 'rock'" />
	    <xsl:variable name="background-color" select="if( contains($options-used, 'green') ) then 'green' else ''" />
	  <section class="text-container videopanel overlay-texture {$background-color} {$background-texture}">
		<div class="container">
		<div class="container-flex row-alt">
			<div class="col-sm">
				<xsl:apply-templates select="tbody/tr[1]/td[1]/node()"/>
			</div>
		</div>
		</div>
	</section>
  </xsl:template>	
	
  <!-- fgcuteam-mike  Video | Box (COMBO) -->
  <xsl:template match="table[@class='ou-video-box']">
	  <xsl:variable name="options-used" select="lower-case(ou:textual-content(caption[2]/node()))"/>
	  <xsl:variable name="background-texture" select="if( contains($options-used, 'rock') ) then 'rock' else if( contains($options-used, 'sea') ) then 'sea' else if( contains($options-used, 'waterfall') ) then 'waterfall' else 'rock'" />
	    <xsl:variable name="background-color" select="if( contains($options-used, 'green') ) then 'green' else 'blue'" />
	  <xsl:choose>
            <xsl:when test="contains($options-used, 'horizontal')">
				
				<section class="video-box row horizontalvideo">
				   <div class="col-md-12 col-lg-12 col-sm-24">
					 <xsl:apply-templates select="tbody/tr[1]/td[1]/node()"/>
				   </div>
				   <div class="col-md-12 col-lg-12 col-sm-24">
					  <section class="videopanel overlay-texture {$background-color} {$background-texture}">
						 <div class="container">
							<div class="container-flex row-alt">
							   <div class="col-sm">
								   <xsl:apply-templates select="tbody/tr[1]/td[2]/node()"/>
							   </div>
							</div>
						 </div>
					  </section>
				   </div>
				</section>
				
			</xsl:when>
          	<xsl:otherwise>
				<section class="video-box row">
					<div class="col-md-24">
					 <xsl:apply-templates select="tbody/tr[1]/td[1]/node()"/>
					   <section class="videopanel overlay-texture {$background-color} {$background-texture}">
							 <div class="container">
								<div class="container-flex row-alt">
								   <div class="col-sm">
									   <xsl:apply-templates select="tbody/tr[1]/td[2]/node()"/>
								   </div>
								</div>
							 </div>
						  </section>
					</div>
				</section>	
				
		  	</xsl:otherwise>
      </xsl:choose>
		
  </xsl:template>	


    
  <!-- [Generic] Text -->
  <xsl:template match="table[@class='ou-text-section']">
    <section class="text-container">
      <div class="container-flex"> <!-- removed content-container class -->
        <xsl:apply-templates select="tbody/tr/td[1]/node()"/>
      </div>
    </section>
  </xsl:template>

<!-- [Generic] Text/Content section - fgcuteam-mike -->
  <xsl:template match="table[@class='ou-text-container-section']">
  <xsl:variable name="options-used" select="lower-case(ou:textual-content(caption[2]/node()))"/>	
  <xsl:variable name="background-color" select="if( contains($options-used, 'gray') or contains($options-used, 'grey')) then 'gray' else if( contains($options-used, 'lightblue') ) then 'lightblue' else if( contains($options-used, 'blue') ) then 'blue' else ''" />
    <section class="text-container {$background-color}">
      <div class="container-flex">
        <xsl:apply-templates select="tbody/tr/td[1]/node()"/>
      </div>
    </section>
  </xsl:template>
	
	<!-- FGCUTeam Mike [Generic] Text Wide -->
  <xsl:template match="table[@class='ou-text-section-wide']">
    <section class="text-section">
      <div class="container lightpaddingcontainer">
        <xsl:apply-templates select="tbody/tr/td[1]/node()"/>
      </div>
    </section>
  </xsl:template>
  
  <!--
    Home Page
   -->
  
  <!-- [Home Page] See For Yourself -->
	<xsl:template match="table[@class='ou-see-for-yourself']">
		<xsl:if test="tbody/tr/td[1]/descendant::img">
				  <!-- fgcuteam-mike convert youtube link to site safe link -->
					<xsl:variable name="clean-url" select="replace(replace(replace(replace(replace(tbody/tr/td[4]/descendant::a/@href, 'controls=(\d)', ''), 'rel=(\d)', ''), 'showinfo=(\d)', ''), 'watch\?v=', 'embed/'), 'youtu\.be/', 'www.youtube.com/embed/') " />	
					<xsl:variable name="clean-url-video" select="if(contains($clean-url, '?')) then concat($clean-url, '&amp;rel=0&amp;controls=1&amp;showinfo=0') else concat($clean-url, '?rel=0&amp;controls=1&amp;showinfo=0')" />
			<xsl:variable name="poster-image" select="tbody/tr[1]/td[5]/descendant::img/@src" />
			<xsl:variable name="image" select="tbody/tr[1]/td[1]/descendant::img/@src" />
			<xsl:variable name="extension" select="concat('.', substring-after($image, '.'))" />	
			<xsl:variable name="tablet-image" select="concat(replace($image, $extension, ''), '-tablet', $extension) " />
			<xsl:variable name="mobile-image" select="concat(replace($image, $extension, ''), '-mobile', $extension) " />      
			<section class="see-for-yourself desktop-banner" style="background-image: url({$image});">
				<div class="tablet-banner" style="background-image: url({$tablet-image})">
					<div class="mobile-banner" style="background-image: url({$mobile-image})">
						<div class="container">
							<xsl:if test="ou:textual-content(tbody/tr/td[2]) != ''"><h2><xsl:value-of select="tbody/tr/td[2]/node()"/></h2></xsl:if>
							<xsl:if test="ou:textual-content(tbody/tr/td[3]) != ''"><p class="hide-on-tablet"><xsl:value-of select="tbody/tr/td[3]/node()"/></p></xsl:if>
							<div class="embed-container">
								<xsl:if test="tbody/tr/td[4]/descendant::a"><iframe id="video-{$clean-url}" title="video-{$clean-url}" width="560" height="315" src="{$clean-url-video}"  allowfullscreen="allowfullscreen"></iframe></xsl:if>
								<img src="{$poster-image}" alt="video-poster"/>
								<xsl:if test="ou:textual-content(tbody/tr/td[3]) != ''"><p><xsl:value-of select="tbody/tr/td[3]/node()"/></p></xsl:if>  
								<div class="video-mask"></div>
								<a class="play-button" aria-label="Play Video" title="Play Video" href="{$clean-url-video}"></a>  
							</div>
							<xsl:apply-templates select="tbody/tr/td[6]/descendant::a" />
						</div>
						<div class="overlay"></div>
					</div>
				</div>                        
			</section><!-- .see-for-yourself -->
		</xsl:if>
	</xsl:template>
  
  <!-- [Home Page] The FGCU Effect -->
  <xsl:template match="table[@class='ou-fgcu-effect']">
    <xsl:if test="tbody/tr/td[1]/descendant::img">
      <xsl:variable name="image" select="tbody/tr/td[1]/descendant::img/@src" />    
      <xsl:variable name="extension" select="concat('.', substring-after($image, '.'))" />		
      <xsl:variable name="tablet-image" select="concat(replace($image, $extension, ''), '-tablet', $extension) " />
      <xsl:variable name="mobile-image" select="concat(replace($image, $extension, ''), '-mobile', $extension) " />      
      <section class="the-fgu-effect desktop-banner" style="background-image: url({$image})">
        <div class="tablet-banner" style="background-image: url({$tablet-image})">
          <div class="mobile-banner" style="background-image: url({$mobile-image})">                        
            <!-- svg image line -->
            <svg version="1.1" id="effect-line-animation" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
              viewBox="0 0 400 700" style="enable-background:new 0 0 400 700;" xml:space="preserve">
              <path class="path" fill="none" stroke="#ffffff" stroke-width="3" stroke-miterlimit="10" d="M69.8,700c0,0-68.7-90.9-62.4-238.8C24.2,63.4,400,4.1,400,4.1"/>
            </svg>            
            <div class="container col-sm-16 pull-right">
              <button id="reset-the-fgcu-effect">Reset</button>
              <xsl:for-each select="tbody/tr[position() gt 1]">
                <div class="initial-content">
                  <xsl:if test="position() gt 1">
                    <xsl:attribute name="class"><xsl:value-of select="concat('radar-item-', position()-1, '-content inactive')" /></xsl:attribute>
                  </xsl:if>
                  <xsl:if test="ou:textual-content(td[1]) != '' and position() = 2"><h2><xsl:value-of select="td[1]/node()"/></h2></xsl:if>
                  <xsl:if test="ou:textual-content(td[1]) != '' and not(position() = 2)"><h2 class="h2"><xsl:value-of select="td[1]/node()"/></h2></xsl:if>
                  <xsl:apply-templates select="td[2]/node()"/>
                </div>               
              </xsl:for-each>
            </div><!-- .initial-content -->
            <div class="icons col-sm-8">
              <div class="icon-container">
                <div class="icon-wrapper one" aria-label="show details">
                  <div id="radar-item-1" class="radar-item-1 icon">
                    <span class="{lower-case(tbody/tr[3]/td[3]/descendant::a/@class)}"></span>
                    <p><xsl:value-of select="ou:capital(tbody/tr[3]/td[3]/descendant::a/text())"/></p>
                  </div>
                </div>
                <div class="icon-wrapper two" aria-label="show details">
                  <div id="radar-item-2" class="radar-item-2 icon">
                    <span class="{lower-case(tbody/tr[4]/td[3]/descendant::a/@class)}"></span>
                    <p><xsl:value-of select="ou:capital(tbody/tr[4]/td[3]/descendant::a/text())"/></p>
                  </div>
                </div>
                <div class="icon-wrapper three" aria-label="show details">
                  <div id="radar-item-3" class="radar-item-3 icon">
                    <span class="{lower-case(tbody/tr[5]/td[3]/descendant::a/@class)}"></span>
                    <p><xsl:value-of select="ou:capital(tbody/tr[5]/td[3]/descendant::a/text())"/></p>
                  </div>
                </div>
              </div>
            </div>
            <div class="overlay"></div>
            <div class="overlay-active"></div>
          </div><!-- .mobile-banner -->
        </div>
      </section><!-- .the-fgu-effect -->
    </xsl:if>
  </xsl:template>
  
  <!-- 
    Student Life Snippets
  -->
	
  <!-- fgcuteam-mike Billboard | Box -->
  <xsl:template match="table[@class='ou-billboard-box']">
	<xsl:variable name="color" select="if( contains(lower-case(ou:textual-content(caption[2])), 'white') ) then 'white' else 'grey'"/>
	<xsl:variable name="size" select="if( contains(lower-case(ou:textual-content(caption[2])), 'left') or contains(lower-case(ou:textual-content(caption[2])), 'right') ) then 'col-md-11' else 'col-md-24'"/>
	<xsl:variable name="image" select="if( tbody/tr/td[1]/descendant::img/@src ) then concat('background-image: url(',tbody/tr/td[1]/descendant::img/@src,');') else ''"/>
	<xsl:variable name="float" select="if( contains(lower-case(ou:textual-content(caption[2])), 'right') ) then 'right' else 'left'"/>
	<section class="billboard-box {$color}" style="{$image}">
		<div class="container">
			<div class="box {$size} {$float}">
				<xsl:apply-templates select="tbody/tr/td[2]/node()"/>
			</div>
		</div>	  	  
	</section>
  </xsl:template>	
  
  <!-- [Student Life] Intro Section Paragraph + Image -->
  <xsl:template match="table[@class='ou-intro-section-paragraph-image']">
    <div class="section intro-section" style="background-image: url({tbody/tr/td[1]/descendant::img/@src})">
      <div class="container">
        <xsl:if test="ou:textual-content(tbody/tr/td[2]) != ''">
          <p class="intro-text"><xsl:value-of select="tbody/tr/td[2]/node()"/></p>
        </xsl:if>        
        <xsl:apply-templates select="tbody/tr/td[3]/node()"/>       
      </div>
    </div>
  </xsl:template>
  
  <!-- [Student Life] CTA Block: Large Block Alt -->
  <xsl:template match="table[@class='ou-cta-block-large-alt']">
    <section class="carousel-text">
      <div class="carousel-text-wrapper">
        <div class="slide">
          <div class="top">
            <xsl:apply-templates select="tbody/tr/td[1]/descendant::img"/>
            <div class="slick-arrow-container"></div>
          </div>
          <div class="content-wrapper" style="background-image: url({tbody/tr/td[1]/descendant::img/@src});">
            <div class="content">
              <xsl:if test="ou:textual-content(tbody/tr/td[2]) != ''"><p class="h3"><xsl:value-of select="tbody/tr/td[2]/node()"/></p></xsl:if>
              <xsl:apply-templates select="tbody/tr/td[3]/node()"/>
              <xsl:if test="tbody/tr/td[4]/descendant::a">
                <div class="cta-links">
                  <xsl:apply-templates select="tbody/tr/td[4]/descendant::a"/>                  
                </div>
              </xsl:if>
              <div class="slick-arrow-container"></div>
            </div>
          </div>
        </div>
      </div><!-- .carousel-wrapper -->
    </section>    
  </xsl:template>
  
  <!-- [Student Life] CTA Three Column Block -->
  <xsl:template match="table[@class='ou-cta-three-column-block']">
    <section class="circle-listing" >
      <div class="content-container">
        <xsl:if test="ou:textual-content(tbody/tr[1]/td[1]) != ''"><h2><xsl:value-of select="tbody/tr[1]/td[1]/node()"/></h2></xsl:if>
        <xsl:if test="ou:textual-content(tbody/tr[1]/td[2]) != ''"><p class="intro-text"><xsl:value-of select="tbody/tr[1]/td[2]/node()"/></p></xsl:if>        
      </div>
      <div class="container">
        <div class="scrollable-wrapper">
          <div class="scrollable">
            <button class="scroll-right">scroll right</button>  
            <button class="scroll-left">scroll left</button>  
            <div class="medium-slider">
              <xsl:for-each select="tbody/tr[position() gt 1]">                
                <div class="article-wrapper">
                  <div class="circle-tile">
                    <div class="thumbnail">
                      <a href="{if(td[3]/descendant::a) then td[3]/descendant::a/@href else '#'}">
                        <xsl:apply-templates select="td[3]/descendant::a/attribute()[not(name() = 'href')]"/>
                        <xsl:apply-templates select="td[1]/descendant::img"/>                        
                      </a>
                      <div class="icon"><xsl:apply-templates select="td[3]/node()"/></div>
                    </div>
                    <div class="lower-content">
                      <p class="h4"><a href="{if(td[3]/descendant::a) then td[3]/descendant::a/@href else '#'}"><xsl:value-of select="td[2]"/></a></p>
                    </div>
                  </div> 
                </div>
              </xsl:for-each>              
            </div> 
          </div>
        </div>
      </div>
    </section>
  </xsl:template>
  
  <!-- [Student Life] Events Listing Carousel -->
  <xsl:template match="table[@class='ou-events-listing-carousel']">    
    <xsl:variable name="feed" select="tbody/tr/td[2]/descendant::a/@href"/>
    <xsl:variable name="items" select="'6'"/>
	<xsl:variable name="class-tiles" select="if (contains($feed, '.json')) then 'event-tiles' else ''"/>
    <!-- <section class="event-listing">
      <div class="container">
        <xsl:if test="ou:textual-content(tbody/tr/td[1])"><h2><xsl:value-of select="tbody/tr/td[1]/node()"/></h2></xsl:if>
        <ul class="event-wrapper slider {$class-tiles}">         
          
          <xsl:choose>
            <xsl:when test="$ou:action = 'pub'">
			  <xsl:choose>
                <xsl:when test="contains($feed, '.json')">
				  <xsl:text disable-output-escaping="yes">&lt;%</xsl:text>                                                                                                
                  Response.Write(OUC.GetEvents.displayEventsCarouselJson("<xsl:value-of select="$feed"/>", <xsl:value-of select="$items"/>));                
                  <xsl:text disable-output-escaping="yes">%&gt;</xsl:text>					
			    </xsl:when>
			    <xsl:otherwise>
				  <xsl:text disable-output-escaping="yes">&lt;%</xsl:text>                                                                                                
                  Response.Write(OUC.GetEvents.displayEventsCarousel("<xsl:value-of select="$feed"/>", "feed/entry", <xsl:value-of select="$items"/>));                
                  <xsl:text disable-output-escaping="yes">%&gt;</xsl:text>
			    </xsl:otherwise>
			  </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
              <li>
                <div class="inner-container">
                  <a href="#" class="date-icon">
                    <div>
                      <span class="month">Xxx</span>
                      <span class="day">X</span>
                    </div>
                  </a>
                  <a href="#" class="title">Number of Items: <xsl:value-of select="$items"/></a>
                  <div class="time">Events Feed: <xsl:value-of select="$feed"/></div>
                  <div class="location">Events Appear on Page Publish</div>
                </div>
              </li>       
            </xsl:otherwise>
          </xsl:choose>             
        </ul>
        <xsl:apply-templates select="tbody/tr/td[3]/descendant::a"/>
      </div>
    </section> -->
  </xsl:template>
	
	
	<!-- fgcuteam-mike Calendar | Events | List -->
  <xsl:template match="table[@class='ou-events-listing-list']">    
    <xsl:variable name="feed" select="tbody/tr/td[2]/descendant::a/@href"/>
    <xsl:variable name="items" select="'5'"/>
    <section class="text-container eventslist">
      <div class="container">
		  <div class="col-sm-24">
			 <xsl:if test="ou:textual-content(tbody/tr/td[1])">
				 <h2 class="h3"><xsl:value-of select="tbody/tr/td[1]/node()"/><xsl:if test="ou:textual-content(tbody/tr/td[3])"><a class="button red outline flat small" href="{tbody/tr/td[3]/descendant::a/@href}"><xsl:value-of select="ou:textual-content(tbody/tr/td[3]/descendant::a)"/></a></xsl:if></h2>
			  </xsl:if>
		  </div>
          <!-- requires url for events to parse -->
          <xsl:choose>
            <xsl:when test="$ou:action = 'pub'">
				  <xsl:text disable-output-escaping="yes">&lt;%</xsl:text>                                                                                                
                  Response.Write(OUC.GetEvents.displayEventsCarouselJson("<xsl:value-of select="$feed"/>", <xsl:value-of select="$items"/>, "box"));                
                  <xsl:text disable-output-escaping="yes">%&gt;</xsl:text>					
            </xsl:when>
            <xsl:otherwise>
              <li>
                <div class="inner-container">
                  <a href="#" class="date-icon">
                    <div>
                      <span class="month">Xxx</span>
                      <span class="day">X</span>
                    </div>
                  </a>
                  <a href="#" class="title">Number of Items: <xsl:value-of select="$items"/></a>
                  <div class="time">Events Feed: <xsl:value-of select="$feed"/></div>
                  <div class="location">Events Appear on Page Publish</div>
                </div>
              </li>       
            </xsl:otherwise>
          </xsl:choose>
      </div>
    </section><!-- .event-listing -->
  </xsl:template>
	
 <!-- [Student Life] Events Listing Carousel Featured -->
  <xsl:template match="table[@class='ou-events-listing-carousel-featured']">    
    <xsl:variable name="title" select="ou:textual-content(tbody/tr/td[1]/node())"/>
	<xsl:variable name="feed" select="tbody/tr/td[2]/descendant::a/@href"/>
    <xsl:variable name="days" select="ou:textual-content(tbody/tr/td[3]/node())"/>
	<xsl:variable name="class-tiles" select="if (contains($feed, '.json')) then 'event-tiles' else ''"/>
    <!-- 
	<section class="event-listing">
      <div class="container">
             
          
          <xsl:choose>
            <xsl:when test="$ou:action = 'pub'">
				  <xsl:text disable-output-escaping="yes">&lt;%</xsl:text>                                                                                                
                  Response.Write(OUC.GetEvents.displayEventsCarouselFeaturedJson("<xsl:value-of select="$feed"/>", "<xsl:value-of select="$title"/>", <xsl:value-of select="$days"/>));                
                  <xsl:text disable-output-escaping="yes">%&gt;</xsl:text>	
            </xsl:when>
            <xsl:otherwise>
                <div class="inner-container">
                  <div class="time">Events Feed: <xsl:value-of select="$feed"/></div>
                  <div class="location">Event to Appear on Page Publish</div>
                </div>
            </xsl:otherwise>
          </xsl:choose>             
        
      </div>
    </section>-->
  </xsl:template>	
  
  <!--  
    Typical Snippets
  -->
  
  <!-- [Typical Page] Featured Video Wrapper -->
  <xsl:template match="table[@class='ou-featured-video-wrapper']"> 
		<!-- fgcuteam-mike convert youtube link to site safe link -->
	<xsl:variable name="video-url" select="tbody/tr/td[2]/descendant::a[1]/@href"/>
	<xsl:variable name="yt_url_id">
		  <xsl:analyze-string select="$video-url" regex='^.*(?:(?:youtu\.be/|v/|vi/|u/\w/|embed/)|(?:(?:watch)?\?v(?:i)?=|&amp;v(?:i)?=))([^#&amp;\?]*).*$' >
			  <xsl:matching-substring>	
				  <xsl:value-of select="regex-group(1)"/>
			  </xsl:matching-substring>
		  </xsl:analyze-string>
	</xsl:variable>
	  <!--
	<xsl:variable name="clean-url" select="replace(replace(replace(replace(replace(tbody/tr/td[2]/descendant::a/@href, 'controls=(\d)', ''),  'rel=(\d)', ''), 'showinfo=(\d)', ''), 'watch\?v=', 'embed/'), 'youtu\.be/', 'www.youtube.com/embed/') " />
	  <xsl:variable name="clean-url2" select="if(contains($clean-url, '?')) then concat($clean-url, '&amp;rel=0&amp;controls=1&amp;showinfo=0') else concat($clean-url, '?rel=0&amp;controls=1&amp;showinfo=0')" />  
	  <xsl:variable name="clean-url3" select="replace(replace($clean-url2,'&amp;t=(\d)', '&amp;start=$1'),'\?t=(\d)', '?start=$1')"/>
	  <xsl:variable name="clean-url-video" select="$clean-url3"/>-->
	  <xsl:variable name="clean-url-video" select="concat('https://www.youtube.com/embed/', $yt_url_id, '?rel=0&amp;controls=1&amp;showinfo=0')"/>
	  <!--
		<xsl:variable name="clean-url-video" select="replace($clean-url2,'(.*)(&amp;s=\d|\?s=\d)(.*)', '$1$3')"/>
      -->
	  <!--
	<xsl:variable name="clean-url-video-BACKUP" select="if(contains($clean-url, '?')) then concat($clean-url, '&amp;rel=0&amp;controls=1&amp;showinfo=0') else concat($clean-url, '?rel=0&amp;controls=1&amp;showinfo=0')" />
-->
	<xsl:variable name="youtube-autoplay" select="if(contains($clean-url-video, 'autoplay=1')) then 'yes' else 'no'" />
	<xsl:variable name="youtube-jsapi" select="if(contains($clean-url-video, 'enablejsapi=1')) then '' else '&amp;enablejsapi=1'" />
	<xsl:variable name="yt_url" select="$clean-url-video"/>
    <xsl:variable name="yt_url2" select="if(contains($yt_url, '&amp;') and contains($yt_url, '?v=') ) then substring-before(substring-after($yt_url, '?v='), '&amp;') else substring-after($yt_url, '?v=')" />
    <xsl:variable name="yt_url3" select="if(contains($yt_url, '?') and contains($yt_url, 'embed/')) then substring-before(substring-after($yt_url, 'embed/'), '?') else substring-after($yt_url, 'embed/')" />
   <!-- <xsl:variable name="yt_url_id" select="concat($yt_url2, $yt_url3)" />-->
	<xsl:variable name="yt_url_thumb" select="concat('https://img.youtube.com/vi/', $yt_url_id, '/maxresdefault.jpg')" />
	<xsl:variable name="video-id" select="generate-id(.)"/>
	<xsl:variable name="url-label" select="if(ou:textual-content(tbody/tr/td[2]/descendant::a/@title) = '') then 'Video Thumbnail' else concat(tbody/tr/td[2]/descendant::a/@title, 'Video Thumbnail') "/>
	<xsl:variable name="video-size" select="if (contains(ou:textual-content(caption[2]/node()), 'large-video')) then 'large-video' else ''"/>
    <xsl:if test="not(contains(parent::node(), ouc:div[@label='maincontent']))">
      <xsl:text disable-output-escaping="yes">&lt;section&gt;</xsl:text>
      <xsl:text disable-output-escaping="yes">&lt;div class="content-container"&gt;</xsl:text>
    </xsl:if>
    <div class="featured-video-wrapper {$video-size}">
      <div class="featured-video">
        <div class="embed-container">
			<xsl:choose>
				<xsl:when test="contains($clean-url-video, 'autoplay=1')">	
					<!--<iframe id="video-1" style="display: inline;" width="560" height="315" src="{$clean-url-video}" frameborder="0" allowfullscreen="allowfullscreen"><xsl:comment> </xsl:comment></iframe>-->
					<style>
						iframe#<xsl:value-of select="$video-id"/> {display: inline;}
					</style>
					<!--<div id="player"></div>-->
					<div id="{$video-id}"></div>
					<!--<iframe id="{$video-id}" width="560" height="315" src="{$clean-url-video}{$youtube-jsapi}" frameborder="0" allowfullscreen="allowfullscreen"><xsl:comment> </xsl:comment></iframe>-->
					<script> 
						
						//https://developers.google.com/youtube/iframe_api_reference
						
						// 2. This code loads the IFrame Player API code asynchronously.
						var tag = document.createElement('script');
						tag.src = "https://www.youtube.com/player_api";
						var firstScriptTag = document.getElementsByTagName('script')[0];
						firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

						// 3. This function creates an iframe (and YouTube player)
						//    after the API code downloads.
						var player;
						function onYouTubePlayerAPIReady() {
							//player = new YT.Player('<xsl:value-of select="$video-id"/>', {playerVars: { 'autoplay': 1, }});
							player = new YT.Player('<xsl:value-of select="$video-id"/>', {
											  playerVars: {  'autoplay': 1, 'controls': 1, 'loop': 0, 'rel':0, 'showinfo':0, 'playlist':'<xsl:value-of select="$yt_url_id"/>'  },
											  videoId: '<xsl:value-of select="$yt_url_id"/>',
											  width: '560',
											  height: '315',
												events: {
												'onReady': onPlayerReady}
							});
						}
						
						// 4. The API will call this function when the video player is ready.
						function onPlayerReady(event) {
							//event.target.mute();
							//setTimeout(stopVideo, 1000);
							//event.target.playVideo();
						}
						
						
						/*
							var done = false;
						  function onPlayerStateChange(event) {
							if (event.data == YT.PlayerState.PLAYING ) {
									if(done == false){
									  setTimeout(stopVideo, 1000);
									  done = true;
									}
							}
						  }
						*/
						
						  function stopVideo() {
							player.unMute();
						  }

						</script>				
					  					  
				</xsl:when>
				 <xsl:otherwise>
					 <xsl:choose>
						<xsl:when test="contains(ou:textual-content(caption[2]/node()), 'popup')">
							<a href="{$clean-url-video}&amp;autoplay=1&amp;auto_play=true" title="{if(tbody/tr/td[1]/descendant::img/@alt) then tbody/tr/td[1]/descendant::img/@alt else $url-label}" data-fancybox="{$video-id}" data-gallerytype="simple" >
								<div class="thumb-image">
									<img src="{if(tbody/tr/td[1]/descendant::img) then tbody/tr/td[1]/descendant::img/@src else $yt_url_thumb}" alt="{if(tbody/tr/td[1]/descendant::img/@alt) then tbody/tr/td[1]/descendant::img/@alt else $url-label}" />
									<div class="play-button" aria-label="Play Video" title="Play Video"></div>
								</div>
							</a>
					 	</xsl:when>
				 		<xsl:otherwise>
							<a class="video-thumbnail" href="{$clean-url-video}&amp;autoplay=1&amp;auto_play=true">						
								<img src="{if(tbody/tr/td[1]/descendant::img) then tbody/tr/td[1]/descendant::img/@src else $yt_url_thumb}" alt="{if(tbody/tr/td[1]/descendant::img/@alt) then tbody/tr/td[1]/descendant::img/@alt else $url-label}" width="319" height="279" />
								<div class="play-button" aria-label="Play Video" title="Play Video"></div>
							</a>
					 	</xsl:otherwise>
					</xsl:choose>
					 <!--
					  <iframe id="{$video-id}" width="560" height="315" src="{$clean-url-video}" frameborder="0" allowfullscreen="allowfullscreen"><xsl:comment> </xsl:comment></iframe>
					  <xsl:apply-templates select="tbody/tr/td[1]/descendant::img"/>
					  <a href="{$clean-url-video}" class="play-button">Play Video</a>
					-->
				</xsl:otherwise>
			</xsl:choose>
        </div>                      
      </div>
    </div>
    <xsl:if test="not(contains(parent::node(), ouc:div[@label='maincontent']))">
      <xsl:text disable-output-escaping="yes">&lt;/section&gt;</xsl:text>
      <xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
    </xsl:if>
  </xsl:template>
  
  <!-- [Typical Page] Two Column Content (Right Image) -->
  <xsl:template match="table[@class='ou-two-column-content-right-image']">
    <xsl:if test="not(contains(parent::node(), ouc:div[@label='maincontent']))">
      <xsl:text disable-output-escaping="yes">&lt;section&gt;</xsl:text>
      <xsl:text disable-output-escaping="yes">&lt;div class="content-container"&gt;</xsl:text>
    </xsl:if>
    <div class="container">
	  <div class="row gutter-40">
      <div class="col-sm-11">
        <xsl:apply-templates select="tbody/tr/td[1]/node()"/>
      </div>
      <div class="col-sm-13">
        <figure class="photo">
          <xsl:apply-templates select="tbody/tr/td[2]/descendant::img"/>
          <xsl:if test="ou:textual-content(tbody/tr/td[3]) != ''">
            <figcaption>
              <xsl:apply-templates select="tbody/tr/td[3]/node()"/>
            </figcaption>
          </xsl:if>
        </figure>
      </div>
    </div>
	</div>
    <!-- .row -->
    <hr/>
    <xsl:if test="not(contains(parent::node(), ouc:div[@label='maincontent']))">
      <xsl:text disable-output-escaping="yes">&lt;/section&gt;</xsl:text>
      <xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
    </xsl:if>
  </xsl:template>
  
  <!-- [Typical Page] Vertical Buttons -->  
  <xsl:template match="table[@class='ou-vertical-buttons']">
    <xsl:if test="not(contains(parent::node(), ouc:div[@label='maincontent']))">
      <xsl:text disable-output-escaping="yes">&lt;section&gt;</xsl:text>
      <xsl:text disable-output-escaping="yes">&lt;div class="content-container"&gt;</xsl:text>
    </xsl:if>
    <div class="buttons">
      <xsl:apply-templates select="tbody/tr/td[1]/node()"/>
    </div>
    <xsl:if test="not(contains(parent::node(), ouc:div[@label='maincontent']))">
      <xsl:text disable-output-escaping="yes">&lt;/section&gt;</xsl:text>
      <xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
    </xsl:if>
  </xsl:template> 
  
  <!-- [Typical Page] Basic Table -->
  <xsl:template match="table[@class='ou-basic-table']">
    <xsl:if test="not(contains(parent::node(), ouc:div[@label='maincontent']))">
      <xsl:text disable-output-escaping="yes">&lt;section&gt;</xsl:text>
      <xsl:text disable-output-escaping="yes">&lt;div class="content-container"&gt;</xsl:text>
    </xsl:if>
    <div class="table-wrapper">
      <div class="table-container">
        <button class="scroll-right">scroll right</button>  
        <button class="scroll-left">scroll left</button>
        <table><xsl:apply-templates select="@*" /><!-- add any properties/attributes added by the user with a select@* -->
          <xsl:apply-templates select="./node()"/>
        </table>
      </div>
    </div>    
    <xsl:if test="not(contains(parent::node(), ouc:div[@label='maincontent']))">
      <xsl:text disable-output-escaping="yes">&lt;/section&gt;</xsl:text>
      <xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
    </xsl:if>
  </xsl:template>
  
 <!-- [Typical Page] Accordion -->
	<xsl:template match="table[@class='ou-typical-accordion']">
		<xsl:variable name="class" select="./@class"/><!--#58929 -->		
		<xsl:variable name="options-used" select="lower-case(ou:textual-content(caption[2]/node()))"/>	
		<xsl:variable name="extra-style" select="if(contains($options-used, 'bottomborder')) then 'simple' else ''"/>
		<xsl:if test="not(contains(parent::node(), ouc:div[@label='maincontent']))">
			<xsl:text disable-output-escaping="yes">&lt;section&gt;</xsl:text>
			<xsl:text disable-output-escaping="yes">&lt;div class="content-container"&gt;</xsl:text>
		</xsl:if>
		<div class="container-flex accordion-wrapper {$extra-style}">
			<xsl:if test="(contains($options-used, 'expandall') and (tbody/tr[2]/node()))"><!-- or not(thead/tr[2]/th[1]/node()) -->
				<div class="accordion-controls all-collapsed">
					<button class="open">Expand All</button>				
				</div>
			</xsl:if>
			<ul>
				<xsl:for-each select="tbody/tr">
					<li>
						<xsl:variable name="ref-name" select="ou:ref-name(td[1])"/><!--#58929 -->
						<xsl:variable name="get-prv-count"><!--#58929 -->
							<xsl:variable name="siblings" select="count(./preceding-sibling::tr[ou:ref-name(td[1]) = $ref-name])"/>
							<xsl:variable name="ancestors" select="sum(
																   for $i in ancestor::*[not(self::document)] 
																   return 
																   count($i/preceding-sibling::*/(self::*[contains(@class,'accordion') or contains(@class,'tabs')]|descendant::*[contains(@class,'accordion') or contains(@class,'tabs')])/tbody/tr[ou:ref-name(td[1]) = $ref-name]))"/>
							<xsl:value-of select="if(($siblings + $ancestors) gt 0) then concat('-', $siblings + $ancestors + 1) else ''"/>
						</xsl:variable>
						<xsl:variable name="ref-name" select="concat($ref-name, $get-prv-count)"/><!-- reset --><!--#58929 -->
						
						<xsl:if test="ou:textual-content(td[1]) != ''">
							<!-- Edited For Ticket #44413 O.F -->
							<xsl:variable name="anchor" select="td[1]//a/@id"/>
							<xsl:choose>
								<xsl:when test="$ref-name">
									<p class="accordion-title"><xsl:value-of select="td[1]/node()" /></p>
								</xsl:when>
								<xsl:otherwise>
									<p class="accordion-title"><xsl:value-of select="td[1]/node()" /></p>
								</xsl:otherwise>
							</xsl:choose>	
						</xsl:if>						
						<xsl:choose>
                          <xsl:when test="$ou:action = 'pub'">
                            <a class="toggle-accordion" aria-expanded="false" href="{$ref-name}"><span>Toggle More Info</span></a>   
                          </xsl:when>
                          <xsl:otherwise>
                            <a class="toggle-accordion" aria-expanded="false"><span>Toggle More Info</span></a>
                          </xsl:otherwise>
                        </xsl:choose>  
						<div id="{replace($ref-name, '#', '')}" class="more-info" aria-hidden="true">
							<xsl:apply-templates select="td[2]/node()"/>
							<xsl:if test="ou:textual-content(td[3]) != ''">
								<button class="accordion-top"><xsl:value-of select="td[3]/node()"/></button>
							</xsl:if>
							<xsl:if test="contains(lower-case(ou:textual-content(../../thead/tr[1]/th[1]/node())), 'backtotop')">
							<button class="accordion-top">Back to top</button>
							</xsl:if>
						</div>
					</li>
				</xsl:for-each>        
			</ul>
		</div><!-- .accordion-wrapper -->
		<xsl:if test="not(contains(parent::node(), ouc:div[@label='maincontent']))">
			<xsl:text disable-output-escaping="yes">&lt;/section&gt;</xsl:text>
			<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
		</xsl:if>
	</xsl:template> 
  
  <!-- [Typical Page] Events Calendar -->
  <xsl:template match="table[@class='ou-events-content']">
    <xsl:variable name="feed" select="tbody/tr/td[4]/descendant::a/@href"/>
    <xsl:variable name="items" select="'6'"/>		
    <section>
      <div class="content-container">
        <xsl:if test="ou:textual-content(tbody/tr/td[1])">
          <h2><xsl:value-of select="tbody/tr/td[1]/node()"/></h2>
        </xsl:if>
        <xsl:if test="ou:textual-content(tbody/tr/td[2])">
          <p class="h6"><xsl:value-of select="tbody/tr/td[2]/node()"/></p>
        </xsl:if>
        <div class="related-subjects">
          <button class="toggle-dropdown" aria-expanded="false"><xsl:value-of select="tbody/tr/td[3]/descendant::ul/li[1]/a/text()"/><span></span></button>
          <ul class="dropdown" aria-hidden="true">
            <xsl:for-each select="tbody/tr/td[3]/descendant::ul/li">
              <li><xsl:apply-templates /></li>
            </xsl:for-each>
            <li></li>
          </ul>
        </div>
      </div>
      <div class="event-grid row">              
        <xsl:choose>
          <xsl:when test="$ou:action = 'pub'">
            <xsl:text disable-output-escaping="yes">&lt;%</xsl:text>                                                                                                
              Response.Write(OUC.GetEvents.displayEventsContent("<xsl:value-of select="$feed"/>", "feed/entry", <xsl:value-of select="$items"/>));                
            <xsl:text disable-output-escaping="yes">%&gt;</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <div class="col-sm-12 col-lg-8 event">
              <a href="#" class="date-icon">
                <div>
                  <span class="month">Nov</span>
                  <span class="day">3</span>
                </div>
              </a>              
              <div class="time">Events Feed: <xsl:value-of select="$feed"/></div>
              <div class="location">Events Appear on Page Publish</div>
            </div>
          </xsl:otherwise>
        </xsl:choose></div>
    </section>
  </xsl:template>
  
  <!-- [Typical Page] Press Releases -->
  <xsl:template match="table[@class='ou-press-releases-listing']">
    <xsl:variable name="feed-source" select="lower-case(tbody/tr/td[2]/node())"/>
    <xsl:variable name="feed">
      <xsl:if test="$feed-source = 'external'"><xsl:value-of select="tbody/tr/td[3]/descendant::a/@href"/></xsl:if>
      <xsl:if test="$feed-source = 'omniupdate'"><xsl:value-of select="concat($domain-target,tbody/tr/td[3]/descendant::a/@href)"/></xsl:if>
    </xsl:variable>
    <xsl:variable name="items" select="'3'"/>			    
    <xsl:variable name="filters" select="if(ou:textual-content(tbody/tr/td[4]) = '') then 'All' else tbody/tr/td[4]/node()" />
    <xsl:variable name="news-config">		
      <categories>
        <category><xsl:value-of select="$filters"/></category>								
      </categories> 			
    </xsl:variable>  
    <section class="press-releases">
      <div class="content-container">
        <xsl:if test="ou:textual-content(tbody/tr/td[1])">
          <p class="h2"><xsl:value-of select="tbody/tr/td[1]/node()"/></p>  
        </xsl:if>
        <div class="news-list">
          <xsl:choose>
            <xsl:when test="$ou:action = 'pub'">
              <xsl:text disable-output-escaping="yes">&lt;%</xsl:text>
              <xsl:if test="$feed-source = 'omniupdate'">
                string filter = "<xsl:value-of select="$news-config/categories/category"/>";
                Response.Write(OUC.WnlDisplayMethods.displayNewsPrList("<xsl:value-of select="$feed"/>", "rss/channel/item", <xsl:value-of select="$items"/>, filter, 0));
              </xsl:if>
              <xsl:if test="$feed-source = 'external'">
                Response.Write(OUC.GetNews.displayNewsListPrList("<xsl:value-of select="$feed"/>", "rss/channel/item", <xsl:value-of select="$items"/>, 0));
              </xsl:if>
              <xsl:text disable-output-escaping="yes">%&gt;</xsl:text>
            </xsl:when>
            <xsl:otherwise>              
              <article class="row">
                <figure class="col-lg-8 col-sm-8">
                  <a href="#"><img src="{{f:15924742}}" alt="News image 1"/></a>
                </figure>
                <div class="col-lg-16 col-sm-16">
                  <h2 class="h4"><a href="#" class="title">RSS Feed: <xsl:value-of select="$feed"/></a></h2>
                  <time datetime="2016-10-21">Number of Items: <xsl:value-of select="$items"/></time>
                  <p class="news-events-listing-description">Feed Type: <xsl:value-of select="$feed-source"/> <br/>
                    Active Filter(s): <xsl:value-of select="$news-config/categories/category"/></p>
                </div>
              </article>                                  
            </xsl:otherwise>
          </xsl:choose>          
        </div>
      </div>
    </section>
  </xsl:template>
  
  <!-- [Typical Page] Department Banner -->
  <xsl:template match="table[@class='ou-faculty-banner']">
    <xsl:if test="ou:textual-content(tbody/tr/td[1]) != '' or ou:textual-content(tbody/tr/td[2]) != ''">
      <section>
        <div class="content-container">
          <xsl:if test="ou:textual-content(tbody/tr/td[1])"><p><xsl:value-of select="tbody/tr/td[1]/node()"/></p></xsl:if>
          <xsl:if test="ou:textual-content(tbody/tr/td[2])"><h2><xsl:value-of select="tbody/tr/td[2]/node()"/></h2></xsl:if>
        </div>
      </section>
    </xsl:if>
    <section>
      <div class="content-container">			           
        <div class="meet-fgcu-list-view row gutter-0">
          <xsl:choose>
            <xsl:when test="ou:textual-content(tbody/tr/td[3]) != ''">
              <xsl:variable name="snippet-tags" select="tokenize(tbody/tr/td[3], ',')"/>
              <xsl:variable name="story-data">
                <xsl:choose>
                  <xsl:when test="doc-available(concat($domain, $story-xml))">
                    <xsl:copy-of select="doc(concat($domain, $story-xml))"/>
                  </xsl:when>
                  <xsl:otherwise><xsl:if test="$ou:action!='pub'">System Message: Story Data Not Found 1</xsl:if></xsl:otherwise>
                </xsl:choose>	
              </xsl:variable>                        
              <xsl:choose>
                <xsl:when test="$ou:action = 'pub'">
                  <xsl:text disable-output-escaping="yes">&lt;%</xsl:text>                                                                                                
                    Response.Write(OUC.GetStories.displayBanner("<xsl:value-of select="concat($domain, $story-xml)"/>", "<xsl:value-of select="tbody/tr/td[3]/node()"/>"));                
                  <xsl:text disable-output-escaping="yes">%&gt;</xsl:text>                  
                </xsl:when>
                <xsl:otherwise>
                  <div class="portrait col-md-7 col-sm-10">                   
                  </div>
                  <div class="col-md-17 col-sm-14">
                    <p class="intro">Story to appear on publish&rdquo;</p>
                  </div>
                </xsl:otherwise>
              </xsl:choose>                           
            </xsl:when>
            <xsl:otherwise>
              <xsl:variable name="story-data">
                <xsl:choose>
                  <xsl:when test="doc-available(concat($domain, replace(tbody/tr/td[4]/descendant::a/@href, 'aspx', 'xml')))">
                    <xsl:copy-of select="doc(concat($domain, replace(tbody/tr/td[4]/descendant::a/@href, 'aspx', 'xml')))"/>
                  </xsl:when>
                  <xsl:otherwise><xsl:if test="$ou:action!='pub'">System Message: Story Data Not Found 1</xsl:if></xsl:otherwise>
                </xsl:choose>	
              </xsl:variable>                  
              <div class="portrait col-md-7 col-sm-10">
                <img src="{$story-data/story-content/image/img/@src}" alt="{$story-data/story-content/image/img/@alt}"/>
              </div>
              <div class="col-md-17 col-sm-14">
                <p class="intro"><xsl:value-of select="$story-data/story-content/quote"/>&rdquo;</p>
                <p class="author"><xsl:value-of select="concat($story-data/story-content/prefix, ' ', $story-data/story-content/firstname, ' ', $story-data/story-content/lastname, ' ', $story-data/story-content/suffix)"/></p>
                <p class="author-field-of-study"><xsl:value-of select="$story-data/story-content/title"/></p>
              </div>                           
            </xsl:otherwise>
          </xsl:choose>          
        </div>
      </div>
    </section>		
  </xsl:template>
  
  <!-- [Typical Page] Department Banner User Entry -->
  <xsl:template match="table[@class='ou-faculty-banner-manual']">
	 <section>
		  <div class="container-flex">			   <!-- content-container -->
			<div class="meet-fgcu-list-view row gutter-0">          
			  <div class="portrait col-md-7 col-sm-10">
				<img src="{tbody/tr/td[1]/descendant::img/@src}" alt="{tbody/tr/td[1]/descendant::img/@alt}"/>
			  </div>
			  <div class="col-md-17 col-sm-14">
				<p class="intro"><xsl:value-of select="tbody/tr/td[2]/node()"/>&rdquo;</p>
				<p class="author"><xsl:value-of select="tbody/tr/td[3]/node()"/></p>
				<p class="author-field-of-study"><xsl:value-of select="tbody/tr/td[4]/node()"/></p>
				<xsl:if test="tbody/tr/td[5]/descendant::a"><p><a class="button outline small red"><xsl:apply-templates select="tbody/tr/td[5]/descendant::a/@*[name()!='class']" /><xsl:value-of select="ou:textual-content(tbody/tr/td[5]/node())"/></a></p></xsl:if>
			  </div>                                              
			</div>
		  </div>
		</section>			
  </xsl:template>  
  
  <!-- [Typical Page] Three Up -->
  <xsl:template match="table[@class='ou-typical-three-up']">
    <section class="three-up">
      <xsl:if test="ou:textual-content(tbody/tr[1]/td[1]) != ''">
        <div class="content-container">
          <hr/>
          <h2><xsl:value-of select="tbody/tr[1]/td[1]/node()"/></h2>
        </div>
      </xsl:if>
      <div class="container">
        <div class="slide-wrapper">
          <div class="news-slider-2 slider medium-scroll">
            <xsl:for-each select="tbody/tr[position() gt 1]">
              <div class="article-wrapper">             
                <article class="news-tile">
                  <figure>
                    <a href="{if(td[2]/descendant::a) then td[2]/descendant::a/@href else '#'}" target="{td[2]/descendant::a/@target}">
                      <xsl:apply-templates select="td[1]/descendant::img"/>
                    </a>
                  </figure>
                  <div class="icon"><a href="{if(td[2]/descendant::a) then td[2]/descendant::a/@href else '#'}" target="{td[2]/descendant::a/@target}">View Article</a></div>
                  <xsl:if test="ou:textual-content(td[3]) != ''">
                    <h2><a href="{if(td[2]/descendant::a) then td[2]/descendant::a/@href else '#'}" target="{td[2]/descendant::a/@target}"><xsl:value-of select="td[3]/node()"/></a></h2>
                  </xsl:if>
                  <xsl:if test="ou:textual-content(td[4]) != ''">
                    <time datetime="{ou:numerical-date(ou:textual-content(td[4]/node()))}"><xsl:value-of select="td[4]/node()"/></time>
                  </xsl:if>
                  <xsl:if test="ou:textual-content(td[5]) != ''">
                    <p class="description"><xsl:value-of select="td[5]/node()"/></p>
                  </xsl:if>
                </article> 
              </div>
            </xsl:for-each>                       
          </div>
        </div><!-- .slide-wrapper -->  
      </div><!-- .container -->
    </section>		
  </xsl:template>
  
  <!-- [Typical Page] Two Up 'Blue' or 'White' -->
  <xsl:template match="table[@class='ou-typical-two-up']">
    <xsl:if test="ou:textual-content(tbody/tr[1]/td[1]) != ''">
      <div class="content-container">        
        <h2><xsl:value-of select="tbody/tr[1]/td[1]/node()"/></h2>
      </div>
    </xsl:if>
    <section class="two-up">
      <xsl:if test="ou:textual-content(tbody/tr[1]/td[2]) != '' or contains(lower-case(tbody/tr[1]/td[2]/node()),'blue')"><xsl:attribute name="class">two-up blue</xsl:attribute></xsl:if>      
      <div class="container row">
        <div class="col-md-12"><xsl:if test="ou:textual-content(tbody/tr[2]/td[3]) != ''"><xsl:attribute name="class">col-md-7</xsl:attribute></xsl:if>      
          <xsl:apply-templates select="tbody/tr[2]/td[1]/node()"/>          
        </div>
        <div class="col-md-12"><xsl:if test="ou:textual-content(tbody/tr[2]/td[3]) != ''"><xsl:attribute name="class">col-md-7 col-md-offset-1</xsl:attribute></xsl:if> 
          <xsl:apply-templates select="tbody/tr[2]/td[2]/node()"/>
        </div>
		 <!-- fgcuteam-mike add a hidden third column option  -->
		<xsl:if test="ou:textual-content(tbody/tr[2]/td[3]) != ''">
		  <div class="col-md-7 col-md-offset-1">
          	<xsl:apply-templates select="tbody/tr[2]/td[3]/node()"/>
          </div>
		</xsl:if> 
      </div>
    </section>		
  </xsl:template>
  
  <!-- [Typical Page] Two Up Images -->
  <xsl:template match="table[@class='ou-typical-two-up-images']">    
    <section class="two-up-images">
      <xsl:if test="ou:textual-content(tbody/tr[1]/td[1]) != '' or contains(lower-case(tbody/tr[1]/td[1]/node()),'blue')"><xsl:attribute name="class">two-up-images blue</xsl:attribute></xsl:if>
      <div class="container row">
        <xsl:for-each select="tbody/tr[position() gt 1]">
          <div class="article-wrapper col-sm-12">
            <article class="news-tile">
				<xsl:if test="td[1]/descendant::img">
				  <figure>
					<a href="{if(td[2]/descendant::a) then td[2]/descendant::a/@href else '#'}">
					  <xsl:apply-templates select="td[1]/descendant::img"/>
					</a>
				  </figure>
				</xsl:if>
              <div class="icon"><a href="{if(td[2]/descendant::a) then td[2]/descendant::a/@href else '#'}">View Article</a></div>
              <xsl:if test="ou:textual-content(td[3]) != ''">
                <h2><a href="{if(td[2]/descendant::a) then td[2]/descendant::a/@href else '#'}"><xsl:value-of select="td[3]/node()"/></a></h2>
              </xsl:if>
              <xsl:if test="ou:textual-content(td[4]) != ''">
                <p class="description"><xsl:value-of select="td[4]/node()"/></p>
              </xsl:if>
            </article>
          </div>
        </xsl:for-each>       
      </div>              
    </section>
  </xsl:template>
  
  <!-- [Typical Page] Featured Video Alt -->
  <xsl:template match="table[@class='ou-typical-featured-video']">
	  <!-- fgcuteam-mike convert youtube link to site safe link -->
	<xsl:variable name="clean-url" select="replace(replace(replace(replace(replace(tbody/tr/td[2]/descendant::a/@href, 'controls=(\d)', ''), 'rel=(\d)', ''), 'showinfo=(\d)', ''), 'watch\?v=', 'embed/'), 'youtu\.be/', 'www.youtube.com/embed/') " />	
	  <xsl:variable name="clean-url2" select="if(contains($clean-url, '?')) then concat($clean-url, '&amp;rel=0&amp;controls=1&amp;showinfo=0') else concat($clean-url, '?rel=0&amp;controls=1&amp;showinfo=0')" />  
	  <xsl:variable name="clean-url3" select="replace(replace($clean-url2,'&amp;t=(\d)', '&amp;start=$1'),'\?t=(\d)', '?start=$1')"/>
	  <xsl:variable name="clean-url-video" select="$clean-url3"/>
	<!--<xsl:variable name="clean-url-video" select="if(contains($clean-url, '?')) then concat($clean-url, '&amp;rel=0&amp;controls=1&amp;showinfo=0') else concat($clean-url, '?rel=0&amp;controls=1&amp;showinfo=0')" />-->
    <div class="content-container">
      <xsl:if test="ou:textual-content(tbody/tr/td[1]) != ''"><h2><xsl:value-of select="tbody/tr/td[1]/node()"/></h2></xsl:if>
      <div class="featured-video-wrapper">
        <div class="featured-video">
          <div class="embed-container">
            <iframe id="video-{$clean-url}" title="video-{$clean-url}" width="560" height="315" src="{$clean-url-video}" frameborder="0" allowfullscreen="allowfullscreen"></iframe>
            <xsl:apply-templates select="tbody/tr/td[3]/descendant::img"/>
            <a href="{$clean-url-video}" aria-label="Play Video {tbody/tr/td[3]/descendant::img/@alt}" title="Play Video" class="play-button"></a>  
          </div>                      
        </div>
        <xsl:if test="ou:textual-content(tbody/tr/td[4]) != ''"><p><xsl:value-of select="tbody/tr/td[4]/node()"/></p></xsl:if>
      </div>
    </div>
  </xsl:template>
  
  <!-- [Typical Page] Featured Image -->
  <xsl:template match="table[@class='ou-featured-image']">    
    <xsl:if test="tbody/tr/td[1]/descendant::img">
      <div class="content-container">
        <div class="featured-image">
          <xsl:apply-templates select="tbody/tr/td[1]/descendant::img"/>
          <xsl:if test="ou:textual-content(tbody/tr/td[2]) != ''">
            <p class="featured-caption">
              <xsl:apply-templates select="tbody/tr/td[2]/node()"/>
            </p>
          </xsl:if>
        </div>
      </div>
    </xsl:if>
  </xsl:template>

  <!-- anchors in featured image snippet -->
  <xsl:template match="table[@class='ou-featured-image']/tbody/tr/td[2]/descendant::a">
    <a>
      <xsl:apply-templates select="attribute()[not(name() = 'class')]"/>
      <xsl:value-of select="text()"/>
    </a>
  </xsl:template>
  
  <!--
    Undegraduate Snippets
  -->
  
  <!-- [Undergraduate Admissions] Image Grid -->
  <xsl:template match="table[@class='ou-image-grid']">
	<xsl:variable name="cols" select="round(24 div round((count(tbody/tr)-1) div 2) )"/>
    <section class="grid-four">
      <xsl:if test="ou:textual-content(tbody/tr[1]/td[2]) != ''">
        <div class="content-container">
          <p class="intro-text"><xsl:value-of select="tbody/tr[1]/td[2]/node()" /></p>
        </div>
      </xsl:if>
      <div class="grid row" style="background-image: url({tbody/tr[1]/td[1]/descendant::img/@src});">
        <xsl:for-each select="tbody/tr[position() gt 1]">
          <div class="col-sm-12 col-md-{$cols} match-grid xxx">
			<xsl:if test="ou:textual-content(td[2]) != ''">
			<a href="{td[2]/descendant::a/@href}">
            <div class="inner-wrapepr">
				<p><xsl:apply-templates select="ou:textual-content(td[2]/node())"/></p>
              <div class="overlay" style="background-image: url({td[1]/descendant::img/@src});"></div>
            </div>
			</a> 
			</xsl:if>
          </div>
        </xsl:for-each>
      </div>
    </section>
  </xsl:template>
  
  <!-- [Undergraduate Admissions] CTA Block: (Content) Accordion + Images -->
  <xsl:template match="table[@class='ou-cta-block-content-images']">
    <section class="accordion-info parallax" data-z-index="auto" data-parallax="scroll" data-image-src="{tbody/tr/td[4]/descendant::img/@src}" data-speed="0.7">
      <div class="content-container">
        <xsl:if test="ou:textual-content(tbody/tr/td[1]) != ''"><h2><xsl:value-of select="tbody/tr/td[1]/node()"/></h2></xsl:if>
        <xsl:if test="ou:textual-content(tbody/tr/td[2]) != ''"><p class="intro-text"><xsl:value-of select="tbody/tr/td[2]/node()"/></p></xsl:if>
        <xsl:apply-templates select="tbody/tr/td[3]/descendant::a"/>
      </div>
      <div class="container row">
        <xsl:if test="not(tbody/tr/td[6]/descendant::table)">          
          <xsl:text disable-output-escaping="yes">&lt;div class="col-md-11"&gt;</xsl:text>
        </xsl:if>
        <xsl:apply-templates select="tbody/tr/td[6]/node()"/>
        <xsl:if test="not(tbody/tr/td[6]/descendant::table)">          
          <xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
        </xsl:if>
        <div class="col-md-13">
          <xsl:apply-templates select="tbody/tr/td[5]/descendant::img"/>
        </div>
      </div>
    </section>
  </xsl:template>
  
  <!-- [Undergraduate Admissions] CTA Block: Accordion -->
  <xsl:template match="table[@class='ou-cta-accordion']">
	  <xsl:variable name="class" select="./@class"/><!--#58929 -->
    <div class="col-md-11 accordion-wrapper">
      <ul>
        <xsl:for-each select="tbody/tr">
          <li>
			  <xsl:variable name="ref-name" select="ou:ref-name(td[1])"/><!--#58929 -->
			  <xsl:variable name="get-prv-count"><!--#58929 -->
				  <xsl:variable name="siblings" select="count(./preceding-sibling::tr[ou:ref-name(td[1]) = $ref-name])"/>
				  <xsl:variable name="ancestors" select="sum(
														 for $i in ancestor::*[not(self::document)] 
														 return 
														 count($i/preceding-sibling::*/(self::*[contains(@class,'accordion') or contains(@class,'tabs')]|descendant::*[contains(@class,'accordion') or contains(@class,'tabs')])/tbody/tr[ou:ref-name(td[1]) = $ref-name]))"/>
				  <xsl:value-of select="if(($siblings + $ancestors) gt 0) then concat('-', $siblings + $ancestors + 1) else ''"/>
			  </xsl:variable>
			  <xsl:variable name="ref-name" select="concat($ref-name, $get-prv-count)"/><!-- reset --><!--#58929 -->			
            <xsl:if test="ou:textual-content(td[1]) != ''"><p class="accordion-title"><xsl:value-of select="td[1]/node()"/></p></xsl:if>
			  <xsl:choose>
				  <xsl:when test="$ou:action = 'pub'">					  
					  <a class="toggle-accordion-list" aria-expanded="false" href="{$ref-name}"><span>Toggle More Info</span></a>   
				  </xsl:when>
				  <xsl:otherwise>
					  <a class="toggle-accordion-list" aria-expanded="false"><span>Toggle More Info</span></a>
				  </xsl:otherwise>
			  </xsl:choose>  			              
            <div id="{replace($ref-name, '#', '')}" class="more-info" aria-hidden="true">
              <xsl:apply-templates select="td[2]/node()"/>
            </div>
          </li>  
        </xsl:for-each>
      </ul>
    </div><!-- .accordion-wrapper -->
  </xsl:template>
	
  <!-- fgcuteam-mike Simple Accordion -->
  <xsl:template match="table[@class='ou-simple-accordion']">
	  <xsl:variable name="class" select="./@class"/><!--#58929 -->
    <div class="container-flex accordion-wrapper simple">
      <ul>
        <xsl:for-each select="tbody/tr">
          <li>
			  <xsl:variable name="ref-name" select="ou:ref-name(td[1])"/><!--#58929 -->
			  <xsl:variable name="get-prv-count"><!--#58929 -->
				  <xsl:variable name="siblings" select="count(./preceding-sibling::tr[ou:ref-name(td[1]) = $ref-name])"/>
				  <xsl:variable name="ancestors" select="sum(
														 for $i in ancestor::*[not(self::document)] 
														 return 
														 count($i/preceding-sibling::*/(self::*[contains(@class,'accordion') or contains(@class,'tabs')]|descendant::*[contains(@class,'accordion') or contains(@class,'tabs')])/tbody/tr[ou:ref-name(td[1]) = $ref-name]))"/>
				  <xsl:value-of select="if(($siblings + $ancestors) gt 0) then concat('-', $siblings + $ancestors + 1) else ''"/>
			  </xsl:variable>
			  <xsl:variable name="ref-name" select="concat($ref-name, $get-prv-count)"/><!-- reset --><!--#58929 -->			  
            <xsl:if test="ou:textual-content(td[1]) != ''"><p class="accordion-title"><xsl:value-of select="td[1]/node()"/></p></xsl:if>			              
			  <xsl:choose>
				  <xsl:when test="$ou:action = 'pub'">							  
					  <a class="toggle-accordion-list" aria-expanded="false" href="{$ref-name}"><span>Toggle More Info</span></a>   
				  </xsl:when>
				  <xsl:otherwise>
					  <a class="toggle-accordion-list" aria-expanded="false"><span>Toggle More Info</span></a>
				  </xsl:otherwise>
			  </xsl:choose>			  
            <div id="{replace($ref-name, '#', '')}" class="more-info" aria-hidden="true">
              <xsl:apply-templates select="td[2]/node()"/>
            </div>
          </li>  
        </xsl:for-each>
      </ul>
    </div><!-- .accordion-wrapper -->
  </xsl:template>
	
  <!-- fgcuteam-mike Plain Accordion -->
  <xsl:template match="table[@class='ou-plain-accordion']">
	  <xsl:variable name="class" select="./@class"/><!--#58929 -->
    <div class="container-flex accordion-wrapper simple plain {ou:textual-content(caption[2])}">
      <ul>
        <xsl:for-each select="tbody/tr">
          <li>
			  <xsl:variable name="ref-name" select="ou:ref-name(td[1])"/><!--#58929 -->
			  <xsl:variable name="get-prv-count"><!--#58929 -->
				  <xsl:variable name="siblings" select="count(./preceding-sibling::tr[ou:ref-name(td[1]) = $ref-name])"/>
				  <xsl:variable name="ancestors" select="sum(
														 for $i in ancestor::*[not(self::document)] 
														 return 
														 count($i/preceding-sibling::*/(self::*[contains(@class,'accordion') or contains(@class,'tabs')]|descendant::*[contains(@class,'accordion') or contains(@class,'tabs')])/tbody/tr[ou:ref-name(td[1]) = $ref-name]))"/>
				  <xsl:value-of select="if(($siblings + $ancestors) gt 0) then concat('-', $siblings + $ancestors + 1) else ''"/>
			  </xsl:variable>
			  <xsl:variable name="ref-name" select="concat($ref-name, $get-prv-count)"/><!-- reset --><!--#58929 -->				  
            <xsl:if test="ou:textual-content(td[1]) != ''"><p class="accordion-title"><xsl:value-of select="td[1]/node()"/></p></xsl:if>            
			  <xsl:choose>
				  <xsl:when test="$ou:action = 'pub'">
					  <a class="toggle-accordion-list" aria-expanded="false" href="{$ref-name}"><span>Toggle More Info</span></a>   
				  </xsl:when>
				  <xsl:otherwise>
					  <a class="toggle-accordion-list" aria-expanded="false"><span>Toggle More Info</span></a>
				  </xsl:otherwise>
			  </xsl:choose>				  
            <div id="{replace($ref-name, '#', '')}" class="more-info" aria-hidden="true">
              <xsl:apply-templates select="td[2]/node()"/>
            </div>
          </li>  
        </xsl:for-each>
      </ul>
    </div><!-- .accordion-wrapper -->
  </xsl:template>
	
	<!-- fgcuteam-mike Modal Popup -->	 
   <xsl:template match="table[@class='ou-modal-popup']">
	  <xsl:variable name="modal-id" select="generate-id(.)"/>
	  <xsl:variable name="modal-href" select="if(ou:textual-content(tbody/tr/td[4]) = 'link') then tbody/tr/td[3]/descendant::a/@href else '#'" />
	  
	  <!--  Set data-remote="false" to disable o disable the deprecated Bootstrap load function and use JS show.bs.modal instead -->
	  <xsl:if test="tbody/tr/td[3]/descendant::img">
	  <p style="text-align: center;">
	  <a data-remote="false" data-toggle="modal" data-target="#modal-id-{$modal-id}" href="{$modal-href}" style="display: contents;">
	  <img style="{tbody/tr/td[3]/descendant::img/@style}" src="{tbody/tr/td[3]/descendant::img/@src}" alt="{tbody/tr/td[3]/descendant::img/@alt}" width="{tbody/tr/td[3]/descendant::img/@width}" height="{tbody/tr/td[3]/descendant::img/@height}"/>
	  </a>
	  </p>
	  </xsl:if>
	  <p style="{tbody/tr/td[3]/@style}"><a data-remote="false" data-toggle="modal" data-target="#modal-id-{$modal-id}" href="{$modal-href}" class="{tbody/tr/td[3]/descendant::a/@class}" style="{tbody/tr/td[3]/descendant::a/@style}"><xsl:apply-templates select="ou:textual-content(tbody/tr/td[3])"/></a></p>
	  	  
	  <div class="modal" id="modal-id-{$modal-id}" role="dialog" aria-hidden="true" style="display: none;" tabindex="-1">
		  <div class="modal-dialog">
			  <div class="modal-content">
				  <div class="modal-header">
					  <button type="button" class="close" data-dismiss="modal">×</button>
					  <p class="modal-title h4"><xsl:apply-templates select="tbody/tr/td[1]/node()"/></p>
				  </div>
				  <div class="modal-body">
					  <xsl:apply-templates select="tbody/tr/td[2]/node()"/>
				  </div>
				  <div class="modal-footer">
					  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				  </div>
			  </div>
		  </div>
	  </div>
  </xsl:template>
	
	<!-- fgcuteam-mike Added to intercept all links that have #popanchor in their value to generate the appropiate Modal Popup Decoupled code 
	 For some cases this needs double transformation. Double transformation applied in post-process template at: /_resources/xsl/student-life.xsl
	NOTE: Not used anymore due to some issues with <aspx> conversion in assets code
	-->
	<xsl:template match="a[@href[contains(.,'popanchor')]]">
		<a data-remote="false" data-toggle="modal" data-target="#modal-id-{replace(@href, '#', '')}" href="#" class="{@class}"><!--  <xsl:apply-templates select="@*" />add any properties/attributes added by the user with a select@* -->
		<xsl:apply-templates select="node()"/></a>		
	</xsl:template>
	
	<!-- fgcuteam-mike Modal Popup Decoupled-->	 
   <xsl:template match="table[@class='ou-modal-popup-decoupled']">
	  <!--<xsl:variable name="modal-id" select="tbody/tr/td[1]/descendant::a/@id"/>-->
	  <xsl:variable name="modal-id" select="ou:textual-content(tbody/tr/td[1]/node())"/>
	  <xsl:for-each select="tbody/tr">
		  <div class="modal" id="modal-id-{ou:textual-content(td[1]/node())}" role="dialog" aria-hidden="true" style="display: none;" tabindex="-1">
			  <div class="modal-dialog">
				  <div class="modal-content">
					  <div class="modal-header">
						  <button type="button" class="close" data-dismiss="modal">×</button>
						  <p class="modal-title h4"><xsl:apply-templates select="td[2]/node()"/></p>
					  </div>
					  <div class="modal-body">
						  <xsl:apply-templates select="td[3]/node()"/>
					  </div>
					  <div class="modal-footer">
						  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					  </div>
				  </div>
			  </div>
		  </div>
	  </xsl:for-each>
  </xsl:template>
	
	<!-- fgcuteam-mike Modal Popup Decoupled Source Code-->	 
   <xsl:template match="table[@class='ou-modal-popup-decoupled-sourcecode']">
	  <!--<xsl:variable name="modal-id" select="tbody/tr/td[1]/descendant::a/@id"/>-->
	  <xsl:variable name="modal-id" select="ou:textual-content(tbody/tr/td[1]/node())"/>
	  <xsl:for-each select="tbody/tr">
		  <div class="modal" id="modal-id-{ou:textual-content(td[1]/node())}" role="dialog" aria-hidden="true" style="display: none;" tabindex="-1">
			  <div class="modal-dialog">
				  <div class="modal-content">
					  <div class="modal-header">
						  <button type="button" class="close" data-dismiss="modal">×</button>
						  <p class="modal-title h4"><xsl:apply-templates select="td[2]/node()"/></p>
					  </div>
					  <div class="modal-body">
						  <xsl:apply-templates select="td[3]/node()"/>
					  </div>
					  <div class="modal-footer">
						  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					  </div>
				  </div>
			  </div>
		  </div>
	  </xsl:for-each>
  </xsl:template>
	
  <!-- fgcuteam-mike Modal Popup Decoupled Button -->
  <xsl:template match="table[@class='ou-modal-popup-decoupled-button']">
	  <xsl:variable name="modal-id" select="tbody/tr/td[2]"/>
	  <xsl:variable name="rows" select="count(tbody/tr)"/>
	  	<xsl:if test="($rows lt 2)">
	  <xsl:if test="ou:textual-content(caption[2]/node()) = ''"><p style="{tbody/tr/td[1]/p/@style}"><a data-remote="false" data-toggle="modal" data-target="#modal-id-{$modal-id}" href="#" class="{tbody/tr/td[1]/descendant::a/@class}" style="{tbody/tr/td[1]/descendant::a/@style}"><xsl:apply-templates select="ou:textual-content(tbody/tr/td[1])"/></a></p>
	  </xsl:if>
			<xsl:if test="ou:textual-content(caption[2]/node()) != ''"><a data-remote="false" data-toggle="modal" data-target="#modal-id-{$modal-id}" href="#" class="{tbody/tr/td[1]/descendant::a/@class}" style="{tbody/tr/td[1]/descendant::a/@style}"><xsl:apply-templates select="ou:textual-content(tbody/tr/td[1])"/></a>
	  </xsl:if>
	  </xsl:if>
	  <xsl:if test="($rows gt 1)">
	  <xsl:for-each select="tbody/tr">
	  <xsl:if test="not(contains(lower-case(td[2]/node()),'link'))">
	  <xsl:variable name="modal-id-each" select="td[2]"/>
	  <span style="{td[1]/p/@style}"><a data-remote="false" data-toggle="modal" data-target="#modal-id-{$modal-id-each}" href="#" class="{td[1]/descendant::a/@class}" style="{td[1]/descendant::a/@style}"><xsl:apply-templates select="ou:textual-content(td[1])"/></a></span>
	  </xsl:if>
	  <xsl:if test="contains(lower-case(td[2]/node()),'link')">
	  <span style="{td[1]/p/@style}"><a href="{td[1]/descendant::a/@href}" class="{td[1]/descendant::a/@class}" style="{td[1]/descendant::a/@style}"><xsl:apply-templates select="ou:textual-content(td[1])"/></a></span>
	  </xsl:if>
	  </xsl:for-each>
	  </xsl:if>
  </xsl:template>	
	
	<!-- fgcuteam-mike Splash Screen Modal -->	 
   <xsl:template match="table[@class='ou-splash-screen-modal']">
	  <xsl:variable name="modal-id" select="generate-id(.)"/>
	  <xsl:variable name="modal-cookiename" select="ou:textual-content(tbody/tr/td[3]/node())" />	   	  
	  	  
	  <div class="modal fade autodisplay" id="modal-id-{$modal-id}" role="dialog" data-cookiename="{$modal-cookiename}" tabindex="-1">
		  <div class="modal-dialog splash {ou:textual-content(caption[2]/node())}">
			  <div class="modal-content">
				  <div class="modal-header">
					  <button type="button" class="close" data-dismiss="modal">×</button>
					  <p class="modal-title h4"><xsl:apply-templates select="tbody/tr/td[1]/node()"/></p>
				  </div>
				  <div class="modal-body">
					  <xsl:apply-templates select="tbody/tr/td[2]/node()"/>
				  </div>
				  <div class="modal-footer">
					  <button type="button" class="button solid white flat" data-dismiss="modal" data-prevent="true">Don't Show again</button>
					  <button type="button" class="button solid blue flat" data-dismiss="modal">Close</button>
				  </div>
			  </div>
		  </div>
	  </div>
  </xsl:template>	
		
	
  <!-- fgcuteam-mike Navigation Tabs -->
  <xsl:template match="table[@class='ou-navigation-tabs']">
	<div class="container-flex">
	<ul class="nav nav-tabs">
		<xsl:for-each select="tbody/tr">
			<xsl:variable name="ref-name"> 
				  <xsl:choose>
					  <xsl:when test="td[1]/descendant::a"><xsl:value-of select="concat('#', replace( (td[1]/descendant::a/@href, td[1]/descendant::a/@id)[1], '#', ''))"/></xsl:when>
					  <xsl:otherwise><xsl:value-of select="concat('#', replace(ou:textual-content(td[1]),'[^a-zA-Z0-9]',''))"/></xsl:otherwise>
				  </xsl:choose>
			</xsl:variable>	
		<li class="{ou:textual-content(td[2])}"><a data-toggle="tab" href="{$ref-name}"><xsl:value-of select="ou:textual-content(td[1])"/></a></li>		
		</xsl:for-each>
	</ul>	  
	  
    <div class="tab-content">      
        <xsl:for-each select="tbody/tr">
			<xsl:variable name="ref-name2"> 
				  <xsl:choose>
					  <xsl:when test="td[1]/descendant::a"><xsl:value-of select="translate( (td[1]/descendant::a/@href, td[1]/descendant::a/@id)[1], '#', '')"/></xsl:when>
					  <xsl:otherwise><xsl:value-of select="replace(ou:textual-content(td[1]),'[^a-zA-Z0-9]','')"/></xsl:otherwise>
				  </xsl:choose>
			  </xsl:variable>	
			  <xsl:variable name="class-active"> 
				  <xsl:choose>
					  <xsl:when test="ou:textual-content(td[2]) != ''">
						  <xsl:value-of select="' in active'"/>
					  </xsl:when>
					  <xsl:otherwise>
						  <xsl:value-of select="''"/>
					  </xsl:otherwise>
				  </xsl:choose>
			  </xsl:variable>						
		  <!-- remove any whitespaces:   translate(content,' ','') -->
          <div id="{$ref-name2}" class="tab-pane fade{$class-active}">            
			<xsl:apply-templates select="td[3]/node()"/>
          </div>
			
        </xsl:for-each>      
    </div>
	</div>
  </xsl:template>
	
   <!-- fgcuteam-mike Navigation Tabs Vertical -->
  <xsl:template match="table[@class='ou-navigation-tabs-vertical']">
	<div class="container-flex row">
	
	<ul class="nav nav-tabs nav-tabs-vertical col-md-6">
		<xsl:for-each select="tbody/tr">
			<xsl:variable name="ref-name"> 
				  <xsl:choose>
					  <xsl:when test="td[1]/descendant::a"><xsl:value-of select="concat('#', replace( (td[1]/descendant::a/@href, td[1]/descendant::a/@id)[1], '#', ''))"/></xsl:when>
					  <xsl:otherwise><xsl:value-of select="concat('#', replace(ou:textual-content(td[1]),'[^a-zA-Z0-9]',''))"/></xsl:otherwise>
				  </xsl:choose>
			</xsl:variable>	
		<li class="{ou:textual-content(td[2])}"><a data-toggle="tab" href="{$ref-name}"><xsl:value-of select="ou:textual-content(td[1])"/></a></li>		
		</xsl:for-each>
	</ul>
	
	  
    <div class="col-md-18 tab-content tab-content-vertical">      
        <xsl:for-each select="tbody/tr">
			<xsl:variable name="ref-name2"> 
				  <xsl:choose>
					  <xsl:when test="td[1]/descendant::a"><xsl:value-of select="translate( (td[1]/descendant::a/@href, td[1]/descendant::a/@id)[1], '#', '')"/></xsl:when>
					  <xsl:otherwise><xsl:value-of select="replace(ou:textual-content(td[1]),'[^a-zA-Z0-9]','')"/></xsl:otherwise>
				  </xsl:choose>
			  </xsl:variable>	
			  <xsl:variable name="class-active"> 
				  <xsl:choose>
					  <xsl:when test="ou:textual-content(td[2]) != ''">
						  <xsl:value-of select="' in active'"/>
					  </xsl:when>
					  <xsl:otherwise>
						  <xsl:value-of select="''"/>
					  </xsl:otherwise>
				  </xsl:choose>
			  </xsl:variable>						
		  <!-- remove any whitespaces:   translate(content,' ','') -->
          <div id="{$ref-name2}" class="tab-pane fade{$class-active}">            
			<xsl:apply-templates select="td[3]/node()"/>
          </div>
			
        </xsl:for-each>      
    </div>
	</div>
  </xsl:template>
	
	  <xsl:template match="table[@class='ou-navigation-tabs-vertical-full']">
	<div>
	
	<ul class="nav nav-tabs nav-tabs-vertical col-md-4">
		<xsl:for-each select="tbody/tr">
			<xsl:variable name="ref-name"> 
				  <xsl:choose>
					  <xsl:when test="td[1]/descendant::a"><xsl:value-of select="concat('#', replace( (td[1]/descendant::a/@href, td[1]/descendant::a/@id)[1], '#', ''))"/></xsl:when>
					  <xsl:otherwise><xsl:value-of select="concat('#', replace(ou:textual-content(td[1]),'[^a-zA-Z0-9]',''))"/></xsl:otherwise>
				  </xsl:choose>
			</xsl:variable>	
		<li class="{ou:textual-content(td[2])}"><a data-toggle="tab" href="{$ref-name}"><xsl:value-of select="ou:textual-content(td[1])"/></a></li>		
		</xsl:for-each>
	</ul>
	
	  
    <div class="col-md-18 tab-content tab-content-vertical">      
        <xsl:for-each select="tbody/tr">
			<xsl:variable name="ref-name2"> 
				  <xsl:choose>
					  <xsl:when test="td[1]/descendant::a"><xsl:value-of select="translate( (td[1]/descendant::a/@href, td[1]/descendant::a/@id)[1], '#', '')"/></xsl:when>
					  <xsl:otherwise><xsl:value-of select="replace(ou:textual-content(td[1]),'[^a-zA-Z0-9]','')"/></xsl:otherwise>
				  </xsl:choose>
			  </xsl:variable>	
			  <xsl:variable name="class-active"> 
				  <xsl:choose>
					  <xsl:when test="ou:textual-content(td[2]) != ''">
						  <xsl:value-of select="' in active'"/>
					  </xsl:when>
					  <xsl:otherwise>
						  <xsl:value-of select="''"/>
					  </xsl:otherwise>
				  </xsl:choose>
			  </xsl:variable>						
		  <!-- remove any whitespaces:   translate(content,' ','') -->
          <div id="{$ref-name2}" class="tab-pane fade{$class-active}">            
			<xsl:apply-templates select="td[3]/node()"/>
          </div>
			
        </xsl:for-each>      
    </div>
	</div>
  </xsl:template>

  <!-- fgcuteam-mike Content Wizard -->
  <xsl:template match="table[@class='ou-content-wizard']">
	  <div class="content-wizard">
        <xsl:for-each select="tbody/tr">			
			  <xsl:variable name="style-active"> 
				  <xsl:choose>
					  <xsl:when test="position()=1">
						  <xsl:value-of select="''"/>
					  </xsl:when>
					  <xsl:otherwise>
						  <xsl:value-of select="'display:none;'"/>
					  </xsl:otherwise>
				  </xsl:choose>
			  </xsl:variable>		            
		  <div class="content-wizard-item" style="{$style-active}" data-id="{ou:textual-content(td[1])}">
			<xsl:if test="position()>1"> <a class="go-back" href="#" alt="back">Go Back</a> </xsl:if>
			<xsl:apply-templates select="td[2]/node()"/>
          </div>
        </xsl:for-each>
	</div>
  </xsl:template>	
	
  <!-- fgcuteam-mike Show Content -->
  <xsl:template match="table[@class='ou-show-content']">
        <xsl:for-each select="tbody/tr">
			<xsl:variable name="ref-name2"> 
				  <xsl:choose>
					  <xsl:when test="td[1]/descendant::a"><xsl:value-of select="translate( (td[1]/descendant::a/@href, td[1]/descendant::a/@id)[1], '#', '')"/></xsl:when>
					  <xsl:otherwise><xsl:value-of select="replace(ou:textual-content(td[1]),'[^a-zA-Z0-9]','')"/></xsl:otherwise>
				  </xsl:choose>
			  </xsl:variable>	
			  <xsl:variable name="style-active"> 
				  <xsl:choose>
					  <xsl:when test="ou:textual-content(td[2]) != ''">
						  <xsl:value-of select="''"/>
					  </xsl:when>
					  <xsl:otherwise>
						  <xsl:value-of select="'display:none;'"/>
					  </xsl:otherwise>
				  </xsl:choose>
			  </xsl:variable>						
		  <!-- remove any whitespaces:   translate(content,' ','') -->
          <!--Anchor DISABLED <a name="{$ref-name2}"></a>-->
		  <div id="{$ref-name2}" class="{$ref-name2}-show-content" style="{$style-active}" data-type="show-content">            
			<xsl:apply-templates select="td[3]/node()"/>
          </div>			
        </xsl:for-each>    
  </xsl:template>	

 <!-- fgcuteam-mike Instagram Feed Listing -->
  <xsl:template match="table[@class='ou-instagram-feed']">
    <xsl:variable name="feed" select="ou:textual-content(tbody/tr/td[2]/node())" />     
   <section class="instagram-feed">
		<div class="container">
			<xsl:if test="ou:textual-content(tbody/tr/td[1]/node()) != ''">
			  <h2 class="h2"><xsl:value-of select="tbody/tr/td[1]/node()"/></h2>
			</xsl:if>
				<div class="scrollable-wrapper">
					<div class="scrollable">
						<button class="scroll-right">scroll right</button>    
						<button class="scroll-left">scroll left</button> 
						<xsl:if test="$ou:action != 'pub'">
							<div style="{$message-styling-info} width: 100% !important;">								
								<p style="font-size: 15px;">Instagram Posts to appear on publish</p>
							</div>					
						</xsl:if>
						<ul class="instagram-feed-wrapper medium-slider">
							<xsl:choose>
								<xsl:when test="$ou:action = 'pub'">
									<xsl:text disable-output-escaping="yes">&lt;%</xsl:text>                                                                                                
									Response.Write(OUC.GetInstagramPosts.displayInstagramPostsSnippet("<xsl:value-of select="$feed"/>"));                 
									<xsl:text disable-output-escaping="yes">%&gt;</xsl:text>
								</xsl:when>
								<xsl:otherwise></xsl:otherwise>
							</xsl:choose>      								
						</ul>							
					</div>
			</div>
		</div>
	  </section>
  </xsl:template>
	
 <!-- fgcuteam-mike Twitter Feed Listing -->
  <xsl:template match="table[@class='ou-twitter-feed']">
    <xsl:variable name="feed" select="ou:textual-content(tbody/tr/td[2]/node())" />     
    <section class="social-feed">
		<div class="container">
			<xsl:if test="ou:textual-content(tbody/tr/td[1]/node()) != ''">
			  <h2><xsl:value-of select="tbody/tr/td[1]/node()"/></h2>
			</xsl:if>
				<div class="scrollable-wrapper">
					<div class="scrollable">
						<button class="scroll-right">scroll right</button>    
						<button class="scroll-left">scroll left</button> 
						<xsl:if test="$ou:action != 'pub'">
							<div style="{$message-styling-info} width: 100% !important;">								
								<p style="font-size: 15px;">Twitter Posts to appear on publish</p>
							</div>					
						</xsl:if>
						<ul class="social-feed-wrapper medium-slider">
							<xsl:choose>
								<xsl:when test="$ou:action = 'pub'">
									<xsl:text disable-output-escaping="yes">&lt;%</xsl:text>                                                                                                
									Response.Write(OUC.GetTweets.displayTweetsSnippet("<xsl:value-of select="$feed"/>"));                 
									<xsl:text disable-output-escaping="yes">%&gt;</xsl:text>
								</xsl:when>
								<xsl:otherwise></xsl:otherwise>
							</xsl:choose>      								
						</ul>							
					</div>
			</div>
		</div>
	  </section>
  </xsl:template>
	
 <!-- fgcuteam-mike Facebook Feed Listing -->
  <xsl:template match="table[@class='ou-facebook-feed']">
   <xsl:variable name="feed" select="ou:textual-content(tbody/tr/td[2]/node())" />
	<!--<section style="margin: 0 auto; text-align: center;">
	 	<div id="fb-root"></div>
	 	<script async="async" defer="defer" crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&amp;version=v10.0" nonce="PYxDjJIW"></script>
	  
	  	<div class="fb-page" data-href="https://www.facebook.com/{$feed}" data-tabs="timeline" data-width="500" data-height="" data-small-header="true" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><blockquote cite="https://www.facebook.com/{$feed}" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/{$feed}">Facebook</a></blockquote></div>
	 </section>-->
   <section class="social-feed">
		<div class="container">
			<xsl:if test="ou:textual-content(tbody/tr/td[1]/node()) != ''">
			  <h2><xsl:value-of select="tbody/tr/td[1]/node()"/></h2>
			</xsl:if>
				<div class="scrollable-wrapper">
					<div class="scrollable">
						<button class="scroll-right">scroll right</button>    
						<button class="scroll-left">scroll left</button> 
						<xsl:if test="$ou:action != 'pub'">
							<div style="{$message-styling-info} width: 100% !important;">								
								<p style="font-size: 15px;">Facebook Posts to appear on publish</p>
							</div>					
						</xsl:if>
						<ul class="social-feed-wrapper medium-slider">
							<xsl:choose>
								<xsl:when test="$ou:action = 'pub'">
									<xsl:text disable-output-escaping="yes">&lt;%</xsl:text>                                                                                                
									Response.Write(OUC.Facebook.displayFacebookPostsSnippet("<xsl:value-of select="$feed"/>"));                 
									<xsl:text disable-output-escaping="yes">%&gt;</xsl:text>
								</xsl:when>
								<xsl:otherwise></xsl:otherwise>
							</xsl:choose>      								
						</ul>							
					</div>
			</div>
		</div>
	  </section>
  </xsl:template>
	
 <!-- fgcuteam-mike Social Feed Listing -->
  <xsl:template match="table[@class='ou-social-feed']">
    
	<xsl:variable name="rows" select="count(tbody/tr)"/>
    <section class="social-feed">
		<div class="container">
			<xsl:if test="ou:textual-content(caption[2]/node()) != ''">
			  <h2><xsl:value-of select="caption[2]/node()"/></h2>
			</xsl:if>
				<div class="scrollable-wrapper">
					<div class="scrollable">
						<button class="scroll-right">scroll right</button>    
						<button class="scroll-left">scroll left</button>
						<xsl:if test="$ou:action != 'pub'">
							<div style="{$message-styling-info} width: 100% !important;">								
								<p style="font-size: 15px;">Social Posts to appear on publish</p>
							</div>					
						</xsl:if>
						<ul class="social-feed-wrapper medium-slider">							  
							<xsl:choose>
								<xsl:when test="$ou:action = 'pub'">
									
									<xsl:if test="($rows = 1)">										
										<xsl:call-template name="social-snippet-funcname"><xsl:with-param name="service" ><xsl:value-of select="ou:textual-content(tbody/tr[1]/td[1]/node())"/></xsl:with-param><xsl:with-param name="source" select="tbody/tr[1]/td[2]"/><xsl:with-param name="count" >3</xsl:with-param></xsl:call-template>
									</xsl:if>									
									<xsl:if test="($rows = 2)">
										<xsl:call-template name="social-snippet-funcname"><xsl:with-param name="service" ><xsl:value-of select="ou:textual-content(tbody/tr[1]/td[1]/node())"/></xsl:with-param><xsl:with-param name="source" select="tbody/tr[1]/td[2]"/><xsl:with-param name="count" >2</xsl:with-param></xsl:call-template>
										<xsl:call-template name="social-snippet-funcname"><xsl:with-param name="service" ><xsl:value-of select="ou:textual-content(tbody/tr[2]/td[1]/node())"/></xsl:with-param><xsl:with-param name="source" select="tbody/tr[2]/td[2]"/><xsl:with-param name="count" >1</xsl:with-param></xsl:call-template>										
									</xsl:if>
									<xsl:if test="($rows = 3)">
										<xsl:call-template name="social-snippet-funcname"><xsl:with-param name="service" ><xsl:value-of select="ou:textual-content(tbody/tr[1]/td[1]/node())"/></xsl:with-param><xsl:with-param name="source" select="tbody/tr[1]/td[2]"/><xsl:with-param name="count" >1</xsl:with-param></xsl:call-template>
										<xsl:call-template name="social-snippet-funcname"><xsl:with-param name="service" ><xsl:value-of select="ou:textual-content(tbody/tr[2]/td[1]/node())"/></xsl:with-param><xsl:with-param name="source" select="tbody/tr[2]/td[2]"/><xsl:with-param name="count" >1</xsl:with-param></xsl:call-template>
										<xsl:call-template name="social-snippet-funcname"><xsl:with-param name="service" ><xsl:value-of select="ou:textual-content(tbody/tr[3]/td[1]/node())"/></xsl:with-param><xsl:with-param name="source" select="tbody/tr[3]/td[2]"/><xsl:with-param name="count" >1</xsl:with-param></xsl:call-template>
									</xsl:if>									
																		
								</xsl:when>
								<xsl:otherwise></xsl:otherwise>
							</xsl:choose>      								
						</ul>							
					</div>
			</div>
		</div>
	  </section>
  </xsl:template>
	
	<xsl:template name="social-snippet-funcname">
			<xsl:param name="service"> </xsl:param>
			<xsl:param name="source"> </xsl:param>
			<xsl:param name="count"> </xsl:param>
			
			<xsl:choose>				
				<xsl:when test="$service = 'twitter'">
					<xsl:text disable-output-escaping="yes">&lt;%</xsl:text>
					Response.Write(OUC.GetTweets.displayTweetsSnippet("<xsl:value-of select="ou:textual-content($source)"/>", <xsl:value-of select="$count"/>));
					<xsl:text disable-output-escaping="yes">%&gt;</xsl:text>
				</xsl:when>
				<xsl:when test="$service = 'facebook'">
					<xsl:text disable-output-escaping="yes">&lt;%</xsl:text>
					Response.Write(OUC.Facebook.displayFacebookPostsSnippet("<xsl:value-of select="ou:textual-content($source)"/>", <xsl:value-of select="$count"/>));
					<xsl:text disable-output-escaping="yes">%&gt;</xsl:text>				
				</xsl:when>  
				<xsl:when test="$service = 'instagram'">
					<xsl:text disable-output-escaping="yes">&lt;%</xsl:text>
					Response.Write(OUC.GetInstagramPosts.displayBoxInstagramPostsSnippet("<xsl:value-of select="ou:textual-content($source)"/>", <xsl:value-of select="$count"/>));
					<xsl:text disable-output-escaping="yes">%&gt;</xsl:text>				
				</xsl:when>  
				<xsl:otherwise>
						<li>
							<div class="inner-wrapper">
								<div class="icon export"><span class="icon-export"></span></div>
									<a href="{$source/descendant::a/@href}"><div class="social-image"><img class="social-thumbnail-image" src="{$source/descendant::img/@src}" alt="Social Media Image" /></div></a>
									<div class="social-info">
										<div class="social-text"><xsl:apply-templates select="substring(ou:textual-content($source), 1, 103)"/></div>						
									</div>
							</div>
						</li>
				</xsl:otherwise>
			</xsl:choose>				
	</xsl:template>	
	
  <!-- [Undergraduate Admissions] Fast Facts -->
  <xsl:template match="table[@class='ou-fast-facts']">
    <section class="stats">
      <div class="container">
        <div class="scrollable-wrapper">
          <div class="scrollable">
            <button class="scroll-right">scroll right</button>  
            <button class="scroll-left">scroll left</button> 
            <div class="medium-slider stat-wrapper">
              <xsl:for-each select="tbody/tr[position() != last()]">
                <div class="slide">
                  <div class="stat" style="background-image: url({td[1]/descendant::img/@src})">
                    <div class="content">
                      <div class="icon-positioner {td[2]/descendant::a/@class}">                        
                      </div>
                      <xsl:apply-templates select="td[3]/node()"/>
                    </div>
                    <div class="overlay"></div>
                  </div>
                </div> 
              </xsl:for-each>                             
            </div>
          </div>
        </div>
      </div>
      <xsl:if test="tbody/tr[4]/td[1]/descendant::a">                 
        <div class="more-fast-facts">
          <xsl:apply-templates select="tbody/tr[4]/td[1]/descendant::a"/>
        </div>
      </xsl:if>
    </section><!-- .stats -->	
  </xsl:template>
  
  <!-- [Undergraduate Admissions] CTA Block: Large Block -->
  <xsl:template match="table[@class='ou-cta-block-large-block']">
    <section class="blue-callout">		
		<xsl:if test="tbody/tr/td[2]/descendant::img">
			<xsl:attribute name="style">background-image: url('<xsl:value-of select="tbody/tr/td[2]/descendant::img/@src"/>')</xsl:attribute>
			<xsl:attribute name="class">blue-callout dimmed-background-alt blue-callout-alt</xsl:attribute>
		</xsl:if>					
      <div class="content-container">
        <xsl:if test="ou:textual-content(tbody/tr/td[1]) != ''"><h2><xsl:value-of select="tbody/tr/td[1]/node()"/></h2></xsl:if>
        <xsl:apply-templates select="tbody/tr/td[3]/node()"/>
		  <xsl:if test="tbody/tr/td[4]/descendant::a">
			  <div class="cta-links">
				  <xsl:apply-templates select="tbody/tr/td[4]/descendant::a"/>                  
			  </div>
		  </xsl:if>
      </div>
    </section>
  </xsl:template>
	
	  <!-- fgcuteam-Mike [Undergraduate Admissions] CTA Block: Large Block WIDE -->
  <xsl:template match="table[@class='ou-cta-block-large-block-wide']">
    <section class="blue-callout">
      <xsl:if test="tbody/tr/td[2]/descendant::img">
        <xsl:attribute name="style">background-image: url('<xsl:value-of select="tbody/tr/td[2]/descendant::img/@src"/>')</xsl:attribute>
      </xsl:if>
      <div class="container lightpaddingcontainer">
        <xsl:if test="ou:textual-content(tbody/tr/td[1]) != ''"><h2><xsl:value-of select="tbody/tr/td[1]/node()"/></h2></xsl:if>
        <xsl:apply-templates select="tbody/tr/td[3]/node()"/>
        <xsl:apply-templates select="tbody/tr/td[4]/descendant::a"/>
      </div>
    </section>
  </xsl:template>
	
	<!-- <xsl:template name="encode-string">
        <xsl:param name="s"> <xsl:apply-templates select="''"/></xsl:param>
        <xsl:apply-templates select="replace($s, '&quot;', '\\&quot;')"/>
    </xsl:template>
    -->
	
  <!-- fgcuteam-mike Date Content Chooser -->
  <xsl:template match="table[@class='ou-date-content-chooser']">
	  <xsl:choose>
		  <xsl:when test="$ou:action = 'pub'">
			  <xsl:variable name="var-id" select="generate-id(.)"/>

				<xsl:for-each select="tbody/tr">
					  <xsl:variable name="chooser-date" select="ou:textual-content(td[1])" />
					  <!--
					  <xsl:variable name="chooser-content">
							<xsl:call-template name="encode-string"><xsl:with-param name="s" ><xsl:apply-templates  select="td[2]/node()"/></xsl:with-param></xsl:call-template>
					  </xsl:variable>
						-->
					  <!-- <xsl:variable name="chooser-content">
						<xsl:value-of select="replace(serialize(*), '&quot;', '\\&quot;')"/>
					  </xsl:variable>
						-->
					  <xsl:variable name="chooser-precontent">
						   <xsl:apply-templates select="td[2]"  />
					  </xsl:variable>			  
					  <xsl:variable name="chooser-content" select="replace(serialize($chooser-precontent), '&quot;', '&quot;&quot;')" />
							  <!-- We use a variable with @ for the content to avoid a one-liner string break by new line character or by quote, etc in the C# string variable. 
								Also decode the serilize from the XSL replace(serialize(... -->
							  <xsl:text disable-output-escaping="yes">&lt;%</xsl:text>									 									
									Response.Write(OUC.WnlDisplayMethods.displayDateContent(@"<xsl:value-of select="$chooser-date"/>", System.Web.HttpUtility.HtmlDecode(@"<xsl:apply-templates select="$chooser-content"/>")));
							  <xsl:text disable-output-escaping="yes">%&gt;</xsl:text>
				 </xsl:for-each>
		  </xsl:when>
		  <xsl:otherwise>Date Content to appear on publish</xsl:otherwise>					
	  </xsl:choose> 
  </xsl:template>
	
  <!-- fgcuteam-mike Day Content Chooser -->
  <xsl:template match="table[@class='ou-day-content-chooser']">
	  <xsl:choose>
		  <xsl:when test="$ou:action = 'pub'">
			  	<xsl:for-each select="tbody/tr">
					  <xsl:variable name="chooser-date" select="ou:textual-content(td[1])" />					  
					  <xsl:variable name="chooser-precontent">
						   <xsl:apply-templates select="td[2]"  />
					  </xsl:variable>			  
					  <xsl:variable name="chooser-content" select="replace(serialize($chooser-precontent), '&quot;', '&quot;&quot;')" />
							  <!-- We use a variable with @ for the content to avoid a one-liner string break by new line character or by quote, etc in the C# string variable. 
								Also decode the serilize from the XSL replace(serialize(... -->
							  <xsl:text disable-output-escaping="yes">&lt;%</xsl:text>									 									
									Response.Write(OUC.WnlDisplayMethods.displayDayContent("<xsl:value-of select="$chooser-date"/>", System.Web.HttpUtility.HtmlDecode(@"<xsl:apply-templates select="$chooser-content"/>")));
							  <xsl:text disable-output-escaping="yes">%&gt;</xsl:text>
				 </xsl:for-each>
		  </xsl:when>
		  <xsl:otherwise>Day Content to appear on publish</xsl:otherwise>					
	  </xsl:choose> 
  </xsl:template>
	
  <!-- fgcuteam-mike Custom Feed -->
  <xsl:template match="table[@class='ou-custom-feed']">
	  <xsl:choose>
		  <xsl:when test="$ou:action = 'pub'">
			  	
			  <xsl:variable name="layout" select="ou:textual-content(tbody/tr/td[1])" />
			  <xsl:variable name="title" select="ou:textual-content(tbody/tr/td[2])" />
			  <xsl:variable name="clickable" select="ou:textual-content(tbody/tr/td[3])" />	
			  <xsl:variable name="readmoretext" select="ou:textual-content(tbody/tr/td[4])" />
			  <xsl:variable name="readmorelink" select="tbody/tr/td[4]/descendant::a/@href" />
			  <xsl:variable name="format" select="ou:textual-content(tbody/tr/td[5])" />
			  <xsl:variable name="url" select="ou:textual-content(tbody/tr/td[6]/descendant::a/@href)" />
			  <xsl:variable name="count" select="ou:textual-content(tbody/tr/td[7])" />
			  <xsl:variable name="xitem" select="ou:textual-content(tbody/tr/td[8])" />
			  <xsl:variable name="ximage" select="ou:textual-content(tbody/tr/td[9])" />
			  <xsl:variable name="ximagedesc" select="ou:textual-content(tbody/tr/td[10])" />
			  <xsl:variable name="xdate" select="ou:textual-content(tbody/tr/td[11])" />
			  <xsl:variable name="xtitle" select="ou:textual-content(tbody/tr/td[12])" />
			  <xsl:variable name="xlink" select="ou:textual-content(tbody/tr/td[13])" />
			  <xsl:variable name="xdescription" select="ou:textual-content(tbody/tr/td[14])" />
			  <xsl:variable name="xfilterfield" select="ou:textual-content(tbody/tr/td[15])" />
			  <xsl:variable name="filtervalue" select="ou:textual-content(tbody/tr/td[16])" />
			  <xsl:variable name="sort" select="ou:textual-content(tbody/tr/td[17])" />
			  <xsl:variable name="imgcategory" select="ou:textual-content(tbody/tr/td[18])" />
			  <xsl:variable name="imgcategorylist" select="ou:textual-content(tbody/tr/td[19])" />
			  <xsl:variable name="datetolocal" select="ou:textual-content(tbody/tr/td[20])" />	
			  <xsl:variable name="showtime" select="ou:textual-content(tbody/tr/td[21])" />	
			  
			  <xsl:text disable-output-escaping="yes">&lt;%</xsl:text>									 									
			  Response.Write(OUC.WnlDisplayMethods.displayCustomFeed("<xsl:value-of select="$layout"/>", "<xsl:value-of select="$title"/>", <xsl:value-of select="$clickable"/>, "<xsl:value-of select="$readmoretext"/>", "<xsl:value-of select="$readmorelink"/>","<xsl:value-of select="$format"/>","<xsl:value-of select="$url"/>",<xsl:value-of select="$count"/>,"<xsl:value-of select="$xitem"/>","<xsl:value-of select="$ximage"/>","<xsl:value-of select="$ximagedesc"/>","<xsl:value-of select="$xdate"/>","<xsl:value-of select="$xtitle"/>","<xsl:value-of select="$xlink"/>","<xsl:value-of select="$xdescription"/>","<xsl:value-of select="$xfilterfield"/>","<xsl:value-of select="$filtervalue"/>","<xsl:value-of select="$sort"/>","<xsl:value-of select="$imgcategory"/>","<xsl:value-of select="$imgcategorylist"/>", <xsl:value-of select="$datetolocal"/>, <xsl:value-of select="$showtime"/>));
			  <xsl:text disable-output-escaping="yes">%&gt;</xsl:text>
				 
		  </xsl:when>
		  <xsl:otherwise>Feed Content to appear on publish</xsl:otherwise>					
	  </xsl:choose> 
  </xsl:template>	
	
  <!-- fgcuteam-mike Timeline -->
  <xsl:template match="table[@class='ou-timeline']">
	  <xsl:variable name="var-id" select="generate-id(.)"/>
	  <div class="container-flex">
	  <ul class="timeline-2">
		  <xsl:for-each select="tbody/tr">
			  <xsl:variable name="chooser-date" select="ou:textual-content(td[1])" />
			  <xsl:variable name="month" select="if($chooser-date != '' and string(replace($chooser-date, '([0-9]{2})\D([0-9]{2})\D([0-9]{4})', '$3-$1-$2')) castable as xs:date) then format-date(xs:date($chooser-date),'[MN]') else ''" />
			  <!--<xsl:variable name="panel-type" select="ou:textual-content(td[2])" />-->
			  <li>
				  <time class="timeline-time" datetime=""><xsl:value-of select="if($chooser-date != '' and string(replace($chooser-date, '([0-9]{2})\D([0-9]{2})\D([0-9]{4})', '$3-$1-$2')) castable as xs:date) then format-date(xs:date($chooser-date),'[Y]') else $chooser-date "/><span> <xsl:value-of select="concat(upper-case(substring($month,1,1)),lower-case(substring($month,2)))"/></span></time>
				  <i class="timeline-2-point" aria-hidden="true"></i>
				  <div class="timeline-2-body">
                            <xsl:apply-templates select="td[2]"  />
                  </div>
				  <!--<div class="panel {$panel-type}">
                        <div class="panel-heading"><xsl:value-of select="ou:textual-content(td[3])"/></div>
                        <div class="panel-body">
                            <xsl:apply-templates select="td[4]"  />
                        </div>
                  </div>
				  -->
			  </li>			  
		  </xsl:for-each>
	  </ul>
	  </div>
  </xsl:template>	
	
 	<!-- Bootrap Columns - fgcuteam-mike  -->
    <xsl:template match="table[@class='ou-bootstrap-columns']">
		<div class="container-flex row {ou:textual-content(caption[2]/node())}"> 
			<xsl:for-each select="tbody/tr">
				<div class="{ou:textual-content(td[1]/node())}" >
					<xsl:apply-templates select="td[2]/node()"  />
				</div>					
			</xsl:for-each>
		</div>
  	</xsl:template>
	
	<!-- fgcuteam-mike Panel (Bootstrap) -->
	<xsl:template match="table[@class='ou-panel']">
		<div class="panel {ou:textual-content(tbody/tr/td[1])}">
			<div class="panel-heading"><xsl:value-of select="ou:textual-content(caption[2]/node())"/></div>
			<div class="panel-body">
				<xsl:apply-templates select="tbody/tr/td[2]"  />
			</div>
        </div>
	</xsl:template>
	
	  <!-- Drop Down List Links - fgcuteam-mike  -->
    <xsl:template match="table[@class='ou-dropdown-list-links']">
		<select class="select-picker {ou:textual-content(caption[3]/node())}" data-width="100%" data-stretch="true" title="{ou:textual-content(caption[2]/node())}"> <!--  onChange="window.location.href=this.value" -->	 
				<!--<option selected="selected"><xsl:value-of select="ou:textual-content(caption[2]/node())" /></option>-->
			<xsl:for-each select="tbody/tr">
				<xsl:if test="td[2]/descendant::a/@href">
					<option value="{td[2]/descendant::a/@href}" data-target="{td[2]/descendant::a/@target}"><xsl:value-of select="ou:textual-content(td[1]/node())"/></option>	
				</xsl:if>
			</xsl:for-each>
		</select>
  	</xsl:template>
	
 <!-- fgcuteam-mike parallax background snippet/content container-->
  <xsl:template match="table[@class='ou-parallax-background-simple']">
	<xsl:variable name="text-color" select="if (contains(ou:textual-content(caption[2]/node()), 'defaulttext')) then 'color:inherit;' else ''"/>
	<xsl:variable name="background-color" select="if (contains(ou:textual-content(caption[2]/node()), 'defaulttext')) then 'background-color:#fff;' else ''"/>
    <section class="blue-callout" style="{$text-color} {$background-color} text-align:left;">
      <xsl:if test="tbody/tr[2]/td[1]/descendant::img">
        <xsl:attribute name="style">background-image: url('<xsl:value-of select="tbody/tr[2]/td[1]/descendant::img/@src"/>'); text-align:left; <xsl:value-of select="$text-color" /> <xsl:value-of select="$background-color" /> </xsl:attribute>
      </xsl:if>      
        <xsl:apply-templates select="tbody/tr[1]/td[1]/node()"/>      
    </section>
	</xsl:template>
  
  <!-- fgcuteam-mike [Undergraduate Admissions] CTA Block: Large Block -->
  <xsl:template match="table[@class='ou-cta-block-large-block-alt']">
    <section class="blue-callout dimmed-background-alt blue-callout-alt">
      <xsl:if test="tbody/tr/td[2]/descendant::img">
        <xsl:attribute name="style">background-image: url('<xsl:value-of select="tbody/tr/td[2]/descendant::img/@src"/>')</xsl:attribute>
      </xsl:if>
      <div class="content-container">
        <xsl:if test="ou:textual-content(tbody/tr/td[1]) != ''"><h2><xsl:value-of select="tbody/tr/td[1]/node()"/></h2></xsl:if>
        <xsl:apply-templates select="tbody/tr/td[3]/node()"/>
        <p class="dimmedbutton"> <xsl:apply-templates select="tbody/tr/td[4]/descendant::a"/> </p>
      </div>
    </section>
  </xsl:template>
	
  <!-- fgcuteam-mike [Faculty Profile] Image float text -->
  <xsl:template match="table[@class='ou-image-float-text']">    
      <div class="container-flex image-float-text image-float-text-{ou:textual-content(tbody/tr/td[3])}">
		<xsl:if test="tbody/tr/td[1]/descendant::img">
        	<xsl:apply-templates select="tbody/tr/td[1]/node()"/>
      	</xsl:if>        
        <div><xsl:apply-templates select="tbody/tr/td[2]/node()"/></div>        
      </div>    
  </xsl:template>
	
  <!-- fgcuteam-mike Image text Article -->
  <xsl:template match="table[@class='ou-image-text-article']">	  
	  <xsl:variable name="image-align">
		  <xsl:choose>
			  <xsl:when test="contains(ou:textual-content(caption[2]/node()), 'left')"><xsl:value-of select="'left'"/></xsl:when>
			  <xsl:otherwise><xsl:value-of select="'right'"/></xsl:otherwise>
		  </xsl:choose>
	  </xsl:variable>
      
		  <xsl:choose>
			  <xsl:when test="contains(ou:textual-content(caption[2]/node()), 'wrap-title')">				
				  	<xsl:choose>
						<xsl:when test="ou:textual-content(tbody/tr/td[3]) = ''">
							<div class="container-flex image-float-text image-float-text-{$image-align}">
								<xsl:if test="tbody/tr/td[1]/descendant::img"><xsl:apply-templates select="tbody/tr/td[1]/node()"/></xsl:if>        
								<div><xsl:apply-templates select="tbody/tr/td[2]/node()"/><xsl:apply-templates select="tbody/tr/td[4]/node()"/></div> 
							</div>
						</xsl:when>
						<xsl:otherwise>
							<div class="container-flex">
								<div class="row">
									<xsl:choose>
										<xsl:when test="contains(ou:textual-content(caption[2]/node()), 'left')">
											<div class="col-sm-8 twothirds">
												<xsl:apply-templates select="tbody/tr/td[1]/node()"/>
											</div>
											<div class="col-sm-16">
												<xsl:apply-templates select="tbody/tr/td[2]/node()"/>
												<xsl:apply-templates select="tbody/tr/td[3]/node()"/>
											</div>									
										</xsl:when>
										<xsl:otherwise>
											<div class="col-sm-12 twothirds">
												<xsl:apply-templates select="tbody/tr/td[2]/node()"/>
												<xsl:apply-templates select="tbody/tr/td[3]/node()"/>										
											</div>
											<div class="col-sm-8">
												<xsl:apply-templates select="tbody/tr/td[1]/node()"/>
											</div>									
										</xsl:otherwise>
									</xsl:choose>
								</div>
								<div class="row"><xsl:apply-templates select="tbody/tr/td[4]/node()"/></div>
							</div>
						</xsl:otherwise>
					</xsl:choose>				  
			  </xsl:when>
			  <xsl:otherwise>				  	
				  	<xsl:choose>
						<xsl:when test="ou:textual-content(tbody/tr/td[3]) = ''">
							<div class="container-flex image-float-text image-float-text-{$image-align}">
								<xsl:apply-templates select="tbody/tr/td[2]/node()"/>
								<xsl:if test="tbody/tr/td[1]/descendant::img"><xsl:apply-templates select="tbody/tr/td[1]/node()"/></xsl:if>        
								<div><xsl:apply-templates select="tbody/tr/td[4]/node()"/></div>  
							</div>
						</xsl:when>
						<xsl:otherwise>
							<div class="container-flex">
								<xsl:apply-templates select="tbody/tr/td[2]/node()"/>
								<div class="row">
									<xsl:choose>
										<xsl:when test="contains(ou:textual-content(caption[2]/node()), 'left')">
											<div class="col-sm-8 twothirds">
												<xsl:apply-templates select="tbody/tr/td[1]/node()"/>											
											</div>
											<div class="col-sm-16">
												<xsl:apply-templates select="tbody/tr/td[3]/node()"/>
											</div>
										</xsl:when>
										<xsl:otherwise>
											<div class="col-sm-12 twothirds">
												<xsl:apply-templates select="tbody/tr/td[3]/node()"/>
											</div>
											<div class="col-sm-8">
												<xsl:apply-templates select="tbody/tr/td[1]/node()"/>										
											</div>									
										</xsl:otherwise>
									</xsl:choose>
								</div>
								<div class="row"><xsl:apply-templates select="tbody/tr/td[4]/node()"/></div>
							</div>
						</xsl:otherwise>
					</xsl:choose>
			  </xsl:otherwise>
		  </xsl:choose>
		      
          
  </xsl:template>
  
  <!-- [Undergraduate Admissions] Contact Info: Image Feature -->
  <xsl:template match="table[@class='ou-contact-info-image-feature']">
    <xsl:if test="tbody/tr/td[1]/descendant::img">
      <xsl:variable name="image" select="tbody/tr/td[1]/descendant::img/@src" />    
      <xsl:variable name="extension" select="substring-after($image, '.')" />		
      <xsl:variable name="tablet-image" select="concat(replace($image, $extension, ''), '-tablet.', $extension) " />
      <xsl:variable name="mobile-image" select="concat(replace($image, $extension, ''), '-mobile.', $extension) " />
      <section class="contact-info desktop-banner" style="background-image: url({$image})">
        <div class="tablet-banner" style="background-image: url({$tablet-image})">
          <div class="top">
            <xsl:apply-templates select="tbody/tr/td[1]/descendant::img"/>
          </div>
          <div class="container">
            <div class="col-md-11 content">
              <xsl:if test="ou:textual-content(tbody/tr/td[2]) != ''"><h2><xsl:value-of select="tbody/tr/td[2]"/></h2></xsl:if>
              <xsl:if test="ou:textual-content(tbody/tr/td[3]) != ''"><p class="title"><xsl:value-of select="tbody/tr/td[3]"/></p></xsl:if>
              <div class="row">
                <div class="col-sm-24 col-sm-10 col-md-24">
                  <xsl:apply-templates select="tbody/tr/td[4]/node()"/>
                </div>
                <xsl:if test="ou:textual-content(tbody/tr/td[5]) != '' or ou:textual-content(tbody/tr/td[6]) != '' or tbody/tr/td[7]/descendant::a or tbody/tr/td[8]/descendant::a">
                  <div class="col-sm-24 col-sm-14 col-md-24">                
                    <div class="row">
                      <xsl:if test="ou:textual-content(tbody/tr/td[5]) != '' or ou:textual-content(tbody/tr/td[6]) != ''">                      
                        <div class="col-xs-12">
                          <p class="phone"><xsl:value-of select="tbody/tr/td[5]/node()"/></p>
                          <p class="phone"><xsl:value-of select="tbody/tr/td[6]/node()"/></p>
                        </div>
                      </xsl:if>
                      <xsl:if test="tbody/tr/td[7]/descendant::a or tbody/tr/td[8]/descendant::a">
                        <div class="col-xs-12">
                          <xsl:if test="tbody/tr/td[7]/descendant::a">                        
                            <p class="contact"><xsl:apply-templates select="tbody/tr/td[7]/descendant::a"/></p>
                          </xsl:if>
                          <xsl:if test="tbody/tr/td[8]/descendant::a">                        
                            <p class="chat"><xsl:apply-templates select="tbody/tr/td[8]/descendant::a"/></p>
                          </xsl:if>
                        </div>
                      </xsl:if>
                    </div>                  
                  </div>
                </xsl:if>
              </div>
            </div>
          </div>
        </div>
        <!-- </div> design has this extra div commented out by OU-->    
      </section>		
    </xsl:if>
    <xsl:if test="not(tbody/tr/td[1]/descendant::img)">
      <div style="{$message-styling-info}">                        								                                     
        <p style="padding-bottom: 100px; margin-bottom: 0px; font-size: 15px;"><strong>Please Select a background image.</strong></p>
      </div>
    </xsl:if>
  </xsl:template>
	
  <!-- [Undergraduate Admissions] Contact Info: Image Feature ALT -->
  <xsl:template match="table[@class='ou-contact-info-image-feature-alt']">
    <xsl:if test="tbody/tr/td[1]/descendant::img">
      <xsl:variable name="image" select="tbody/tr/td[1]/descendant::img/@src" />    
      <xsl:variable name="extension" select="substring-after($image, '.')" />		
      <xsl:variable name="tablet-image" select="concat(replace($image, $extension, ''), '-tablet.', $extension) " />
      <xsl:variable name="mobile-image" select="concat(replace($image, $extension, ''), '-mobile.', $extension) " />
      <section class="contact-info desktop-banner" style="background-image: url({$image})">
        <div class="tablet-banner" style="background-image: url({$tablet-image})">
          <div class="top">
            <xsl:apply-templates select="tbody/tr/td[1]/descendant::img"/>
          </div>
          <div class="container">
            <div class="col-md-11 content">
              <xsl:apply-templates select="tbody/tr/td[2]/node()"/>       
            </div>
          </div>
        </div>
        <!-- </div> design has this extra div commented out by OU-->    
      </section>		
    </xsl:if>
    <xsl:if test="not(tbody/tr/td[1]/descendant::img)">
      <div style="{$message-styling-info}">                        								                                     
        <p style="padding-bottom: 100px; margin-bottom: 0px; font-size: 15px;"><strong>Please Select a background image.</strong></p>
      </div>
    </xsl:if>
  </xsl:template>	
  
  <!-- Stackable Columns Grid - fgcuteam-mike  -->
    <xsl:template match="table[@class='ou-stackable-columns-grid']">	
	<xsl:variable name="options-used" select="lower-case(ou:textual-content(caption[2]/node()))"/>	
	<xsl:variable name="no-outer-padding" select="if( contains($options-used, 'no-outer-padding')) then 'no-outer-padding' else ''" />
	<xsl:variable name="separator" select="if( contains($options-used, 'blue-separator')) then 'blue-separator' else if(contains($options-used, 'green-separator')) then 'green-separator' else ''" />
	<xsl:variable name="mobile-resp" select="if( contains($options-used, 'smart')) then 'smart-resp' else if(contains($options-used, '1col')) then '' else if(contains($options-used, '2col')) then 'col-xs-12' else if(contains($options-used, '3col')) then 'col-xs-8' else if(contains($options-used, '4col')) then 'col-xs-6' else ''" />
	<xsl:variable name="columns" select="count(tbody/tr/td)"/>
		  <xsl:for-each select="tbody/tr">
			  <div class="container-flex row-alt {$no-outer-padding} {$separator} columns-{$columns}">
				  <xsl:for-each select="td">
					  <xsl:variable name="count" select="count(td)" />
									  <div class="col-sm {$mobile-resp}">
										  <!-- add any properties/attributes added by the user with a select@* -->
										  <xsl:apply-templates select="@*" />
										  <xsl:apply-templates select="node()"/>
									  </div>
					  <!-- check position and if separator has been specified -->
					  <xsl:if test="(position() != 2) and ($separator != '')">
					  	<div class="separator"></div>
					  </xsl:if>
				  </xsl:for-each>
				  <xsl:message select="Hello"/>
			  </div>	
		  </xsl:for-each>
  	</xsl:template>
	
  <!-- Stackable Columns Table - fgcuteam-mike  -->
    <xsl:template match="table[@class='ou-stackable-columns-table']">
		<xsl:variable name="options-used" select="ou:textual-content(caption[3]/node())"/>
		<xsl:variable name="advanced-table" select="if( contains($options-used, 'filter') or contains($options-used, 'search') or contains($options-used, 'pagination') or contains($options-used, 'info') or contains($options-used, 'asc') or contains($options-used, 'desc') ) then 'advanced-table' else ''"/>
		<div class="container-flex stackable-table-wrap">
		  <xsl:if test="contains(ou:textual-content($options-used), 'stackheader')">
			<div class="thead-master-stack">
				<div><xsl:value-of select="thead/tr/th[1]"/></div>
				<div>
					<xsl:for-each select="thead/tr/th">					
						<xsl:value-of select="if(position() != last() and position() != 1) then concat(ou:textual-content(node()), ', ' )  else if(position()=last()) then ou:textual-content(node()) else ''" />
					</xsl:for-each>
				</div>
			</div>
		  </xsl:if>
		  <table><xsl:apply-templates select="@*" /><!-- add any properties/attributes added by the user with a select@* -->
			  <xsl:attribute name="class"><!-- conditional attribute parametter -->								  
				  <xsl:if test="contains($options-used, 'light-table')"> bordertable</xsl:if>
				  <xsl:if test="contains($options-used, 'small-table')"> smalltable</xsl:if>
				  <xsl:if test="contains($options-used, 'border-table')"> bordertable</xsl:if>
				  <xsl:value-of select="concat(' ', $advanced-table)"/> 				  
			  </xsl:attribute>
			  <xsl:if test="contains($options-used, 'filter')"><xsl:attribute name="data-multi-filter">true</xsl:attribute></xsl:if>
			  <xsl:attribute name="data-xsl-params"><xsl:value-of select="$options-used"/></xsl:attribute><!-- used for other things like knowing if there is filter columns in specific ie filter1, filter2	-->			  
			  <xsl:if test="contains($options-used, 'search')"><xsl:attribute name="data-searching">true</xsl:attribute></xsl:if>
			  <xsl:if test="contains($options-used, 'pagination')"><xsl:attribute name="data-paging">true</xsl:attribute></xsl:if>
			  <xsl:if test="contains($options-used, 'info')"><xsl:attribute name="data-info">true</xsl:attribute></xsl:if>
			  <xsl:if test="contains($options-used, 'nosort')"><xsl:attribute name="data-b-Sort">false</xsl:attribute></xsl:if>
			  <xsl:if test="contains($options-used, 'desc')"><xsl:attribute name="data-order"><xsl:value-of select="concat('[[ ', substring(substring-after($options-used,'desc'), 0, 2), ', &quot;desc&quot; ]]') "/></xsl:attribute></xsl:if>
			  <xsl:if test="contains($options-used, 'asc')"><xsl:attribute name="data-order"><xsl:value-of select="concat('[[ ', substring(substring-after($options-used,'asc'), 0, 2), ', &quot;asc&quot; ]]') "/></xsl:attribute></xsl:if>			  
			  <xsl:if test="$advanced-table = 'advanced-table'"><xsl:attribute name="style"><xsl:value-of select="concat(@style, ' width:100%;')"/></xsl:attribute></xsl:if><!-- width 100% is needed for mobile display when using advanced-table -->
			<thead><xsl:apply-templates select="thead/@*" /><!-- add any properties/attributes added by the user with a select@* -->
		  		<xsl:apply-templates select="thead[1]/node()"/>
				<!-- DISABLED: Not needed(only for filter functionality)?  Causing issue with ADA due to empty values.
				<xsl:if test="$advanced-table = 'advanced-table'">
					<tr>
						<xsl:for-each select="thead[1]/tr[1]/th">
							<th></th>
						</xsl:for-each>
					</tr>
				</xsl:if>
				-->
		  	</thead>
	      <tbody><xsl:apply-templates select="tbody/@*" /><!-- add any properties/attributes added by the user with a select@* -->
		  <xsl:for-each select="tbody/tr">
			  <xsl:variable name="tr-attributes" select="@*" />
			  			  
			  <xsl:variable name="border-value" select="if(contains($options-used, 'noborder')) then '' else 'with-borders'" /> 
			  <xsl:variable name="align-value" select="if(contains($options-used, 'left')) then 'align-left' else if (contains($options-used, 'right')) then 'align-right' else 'align-center'" />   			  
			  <tr class="{$border-value}" ><xsl:apply-templates select="@*" /><!-- add any properties/attributes added by the user with a select@* -->
				  <xsl:for-each select="td">
					  <!-- for some reason we need to store the position() in a variable when within another parent loop  -->
					  <xsl:variable name="current-pos" select="position()"/>
					  <xsl:variable name="header-value"> 
						  <xsl:choose>
							  <xsl:when test="contains($options-used, 'noheader') or contains($options-used, 'stackheader')">
								  <xsl:value-of select="''"/>
							  </xsl:when>
							  <xsl:otherwise>
								  <xsl:value-of select="../../../thead[1]/tr[1]/*[$current-pos]/node()"/><!--Note using /* instead of /th, because it is possible it can be /td also on some cases when a header is not used in a specific column by the user and needs to use an empty td for accesibility error avoidance -->
							  </xsl:otherwise>
						  </xsl:choose>
					  </xsl:variable>
					  <td class="{$border-value} {$align-value}" data-header="{$header-value}"><xsl:apply-templates select="@*" /><!-- add any properties/attributes added by the user with a select@* -->
						  <xsl:apply-templates select="node()"/>
					  </td>
				  </xsl:for-each>
			  </tr>	
		  </xsl:for-each>
		  </tbody>
		  </table>
		</div>
  	</xsl:template>	

  <!-- Tables | Stackable | Google Spreadsheet - fgcuteam-mike  -->
    <xsl:template match="table[@class='ou-stackable-table-spreadsheet']">
		<xsl:variable name="options-used" select="ou:textual-content(caption[3]/node())"/>			  
		<xsl:variable name="border-value" select="if(contains($options-used, 'noborder')) then '' else 'with-borders'" /> 
		<xsl:variable name="align-value" select="if(contains($options-used, 'left')) then 'align-left' else if (contains($options-used, 'right')) then 'align-right' else 'align-center'" />		
		<xsl:variable name="header-value" select="if(contains($options-used, 'noheader')) then 'noheader' else if(contains($options-used, 'stackheader')) then 'stackheader' else 'itemheader'" /> 	
		<xsl:variable name="advanced-table" select="if( contains($options-used, 'filter') or contains($options-used, 'search') or contains($options-used, 'pagination') or contains($options-used, 'info') or contains($options-used, 'asc') or contains($options-used, 'desc'))   then 'advanced-table' else ''"/>		
		<div class="container-flex stackable-table-wrap">
			<xsl:choose>
				<xsl:when test="$ou:action = 'pub'">
					<table data-url="{tbody/tr/td[1]}" id="gsheet-{tbody/tr/td[2]}" data-sheetname="{tbody/tr/td[2]}" data-sheetfrom="{tbody/tr/td[3]}" data-sheetto="{tbody/tr/td[4]}" data-border="{$border-value}" data-align="{$align-value}" data-header="{$header-value}"><xsl:apply-templates select="@*" /><!-- add any properties/attributes added by the user with a select@* -->
						<xsl:attribute name="class"><!-- conditional attribute parametter -->
							<xsl:choose>
								<xsl:when test="contains(ou:textual-content(caption[3]/node()), 'light-table') and contains(ou:textual-content(caption[3]/node()), 'small-table')">google-spreadsheet light-table smalltable</xsl:when>
								<xsl:when test="contains(ou:textual-content(caption[3]/node()), 'light-table')">google-spreadsheet light-table</xsl:when>
								<xsl:when test="contains(ou:textual-content(caption[3]/node()), 'small-table')">google-spreadsheet smalltable</xsl:when>
								<xsl:otherwise>google-spreadsheet</xsl:otherwise>
							</xsl:choose>
							<!-- DISABLED due to dataTable js being initiatied undesireably <xsl:value-of select="concat(' ', $advanced-table)"/> 	-->
						</xsl:attribute>
			  <xsl:if test="contains($options-used, 'filter')"><xsl:attribute name="data-multi-filter">true</xsl:attribute></xsl:if>
			  <xsl:attribute name="data-xsl-params"><xsl:value-of select="$options-used"/></xsl:attribute><!-- used for other things like knowing if there is filter columns in specific ie filter1, filter2	-->
			  <xsl:if test="contains($options-used, 'search')"><xsl:attribute name="data-searching">true</xsl:attribute></xsl:if>
			  <xsl:if test="contains($options-used, 'pagination')"><xsl:attribute name="data-paging">true</xsl:attribute></xsl:if>
			  <xsl:if test="contains($options-used, 'info')"><xsl:attribute name="data-info">true</xsl:attribute></xsl:if>
			  <xsl:if test="contains($options-used, 'nosort')"><xsl:attribute name="data-b-Sort">false</xsl:attribute></xsl:if>
			  <xsl:if test="contains($options-used, 'desc')"><xsl:attribute name="data-order"><xsl:value-of select="concat('[[ ', substring(substring-after($options-used,'desc'), 0, 2), ', &quot;desc&quot; ]]') "/></xsl:attribute></xsl:if>
			  <xsl:if test="contains($options-used, 'asc')"><xsl:attribute name="data-order"><xsl:value-of select="concat('[[ ', substring(substring-after($options-used,'asc'), 0, 2), ', &quot;asc&quot; ]]') "/></xsl:attribute></xsl:if>						
			  <xsl:if test="$advanced-table = 'advanced-table'"><xsl:attribute name="style"><xsl:value-of select="concat(@style, ' width:100%;')"/></xsl:attribute></xsl:if><!-- width 100% is needed for mobile display when using advanced-table -->
						<thead><xsl:apply-templates select="thead/@*" /><!-- add any properties/attributes added by the user with a select@* -->		  		
						</thead>
						<tbody><xsl:apply-templates select="tbody/@*" /><!-- add any properties/attributes added by the user with a select@* -->
						</tbody>
					</table>									
				</xsl:when>
				<xsl:otherwise>Table Data to appear on publish.</xsl:otherwise>
			</xsl:choose> 
		</div>
  	</xsl:template>		
	
  <!-- Simple Calendar: fgcuteam-mike  -->
    <xsl:template match="table[@class='ou-tiva-events-calendar']">
		<table class="tiva-events-calendar-data" style="display:none;" data-view="{ou:textual-content(caption[2]/node())}">
		  <thead>
			  <tr>				  	
					<th>name</th>
					<th>image</th>
					<th>day</th>
					<th>month</th>
					<th>year</th>
					<th>time</th>
					<th>duration</th>
					<th>color</th>
					<th>location</th>
					<th>description</th>
				 	<th>image_alt</th>
			  </tr>
		  </thead>
		  <tbody>
		  <xsl:for-each select="tbody/tr">
			 <tr>
			  <td><xsl:value-of select="ou:textual-content(td[1]/node())"/></td>
			  <td><xsl:value-of select="td[2]/descendant::img/@src"/></td>				 
			  <td><xsl:value-of select="ou:textual-content(td[3]/node())"/></td>
			  <td><xsl:value-of select="ou:textual-content(td[4]/node())"/></td>
			  <td><xsl:value-of select="ou:textual-content(td[5]/node())"/></td>
			  <td><xsl:value-of select="ou:textual-content(td[6]/node())"/></td>
			  <td><xsl:value-of select="ou:textual-content(td[7]/node())"/></td>
			  <td><xsl:value-of select="ou:textual-content(td[8]/node())"/></td>
			  <td><xsl:value-of select="ou:textual-content(td[9]/node())"/></td>
			  <td><xsl:apply-templates select="td[10]/node()"/></td>
			  <td><xsl:value-of select="ou:textual-content(td[2]/descendant::img/@alt)"/></td>
			</tr>
		  </xsl:for-each>
		  </tbody>
		</table>
  	</xsl:template>
	
	
	<!-- FGCUTEAM Mike [Testimonials] Faculty Quote Callout -->
	<xsl:template match="table[@class='ou-faculty-quote-callout']">
	<xsl:variable name="image-back" select="tbody/tr[1]/td[1]/descendant::img/@src" />
	<xsl:variable name="image-front" select="tbody/tr[1]/td[2]/descendant::img/@src" />
	<section class="faculty-quote-callout-section-background">
		<div>
		<div class="col-sm faculty-quote-callout-background-gradient" style="background-image: url({$image-back});">
			<div class="faculty-quote-callout-background-image" style="background-image: url({$image-front});">
				<div class="faculty-quote-callout-leftbox">
						<blockquote class="faculty-quote-callout-text">
							<p><xsl:apply-templates select="tbody/tr[1]/td[3]/node()"/><br />
							<div class="faculty-quote-callout-name"><em><xsl:apply-templates select="tbody/tr[1]/td[4]/node()"/></em></div>
							<div class="faculty-quote-callout-description"><em><xsl:apply-templates select="tbody/tr[1]/td[5]/node()"/></em></div>
							<div class="faculty-quote-callout-subtitle"><em><xsl:apply-templates select="tbody/tr[1]/td[6]/node()"/></em></div>
							<div class="faculty-quote-callout-button"><xsl:apply-templates select="tbody/tr[1]/td[7]/node()"/></div>
							</p>
						</blockquote>
				</div>
			</div>
		</div>
		</div>
	</section>	  	
  </xsl:template>
	
	
	<!-- fgcuteam-Mike - Contact | Directory | Dynamic -->
	<xsl:template match="table[@class='ou-contact-directory-dynamic']">
		<xsl:variable name="options-used" select="lower-case(ou:textual-content(caption[2]/node()))"/>
		<xsl:variable name="sortmanual" select="if(contains($options-used, 'sortmanual')) then 'true' else 'false' " />
		<xsl:variable name="azindex">
			  <xsl:choose>
				  <xsl:when test="contains($options-used, 'azindex')"><xsl:value-of select="'true'"/></xsl:when>
				  <xsl:otherwise><xsl:value-of select="'false'"/></xsl:otherwise>
			  </xsl:choose>
		</xsl:variable>
		<xsl:variable name="facultystaff">
			  <xsl:choose>
				  <xsl:when test="contains($options-used, 'faculty')"><xsl:value-of select="'F'"/></xsl:when>
				  <xsl:when test="contains($options-used, 'staff')"><xsl:value-of select="'S'"/></xsl:when>
				  <xsl:otherwise><xsl:value-of select="'all'"/></xsl:otherwise>
			  </xsl:choose>
		</xsl:variable>		
		<xsl:variable name="layout" select="if(contains($options-used, 'text')) then 'text' else if(contains($options-used, '1column')) then '1column' else if(contains($options-used, '2column')) then '2column' else if(contains($options-used, '3column')) then '3column' else if(contains($options-used, '4column')) then '4column' else if(contains($options-used, 'table')) then 'table' else 'thumbnail' " />	
		<xsl:variable name="noprofile" select="if(contains($options-used, 'noprofile')) then 'noprofile' else '' " />
		<xsl:variable name="showdegree" select="if(contains($options-used, 'showdegree')) then 'showdegree' else '' " />
		<xsl:variable name="notitle" select="if(contains($options-used, 'notitle')) then 'notitle' else '' " />
		<xsl:variable name="nooffice" select="if(contains($options-used, 'nooffice')) then 'nooffice' else '' " />
		<xsl:variable name="nophone" select="if(contains($options-used, 'nophone')) then 'nophone' else '' " />
		<xsl:variable name="noemail" select="if(contains($options-used, 'noemail')) then 'noemail' else '' " />
		<xsl:variable name="nofocus" select="if(contains($options-used, 'nofocus')) then 'nofocus' else '' " />
   		<div class="container-flex row-alt">
			<xsl:choose>
                    <xsl:when test="$ou:action = 'pub'">
                      <xsl:text disable-output-escaping="yes">&lt;%</xsl:text>                                                                                                
                        Response.Write(OUC.GetProfiles.displaySnippetListing("<xsl:value-of select="ou:textual-content(tbody/tr/td[1]/node())"/>", @"<xsl:value-of select="ou:textual-content(tbody/tr/td[2]/node())"/>", @"<xsl:value-of select="ou:textual-content(tbody/tr/td[3]/node())"/>", "<xsl:value-of select="$layout"/>", <xsl:value-of select="$azindex"/>, "<xsl:value-of select="$facultystaff"/>", "<xsl:value-of select="concat($notitle,$nooffice,$nophone,$noemail,$nofocus,$showdegree,$noprofile)"/>", <xsl:value-of select="$sortmanual"/>));                
                      <xsl:text disable-output-escaping="yes">%&gt;</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>Directory data to appear on publish</xsl:otherwise>
             </xsl:choose>
		</div>
	 </xsl:template>

	
<!-- FGCUTEAM Mike [Testimonials] Faculty Staff Grid -->
	<xsl:template match="table[@class='ou-faculty-staff-grid']">
	<xsl:variable name="layout" select="if(contains(lower-case(ou:textual-content(thead/tr[1]/th[1]/node())), 'text')) then '24' else '14' " />
   <div class="container-flex row-alt">
	   <xsl:choose>
      <!-- End faculty fixed info -->
      <xsl:when test="contains(lower-case(ou:textual-content(thead/tr[1]/th[1]/node())), 'open')">
         <!-- Begin faculty opened info -->
         <xsl:for-each select="tbody/tr">
			 <xsl:variable name="modal-id" select="generate-id(.)"/>
            <div class="col-xs-12 facultystaffcontainer">
                <xsl:if test="$layout = '14'"><div class="col-md-10"><span><img src="{td[1]/descendant::img/@src}" alt="{td[1]/descendant::img/@alt}" width="200" height="200" /></span></div></xsl:if>
               <div class="col-md-{$layout}">
                  <div style="">
                     <xsl:if test="contains(ou:textual-content(td[7]/node()), 'Modal')">
                        <div class="modal" id="modal-id-{replace(ou:textual-content(td[2]/node()), '[^a-zA-Z0-9]', '')}-{$modal-id}" role="dialog" aria-hidden="true" style="display: none;" tabindex="-1">
                           <div class="modal-dialog">
                              <div class="modal-content">
                                 <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">×</button>
                                    <p class="modal-title h4">
                                       <xsl:apply-templates select="td[2]/descendant::a/text()"/>
                                    </p>
                                 </div>
                                 <div class="modal-body">
                                    <xsl:apply-templates select="td[8]/node()"/>
                                 </div>
                                 <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div>
                           <span>
                              <strong>
                                 <a data-remote="false" data-toggle="modal" data-target="#modal-id-{replace(ou:textual-content(td[2]/node()), '[^a-zA-Z0-9]', '')}-{$modal-id}" href="#">
                                    <xsl:value-of select="td[2]/node()"/>
                                 </a>
                              </strong>
                           </span>
                        </div>
                     </xsl:if>
                     <xsl:if test="contains(ou:textual-content(td[7]/node()), 'Link')">
                        <div>
                           <span>
                              <strong>
                                 <xsl:apply-templates select="td[2]/node()"/>
                              </strong>
                           </span>
                        </div>
                     </xsl:if>
                     <xsl:if test="not(contains(ou:textual-content(td[7]/node()), 'Link')) and not(contains(ou:textual-content(td[7]/node()), 'Modal'))">
                        <div>
                           <span>
                              <strong>
                                 <xsl:value-of select="td[2]/node()"/>
                              </strong>
                           </span>
                        </div>
                     </xsl:if>
                     <div>
                        <xsl:apply-templates select="td[3]/node()"/>
                     </div>
                     <div>
                        <xsl:apply-templates select="td[4]/node()"/>
                     </div>
                     <div>
                        <xsl:apply-templates select="td[5]/node()"/>
                     </div>
                     <div>
                        <xsl:apply-templates select="td[6]/node()"/>
                     </div>
                  </div>
               </div>
            </div>
         </xsl:for-each>
      </xsl:when>
	  <xsl:otherwise>
	         <!-- <xsl:if test="contains(lower-case(ou:textual-content(thead/tr[1]/th[1]/node())), 'fixed')"> -->
         <!-- Begin faculty fixed info -->
         <xsl:for-each select="tbody/tr">
			 <xsl:variable name="modal-id" select="generate-id(.)"/>
            <div class="col-xs-12 facultystaffcontainer">
               <xsl:if test="$layout = '14'"><div class="col-md-10"><span><img src="{td[1]/descendant::img/@src}" alt="{td[1]/descendant::img/@alt}" width="200" height="200" /></span></div></xsl:if>
               <div class="col-md-{$layout}">
                  <div style="">
                     <xsl:if test="contains(ou:textual-content(td[7]/node()), 'Modal')">
                        <div class="modal" id="modal-id-{replace(ou:textual-content(td[2]/node()), '[^a-zA-Z0-9]', '')}-{$modal-id}" role="dialog" aria-hidden="true" style="display: none;" tabindex="-1">
                           <div class="modal-dialog">
                              <div class="modal-content">
                                 <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">×</button>
                                    <p class="modal-title h4">
                                       <xsl:apply-templates select="td[2]/descendant::a/text()"/>
                                    </p>
                                 </div>
                                 <div class="modal-body">
                                    <xsl:apply-templates select="td[8]/node()"/>
                                 </div>
                                 <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div>
                           <span>
                              <strong>
                                 <a data-remote="false" data-toggle="modal" data-target="#modal-id-{replace(ou:textual-content(td[2]/node()), '[^a-zA-Z0-9]', '')}-{$modal-id}" href="#">
                                    <xsl:value-of select="td[2]/node()"/>
                                 </a>
                              </strong>
                           </span>
                        </div>
                     </xsl:if>
                     <xsl:if test="contains(ou:textual-content(td[7]/node()), 'Link')">
                        <div>
                           <span>
                              <strong>
                                 <xsl:apply-templates select="td[2]/node()"/>
                              </strong>
                           </span>
                        </div>
                     </xsl:if>
                     <xsl:if test="not(contains(ou:textual-content(td[7]/node()), 'Link')) and not(contains(ou:textual-content(td[7]/node()), 'Modal'))">
                        <div>
                           <span>
                              <strong>
                                 <xsl:value-of select="td[2]/node()"/>
                              </strong>
                           </span>
                        </div>
                     </xsl:if>
					  <xsl:if test="ou:textual-content(td[3]/node()) != ''">
                     <div>
                        <span>
                           <xsl:value-of select="td[3]/node()"/>
                        </span>
                     </div>
					  </xsl:if>
					  <xsl:if test="ou:textual-content(td[4]/node()) != ''">
                     <div>
                        <span class="officelocation">
                           <strong>Office:&nbsp;</strong>
                           <span>
                              <span>
                                 <xsl:value-of select="td[4]/node()"/>
                              </span>
                           </span>
                        </span>
						</div>
					  </xsl:if>
					  <xsl:if test="ou:textual-content(td[5]/node()) != ''">
					  	<div>
                        <span class="officephone">
                           <strong>Phone:&nbsp;</strong>
                           <xsl:value-of select="td[5]/node()"/>
                        </span>
                     </div>
					  </xsl:if>
					  <xsl:if test="ou:textual-content(td[6]/node()) != ''">
                     <div>
                        <strong><span class="officeemail">E-mail:&nbsp;</span></strong>
                        <xsl:apply-templates select="td[6]/node()"/>
                     </div>
					 </xsl:if>
                  </div>
               </div>
            </div>
         </xsl:for-each>
        </xsl:otherwise>
	   </xsl:choose>
      <!-- End faculty opened info -->
   </div>
</xsl:template>
	
	<!-- FGCUTEAM Mike [Text] 2/3 + 1/3 Container -->
	<xsl:template match="table[@class='ou-twothirds-onethirds-container']">
	
	<xsl:for-each select="tbody/tr">
	<div class="container-flex row">
		<xsl:if test="contains(ou:textual-content(../../thead/tr/th[1]/node()), '1/3')">
			<div class="col-sm-8 twothirds">
			<xsl:apply-templates select="td[1]/node()"/>
			</div>	
			<div class="col-sm-16">
			<xsl:apply-templates select="td[2]/node()"/>
			</div>
		</xsl:if>
		<xsl:if test="contains(ou:textual-content(../../thead/tr/th[1]/node()), '2/3')">
			<div class="col-sm-16 twothirds">
			<xsl:apply-templates select="td[1]/node()"/>
			</div>	
			<div class="col-sm-8">
			<xsl:apply-templates select="td[2]/node()"/>
			</div>
		</xsl:if>
	</div>
	</xsl:for-each>
  	</xsl:template>
	
	<!-- FGCUTEAM Mike [Text] 3/4 + 1/4 Container -->
	<xsl:template match="table[@class='ou-threefourths-onefourth-container']">
	
	<xsl:for-each select="tbody/tr">
	<div class="container-flex row">
		<xsl:if test="contains(ou:textual-content(../../thead/tr/th[1]/node()), '1/4')">
			<div class="col-sm-6 twothirds">
			<xsl:apply-templates select="td[1]/node()"/>
			</div>	
			<div class="col-sm-18">
			<xsl:apply-templates select="td[2]/node()"/>
			</div>
		</xsl:if>
		<xsl:if test="contains(ou:textual-content(../../thead/tr/th[1]/node()), '3/4')">
			<div class="col-sm-18 twothirds">
			<xsl:apply-templates select="td[1]/node()"/>
			</div>	
			<div class="col-sm-6">
			<xsl:apply-templates select="td[2]/node()"/>
			</div>
		</xsl:if>
	</div>
	</xsl:for-each>
  	</xsl:template>

	<!-- FGCUTEAM Mike Simple CTA box Grid -->
	<xsl:template match="table[@class='ou-simple-box-grid']">
	<div class="container">
               <div class="cta-box-grid">
                  <div>
					  <div class="row">
					 	<xsl:for-each select="tbody/tr">
							<div class="col-sm-{normalize-space(ou:textual-content(td[1]/node()))}">
								<xsl:choose>
									<xsl:when test="td[5]/descendant::a/@href">
										<a href="{td[5]/descendant::a/@href}">
											<div class="hover-gray-background">
												<img src="{td[2]/descendant::img/@src}" alt="{td[2]/descendant::img/@alt}"></img>
												<div class="lower-content-grid">
													<p><xsl:apply-templates select="td[3]/node()"/></p>
													<div class="simple-box-description"><xsl:apply-templates select="td[4]/node()"/></div>
												</div>
											</div>
										</a>
									</xsl:when>
									<xsl:otherwise>
										<div>
												<img src="{td[2]/descendant::img/@src}" alt="{td[2]/descendant::img/@alt}"></img>
												<div class="lower-content-grid">
													<p><xsl:apply-templates select="td[3]/node()"/></p>
													<div class="simple-box-description"><xsl:apply-templates select="td[4]/node()"/></div>
												</div>
										</div>
									</xsl:otherwise>
								</xsl:choose>    
							</div>
							
						 
					  </xsl:for-each>
                  	</div>
					</div>
               </div>
            </div>
	</xsl:template> 

  <!-- FGCUTEAM Mike Featured 4 up -->
    <xsl:template match="table[@class='ou-featured-4up']">
    <section class="living-laboratory">
      <div class="row container">
		<div class="col-sm-12">
			<div class="col-sm-12">
			  <div class="thumbnail">
				<xsl:apply-templates select="tbody/tr[1]/td[1]/descendant::img[1]"/>
			  </div>
			  </div>
			  <div class="col-sm-12">
			  <div class="content">
				<xsl:apply-templates select="tbody/tr[2]/td[1]/node()"/>
			  </div>
			</div>
		</div>
		<div class="col-sm-12">
			<div class="col-sm-12">
			  <div class="thumbnail">
				<xsl:apply-templates select="tbody/tr[1]/td[2]/descendant::img[1]"/>
			  </div>
			  </div>
			  <div class="col-sm-12">
			  <div class="content">
				<xsl:apply-templates select="tbody/tr[2]/td[2]/node()"/>
			  </div>
			</div>
		</div>	
      </div>
    </section>
  </xsl:template>
	
	<!-- FGCUTEAM Mike Card Box 3 Column -->
	<xsl:template match="table[@class='ou-cardbox-3column']">
	<div class="container-flex">
               <div class="row-alt">
				  <xsl:for-each select="tbody/tr">
					  
				<xsl:if test="contains(ou:textual-content(td[2]/node()), 'N')">
                            <div class="cardbox-container col-sm-8">
                     <a href="{td[3]/descendant::a/@href}" target="{td[3]/descendant::a/@target}">
                        <div class="cardboxbg">
                           <div class="cardbox ">
                              <p class="statement-text"><strong><xsl:if test="ou:textual-content(td[4]/node()) != ''"><xsl:apply-templates select="td[4]/node()"/></xsl:if></strong></p>
                              <p><xsl:value-of select="td[5]/node()"/></p>
							   
							   <xsl:if test="ou:textual-content(td[6]/node()) != ''">
							   		<p class="link-arrow white"><xsl:value-of select="td[6]/node()"/></p> 
							   </xsl:if>
							   
                           </div>
							<xsl:if test="contains(ou:textual-content(td[1]/node()), '1')">
                           <div class="card-colour colour-1"></div>
							</xsl:if>
							<xsl:if test="contains(ou:textual-content(td[1]/node()), '2')">
                           <div class="card-colour colour-2"></div>
							</xsl:if>
							<xsl:if test="contains(ou:textual-content(td[1]/node()), '3')">
                           <div class="card-colour colour-3"></div>
							</xsl:if>
							<xsl:if test="contains(ou:textual-content(td[1]/node()), '4')">
                           <div class="card-colour colour-4"></div>
							</xsl:if>
							<xsl:if test="contains(ou:textual-content(td[1]/node()), '5')">
                           <div class="card-colour colour-5"></div>
							</xsl:if>
							<xsl:if test="contains(ou:textual-content(td[1]/node()), '6')">
                           <div class="card-colour colour-6"></div>
							</xsl:if>
							<xsl:if test="contains(ou:textual-content(td[1]/node()), '7')">
                           <div class="card-colour colour-7"></div>
							</xsl:if>
							<xsl:if test="contains(ou:textual-content(td[1]/node()), '8')">
                           <div class="card-colour colour-8"></div>
							</xsl:if>
                        </div></a>
                  </div>
				</xsl:if>
				
					  				<xsl:if test="contains(ou:textual-content(td[2]/node()), 'Y')">
                            <div class="cardbox-container col-sm">
                     <a href="{td[3]/descendant::a/@href}"  target="{td[3]/descendant::a/@target}">
                        <div class="cardboxbg">
                           <div class="cardbox ">                              
							   <xsl:if test="ou:textual-content(td[4]/node()) != ''"><xsl:apply-templates select="td[4]/node()"/></xsl:if>
                              <p><xsl:value-of select="td[5]/node()"/></p>
							   
							   <xsl:if test="ou:textual-content(td[6]/node()) != ''">
							   		<p class="link-arrow white"><xsl:value-of select="td[6]/node()"/></p> 
							   </xsl:if>
							   
                           </div>
							<xsl:if test="contains(ou:textual-content(td[1]/node()), '1')">
                           <div class="card-colour colour-1"></div>
							</xsl:if>
							<xsl:if test="contains(ou:textual-content(td[1]/node()), '2')">
                           <div class="card-colour colour-2"></div>
							</xsl:if>
							<xsl:if test="contains(ou:textual-content(td[1]/node()), '3')">
                           <div class="card-colour colour-3"></div>
							</xsl:if>
							<xsl:if test="contains(ou:textual-content(td[1]/node()), '4')">
                           <div class="card-colour colour-4"></div>
							</xsl:if>
							<xsl:if test="contains(ou:textual-content(td[1]/node()), '5')">
                           <div class="card-colour colour-5"></div>
							</xsl:if>
							<xsl:if test="contains(ou:textual-content(td[1]/node()), '6')">
                           <div class="card-colour colour-6"></div>
							</xsl:if>
                        </div></a>
                  </div>
				</xsl:if>
				   </xsl:for-each>
               </div>
            </div>
	</xsl:template>
	
	<!-- Backend|ASPX Code -->
	<!-- There is a conflict with indentation in the xsl:output config, only possible way is disable indent on the output or use the <pre> tag or <script> tag
        To avoid this parameters with text value can use whitespace html character if posible to prevent words separation by the transformation i.e.: "Health&nbsp;/&nbsp;Wellness&nbsp;/&nbsp;Biological&nbsp;Sciences"
		http://saxon.sourceforge.net/saxon7.3/xsl-elements.html -->
	<xsl:template match="table[@class='ou-backendaspx-code']">
		<!--<pre class="backendaspx-code" style="visibility: hidden;"> -->
		<xsl:text disable-output-escaping="yes">&lt;%</xsl:text>
		<xsl:value-of select="tbody/tr/td[1]" />
		<xsl:text disable-output-escaping="yes">%&gt;</xsl:text>
		<!-- </pre> -->
	</xsl:template>
	
 <!-- [Admin] Admin Billboard -->
<xsl:template match="table[@class='ou-admin-billboard']">

    <!-- Unique Class to Target this snippet for Local CSS-->
    <xsl:variable name="Billboard-Unique-Class" select="caption[2]/node()"/>

    <!-- Billboard Parameters -->
    <xsl:variable name="Billboard-Pad-Top" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-billboard']/tbody/tr[1]/td[2]/node()"/>
    <xsl:variable name="Billboard-Pad-Bot" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-billboard']/tbody/tr[2]/td[2]/node()"/>
    <xsl:variable name="Billboard-Pad-Lef" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-billboard']/tbody/tr[3]/td[2]/node()"/>
    <xsl:variable name="Billboard-Pad-Rig" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-billboard']/tbody/tr[4]/td[2]/node()"/>
    <xsl:variable name="Billboard-Bg-Pos-X" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-billboard']/tbody/tr[5]/td[2]/node()"/>
    <xsl:variable name="Billboard-Bg-Pos-Y" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-billboard']/tbody/tr[6]/td[2]/node()"/>
    <xsl:variable name="Billboard-Bg-Color" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-billboard']/tbody/tr[7]/td[2]/node()"/>
    <xsl:variable name="Billboard-Text-Color" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-billboard']/tbody/tr[8]/td[2]/node()"/>

    <!-- All Columns Parameters -->
    <xsl:variable name="Column-Pad-Top" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-column']/tbody/tr[1]/td[2]/node()"/>
    <xsl:variable name="Column-Pad-Bot" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-column']/tbody/tr[2]/td[2]/node()"/>
    <xsl:variable name="Column-Pad-Lef" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-column']/tbody/tr[3]/td[2]/node()"/>
    <xsl:variable name="Column-Pad-Rig" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-column']/tbody/tr[4]/td[2]/node()"/>
    <xsl:variable name="mobile-stack-order" select="if (contains(ou:textual-content(tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-column']/tbody/tr[5]/td[2]/node()), 'yes')) then 'display: flex;flex-direction: column-reverse;' else ''"/>

    <!-- Column 1 Parameters -->
    <xsl:variable name="Column1-Pad-Top" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-column']/tbody/tr[1]/td[3]/node()"/>
    <xsl:variable name="Column1-Pad-Bot" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-column']/tbody/tr[2]/td[3]/node()"/>
    <xsl:variable name="Column1-Pad-Lef" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-column']/tbody/tr[3]/td[3]/node()"/>
    <xsl:variable name="Column1-Pad-Rig" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-column']/tbody/tr[4]/td[3]/node()"/>

    <!-- Column 2 Parameters -->
    <xsl:variable name="Column2-Pad-Top" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-column']/tbody/tr[1]/td[4]/node()"/>
    <xsl:variable name="Column2-Pad-Bot" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-column']/tbody/tr[2]/td[4]/node()"/>
    <xsl:variable name="Column2-Pad-Lef" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-column']/tbody/tr[3]/td[4]/node()"/>
    <xsl:variable name="Column2-Pad-Rig" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-column']/tbody/tr[4]/td[4]/node()"/>

    <!-- All Headings Parameters -->
    <xsl:variable name="Heading2-Marg-Top" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-heading']/tbody/tr[1]/td[2]/node()"/>
    <xsl:variable name="Heading2-Marg-Bot" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-heading']/tbody/tr[2]/td[2]/node()"/>
    <xsl:variable name="Heading3-Marg-Top" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-heading']/tbody/tr[3]/td[2]/node()"/>
    <xsl:variable name="Heading3-Marg-Bot" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-heading']/tbody/tr[4]/td[2]/node()"/>
    <xsl:variable name="Heading4-Marg-Top" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-heading']/tbody/tr[5]/td[2]/node()"/>
    <xsl:variable name="Heading4-Marg-Bot" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-heading']/tbody/tr[6]/td[2]/node()"/>
    <xsl:variable name="Heading5-Marg-Top" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-heading']/tbody/tr[7]/td[2]/node()"/>
    <xsl:variable name="Heading5-Marg-Bot" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-heading']/tbody/tr[8]/td[2]/node()"/>
    <xsl:variable name="Heading6-Marg-Top" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-heading']/tbody/tr[9]/td[2]/node()"/>
    <xsl:variable name="Heading6-Marg-Bot" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-heading']/tbody/tr[10]/td[2]/node()"/>

    <!-- Col 1 Headings Parameters -->
    <xsl:variable name="Col1-Heading2-Marg-Top" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-heading']/tbody/tr[1]/td[3]/node()"/>
    <xsl:variable name="Col1-Heading2-Marg-Bot" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-heading']/tbody/tr[2]/td[3]/node()"/>
    <xsl:variable name="Col1-Heading3-Marg-Top" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-heading']/tbody/tr[3]/td[3]/node()"/>
    <xsl:variable name="Col1-Heading3-Marg-Bot" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-heading']/tbody/tr[4]/td[3]/node()"/>
    <xsl:variable name="Col1-Heading4-Marg-Top" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-heading']/tbody/tr[5]/td[3]/node()"/>
    <xsl:variable name="Col1-Heading4-Marg-Bot" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-heading']/tbody/tr[6]/td[3]/node()"/>
    <xsl:variable name="Col1-Heading5-Marg-Top" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-heading']/tbody/tr[7]/td[3]/node()"/>
    <xsl:variable name="Col1-Heading5-Marg-Bot" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-heading']/tbody/tr[8]/td[3]/node()"/>
    <xsl:variable name="Col1-Heading6-Marg-Top" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-heading']/tbody/tr[9]/td[3]/node()"/>
    <xsl:variable name="Col1-Heading6-Marg-Bot" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-heading']/tbody/tr[10]/td[3]/node()"/>

    <!-- Col 2 Headings Parameters -->
    <xsl:variable name="Col2-Heading2-Marg-Top" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-heading']/tbody/tr[1]/td[4]/node()"/>
    <xsl:variable name="Col2-Heading2-Marg-Bot" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-heading']/tbody/tr[2]/td[4]/node()"/>
    <xsl:variable name="Col2-Heading3-Marg-Top" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-heading']/tbody/tr[3]/td[4]/node()"/>
    <xsl:variable name="Col2-Heading3-Marg-Bot" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-heading']/tbody/tr[4]/td[4]/node()"/>
    <xsl:variable name="Col2-Heading4-Marg-Top" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-heading']/tbody/tr[5]/td[4]/node()"/>
    <xsl:variable name="Col2-Heading4-Marg-Bot" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-heading']/tbody/tr[6]/td[4]/node()"/>
    <xsl:variable name="Col2-Heading5-Marg-Top" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-heading']/tbody/tr[7]/td[4]/node()"/>
    <xsl:variable name="Col2-Heading5-Marg-Bot" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-heading']/tbody/tr[8]/td[4]/node()"/>
    <xsl:variable name="Col2-Heading6-Marg-Top" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-heading']/tbody/tr[9]/td[4]/node()"/>
    <xsl:variable name="Col2-Heading6-Marg-Bot" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-heading']/tbody/tr[10]/td[4]/node()"/>

    <!-- All Paragraphs Parameters -->
    <xsl:variable name="Paragraph-Marg-Top" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-paragraph']/tbody/tr[1]/td[2]/node()"/>
    <xsl:variable name="Paragraph-Marg-Bot" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-paragraph']/tbody/tr[2]/td[2]/node()"/>
    <xsl:variable name="Paragraph2-Marg-Top" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-paragraph']/tbody/tr[3]/td[2]/node()"/>
    <xsl:variable name="Paragraph2-Marg-Bot" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-paragraph']/tbody/tr[4]/td[2]/node()"/>
    <xsl:variable name="Paragraph3-Marg-Top" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-paragraph']/tbody/tr[5]/td[2]/node()"/>
    <xsl:variable name="Paragraph3-Marg-Bot" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-paragraph']/tbody/tr[6]/td[2]/node()"/>
    <xsl:variable name="Paragraph4-Marg-Top" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-paragraph']/tbody/tr[7]/td[2]/node()"/>
    <xsl:variable name="Paragraph4-Marg-Bot" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-paragraph']/tbody/tr[8]/td[2]/node()"/>
    <xsl:variable name="Paragraph5-Marg-Top" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-paragraph']/tbody/tr[9]/td[2]/node()"/>
    <xsl:variable name="Paragraph5-Marg-Bot" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-paragraph']/tbody/tr[10]/td[2]/node()"/>

    <!-- Col 1 Paragraphs Parameters -->
    <xsl:variable name="Col1-Paragraph-Marg-Top" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-paragraph']/tbody/tr[1]/td[3]/node()"/>
    <xsl:variable name="Col1-Paragraph-Marg-Bot" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-paragraph']/tbody/tr[2]/td[3]/node()"/>
    <xsl:variable name="Col1-Paragraph2-Marg-Top" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-paragraph']/tbody/tr[3]/td[3]/node()"/>
    <xsl:variable name="Col1-Paragraph2-Marg-Bot" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-paragraph']/tbody/tr[4]/td[3]/node()"/>
    <xsl:variable name="Col1-Paragraph3-Marg-Top" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-paragraph']/tbody/tr[5]/td[3]/node()"/>
    <xsl:variable name="Col1-Paragraph3-Marg-Bot" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-paragraph']/tbody/tr[6]/td[3]/node()"/>
    <xsl:variable name="Col1-Paragraph4-Marg-Top" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-paragraph']/tbody/tr[7]/td[3]/node()"/>
    <xsl:variable name="Col1-Paragraph4-Marg-Bot" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-paragraph']/tbody/tr[8]/td[3]/node()"/>
    <xsl:variable name="Col1-Paragraph5-Marg-Top" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-paragraph']/tbody/tr[9]/td[3]/node()"/>
    <xsl:variable name="Col1-Paragraph5-Marg-Bot" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-paragraph']/tbody/tr[10]/td[3]/node()"/>

    <!-- Col 2 Paragraphs Parameters -->
    <xsl:variable name="Col2-Paragraph-Marg-Top" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-paragraph']/tbody/tr[1]/td[4]/node()"/>
    <xsl:variable name="Col2-Paragraph-Marg-Bot" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-paragraph']/tbody/tr[2]/td[4]/node()"/>
    <xsl:variable name="Col2-Paragraph2-Marg-Top" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-paragraph']/tbody/tr[3]/td[4]/node()"/>
    <xsl:variable name="Col2-Paragraph2-Marg-Bot" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-paragraph']/tbody/tr[4]/td[4]/node()"/>
    <xsl:variable name="Col2-Paragraph3-Marg-Top" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-paragraph']/tbody/tr[5]/td[4]/node()"/>
    <xsl:variable name="Col2-Paragraph3-Marg-Bot" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-paragraph']/tbody/tr[6]/td[4]/node()"/>
    <xsl:variable name="Col2-Paragraph4-Marg-Top" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-paragraph']/tbody/tr[7]/td[4]/node()"/>
    <xsl:variable name="Col2-Paragraph4-Marg-Bot" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-paragraph']/tbody/tr[8]/td[4]/node()"/>
    <xsl:variable name="Col2-Paragraph5-Marg-Top" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-paragraph']/tbody/tr[9]/td[4]/node()"/>
    <xsl:variable name="Col2-Paragraph5-Marg-Bot" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-paragraph']/tbody/tr[10]/td[4]/node()"/>

    <!-- All Image Parameters -->
    <xsl:variable name="Img-Marg-Top" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-image']/tbody/tr[1]/td[2]/node()"/>
    <xsl:variable name="Img-Marg-Bot" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-image']/tbody/tr[2]/td[2]/node()"/>
    <xsl:variable name="Img-Marg-Lef" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-image']/tbody/tr[3]/td[2]/node()"/>
    <xsl:variable name="Img-Marg-Rig" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-image']/tbody/tr[4]/td[2]/node()"/>

    <!-- Col 1 Image Parameters -->
    <xsl:variable name="Img1-Marg-Top" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-image']/tbody/tr[1]/td[3]/node()"/>
    <xsl:variable name="Img1-Marg-Bot" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-image']/tbody/tr[2]/td[3]/node()"/>
    <xsl:variable name="Img1-Marg-Lef" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-image']/tbody/tr[3]/td[3]/node()"/>
    <xsl:variable name="Img1-Marg-Rig" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-image']/tbody/tr[4]/td[3]/node()"/>

    <!-- Col 2 Image Parameters -->
    <xsl:variable name="Img2-Marg-Top" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-image']/tbody/tr[1]/td[4]/node()"/>
    <xsl:variable name="Img2-Marg-Bot" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-image']/tbody/tr[2]/td[4]/node()"/>
    <xsl:variable name="Img2-Marg-Lef" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-image']/tbody/tr[3]/td[4]/node()"/>
    <xsl:variable name="Img2-Marg-Rig" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-image']/tbody/tr[4]/td[4]/node()"/>

    <!-- All button Parameters -->
    <xsl:variable name="Btn-Marg-Top" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-button']/tbody/tr[1]/td[2]/node()"/>
    <xsl:variable name="Btn-Marg-Bot" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-button']/tbody/tr[2]/td[2]/node()"/>
    <xsl:variable name="Btn-Marg-Lef" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-button']/tbody/tr[3]/td[2]/node()"/>
    <xsl:variable name="Btn-Marg-Rig" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-button']/tbody/tr[4]/td[2]/node()"/>

    <!-- Col 1 button Parameters -->
    <xsl:variable name="Btn1-Marg-Top" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-button']/tbody/tr[1]/td[3]/node()"/>
    <xsl:variable name="Btn1-Marg-Bot" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-button']/tbody/tr[2]/td[3]/node()"/>
    <xsl:variable name="Btn1-Marg-Lef" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-button']/tbody/tr[3]/td[3]/node()"/>
    <xsl:variable name="Btn1-Marg-Rig" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-button']/tbody/tr[4]/td[3]/node()"/>

    <!-- Col 2 button Parameters -->
    <xsl:variable name="Btn2-Marg-Top" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-button']/tbody/tr[1]/td[4]/node()"/>
    <xsl:variable name="Btn2-Marg-Bot" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-button']/tbody/tr[2]/td[4]/node()"/>
    <xsl:variable name="Btn2-Marg-Lef" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-button']/tbody/tr[3]/td[4]/node()"/>
    <xsl:variable name="Btn2-Marg-Rig" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-button']/tbody/tr[4]/td[4]/node()"/>

    <!-- Extra CSS Parameters -->
    <xsl:variable name="Admin-Extra-CSS" select="tbody/tr[2]/td[1]/table[@class='ou-admin-customizer-extra']/tbody/tr[1]/td[1]/node()"/>

    <style>.admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/>{color: <xsl:value-of select="$Billboard-Text-Color"/>; background-color: <xsl:value-of select="$Billboard-Bg-Color"/>;padding-top: <xsl:value-of select="$Billboard-Pad-Top"/>;padding-bottom: <xsl:value-of select="$Billboard-Pad-Bot"/>;padding-left: <xsl:value-of select="$Billboard-Pad-Lef"/>;padding-right: <xsl:value-of select="$Billboard-Pad-Rig"/>;background-position-x: <xsl:value-of select="$Billboard-Bg-Pos-X"/>;background-position-y: <xsl:value-of select="$Billboard-Bg-Pos-Y"/>;background-size: cover;}
    @media (max-width: 767px){.admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex {<xsl:value-of select="$mobile-stack-order"/>;}}
    .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div {padding-top: <xsl:value-of select="$Column-Pad-Top"/>;padding-bottom: <xsl:value-of select="$Column-Pad-Bot"/>;padding-left: <xsl:value-of select="$Column-Pad-Lef"/>;padding-right: <xsl:value-of select="$Column-Pad-Rig"/>;}
    .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div:nth-child(1) {padding-top: <xsl:value-of select="$Column1-Pad-Top"/>;padding-bottom: <xsl:value-of select="$Column1-Pad-Bot"/>;padding-left: <xsl:value-of select="$Column1-Pad-Lef"/>;padding-right: <xsl:value-of select="$Column1-Pad-Rig"/>;}
    .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div:nth-child(2) {padding-top: <xsl:value-of select="$Column2-Pad-Top"/>;padding-bottom: <xsl:value-of select="$Column2-Pad-Bot"/>;padding-left: <xsl:value-of select="$Column2-Pad-Lef"/>;padding-right: <xsl:value-of select="$Column2-Pad-Rig"/>;}
    .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div img {margin-top: <xsl:value-of select="$Img-Marg-Top"/>;margin-bottom: <xsl:value-of select="$Img-Marg-Bot"/>;margin-left: <xsl:value-of select="$Img-Marg-Lef"/>;margin-right: <xsl:value-of select="$Img-Marg-Rig"/>;}
    .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div:nth-child(1) img {margin-top: <xsl:value-of select="$Img1-Marg-Top"/>;margin-bottom: <xsl:value-of select="$Img1-Marg-Bot"/>;margin-left: <xsl:value-of select="$Img1-Marg-Lef"/>;margin-right: <xsl:value-of select="$Img1-Marg-Rig"/>;}
    .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div:nth-child(2) img {margin-top: <xsl:value-of select="$Img2-Marg-Top"/>;margin-bottom: <xsl:value-of select="$Img2-Marg-Bot"/>;margin-left: <xsl:value-of select="$Img2-Marg-Lef"/>;margin-right: <xsl:value-of select="$Img2-Marg-Rig"/>;}
    .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div a.button {margin-top: <xsl:value-of select="$Btn-Marg-Top"/>;margin-bottom: <xsl:value-of select="$Btn-Marg-Bot"/>;margin-left: <xsl:value-of select="$Btn-Marg-Lef"/>;margin-right: <xsl:value-of select="$Btn-Marg-Rig"/>;}
    .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div:nth-child(1) a.button {margin-top: <xsl:value-of select="$Btn1-Marg-Top"/>;margin-bottom: <xsl:value-of select="$Btn1-Marg-Bot"/>;margin-left: <xsl:value-of select="$Btn1-Marg-Lef"/>;margin-right: <xsl:value-of select="$Btn1-Marg-Rig"/>;}
    .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div:nth-child(2) a.button {margin-top: <xsl:value-of select="$Btn2-Marg-Top"/>;margin-bottom: <xsl:value-of select="$Btn2-Marg-Bot"/>;margin-left: <xsl:value-of select="$Btn2-Marg-Lef"/>;margin-right: <xsl:value-of select="$Btn2-Marg-Rig"/>;}
    
    .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div h2, .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div .h2, .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex h2, .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex .h2 {color: <xsl:value-of select="$Billboard-Text-Color"/>;margin-top: <xsl:value-of select="$Heading2-Marg-Top"/>;margin-bottom: <xsl:value-of select="$Heading2-Marg-Bot"/>;}
    .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div:nth-child(1) h2, .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div:nth-child(1) .h2 {margin-top: <xsl:value-of select="$Col1-Heading2-Marg-Top"/>;margin-bottom: <xsl:value-of select="$Col1-Heading2-Marg-Bot"/>;}
    .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div:nth-child(2) h2, .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div:nth-child(2) .h2 {margin-top: <xsl:value-of select="$Col2-Heading2-Marg-Top"/>;margin-bottom: <xsl:value-of select="$Col2-Heading2-Marg-Bot"/>;}
    .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div h3, .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div .h3, .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex h3, .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex .h3 {color: <xsl:value-of select="$Billboard-Text-Color"/>;margin-top: <xsl:value-of select="$Heading3-Marg-Top"/>;margin-bottom: <xsl:value-of select="$Heading3-Marg-Bot"/>;}
    .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div:nth-child(1) h3, .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div:nth-child(1) .h3 {margin-top: <xsl:value-of select="$Col1-Heading3-Marg-Top"/>;margin-bottom: <xsl:value-of select="$Col1-Heading3-Marg-Bot"/>;}
    .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div:nth-child(2) h3, .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div:nth-child(2) .h3 {margin-top: <xsl:value-of select="$Col2-Heading3-Marg-Top"/>;margin-bottom: <xsl:value-of select="$Col2-Heading3-Marg-Bot"/>;}
    .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div h4, .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div .h4, .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex h4, .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex .h4 {color: <xsl:value-of select="$Billboard-Text-Color"/>;margin-top: <xsl:value-of select="$Heading4-Marg-Top"/>;margin-bottom: <xsl:value-of select="$Heading4-Marg-Bot"/>;}
    .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div:nth-child(1) h4, .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div:nth-child(1) .h4 {margin-top: <xsl:value-of select="$Col1-Heading4-Marg-Top"/>;margin-bottom: <xsl:value-of select="$Col1-Heading4-Marg-Bot"/>;}
    .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div:nth-child(2) h4, .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div:nth-child(2) .h4 {margin-top: <xsl:value-of select="$Col2-Heading4-Marg-Top"/>;margin-bottom: <xsl:value-of select="$Col2-Heading4-Marg-Bot"/>;}
    .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div h5, .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div .h5, .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex h5, .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex .h5  {color: <xsl:value-of select="$Billboard-Text-Color"/>;margin-top: <xsl:value-of select="$Heading5-Marg-Top"/>;margin-bottom: <xsl:value-of select="$Heading5-Marg-Bot"/>;}
    .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div:nth-child(1) h5, .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div:nth-child(1) .h5 {margin-top: <xsl:value-of select="$Col1-Heading5-Marg-Top"/>;margin-bottom: <xsl:value-of select="$Col1-Heading5-Marg-Bot"/>;}
    .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div:nth-child(2) h5, .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div:nth-child(2) .h5 {margin-top: <xsl:value-of select="$Col2-Heading5-Marg-Top"/>;margin-bottom: <xsl:value-of select="$Col2-Heading5-Marg-Bot"/>;}
    .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div h6, .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div .h6, .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex h6, .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex .h6 {color: <xsl:value-of select="$Billboard-Text-Color"/>;margin-top: <xsl:value-of select="$Heading6-Marg-Top"/>;margin-bottom: <xsl:value-of select="$Heading6-Marg-Bot"/>;}
    .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div:nth-child(1) h6, .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div:nth-child(1) .h6 {margin-top: <xsl:value-of select="$Col1-Heading6-Marg-Top"/>;margin-bottom: <xsl:value-of select="$Col1-Heading6-Marg-Bot"/>;}
    .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div:nth-child(2) h6, .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div:nth-child(2) .h6 {margin-top: <xsl:value-of select="$Col2-Heading6-Marg-Top"/>;margin-bottom: <xsl:value-of select="$Col2-Heading6-Marg-Bot"/>;}
    
    .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div p {margin-top: <xsl:value-of select="$Paragraph-Marg-Top"/>;margin-bottom: <xsl:value-of select="$Paragraph-Marg-Bot"/>;}
    .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div:nth-child(1) p {margin-top: <xsl:value-of select="$Col1-Paragraph-Marg-Top"/>;margin-bottom: <xsl:value-of select="$Col1-Paragraph-Marg-Bot"/>;}
    .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div:nth-child(2) p {margin-top: <xsl:value-of select="$Col2-Paragraph-Marg-Top"/>;margin-bottom: <xsl:value-of select="$Col2-Paragraph-Marg-Bot"/>;}
    .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div p:nth-child(2) {margin-top: <xsl:value-of select="$Paragraph2-Marg-Top"/>;margin-bottom: <xsl:value-of select="$Paragraph2-Marg-Bot"/>;}
    .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div:nth-child(1) p:nth-child(2) {margin-top: <xsl:value-of select="$Col1-Paragraph2-Marg-Top"/>;margin-bottom: <xsl:value-of select="$Col1-Paragraph2-Marg-Bot"/>;}
    .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div:nth-child(2) p:nth-child(2) {margin-top: <xsl:value-of select="$Col2-Paragraph2-Marg-Top"/>;margin-bottom: <xsl:value-of select="$Col2-Paragraph2-Marg-Bot"/>;}
    .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div p:nth-child(3) {margin-top: <xsl:value-of select="$Paragraph3-Marg-Top"/>;margin-bottom: <xsl:value-of select="$Paragraph3-Marg-Bot"/>;}
    .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div:nth-child(1) p:nth-child(3) {margin-top: <xsl:value-of select="$Col1-Paragraph3-Marg-Top"/>;margin-bottom: <xsl:value-of select="$Col1-Paragraph3-Marg-Bot"/>;}
    .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div:nth-child(2) p:nth-child(3) {margin-top: <xsl:value-of select="$Col2-Paragraph3-Marg-Top"/>;margin-bottom: <xsl:value-of select="$Col2-Paragraph3-Marg-Bot"/>;}
    .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div p:nth-child(4) {margin-top: <xsl:value-of select="$Paragraph4-Marg-Top"/>;margin-bottom: <xsl:value-of select="$Paragraph4-Marg-Bot"/>;}
    .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div:nth-child(1) p:nth-child(4) {margin-top: <xsl:value-of select="$Col1-Paragraph4-Marg-Top"/>;margin-bottom: <xsl:value-of select="$Col1-Paragraph4-Marg-Bot"/>;}
    .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div:nth-child(2) p:nth-child(4) {margin-top: <xsl:value-of select="$Col2-Paragraph4-Marg-Top"/>;margin-bottom: <xsl:value-of select="$Col2-Paragraph4-Marg-Bot"/>;}
    .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div p:nth-child(5) {margin-top: <xsl:value-of select="$Paragraph5-Marg-Top"/>;margin-bottom: <xsl:value-of select="$Paragraph5-Marg-Bot"/>;}
    .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div:nth-child(1) p:nth-child(5) {margin-top: <xsl:value-of select="$Col1-Paragraph5-Marg-Top"/>;margin-bottom: <xsl:value-of select="$Col1-Paragraph5-Marg-Bot"/>;}
    .admin-billboard.<xsl:value-of select="$Billboard-Unique-Class"/> div.container-flex div:nth-child(2) p:nth-child(5) {margin-top: <xsl:value-of select="$Col2-Paragraph5-Marg-Top"/>;margin-bottom: <xsl:value-of select="$Col2-Paragraph5-Marg-Bot"/>;}
    </style>
    <style>
    <xsl:value-of select="$Admin-Extra-CSS"/>
    </style>
	<section class="admin-billboard {$Billboard-Unique-Class}">
      <xsl:if test="tbody/tr[3]/td[1]/descendant::img">
        <xsl:attribute name="style">background-image: url('<xsl:value-of select="tbody/tr[3]/td[1]/descendant::img/@src"/>'); text-align:left; <xsl:value-of select="$Billboard-Text-Color" /> <xsl:value-of select="$Billboard-Bg-Color" /> </xsl:attribute>
      </xsl:if>      
        <xsl:apply-templates select="tbody/tr[1]/td[1]/node()"/>      
    </section>
	</xsl:template>
	
  <!-- [Global] AZ Index -->
  <xsl:template match="table[@class='ou-az-index']">
	<xsl:variable name="default-letter" select="ou:textual-content(tbody/tr/td[2]/node())" />
	<xsl:variable name="init-letter" select="ou:textual-content(tbody/tr/td[3]/node())" />
    <div class="container-flex az-index" data-default-letter="{$default-letter}" data-init-letter="{$init-letter}">		
      <xsl:apply-templates select="tbody/tr/td[1]/node()"/>
    </div>        
  </xsl:template>
	
  <!-- [Faculty Detail] Intro Text -->
  <xsl:template match="table[@class='ou-intro-text']">
    <div class="intro-text">
      <xsl:apply-templates select="tbody/tr/td[1]/node()"/>
    </div>        
  </xsl:template>

  <!-- For Progams ONLY template only -->
  <xsl:template match="table[@class='ou-program-only-intro-text']">
    <div class="statement-text">
      <xsl:apply-templates select="tbody/tr/td[1]/node()"/>
    </div>        
  </xsl:template>
  
  <!-- [Faculty Detail] Research and Teaching Interests -->
  <xsl:template match="table[@class='ou-research-and-teaching']">
    <div class="faculty-detail-categories">
      <div class="faculty-detail-category research-and-teaching-interests">
        <xsl:if test="ou:textual-content(tbody/tr/td[1]) != ''">
          <p class="h3"><xsl:value-of select="tbody/tr/td[1]/node()"/></p>
        </xsl:if>
        <xsl:apply-templates select="tbody/tr/td[2]/node()"/>
      </div>
    </div>
  </xsl:template>
  
  <!-- [Faculty Detail] Courses Offered -->
  <xsl:template match="table[@class='ou-courses-offered']">
    <div class="faculty-detail-categories">
      <div class="faculty-detail-category courses-offered">
        <xsl:if test="ou:textual-content(tbody/tr/td[1]) != ''">
          <p class="h3"><xsl:value-of select="tbody/tr/td[1]/node()"/></p>
        </xsl:if>
        <xsl:apply-templates select="tbody/tr/td[2]/node()"/>
      </div>   
    </div>
  </xsl:template>
  
  <!-- [Faculty Detail] Publications Accordion -->
  <xsl:template match="table[@class='ou-faculty-detail-accordion-publication']">
    <div class="faculty-detail-categories">
      <div class="faculty-detail-category publications">
        <xsl:if test="ou:textual-content(tbody/tr/td[1]) != ''">
          <p class="h3"><xsl:value-of select="tbody/tr/td[1]/node()"/></p>
        </xsl:if>
        <xsl:apply-templates select="tbody/tr/td[2]/node()"/>      
        <div class="more-content-container">
          <xsl:apply-templates select="tbody/tr/td[3]/node()"/>
        </div>
        <a href="#" class="more-content-button">More</a>
      </div>
    </div>
  </xsl:template>
  
  <!-- [Faculty Detail] Presentations Accordion -->
  <xsl:template match="table[@class='ou-faculty-detail-accordion-presentations']">
    <div class="faculty-detail-categories">
      <div class="faculty-detail-category conference-presentations">
        <xsl:if test="ou:textual-content(tbody/tr/td[1]) != ''">
          <p class="h3"><xsl:value-of select="tbody/tr/td[1]/node()"/></p>
        </xsl:if>
        <xsl:apply-templates select="tbody/tr/td[2]/node()"/>      
        <div class="more-content-container">
          <xsl:apply-templates select="tbody/tr/td[3]/node()"/>
        </div>
        <a href="#" class="more-content-button">More</a>
      </div>
    </div>
  </xsl:template>
  
  <!-- [Faculty Detail] Generic Category -->
  <xsl:template match="table[@class='ou-faculty-detail-category']">    
    <div class="faculty-detail-categories">
      <div class="faculty-detail-category">
        <xsl:if test="ou:textual-content(tbody/tr/td[1]) != ''">
          <p class="h3"><xsl:value-of select="tbody/tr/td[1]/node()"/></p>
        </xsl:if>
        <xsl:apply-templates select="tbody/tr/td[2]/node()"/>      
      </div>
    </div>
  </xsl:template>
  
  <!-- [OUMASHUP] Twitter Footer -->
  <xsl:template match="twitter-asset">
    <xsl:variable name="oauth-consumer-key" select="@ouathconsumerkey"/>
    <xsl:variable name="oauth-consumer-secret" select="@oauthconsumersecret"/>
    <xsl:variable name="handle" select="@handle"/>
    <xsl:variable name="image" select="@image"/>
    <xsl:variable name="url" select="@twitter-url"/>
    <xsl:variable name="json" select="@json-url"/>
    
    <xsl:variable name="banner-extension" select="concat('.', substring-after($image, '.'))" />		
    <xsl:variable name="tablet-image" select="concat(replace($image, $banner-extension, ''), '-tablet', $banner-extension) " />
    <xsl:variable name="mobile-image" select="concat(replace($image, $banner-extension, ''), '-mobile', $banner-extension) " />
    
    <section class="twitter-feed desktop-banner" data-z-index="auto" data-parallax="scroll" data-image-src="{$image}" data-speed="0.7">
      <div class="tablet-banner" style="background-image: url({$tablet-image})">
        <div class="mobile-banner" style="background-image: url({$mobile-image})">
          <div class="container">
            <h2><a href="{$url}"><xsl:value-of select="$handle"/></a></h2>
            <div class="scrollable-wrapper">
              <div class="scrollable">
                <button class="scroll-right">scroll right</button>  
                <button class="scroll-left">scroll left</button>     
                <ul class="twitter-slider medium-slider">                  
                  <xsl:choose>
                    <xsl:when test="$ou:action = 'pub'">
                      <xsl:text disable-output-escaping="yes">&lt;%</xsl:text>                                                                                                
                        Response.Write(OUC.GetTweets.displayTweets("<xsl:value-of select="concat($domain, $json)"/>", "<xsl:value-of select="$handle"/>"));                
                      <xsl:text disable-output-escaping="yes">%&gt;</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>Tweets to appear on publish</xsl:otherwise>
                  </xsl:choose>                     
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>    
  </xsl:template>
	<!-- Blog Snippets -->
<xsl:template match="table[@class='ou-blog-share']">
	<div class="blog-share">	
                              <p>Share Post</p><div class="share-this">	
                                 <ul class="share-this-social-icons">	
                                    	
                                    <li><a title="Share by Email" aria-label="Share by Email" target="_blank" href="mailto:?subject={encode-for-uri(ou:multiedit-field('title'))}&amp;body=https://www.fgcu.edu/{$ou:path}"><span class="icon-mail-close" aria-label="share on twitter"></span></a></li>	
                                    	
                                    <div class="fb-share-button" data-href="https://developers.facebook.com/docs/plugins/" data-layout="button" data-size="large" data-mobile-iframe="true">	
                                       <li><a title="share on facebook" aria-label="share on facebook" class="fb-xfbml-parse-ignore" target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https://www.fgcu.edu{$ou:path}"><span class="icon-icon-facebook" aria-label="share on facebook"></span></a></li>	
                                    </div>	
                                    <li><a title="share on twitter" aria-label="share on twitter" target="_blank" href="https://twitter.com/intent/tweet?text={encode-for-uri(ou:multiedit-field('title'))} https://www.fgcu.edu{$ou:path}"><span class="icon-icon-twitter" aria-label="share on twitter"></span></a></li>	
                                    	
                                    <li><a title="share on linkedin" aria-label="share on linkedin" target="_blank" href="https://www.linkedin.com/cws/share?url=https://www.fgcu.edu{$ou:path}"><span class="icon-icon-linkedin" aria-label="share on linkedin"></span></a></li>	
                                    	
                                 </ul>	
                              </div>	
                           </div>
</xsl:template>
	
	
	<!-- Blog assets -->
	<xsl:template match="blog" expand-text="yes">

		<xsl:variable name="filters" select="ou:textual-content(@tags)" />
		<xsl:variable name="logical-operator" select="if(@filtering = 'strict') then ' and ' else ' or '" />

		<xsl:variable name="xpath">
			<xsl:text>item</xsl:text>

			<xsl:if test="@dir!=''">
				<xsl:text>[starts-with(@href,'{replace(@dir, '/[^/]+\.[^.]+$', '/')}')]</xsl:text>
			</xsl:if>

			<xsl:if test="@type='featured'">
				<xsl:text>[featured/text()='true']</xsl:text>
			</xsl:if>

			<xsl:if test="string-length(@year)=4">
				<xsl:text>[contains(pubDate/text(), {@year})]</xsl:text>
			</xsl:if>

			<xsl:if test="$filters!=''">
				<xsl:text>[</xsl:text>
				<xsl:for-each select="tokenize($filters, ',')">
					<xsl:choose>
						<xsl:when test="contains(., '''')">
							<xsl:value-of select="'tags/tag=&quot;' || replace(normalize-space(.), '&quot;', '') || '&quot;'" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'tags/tag=''' || normalize-space(.) || ''''" />
						</xsl:otherwise>
					</xsl:choose>
					<xsl:if test="position() != last()">
						<xsl:value-of select="$logical-operator" />
					</xsl:if>
				</xsl:for-each>
				<xsl:text>]</xsl:text>
			</xsl:if>
		</xsl:variable>

		<xsl:call-template name="dmc">
			<xsl:with-param name="options">
				<datasource>blogs</datasource>
				<xpath>{$xpath}</xpath>
				<type>sidebar</type>
				<max>{@limit}</max>
				<sort>date(pubDate) desc</sort>
				<heading>{@heading}</heading>
			</xsl:with-param>

			<xsl:with-param name="script-name">blogs</xsl:with-param>
			<xsl:with-param name="debug" select="false()" />
		</xsl:call-template>
	</xsl:template>
	
	<xsl:template match="blog[@type='available-tags']" expand-text="yes">
		<xsl:call-template name="dmc">
			<xsl:with-param name="options">
				<datasource>blogs</datasource>
				<xpath>item[starts-with(@href,'{@dir}')]/tags/tag</xpath>
				<type>{@type}</type>
				<max>{@limit}</max>
				<heading>{@heading}</heading>
				<sort>.</sort>
				<distinct>true</distinct>
				<listing_page_url>{$blog-listing-page}</listing_page_url>
			</xsl:with-param>

			<xsl:with-param name="script-name">blogs</xsl:with-param>
			<xsl:with-param name="debug" select="false()" />
		</xsl:call-template>
	</xsl:template>
	
	<xsl:template match="blog[@type='listing']" expand-text="yes">
		<xsl:variable name="filters" select="ou:textual-content(@tags)" />
		<xsl:variable name="logical-operator" select="if(@filtering = 'strict') then ' and ' else ' or '" />
		
		<xsl:variable name="xpath">
			<xsl:text>item</xsl:text>
			<xsl:if test="@dir!=''"><xsl:text>[starts-with(@href,'{replace(@dir, '/[^/]+\.[^.]+$', '/')}')]</xsl:text></xsl:if>
			<xsl:if test="@type='featured'"><xsl:text>[featured/text()='true']</xsl:text></xsl:if>
			<xsl:if test="string-length(@year)=4"><xsl:text>[contains(pubDate/text(), {@year})]</xsl:text></xsl:if>
			<xsl:if test="$filters!=''">
				<xsl:text>[</xsl:text>
				<xsl:for-each select="tokenize($filters, ',')">
					<xsl:choose>
						<xsl:when test="contains(., '''')"><xsl:value-of select="'tags/tag=&quot;' || replace(normalize-space(.), '&quot;', '') || '&quot;'" /></xsl:when>
						<xsl:otherwise><xsl:value-of select="'tags/tag=''' || normalize-space(.) || ''''" /></xsl:otherwise>
					</xsl:choose>
					<xsl:if test="position() != last()"><xsl:value-of select="$logical-operator" /></xsl:if>
				</xsl:for-each>
				<xsl:text>]</xsl:text>
			</xsl:if>
		</xsl:variable>

		
		<xsl:call-template name="dmc">
			<xsl:with-param name="options">
				<datasource>blogs</datasource>
				<xpath>{$xpath}</xpath><!--<xpath>item[starts-with(@href,'{@dir}')]</xpath>-->
				<type>{@type}</type>
				<max>{@limit}</max>
				<heading>{@heading}</heading>
				<sort>date(pubDate) desc</sort>
				<distinct>true</distinct>
				<listing_page_url>{$blog-listing-page}</listing_page_url>
			</xsl:with-param>

			<xsl:with-param name="script-name">blogs</xsl:with-param>
			<xsl:with-param name="debug" select="false()" />
		</xsl:call-template>
	</xsl:template>
	
	<xsl:template match="blog[@type='listing-3col']" expand-text="yes">
		<xsl:variable name="filters" select="ou:textual-content(@tags)" />
		<xsl:variable name="logical-operator" select="if(@filtering = 'strict') then ' and ' else ' or '" />
		
		<xsl:variable name="xpath">
			<xsl:text>item</xsl:text>
			<xsl:if test="@dir!=''"><xsl:text>[starts-with(@href,'{replace(@dir, '/[^/]+\.[^.]+$', '/')}')]</xsl:text></xsl:if>
			<xsl:if test="@type='featured'"><xsl:text>[featured/text()='true']</xsl:text></xsl:if>
			<xsl:if test="string-length(@year)=4"><xsl:text>[contains(pubDate/text(), {@year})]</xsl:text></xsl:if>
			<xsl:if test="$filters!=''">
				<xsl:text>[</xsl:text>
				<xsl:for-each select="tokenize($filters, ',')">
					<xsl:choose>
						<xsl:when test="contains(., '''')"><xsl:value-of select="'tags/tag=&quot;' || replace(normalize-space(.), '&quot;', '') || '&quot;'" /></xsl:when>
						<xsl:otherwise><xsl:value-of select="'tags/tag=''' || normalize-space(.) || ''''" /></xsl:otherwise>
					</xsl:choose>
					<xsl:if test="position() != last()"><xsl:value-of select="$logical-operator" /></xsl:if>
				</xsl:for-each>
				<xsl:text>]</xsl:text>
			</xsl:if>
		</xsl:variable>

		
			
		<xsl:call-template name="dmc">
			<xsl:with-param name="options">
				<datasource>blogs</datasource>
				<xpath>{$xpath}</xpath><!--<xpath>item[starts-with(@href,'{@dir}')]</xpath>-->
				<type>{@type}</type>
				<max>{@limit}</max>
				<heading>{@heading}</heading>
				<sort>date(pubDate) desc</sort>
				<distinct>true</distinct>
				<listing_page_url>{$blog-listing-page}</listing_page_url>
			</xsl:with-param>

			<xsl:with-param name="script-name">blogs</xsl:with-param>
			<xsl:with-param name="debug" select="false()" />
		</xsl:call-template>
		
		
	</xsl:template>
	
 
</xsl:stylesheet>