<?xml version="1.0"?>
<#import "root://activities/common/kotlin_macros.ftl" as kt>
<recipe>
    <@kt.addAllKotlinDependencies />
    <#if useSupport><dependency mavenUrl="com.android.support:support-v4:${buildApi}.+"/></#if>
    <merge from="root/res/values/strings.xml.ftl" to="${escapeXmlAttribute(resOut)}/values/strings.xml" />
	<merge from="root/res/values/colors.xml.ftl" to="${escapeXmlAttribute(resOut)}/values/colors.xml" />
    <open file="${escapeXmlAttribute(srcOut)}/${className}.java" />

	<#if isFirstDialogFragment>
	<instantiate from="root/src/app_package/BaseDialogFragment.java.ftl"
                 to="${escapeXmlAttribute(srcOut)}/base/${className}.java" />
	<#else>
    <instantiate from="root/src/app_package/BaseDialogFragment.java.ftl"
                 to="${escapeXmlAttribute(srcOut)}/fragment/${className}.java" />
	</#if>

</recipe>
