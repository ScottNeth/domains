<cfcomponent displayname="Domains" extends="com.sebtools.RecordsTester">

<cffunction name="setUp" access="public" returntype="void" output="no">
	
	<cfset loadExternalVars("DomainsMgr")>
	<cfset loadExternalVars(varlist="NoticeMgr",skipmissing=true)>
	
</cffunction>

<cffunction 
	name="ShouldConvertURL" 
	access="public" 
	returntype="void" 
	output="no" 
	hint="Any URL passed to convertURL should be converted to a relative URL (starting with /) if it contains a domain name in the domains table" 
	mxunit:transaction="rollback">
	
	<cfset var sURL = {urlName="example.com/page.html"}>
	<cfset var domainid = saveTestRecord(Variables.DomainsMgr.convertURL,sURL)>
	<cfset var qDomain = Variables.DomainsMgr.Domains.getDomain(domainid)>
	
	<cfif qDomain.DomainName NEQ "/page.html">
		<cfset fail("The URL Name was not converted")>
	</cfif>
	
</cffunction>

</cfcomponent>