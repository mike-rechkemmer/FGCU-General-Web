<?xml version="1.0" encoding="utf-8"?>
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
]>

<xsl:stylesheet version="3.0" 
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:xs="http://www.w3.org/2001/XMLSchema"
				xmlns:ou="http://omniupdate.com/XSL/Variables"
				xmlns:fn="http://omniupdate.com/XSL/Functions"
				xmlns:ouc="http://omniupdate.com/XSL/Variables"
				exclude-result-prefixes="ou xsl xs fn ouc">

	<xsl:import href="common.xsl"/>	

	<!-- Global variables -->
	<xsl:variable name="body-class" select="''"/>

	<xsl:variable name="bannerid" select="//program-content/ouc:div[@label='bannerid']/text()"/>

	<xsl:variable name="undergraduateprogramfeedurl">
		<xsl:if test="$bannerid != ''">
			<xsl:value-of select="concat('https://www2.fgcu.edu/datafeeds/catalogprogramrequirements.xml.asp?wherefield=BannerID&amp;whereoperator=eq&amp;wherevalue=',$bannerid)"/>
		</xsl:if>
	</xsl:variable>

	<xsl:variable name="undergraduateprograminfo">
		<xsl:choose>
			<xsl:when test="$undergraduateprogramfeedurl != ''">
				<xsl:copy-of select="document($undergraduateprogramfeedurl)"/>
			</xsl:when>
			<xsl:otherwise>
				<root/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<!-- Start of templates -->
	<xsl:template name="template-headcode"/>
	<xsl:template name="template-footcode"/>

	<xsl:template name="page-content">	
		<main class="main-content" role="main">
			<article>				
				<xsl:call-template name="page-banner"/>
				<xsl:call-template name="page-navigation"/>

				<xsl:call-template name="js-window-print-button"/>

				<xsl:call-template name="program-major-maincontent"/>

				<xsl:call-template name="program-major-accordion"/>

				<xsl:call-template name="pre-footer-regions"/>
			</article>
		</main>
	</xsl:template>

	<xsl:template name="js-window-print-button">
		<button class="printBtn programdataprintbutton" onclick="javascript:window.print()">Print Details</button>
	</xsl:template>

	<xsl:strip-space elements="*"/>

	<xsl:template name="program-major-maincontent">
		
			<xsl:apply-templates select="//ouc:div[@label='maincontent-above-accordion']"/>
			
			<xsl:text disable-output-escaping="yes">&lt;!-- </xsl:text> Banner ID '<xsl:value-of select="$bannerid"/>' <xsl:text disable-output-escaping="yes"> --&gt;</xsl:text>
		
	</xsl:template>

	<xsl:template match="root/data/item/concentration/text()" name="utility-split-concentrations">
		<xsl:param name="remainingconcentrations" select="."/>
		<xsl:if test="string-length($remainingconcentrations)">
			<li>
				<xsl:value-of select="substring-before(concat($remainingconcentrations,'|'),'|')"/>
			</li>
			<xsl:call-template name="utility-split-concentrations"> <!-- Recurse -->
				<xsl:with-param name="remainingconcentrations" select="substring-after($remainingconcentrations, '|')"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<xsl:template name="program-major-accordion">

		<div class="container-flex wrapper-program-concentrations">
			<xsl:choose>
				<xsl:when test="$ou:action = 'pub'">
					<xsl:text disable-output-escaping="yes">&lt;%</xsl:text>
					Response.Write(OUC.AcademicWeb.getProgramConcentrations("<xsl:value-of select="$bannerid"/>"));
					<xsl:text disable-output-escaping="yes">%&gt;</xsl:text>
				</xsl:when>
				<xsl:otherwise>

					<xsl:if test="$undergraduateprograminfo/root/data/item/concentration">
						<xsl:if test="$undergraduateprograminfo/root/data/item/concentration != ''">
							<p class="statement-text">Concentrations</p>
							<ul>
								<xsl:call-template name="utility-split-concentrations">
									<xsl:with-param name="remainingconcentrations" select="$undergraduateprograminfo/root/data/item/concentration"/>
								</xsl:call-template>
							</ul>
<!--
<p><xsl:value-of select="$undergraduateprograminfo/root/data/item/concentration"/></p>
-->
						</xsl:if>
					</xsl:if>

				</xsl:otherwise>
			</xsl:choose>
		</div>

		<div class="container-flex accordion-wrapper wrapper-program-content">

			<div class="accordion-controls all-collapsed">
				<button class="open">Expand All</button>
				<button class="close">Collapse All</button>
			</div>

			<ul>

				<xsl:if test="//program-content/ouc:div[@label='accreditation'] != ''">
					<li>
						<p class="accordion-title">Accreditation</p>
						<xsl:choose>
							<xsl:when test="$ou:action = 'pub'">
								<a class="toggle-accordion" aria-expanded="false" href="#Accreditation"><span>Toggle More Info</span></a>
							</xsl:when>
							<xsl:otherwise>
								<a class="toggle-accordion"><span></span></a> <!-- Anchor HREF used by flexbox appears to interfere with the OU Campus preview and editor -->
							</xsl:otherwise>
						</xsl:choose>
						<div id="Accreditation" class="more-info" aria-hidden="true">
							<!--<xsl:copy-of select="//program-content/ouc:div[@label='accreditation']/node()" />-->
							<xsl:apply-templates select="//program-content/ouc:div[@label='accreditation']/node()"/>
						</div>
					</li>
				</xsl:if>

				<xsl:if test="$undergraduateprograminfo/root/data/item != ''">

					<xsl:choose>
						<xsl:when test="$ou:action = 'pub'">
							<li>
								<p class="accordion-title">Admissions Information</p>
								<a class="toggle-accordion" aria-expanded="false" href="#AdmissionsInformation"><span>Toggle More Info</span></a>
								<div id="AdmissionsInformation" class="more-info" aria-hidden="true">
									<xsl:text disable-output-escaping="yes">&lt;%</xsl:text>
									Response.Write(OUC.AcademicWeb.getProgramAdmissionRequirements("<xsl:value-of select="$bannerid"/>"));
									<xsl:text disable-output-escaping="yes">%&gt;</xsl:text>
								</div>
							</li>
						</xsl:when>
						<xsl:otherwise>
							<li>
								<p class="accordion-title">Admissions Information</p>
								<a class="toggle-accordion"><span></span></a>
								<div id="AdmissionsInformation" class="more-info" aria-hidden="true">
									<xsl:if test="$undergraduateprograminfo/root/data/item/academicyear != ''">
										<p class="statement-text">Admissions Information for the <xsl:value-of select="$undergraduateprograminfo/root/data/item/academicyear"/> Catalog Year</p>
										<p>
											If you are not yet an FGCU student, visit the <a href="https://www2.fgcu.edu/admissions.asp" target="_blank">Admissions Office Website</a>
										</p>
										<p>
											If you are a newly-admitted FGCU student please be sure to <a href="http://studentservices.fgcu.edu/NewStudentPrograms/orientationregistration.html" target="_blank">sign up for an Eagle View Orientation session</a>. As part of this session you will be meeting with an academic advisor who will assist you in registering for classes for your major.
										</p>
									</xsl:if>
									<xsl:if test="$undergraduateprograminfo/root/data/item/admissionrequirements != ''">
										<p class="statement-text">Program Admission Requirements</p>
										<p><xsl:value-of disable-output-escaping="yes" select="$undergraduateprograminfo/root/data/item/admissionrequirements"/></p>
									</xsl:if>

									<p class="statement-text">Admission Deadlines</p>
									<p>
										<a href="https://www2.fgcu.edu/admissions.asp" target="_blank">Visit the Admissions Office Web site</a> for information on admission deadlines of the university.
									</p>
								</div>
							</li>
						</xsl:otherwise>
					</xsl:choose>

					<xsl:choose>
						<xsl:when test="$ou:action = 'pub'">
							<li>
								<p class="accordion-title">Program Requirements</p>
								<a class="toggle-accordion" aria-expanded="false" href="#ProgramRequirements"><span>Toggle More Info</span></a>
								<div id="ProgramRequirements" class="more-info" aria-hidden="true">
									<xsl:text disable-output-escaping="yes">&lt;%</xsl:text>
									Response.Write(OUC.AcademicWeb.getMajorDegree("<xsl:value-of select="$bannerid"/>"));
									<xsl:text disable-output-escaping="yes">%&gt;</xsl:text>
								</div>
							</li>
						</xsl:when>
						<xsl:otherwise>
							<li>
								<p class="accordion-title">Program Requirements</p>
								<a class="toggle-accordion"><span></span></a>
								<div id="ProgramRequirements" class="more-info" aria-hidden="true">
									<xsl:if test="$undergraduateprograminfo/root/data/item/academicyear != ''">
										<p class="statement-text">Program Requirements for the <xsl:value-of select="$undergraduateprograminfo/root/data/item/academicyear"/> Catalog Year</p>
									</xsl:if>
									<p>The General Education Program Website is located at <a href="http://www.fgcu.edu/general_education" target="_blank">http://www.fgcu.edu/general_education</a></p>

									<xsl:if test="($undergraduateprograminfo/root/data/item/progressrewuirements != '') or ($undergraduateprograminfo/root/data/item/progressionandadditionalgraduationrequirements != '')">
										<p class="statement-text">Program Progression and Additional Graduation Requirements</p>
										<xsl:if test="$undergraduateprograminfo/root/data/item/progressrewuirements != ''">
											<p><xsl:value-of disable-output-escaping="yes" select="$undergraduateprograminfo/root/data/item/progressrewuirements"/></p>
										</xsl:if>

										<xsl:if test="$undergraduateprograminfo/root/data/item/progressionandadditionalgraduationrequirements != ''">
											<p><xsl:value-of disable-output-escaping="yes" select="$undergraduateprograminfo/root/data/item/progressionandadditionalgraduationrequirements"/></p>
										</xsl:if>
									</xsl:if>

									<xsl:if test="$undergraduateprograminfo/root/data/item/degreerequirements != ''">
										<p class="statement-text">Program Requirements</p>
										<p><xsl:value-of disable-output-escaping="yes" select="$undergraduateprograminfo/root/data/item/degreerequirements"/></p>
									</xsl:if>

									<xsl:if test="$undergraduateprograminfo/root/data/item/semesterhours != ''">
										<p>
											<strong><span style="text-transform: uppercase">Total Credits Required: </span>
												<xsl:value-of disable-output-escaping="yes" select="$undergraduateprograminfo/root/data/item/semesterhours"/>
											</strong>
										</p>
									</xsl:if>

									<xsl:if test="$undergraduateprograminfo/root/data/item/futurereqs != ''">
										<p><xsl:value-of disable-output-escaping="yes" select="$undergraduateprograminfo/root/data/item/futurereqs"/></p>
									</xsl:if>

									<xsl:if test="$undergraduateprograminfo/root/data/item/additionalgradrequirements != ''">
										<p class="statement-text">Additional Graduation Requirements</p>
										<p><xsl:value-of disable-output-escaping="yes" select="$undergraduateprograminfo/root/data/item/additionalgradrequirements"/></p>
									</xsl:if>

									<xsl:if test="$undergraduateprograminfo/root/data/item/transfernotes != ''">
										<p class="statement-text">Transfer Notes and Acceptable Substitutes</p>
										<p><xsl:value-of disable-output-escaping="yes" select="$undergraduateprograminfo/root/data/item/transfernotes"/></p>
									</xsl:if>
								</div>
							</li>							
						</xsl:otherwise>
					</xsl:choose>

				</xsl:if>

				<xsl:if test="//program-content/ouc:div[@label='curriculummap'] != ''">
					<li>
						<p class="accordion-title">Curriculum Map</p>
						<xsl:choose>
							<xsl:when test="$ou:action = 'pub'">
								<a class="toggle-accordion" aria-expanded="false" href="#CurriculumMap"><span>Toggle More Info</span></a>
							</xsl:when>
							<xsl:otherwise>
								<a class="toggle-accordion"><span></span></a>
							</xsl:otherwise>
						</xsl:choose>
						<div id="CurriculumMap" class="more-info" aria-hidden="true">
							<!--<xsl:copy-of select="//program-content/ouc:div[@label='curriculummap']/node()" />-->
							<xsl:apply-templates select="//program-content/ouc:div[@label='curriculummap']/node()"/> 
						</div>
					</li>
				</xsl:if>

				<xsl:if test="//program-content/ouc:div[@label='coursedescription'] != ''">
					<li>
						<p class="accordion-title">Course Description</p>
						<xsl:choose>
							<xsl:when test="$ou:action = 'pub'">
								<a class="toggle-accordion" aria-expanded="false" href="#CourseDescription"><span>Toggle More Info</span></a>
							</xsl:when>
							<xsl:otherwise>
								<a class="toggle-accordion"><span></span></a>
							</xsl:otherwise>
						</xsl:choose>
						<div id="CourseDescription" class="more-info" aria-hidden="true">
							<!--<xsl:copy-of select="//program-content/ouc:div[@label='coursedescription']/node()" />-->
							<xsl:apply-templates select="//program-content/ouc:div[@label='coursedescription']/node()"/> 
						</div>
					</li>
				</xsl:if>

				<xsl:if test="//program-content/ouc:div[@label='courseschedule'] != ''">
					<li>
						<p class="accordion-title">Course Schedule</p>
						<xsl:choose>
							<xsl:when test="$ou:action = 'pub'">
								<a class="toggle-accordion" aria-expanded="false" href="#CourseSchedule"><span>Toggle More Info</span></a>
							</xsl:when>
							<xsl:otherwise>
								<a class="toggle-accordion"><span></span></a>
							</xsl:otherwise>
						</xsl:choose>
						<div id="CourseSchedule" class="more-info" aria-hidden="true">
							<!--<xsl:copy-of select="//program-content/ouc:div[@label='courseschedule']/node()" />-->
							<xsl:apply-templates select="//program-content/ouc:div[@label='courseschedule']/node()"/> 
						</div>
					</li>
				</xsl:if>

				<xsl:if test="//program-content/ouc:div[@label='learningoutcomes'] != ''">
					<li>
						<p class="accordion-title">Learning Outcomes</p>
						<xsl:choose>
							<xsl:when test="$ou:action = 'pub'">
								<a class="toggle-accordion" aria-expanded="false" href="#LearningOutcomes"><span>Toggle More Info</span></a>
							</xsl:when>
							<xsl:otherwise>
								<a class="toggle-accordion"><span></span></a>
							</xsl:otherwise>
						</xsl:choose>
						<div id="LearningOutcomes" class="more-info" aria-hidden="true">
							<!--<xsl:copy-of select="//program-content/ouc:div[@label='learningoutcomes']/node()" />-->
							<xsl:apply-templates select="//program-content/ouc:div[@label='learningoutcomes']/node()"/>
						</div>
					</li>
				</xsl:if>

				<xsl:if test="//program-content/ouc:div[@label='educationalobjectivesstudentoutcomes'] != ''">
					<li>
						<p class="accordion-title">Educational Objectives and Student Outcomes</p>
						<xsl:choose>
							<xsl:when test="$ou:action = 'pub'">
								<a class="toggle-accordion" aria-expanded="false" href="#EducationalObjectivesandStudentOutcomes"><span>Toggle More Info</span></a>
							</xsl:when>
							<xsl:otherwise>
								<a class="toggle-accordion"><span></span></a>
							</xsl:otherwise>
						</xsl:choose>
						<div id="EducationalObjectivesandStudentOutcomes" class="more-info" aria-hidden="true">
							<!--<xsl:copy-of select="//program-content/ouc:div[@label='educationalobjectivesstudentoutcomes']/node()" />-->
							<xsl:apply-templates select="//program-content/ouc:div[@label='educationalobjectivesstudentoutcomes']/node()"/>
						</div>
					</li>
				</xsl:if>

				<xsl:if test="//program-content/ouc:div[@label='tuitionfeesfinancialassistance'] != ''">
					<li>
						<p class="accordion-title">Tuition, Fees, and Financial Assistance</p>
						<xsl:choose>
							<xsl:when test="$ou:action = 'pub'">
								<a class="toggle-accordion" aria-expanded="false" href="#TuitionFeesandFinancialAssistance"><span>Toggle More Info</span></a>
							</xsl:when>
							<xsl:otherwise>
								<a class="toggle-accordion"><span></span></a>
							</xsl:otherwise>
						</xsl:choose>
						<div id="TuitionFeesandFinancialAssistance" class="more-info" aria-hidden="true">
							<!--<xsl:copy-of select="//program-content/ouc:div[@label='tuitionfeesfinancialassistance']/node()" />-->
							<xsl:apply-templates select="//program-content/ouc:div[@label='tuitionfeesfinancialassistance']/node()"/>
						</div>
					</li>
				</xsl:if>

			</ul>
		</div>
	</xsl:template>
	
	<xsl:template match="program-content//h1|program-content//h2|program-content//h3|program-content//h4|program-content//h5|program-content//h6">
			<p class="h4"><xsl:apply-templates select="node()"/></p>
	</xsl:template>

	<!-- pre-footer content / region(s) -->
	<xsl:template name="pre-footer-regions">		
		<!-- footer regions -->
		<!-- instagram -->
		<xsl:call-template name="instagram-feed-parser-per-page"/>
		<!-- twitter -->
		<xsl:if test="ou:pcf-param('options') = 'twitter'">
			<xsl:apply-templates select="ou:pcf-param('twitter-src')" />
		</xsl:if>
		<!-- promo box -->
		<xsl:if test="ou:pcf-param('options') = 'promo-box'">
			<section class="promotion">
				<xsl:apply-templates select="ouc:div[@label='additional-content']"/>
			</section><!-- .promotion -->
		</xsl:if>
		<!-- pre-footer-content -->
		<xsl:call-template name="pre-footer-content"/>
	</xsl:template>

</xsl:stylesheet>