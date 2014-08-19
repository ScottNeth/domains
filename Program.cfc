<cfcomponent extends="_config.Program" display="DomainsMgr" output="false">

<cffunction name="config" access="public" returntype="void" output="no">
	<cfargument name="Config" type="any" required="yes">
	
	
	
</cffunction>

<cffunction name="components" access="public" returntype="string" output="no">
	
	<cfset var result = "">
	
	<cfsavecontent variable="result">
	<program name="DomainsMgr">
		<components>
			<component name="DomainsMgr" path="[path_component]model.DomainsMgr">
				<argument name="Manager" component="Manager" />
			</component>
		</components>
	</program>
	</cfsavecontent>
	
	<cfreturn result>
</cffunction>




<cffunction name="links" access="public" returntype="string" output="no">
	
	<cfset var result = "">
	
	<cfsavecontent variable="result"><?xml version="1.0"?>
	<program>
		<link label="Domains" url="domain-list.cfm" />
	</program>
	</cfsavecontent>
	
	<cfreturn result>
</cffunction>


</cfcomponent>