<?xml version="1.0"?>
<globals>
    <global id="manifestOut" value="${manifestDir}" />
    <global id="buildVersion" value="${buildApi}" />
	<#assign useSupport=(minApiLevel lt 23)>
    <global id="useSupport" type="boolean" value="${useSupport?string}" />
    <global id="SupportPackage" value="${useSupport?string('.support.v4','')}" />
    <global id="resOut" value="${resDir}" />
    <global id="srcOut" value="${srcDir}/${slashedPackageName(packageName)}" />
</globals>
