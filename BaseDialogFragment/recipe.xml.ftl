<?xml version="1.0"?>
<#import "root://activities/common/kotlin_macros.ftl" as kt>
<recipe>
    <@kt.addAllKotlinDependencies />
    <merge from="root/res/values/strings.xml.ftl" to="${escapeXmlAttribute(resOut)}/values/strings.xml" />
	<merge from="root/res/values/colors.xml.ftl" to="${escapeXmlAttribute(resOut)}/values/colors.xml" />

	<#if isFirstDialogFragment>
	<instantiate from="root/src/app_package/BaseDialogFragment.java.ftl"
                 to="${escapeXmlAttribute(srcOut)}/base/${className}.java" />
	<open file="${escapeXmlAttribute(srcOut)}/base/${className}.java" />
	<#else>
    <instantiate from="root/src/app_package/BaseDialogFragment.java.ftl"
                 to="${escapeXmlAttribute(srcOut)}/fragment/${className}.java" />
	<instantiate from="root/res/layout/fragment_dialog.xml.ftl"
                 to="${escapeXmlAttribute(resOut)}/layout/${fragmentName}.xml" />
	<open file="${escapeXmlAttribute(srcOut)}/fragment/${className}.java" />
	<open file="${escapeXmlAttribute(resOut)}/layout/${fragmentName}.xml" />
	</#if>

</recipe>
