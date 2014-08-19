<cfcomponent displayname="Domains" extends="com.sebtools.RecordsTester">

<cffunction name="setUp" access="public" returntype="void" output="no">
	
	<cfset loadExternalVars("DomainsMgr")>
	<cfset loadExternalVars(varlist="NoticeMgr",skipmissing=true)>
	
</cffunction>

<cffunction 
	name="shouldExampleBeConvertedToDomainName" 
	access="public" 
	returntype="void" 
	output="no" 
	hint="Any URL passed to convertURL should be converted to a relative URL (starting with /) if it contains a domain name in the domains table" 
	mxunit:transaction="rollback">
	
	<cfset var sURL = "example.com/page.html">
	<cfset var qDomain = Application.DomainsMgr.Domains.getRecord(DomainName='example.com')>
	<cfset var Domain = Application.DomainsMgr.Domains.convertURL(sURL)>
	
	<cfif qDomain.recordcount GT 0>
		<cfif Domain NEQ "/page.html">
			<cfset fail("The URL should return the relative path - instead returned #Domain#")>
		</cfif>
	<cfelse>
		<cfif Domain NEQ "http://example.com/page.html">
			<cfset fail("The URL should return the full path - instead returned #Domain#")>
		</cfif>
	</cfif>
	
</cffunction>

<cffunction 
	name="shouldWWWDotExampleBeConvertedToDomainName" 
	access="public" 
	returntype="void" 
	output="no" 
	hint="Checks for URL with WWW - Any URL passed to convertURL should be converted to a relative URL (starting with /) if it contains a domain name in the domains table" 
	mxunit:transaction="rollback">
	
	<cfset var sURL = "www.example.com/page.html">
	<cfset var qDomain = Application.DomainsMgr.Domains.getRecord(DomainName='example.com')>
	<cfset var Domain = Application.DomainsMgr.Domains.convertURL(sURL)>
	
	<cfif qDomain.recordcount GT 0>
		<cfif Domain NEQ "/page.html">
			<cfset fail("The URL should return the relative path - instead returned #Domain#")>
		</cfif>
	<cfelse>
		<cfif Domain NEQ "http://www.example.com/page.html">
			<cfset fail("The URL should return the full path - instead returned #Domain#")>
		</cfif>
	</cfif>
	
</cffunction>

<cffunction 
	name="shouldExampleWithPortBeConvertedToDomainName" 
	access="public" 
	returntype="void" 
	output="no" 
	hint="Checks for URL with a port - Any URL passed to convertURL should be converted to a relative URL (starting with /) if it contains a domain name in the domains table" 
	mxunit:transaction="rollback">
	
	<cfset var sURL = "example.com:8500/page.html">
	<cfset var qDomain = Application.DomainsMgr.Domains.getRecord(DomainName='example.com')>
	<cfset var Domain = Application.DomainsMgr.Domains.convertURL(sURL)>
	
	<cfif qDomain.recordcount GT 0>
		<cfif Domain NEQ "/page.html">
			<cfset fail("The URL should return the relative path - instead returned #Domain#")>
		</cfif>
	<cfelse>
		<cfif Domain NEQ "http://example.com:8500/page.html">
			<cfset fail("The URL should return the full path - instead returned #Domain#")>
		</cfif>
	</cfif>
	
</cffunction>

<cffunction 
	name="shouldWWWdotExampleWithPortBeConvertedToDomainName" 
	access="public" 
	returntype="void" 
	output="no" 
	hint="Checks for URL with WWW and a Port- Any URL passed to convertURL should be converted to a relative URL (starting with /) if it contains a domain name in the domains table" 
	mxunit:transaction="rollback">
	
	<cfset var sURL = "www.example.com:8500/page.html">
	<cfset var qDomain = Application.DomainsMgr.Domains.getRecord(DomainName='example.com')>
	<cfset var Domain = Application.DomainsMgr.Domains.convertURL(sURL)>
	
	<cfif qDomain.recordcount GT 0>
		<cfif Domain NEQ "/page.html">
			<cfset fail("The URL should return the relative path - instead returned #Domain#")>
		</cfif>
	<cfelse>
		<cfif Domain NEQ "http://www.example.com:8500/page.html">
			<cfset fail("The URL should return the full path - instead returned #Domain#")>
		</cfif>
	</cfif>
	
</cffunction>

<cffunction 
	name="shouldSubdomaindotExampleBeConvertedToDomainName" 
	access="public" 
	returntype="void" 
	output="no" 
	hint="Checks for URL with subdomain - Any URL passed to convertURL should be converted to a relative URL (starting with /) if it contains a domain name in the domains table" 
	mxunit:transaction="rollback">
	
	<cfset var sURL = "mail.example.com/page.html">
	<cfset var qDomain = Application.DomainsMgr.Domains.getRecord(DomainName='example.com')>
	<cfset var Domain = Application.DomainsMgr.Domains.convertURL(sURL)>
	
	<cfif qDomain.recordcount GT 0>
		<cfif Domain NEQ "/page.html">
			<cfset fail("The URL should return the relative path - instead returned #Domain#")>
		</cfif>
	<cfelse>
		<cfif Domain NEQ "http://mail.example.com/page.html">
			<cfset fail("The URL should return the full path - instead returned #Domain#")>
		</cfif>
	</cfif>
	
</cffunction>

<cffunction 
	name="shouldSubdomaindotExampleAndPortBeConvertedToDomainName" 
	access="public" 
	returntype="void" 
	output="no" 
	hint="Checks for URL with subdomain - Any URL passed to convertURL should be converted to a relative URL (starting with /) if it contains a domain name in the domains table" 
	mxunit:transaction="rollback">
	
	<cfset var sURL = "mail.example.com:8500/page.html">
	<cfset var qDomain = Application.DomainsMgr.Domains.getRecord(DomainName='example.com')>
	<cfset var Domain = Application.DomainsMgr.Domains.convertURL(sURL)>
	
	<cfif qDomain.recordcount GT 0>
		<cfif Domain NEQ "/page.html">
			<cfset fail("The URL should return the relative path - instead returned #Domain#")>
		</cfif>
	<cfelse>
		<cfif Domain NEQ "http://mail.example.com:8500/page.html">
			<cfset fail("The URL should return the full path - instead returned #Domain#")>
		</cfif>
	</cfif>
	
</cffunction>

<cffunction 
	name="shouldHTTPExampleBeConvertedToDomainName" 
	access="public" 
	returntype="void" 
	output="no" 
	hint="Any URL passed to convertURL should be converted to a relative URL (starting with /) if it contains a domain name in the domains table" 
	mxunit:transaction="rollback">
	
	<cfset var sURL = "http://example.com/page.html">
	<cfset var qDomain = Application.DomainsMgr.Domains.getRecord(DomainName='example.com')>
	<cfset var Domain = Application.DomainsMgr.Domains.convertURL(sURL)>
	
	<cfif qDomain.recordcount GT 0>
		<cfif Domain NEQ "/page.html">
			<cfset fail("The URL should return the relative path - instead returned #Domain#")>
		</cfif>
	<cfelse>
		<cfif Domain NEQ sURL>
			<cfset fail("The URL should return the full path - instead returned #Domain#")>
		</cfif>
	</cfif>
	
</cffunction>

<cffunction 
	name="shouldHTTPWWWDotExampleBeConvertedToDomainName" 
	access="public" 
	returntype="void" 
	output="no" 
	hint="Checks for URL with http:// and WWW - Any URL passed to convertURL should be converted to a relative URL (starting with /) if it contains a domain name in the domains table" 
	mxunit:transaction="rollback">
	
	<cfset var sURL = "http://www.example.com/page.html">
	<cfset var qDomain = Application.DomainsMgr.Domains.getRecord(DomainName='example.com')>
	<cfset var Domain = Application.DomainsMgr.Domains.convertURL(sURL)>
	
	<cfif qDomain.recordcount GT 0>
		<cfif Domain NEQ "/page.html">
			<cfset fail("The URL should return the relative path - instead returned #Domain#")>
		</cfif>
	<cfelse>
		<cfif Domain NEQ sURL>
			<cfset fail("The URL should return the full path - instead returned #Domain#")>
		</cfif>
	</cfif>
	
</cffunction>

<cffunction 
	name="shouldHTTPExampleWithPortBeConvertedToDomainName" 
	access="public" 
	returntype="void" 
	output="no" 
	hint="Checks for URL with a port - Any URL passed to convertURL should be converted to a relative URL (starting with /) if it contains a domain name in the domains table" 
	mxunit:transaction="rollback">
	
	<cfset var sURL = "http://example.com:8500/page.html">
	<cfset var qDomain = Application.DomainsMgr.Domains.getRecord(DomainName='example.com')>
	<cfset var Domain = Application.DomainsMgr.Domains.convertURL(sURL)>
	
	<cfif qDomain.recordcount GT 0>
		<cfif Domain NEQ "/page.html">
			<cfset fail("The URL should return the relative path - instead returned #Domain#")>
		</cfif>
	<cfelse>
		<cfif Domain NEQ sURL>
			<cfset fail("The URL should return the full path - instead returned #Domain#")>
		</cfif>
	</cfif>
	
</cffunction>

<cffunction 
	name="shouldHTTPWWWdotExampleWithPortBeConvertedToDomainName" 
	access="public" 
	returntype="void" 
	output="no" 
	hint="Checks for URL with WWW and a Port- Any URL passed to convertURL should be converted to a relative URL (starting with /) if it contains a domain name in the domains table" 
	mxunit:transaction="rollback">
	
	<cfset var sURL = "http://www.example.com:8500/page.html">
	<cfset var qDomain = Application.DomainsMgr.Domains.getRecord(DomainName='example.com')>
	<cfset var Domain = Application.DomainsMgr.Domains.convertURL(sURL)>
	
	<cfif qDomain.recordcount GT 0>
		<cfif Domain NEQ "/page.html">
			<cfset fail("The URL should return the relative path - instead returned #Domain#")>
		</cfif>
	<cfelse>
		<cfif Domain NEQ sURL>
			<cfset fail("The URL should return the full path - instead returned #Domain#")>
		</cfif>
	</cfif>
	
</cffunction>

<cffunction 
	name="shouldHTTPSubdomaindotExampleBeConvertedToDomainName" 
	access="public" 
	returntype="void" 
	output="no" 
	hint="Checks for URL with subdomain - Any URL passed to convertURL should be converted to a relative URL (starting with /) if it contains a domain name in the domains table" 
	mxunit:transaction="rollback">
	
	<cfset var sURL = "http://mail.example.com/page.html">
	<cfset var qDomain = Application.DomainsMgr.Domains.getRecord(DomainName='example.com')>
	<cfset var Domain = Application.DomainsMgr.Domains.convertURL(sURL)>
	
	<cfif qDomain.recordcount GT 0>
		<cfif Domain NEQ "/page.html">
			<cfset fail("The URL should return the relative path - instead returned #Domain#")>
		</cfif>
	<cfelse>
		<cfif Domain NEQ sURL>
			<cfset fail("The URL should return the full path - instead returned #Domain#")>
		</cfif>
	</cfif>
	
</cffunction>

<cffunction 
	name="shouldHTTPSubdomaindotExampleAndPortBeConvertedToDomainName" 
	access="public" 
	returntype="void" 
	output="no" 
	hint="Checks for URL with subdomain - Any URL passed to convertURL should be converted to a relative URL (starting with /) if it contains a domain name in the domains table" 
	mxunit:transaction="rollback">
	
	<cfset var sURL = "http://mail.example.com:8500/page.html">
	<cfset var qDomain = Application.DomainsMgr.Domains.getRecord(DomainName='example.com')>
	<cfset var Domain = Application.DomainsMgr.Domains.convertURL(sURL)>
	
	<cfif qDomain.recordcount GT 0>
		<cfif Domain NEQ "/page.html">
			<cfset fail("The URL should return the relative path - instead returned #Domain#")>
		</cfif>
	<cfelse>
		<cfif Domain NEQ sURL>
			<cfset fail("The URL should return the full path - instead returned #Domain#")>
		</cfif>
	</cfif>
	
</cffunction>

<!--- Check for .org's - I really should run through the whole list of tld's, but I think this will suffice --->
<cffunction 
	name="shouldExampleORGBeConvertedToDomainName" 
	access="public" 
	returntype="void" 
	output="no" 
	hint="Any URL passed to convertURL should be converted to a relative URL (starting with /) if it contains a domain name in the domains table" 
	mxunit:transaction="rollback">
	
	<cfset var sURL = "example.org/page.html">
	<cfset var qDomain = Application.DomainsMgr.Domains.getRecord(DomainName='example.org')>
	<cfset var Domain = Application.DomainsMgr.Domains.convertURL(sURL)>
	
	<cfif qDomain.recordcount GT 0>
		<cfif Domain NEQ "/page.html">
			<cfset fail("The URL should return the relative path - instead returned #Domain#")>
		</cfif>
	<cfelse>
		<cfif Domain NEQ "http://example.org/page.html">
			<cfset fail("The URL should return the full path - instead returned #Domain#")>
		</cfif>
	</cfif>
	
</cffunction>

<cffunction 
	name="shouldWWWDotExampleORGBeConvertedToDomainName" 
	access="public" 
	returntype="void" 
	output="no" 
	hint="Checks for URL with WWW - Any URL passed to convertURL should be converted to a relative URL (starting with /) if it contains a domain name in the domains table" 
	mxunit:transaction="rollback">
	
	<cfset var sURL = "www.example.org/page.html">
	<cfset var qDomain = Application.DomainsMgr.Domains.getRecord(DomainName='example.org')>
	<cfset var Domain = Application.DomainsMgr.Domains.convertURL(sURL)>
	
	<cfif qDomain.recordcount GT 0>
		<cfif Domain NEQ "/page.html">
			<cfset fail("The URL should return the relative path - instead returned #Domain#")>
		</cfif>
	<cfelse>
		<cfif Domain NEQ "http://www.example.org/page.html">
			<cfset fail("The URL should return the full path - instead returned #Domain#")>
		</cfif>
	</cfif>
	
</cffunction>

<cffunction 
	name="shouldExampleORGWithPortBeConvertedToDomainName" 
	access="public" 
	returntype="void" 
	output="no" 
	hint="Checks for URL with a port - Any URL passed to convertURL should be converted to a relative URL (starting with /) if it contains a domain name in the domains table" 
	mxunit:transaction="rollback">
	
	<cfset var sURL = "http://example.org:8500/page.html">
	<cfset var qDomain = Application.DomainsMgr.Domains.getRecord(DomainName='example.org')>
	<cfset var Domain = Application.DomainsMgr.Domains.convertURL(sURL)>
	
	<cfif qDomain.recordcount GT 0>
		<cfif Domain NEQ "/page.html">
			<cfset fail("The URL should return the relative path - instead returned #Domain#")>
		</cfif>
	<cfelse>
		<cfif Domain NEQ sURL>
			<cfset fail("The URL should return the full path - instead returned #Domain#")>
		</cfif>
	</cfif>
	
</cffunction>

<cffunction 
	name="shouldWWWdotExampleORGWithPortBeConvertedToDomainName" 
	access="public" 
	returntype="void" 
	output="no" 
	hint="Checks for URL with WWW and a Port- Any URL passed to convertURL should be converted to a relative URL (starting with /) if it contains a domain name in the domains table" 
	mxunit:transaction="rollback">
	
	<cfset var sURL = "www.example.org:8500/page.html">
	<cfset var qDomain = Application.DomainsMgr.Domains.getRecord(DomainName='example.org')>
	<cfset var Domain = Application.DomainsMgr.Domains.convertURL(sURL)>
	
	<cfif qDomain.recordcount GT 0>
		<cfif Domain NEQ "/page.html">
			<cfset fail("The URL should return the relative path - instead returned #Domain#")>
		</cfif>
	<cfelse>
		<cfif Domain NEQ "http://www.example.org:8500/page.html">
			<cfset fail("The URL should return the full path - instead returned #Domain#")>
		</cfif>
	</cfif>
	
</cffunction>

<cffunction 
	name="shouldSubdomaindotExampleORGBeConvertedToDomainName" 
	access="public" 
	returntype="void" 
	output="no" 
	hint="Checks for URL with subdomain - Any URL passed to convertURL should be converted to a relative URL (starting with /) if it contains a domain name in the domains table" 
	mxunit:transaction="rollback">
	
	<cfset var sURL = "mail.example.org/page.html">
	<cfset var qDomain = Application.DomainsMgr.Domains.getRecord(DomainName='example.org')>
	<cfset var Domain = Application.DomainsMgr.Domains.convertURL(sURL)>
	
	<cfif qDomain.recordcount GT 0>
		<cfif Domain NEQ "/page.html">
			<cfset fail("The URL should return the relative path - instead returned #Domain#")>
		</cfif>
	<cfelse>
		<cfif Domain NEQ "http://mail.example.org/page.html">
			<cfset fail("The URL should return the full path - instead returned #Domain#")>
		</cfif>
	</cfif>
	
</cffunction>

<cffunction 
	name="shouldSubdomaindotExampleORGAndPortBeConvertedToDomainName" 
	access="public" 
	returntype="void" 
	output="no" 
	hint="Checks for URL with subdomain - Any URL passed to convertURL should be converted to a relative URL (starting with /) if it contains a domain name in the domains table" 
	mxunit:transaction="rollback">
	
	<cfset var sURL = "mail.example.org:8500/page.html">
	<cfset var qDomain = Application.DomainsMgr.Domains.getRecord(DomainName='example.org')>
	<cfset var Domain = Application.DomainsMgr.Domains.convertURL(sURL)>
	
	<cfif qDomain.recordcount GT 0>
		<cfif Domain NEQ "/page.html">
			<cfset fail("The URL should return the relative path - instead returned #Domain#")>
		</cfif>
	<cfelse>
		<cfif Domain NEQ "http://mail.example.org:8500/page.html">
			<cfset fail("The URL should return the full path - instead returned #Domain#")>
		</cfif>
	</cfif>
	
</cffunction>

<cffunction 
	name="shouldHTTPExampleORGBeConvertedToDomainName" 
	access="public" 
	returntype="void" 
	output="no" 
	hint="Any URL passed to convertURL should be converted to a relative URL (starting with /) if it contains a domain name in the domains table" 
	mxunit:transaction="rollback">
	
	<cfset var sURL = "http://example.org/page.html">
	<cfset var qDomain = Application.DomainsMgr.Domains.getRecord(DomainName='example.org')>
	<cfset var Domain = Application.DomainsMgr.Domains.convertURL(sURL)>
	
	<cfif qDomain.recordcount GT 0>
		<cfif Domain NEQ "/page.html">
			<cfset fail("The URL should return the relative path - instead returned #Domain#")>
		</cfif>
	<cfelse>
		<cfif Domain NEQ "http://example.org/page.html">
			<cfset fail("The URL should return the full path - instead returned #Domain#")>
		</cfif>
	</cfif>
	
</cffunction>

<cffunction 
	name="shouldHTTPWWWDotExampleORGBeConvertedToDomainName" 
	access="public" 
	returntype="void" 
	output="no" 
	hint="Checks for URL with http:// and WWW - Any URL passed to convertURL should be converted to a relative URL (starting with /) if it contains a domain name in the domains table" 
	mxunit:transaction="rollback">
	
	<cfset var sURL = "http://www.example.org/page.html">
	<cfset var qDomain = Application.DomainsMgr.Domains.getRecord(DomainName='example.org')>
	<cfset var Domain = Application.DomainsMgr.Domains.convertURL(sURL)>
	
	<cfif qDomain.recordcount GT 0>
		<cfif Domain NEQ "/page.html">
			<cfset fail("The URL should return the relative path - instead returned #Domain#")>
		</cfif>
	<cfelse>
		<cfif Domain NEQ "http://www.example.org/page.html">
			<cfset fail("The URL should return the full path - instead returned #Domain#")>
		</cfif>
	</cfif>
	
</cffunction>

<cffunction 
	name="shouldHTTPExampleORGWithPortBeConvertedToDomainName" 
	access="public" 
	returntype="void" 
	output="no" 
	hint="Checks for URL with a port - Any URL passed to convertURL should be converted to a relative URL (starting with /) if it contains a domain name in the domains table" 
	mxunit:transaction="rollback">
	
	<cfset var sURL = "http://example.org:8500/page.html">
	<cfset var qDomain = Application.DomainsMgr.Domains.getRecord(DomainName='example.org')>
	<cfset var Domain = Application.DomainsMgr.Domains.convertURL(sURL)>
	
	<cfif qDomain.recordcount GT 0>
		<cfif Domain NEQ "/page.html">
			<cfset fail("The URL should return the relative path - instead returned #Domain#")>
		</cfif>
	<cfelse>
		<cfif Domain NEQ "http://example.org:8500/page.html">
			<cfset fail("The URL should return the full path - instead returned #Domain#")>
		</cfif>
	</cfif>
	
</cffunction>

<cffunction 
	name="shouldHTTPWWWdotExampleORGWithPortBeConvertedToDomainName" 
	access="public" 
	returntype="void" 
	output="no" 
	hint="Checks for URL with WWW and a Port- Any URL passed to convertURL should be converted to a relative URL (starting with /) if it contains a domain name in the domains table" 
	mxunit:transaction="rollback">
	
	<cfset var sURL = "http://www.example.org:8500/page.html">
	<cfset var qDomain = Application.DomainsMgr.Domains.getRecord(DomainName='example.org')>
	<cfset var Domain = Application.DomainsMgr.Domains.convertURL(sURL)>
	
	<cfif qDomain.recordcount GT 0>
		<cfif Domain NEQ "/page.html">
			<cfset fail("The URL should return the relative path - instead returned #Domain#")>
		</cfif>
	<cfelse>
		<cfif Domain NEQ "http://www.example.org:8500/page.html">
			<cfset fail("The URL should return the full path - instead returned #Domain#")>
		</cfif>
	</cfif>
	
</cffunction>

<cffunction 
	name="shouldHTTPSubdomaindotExampleORGBeConvertedToDomainName" 
	access="public" 
	returntype="void" 
	output="no" 
	hint="Checks for URL with subdomain - Any URL passed to convertURL should be converted to a relative URL (starting with /) if it contains a domain name in the domains table" 
	mxunit:transaction="rollback">
	
	<cfset var sURL = "http://mail.example.org/page.html">
	<cfset var qDomain = Application.DomainsMgr.Domains.getRecord(DomainName='example.org')>
	<cfset var Domain = Application.DomainsMgr.Domains.convertURL(sURL)>
	
	<cfif qDomain.recordcount GT 0>
		<cfif Domain NEQ "/page.html">
			<cfset fail("The URL should return the relative path - instead returned #Domain#")>
		</cfif>
	<cfelse>
		<cfif Domain NEQ "http://mail.example.org/page.html">
			<cfset fail("The URL should return the full path - instead returned #Domain#")>
		</cfif>
	</cfif>
	
</cffunction>

<cffunction 
	name="shouldHTTPSubdomaindotExampleORGAndPortBeConvertedToDomainName" 
	access="public" 
	returntype="void" 
	output="no" 
	hint="Checks for URL with subdomain - Any URL passed to convertURL should be converted to a relative URL (starting with /) if it contains a domain name in the domains table" 
	mxunit:transaction="rollback">
	
	<cfset var sURL = "http://mail.example.org:8500/page.html">
	<cfset var qDomain = Application.DomainsMgr.Domains.getRecord(DomainName='example.org')>
	<cfset var Domain = Application.DomainsMgr.Domains.convertURL(sURL)>
	
	<cfif qDomain.recordcount GT 0>
		<cfif Domain NEQ "/page.html">
			<cfset fail("The URL should return the relative path - instead returned #Domain#")>
		</cfif>
	<cfelse>
		<cfif Domain NEQ "http://mail.example.org:8500/page.html">
			<cfset fail("The URL should return the full path - instead returned #Domain#")>
		</cfif>
	</cfif>
	
</cffunction>

<!--- Check for foreign domains like bbc.co.uk --->
<cffunction 
	name="shouldBBCBeConvertedToDomainName" 
	access="public" 
	returntype="void" 
	output="no" 
	hint="Any URL passed to convertURL should be converted to a relative URL (starting with /) if it contains a domain name in the domains table" 
	mxunit:transaction="rollback">
	
	<cfset var sURL = "bbc.co.uk/page.html">
	<cfset var qDomain = Application.DomainsMgr.Domains.getRecord(DomainName='bbc.co.uk')>
	<cfset var Domain = Application.DomainsMgr.Domains.convertURL(sURL)>
	
	<cfif qDomain.recordcount GT 0>
		<cfif Domain NEQ "/page.html">
			<cfset fail("The URL should return the relative path - instead returned #Domain#")>
		</cfif>
	<cfelse>
		<cfif Domain NEQ "http://bbc.co.uk/page.html">
			<cfset fail("The URL should return the full path - instead returned #Domain#")>
		</cfif>
	</cfif>
	
</cffunction>

<cffunction 
	name="shouldWWWDotBBCBeConvertedToDomainName" 
	access="public" 
	returntype="void" 
	output="no" 
	hint="Checks for URL with WWW - Any URL passed to convertURL should be converted to a relative URL (starting with /) if it contains a domain name in the domains table" 
	mxunit:transaction="rollback">
	
	<cfset var sURL = "www.bbc.co.uk/page.html">
	<cfset var qDomain = Application.DomainsMgr.Domains.getRecord(DomainName='bbc.co.uk')>
	<cfset var Domain = Application.DomainsMgr.Domains.convertURL(sURL)>
	
	<cfif qDomain.recordcount GT 0>
		<cfif Domain NEQ "/page.html">
			<cfset fail("The URL should return the relative path - instead returned #Domain#")>
		</cfif>
	<cfelse>
		<cfif Domain NEQ "http://www.bbc.co.uk/page.html">
			<cfset fail("The URL should return the full path - instead returned #Domain#")>
		</cfif>
	</cfif>
	
</cffunction>

<cffunction 
	name="shouldBBCWithPortBeConvertedToDomainName" 
	access="public" 
	returntype="void" 
	output="no" 
	hint="Checks for URL with a port - Any URL passed to convertURL should be converted to a relative URL (starting with /) if it contains a domain name in the domains table" 
	mxunit:transaction="rollback">
	
	<cfset var sURL = "http://bbc.co.uk:8500/page.html">
	<cfset var qDomain = Application.DomainsMgr.Domains.getRecord(DomainName='bbc.co.uk')>
	<cfset var Domain = Application.DomainsMgr.Domains.convertURL(sURL)>
	
	<cfif qDomain.recordcount GT 0>
		<cfif Domain NEQ "/page.html">
			<cfset fail("The URL should return the relative path - instead returned #Domain#")>
		</cfif>
	<cfelse>
		<cfif Domain NEQ sURL>
			<cfset fail("The URL should return the full path - instead returned #Domain#")>
		</cfif>
	</cfif>
	
</cffunction>

<cffunction 
	name="shouldWWWdotBBCWithPortBeConvertedToDomainName" 
	access="public" 
	returntype="void" 
	output="no" 
	hint="Checks for URL with WWW and a Port- Any URL passed to convertURL should be converted to a relative URL (starting with /) if it contains a domain name in the domains table" 
	mxunit:transaction="rollback">
	
	<cfset var sURL = "www.bbc.co.uk:8500/page.html">
	<cfset var qDomain = Application.DomainsMgr.Domains.getRecord(DomainName='bbc.co.uk')>
	<cfset var Domain = Application.DomainsMgr.Domains.convertURL(sURL)>
	
	<cfif qDomain.recordcount GT 0>
		<cfif Domain NEQ "/page.html">
			<cfset fail("The URL should return the relative path - instead returned #Domain#")>
		</cfif>
	<cfelse>
		<cfif Domain NEQ "http://www.bbc.co.uk:8500/page.html">
			<cfset fail("The URL should return the full path - instead returned #Domain#")>
		</cfif>
	</cfif>
	
</cffunction>

<cffunction 
	name="shouldSubdomaindotBBCBeConvertedToDomainName" 
	access="public" 
	returntype="void" 
	output="no" 
	hint="Checks for URL with subdomain - Any URL passed to convertURL should be converted to a relative URL (starting with /) if it contains a domain name in the domains table" 
	mxunit:transaction="rollback">
	
	<cfset var sURL = "mail.bbc.co.uk/page.html">
	<cfset var qDomain = Application.DomainsMgr.Domains.getRecord(DomainName='bbc.co.uk')>
	<cfset var Domain = Application.DomainsMgr.Domains.convertURL(sURL)>
	
	<cfif qDomain.recordcount GT 0>
		<cfif Domain NEQ "/page.html">
			<cfset fail("The URL should return the relative path - instead returned #Domain#")>
		</cfif>
	<cfelse>
		<cfif Domain NEQ "http://mail.bbc.co.uk/page.html">
			<cfset fail("The URL should return the full path - instead returned #Domain#")>
		</cfif>
	</cfif>
	
</cffunction>

<cffunction 
	name="shouldSubdomaindotBBCAndPortBeConvertedToDomainName" 
	access="public" 
	returntype="void" 
	output="no" 
	hint="Checks for URL with subdomain - Any URL passed to convertURL should be converted to a relative URL (starting with /) if it contains a domain name in the domains table" 
	mxunit:transaction="rollback">
	
	<cfset var sURL = "mail.bbc.co.uk:8500/page.html">
	<cfset var qDomain = Application.DomainsMgr.Domains.getRecord(DomainName='bbc.co.uk')>
	<cfset var Domain = Application.DomainsMgr.Domains.convertURL(sURL)>
	
	<cfif qDomain.recordcount GT 0>
		<cfif Domain NEQ "/page.html">
			<cfset fail("The URL should return the relative path - instead returned #Domain#")>
		</cfif>
	<cfelse>
		<cfif Domain NEQ "http://mail.bbc.co.uk:8500/page.html">
			<cfset fail("The URL should return the full path - instead returned #Domain#")>
		</cfif>
	</cfif>
	
</cffunction>

<cffunction 
	name="shouldHTTPBBCBeConvertedToDomainName" 
	access="public" 
	returntype="void" 
	output="no" 
	hint="Any URL passed to convertURL should be converted to a relative URL (starting with /) if it contains a domain name in the domains table" 
	mxunit:transaction="rollback">
	
	<cfset var sURL = "http://bbc.co.uk/page.html">
	<cfset var qDomain = Application.DomainsMgr.Domains.getRecord(DomainName='bbc.co.uk')>
	<cfset var Domain = Application.DomainsMgr.Domains.convertURL(sURL)>
	
	<cfif qDomain.recordcount GT 0>
		<cfif Domain NEQ "/page.html">
			<cfset fail("The URL should return the relative path - instead returned #Domain#")>
		</cfif>
	<cfelse>
		<cfif Domain NEQ "http://bbc.co.uk/page.html">
			<cfset fail("The URL should return the full path - instead returned #Domain#")>
		</cfif>
	</cfif>
	
</cffunction>

<cffunction 
	name="shouldHTTPWWWDotBBCBeConvertedToDomainName" 
	access="public" 
	returntype="void" 
	output="no" 
	hint="Checks for URL with http:// and WWW - Any URL passed to convertURL should be converted to a relative URL (starting with /) if it contains a domain name in the domains table" 
	mxunit:transaction="rollback">
	
	<cfset var sURL = "http://www.bbc.co.uk/page.html">
	<cfset var qDomain = Application.DomainsMgr.Domains.getRecord(DomainName='bbc.co.uk')>
	<cfset var Domain = Application.DomainsMgr.Domains.convertURL(sURL)>
	
	<cfif qDomain.recordcount GT 0>
		<cfif Domain NEQ "/page.html">
			<cfset fail("The URL should return the relative path - instead returned #Domain#")>
		</cfif>
	<cfelse>
		<cfif Domain NEQ "http://www.bbc.co.uk/page.html">
			<cfset fail("The URL should return the full path - instead returned #Domain#")>
		</cfif>
	</cfif>
	
</cffunction>

<cffunction 
	name="shouldHTTPBBCWithPortBeConvertedToDomainName" 
	access="public" 
	returntype="void" 
	output="no" 
	hint="Checks for URL with a port - Any URL passed to convertURL should be converted to a relative URL (starting with /) if it contains a domain name in the domains table" 
	mxunit:transaction="rollback">
	
	<cfset var sURL = "http://bbc.co.uk:8500/page.html">
	<cfset var qDomain = Application.DomainsMgr.Domains.getRecord(DomainName='bbc.co.uk')>
	<cfset var Domain = Application.DomainsMgr.Domains.convertURL(sURL)>
	
	<cfif qDomain.recordcount GT 0>
		<cfif Domain NEQ "/page.html">
			<cfset fail("The URL should return the relative path - instead returned #Domain#")>
		</cfif>
	<cfelse>
		<cfif Domain NEQ "http://bbc.co.uk:8500/page.html">
			<cfset fail("The URL should return the full path - instead returned #Domain#")>
		</cfif>
	</cfif>
	
</cffunction>

<cffunction 
	name="shouldHTTPWWWdotBBCWithPortBeConvertedToDomainName" 
	access="public" 
	returntype="void" 
	output="no" 
	hint="Checks for URL with WWW and a Port- Any URL passed to convertURL should be converted to a relative URL (starting with /) if it contains a domain name in the domains table" 
	mxunit:transaction="rollback">
	
	<cfset var sURL = "http://www.bbc.co.uk:8500/page.html">
	<cfset var qDomain = Application.DomainsMgr.Domains.getRecord(DomainName='bbc.co.uk')>
	<cfset var Domain = Application.DomainsMgr.Domains.convertURL(sURL)>
	
	<cfif qDomain.recordcount GT 0>
		<cfif Domain NEQ "/page.html">
			<cfset fail("The URL should return the relative path - instead returned #Domain#")>
		</cfif>
	<cfelse>
		<cfif Domain NEQ "http://www.bbc.co.uk:8500/page.html">
			<cfset fail("The URL should return the full path - instead returned #Domain#")>
		</cfif>
	</cfif>
	
</cffunction>

<cffunction 
	name="shouldHTTPSubdomaindotBBCBeConvertedToDomainName" 
	access="public" 
	returntype="void" 
	output="no" 
	hint="Checks for URL with subdomain - Any URL passed to convertURL should be converted to a relative URL (starting with /) if it contains a domain name in the domains table" 
	mxunit:transaction="rollback">
	
	<cfset var sURL = "http://mail.bbc.co.uk/page.html">
	<cfset var qDomain = Application.DomainsMgr.Domains.getRecord(DomainName='bbc.co.uk')>
	<cfset var Domain = Application.DomainsMgr.Domains.convertURL(sURL)>
	
	<cfif qDomain.recordcount GT 0>
		<cfif Domain NEQ "/page.html">
			<cfset fail("The URL should return the relative path - instead returned #Domain#")>
		</cfif>
	<cfelse>
		<cfif Domain NEQ "http://mail.bbc.co.uk/page.html">
			<cfset fail("The URL should return the full path - instead returned #Domain#")>
		</cfif>
	</cfif>
	
</cffunction>

<cffunction 
	name="shouldHTTPSubdomaindotBBCAndPortBeConvertedToDomainName" 
	access="public" 
	returntype="void" 
	output="no" 
	hint="Checks for URL with subdomain - Any URL passed to convertURL should be converted to a relative URL (starting with /) if it contains a domain name in the domains table" 
	mxunit:transaction="rollback">
	
	<cfset var sURL = "http://mail.bbc.co.uk:8500/page.html">
	<cfset var qDomain = Application.DomainsMgr.Domains.getRecord(DomainName='bbc.co.uk')>
	<cfset var Domain = Application.DomainsMgr.Domains.convertURL(sURL)>
	
	<cfif qDomain.recordcount GT 0>
		<cfif Domain NEQ "/page.html">
			<cfset fail("The URL should return the relative path - instead returned #Domain#")>
		</cfif>
	<cfelse>
		<cfif Domain NEQ "http://mail.bbc.co.uk:8500/page.html">
			<cfset fail("The URL should return the full path - instead returned #Domain#")>
		</cfif>
	</cfif>
	
</cffunction>

</cfcomponent>