<cf_PageController>

<cf_Template
	title="Check URL for relative or full path"
	showTitle="true"
>
<cfif isDefined("url.result")>
	<h2><cfoutput>#URL.result#</cfoutput></h2>
</cfif>
<cf_sebForm
   CFC_Component="#Application.DomainsMgr.Domains#"
   CFC_Method="convertURL"
   forward=domain-check.cfm?result={result}>
	<cf_sebField name="URL" label="Domain Check">
	<cf_sebField type="Submit">
</cf_sebForm>

</cf_Template>
