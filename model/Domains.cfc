<cfcomponent extends="com.sebtools.Records">

<cffunction name="xml" access="public" output="yes">
<tables prefix="domains">
	<table entity="Domain">
		<field name="DomainName" Label="Domain" type="text" Length="120" required="true" />
	</table>
</tables>
</cffunction>	
	
<cffunction name="convertURL" access="public"  returntype="string" output="no"> 
	<cfargument name="URL" displayName="URL" type="string" required="true" />
		
		<cfset var ret="">
		<cfset var referer = "">
		<cfset var occurrences = 0>
		<cfset var lTLD = "com,org,net,int,edu,gov,mil"><!--- Not an all inclusive list now that there are hundreds of TLD's --->
		 		
		<cfif NOT #Find('://', arguments.URL)#>
			<!--- append with http so the Java can parse it--->
			<cfset referer = 'http://'& arguments.URL>
		<cfelse>
			<cfset referer = arguments.URL>
		</cfif>
		
		<!--- Thank you Ben Nadel - http://www.bennadel.com/blog/1692-ask-ben-getting-the-domain-name-from-the-referer-url.htm --->
		<!--- Create a Java URL object based on our referer URL. --->
		<cfset javaUrl = createObject( "java", "java.net.URL" ).init(
		    javaCast( "string", referer )
		    ) />

		<!---
		    The Java url has parsed the url for us and we can now extract
		    the components from our Java url instance.
		--->
		<cfset sRefererDomain = javaUrl.getHost()>
		
		<!--- We now have a domian, but, it may include subdomains --->
		
		<cfif left(sRefererDomain,4) EQ 'www.'>
			<!--- We don't need to check for a subdomain, just strip off the www.--->
			<cfset sRefererDomain = right(sRefererDomain, len(SRefererDomain)-4)> 		
		<cfelse>
			<!--- Find the number of 'dot's --->
			<cfset occurrences
			   = ( Len(sRefererDomain) -
			       Len(Replace(sRefererDomain,'.','','all'))
			     ) / Len('.') >
			
			<cfif occurrences EQ 3>
				<!--- If there are 3 'dot's then this is a foreign domain with a subdomain, so strip off the subdomain --->
				<cfset sRefererDomain = GetToken(sRefererDomain,2,'.')&'.'&GetToken(sRefererDomain,3,'.')&'.'&GetToken(sRefererDomain,4,'.')>
			<cfelseif occurrences GT 1>
				<!--- if there's only one there is no subdomain and the sRefererDomain is correct as it is, if it has more than one, it could be a foreign domain without a subdomain or a domestic one with a subdomain--->
				<cfif listFind(lTLD, GetToken(sRefererDomain,3,'.'))>
					<!--- Domestic, so strip off the subdomain --->
					<cfset sRefererDomain =  GetToken(sRefererDomain,2,'.')&'.'&GetToken(sRefererDomain,3,'.')>
				</cfif>
			</cfif>
			
		</cfif>
		
		<!--- look in component to see if it exists in a table--->
		<cfset qGetRecords = getRecord(DomainName=sRefererDomain)>
		<cfif qGetRecords.recordCount GT 0>
			<cfset ret = JavaURL.getFile()>
		<cfelse>
			<cfset ret = referer>
		</cfif>		
		
	<cfreturn ret>
	
</cffunction>

<cffunction name="validateDomain" access="public" returntype="struct" output="no">
	
	<cfif StructKeyExists(Arguments,"URL")>
		<cfset Arguments.URL = convertURL(Arguments.URL)>
	</cfif>
	
	<cfreturn Arguments>
</cffunction>
</cfcomponent>