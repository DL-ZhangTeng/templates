<?xml version="1.0"?>
<recipe>
	<#if isFirstActivity>
	<merge from="root/res/values/ids.xml" to="${escapeXmlAttribute(resOut)}/values/ids.xml" />
	<#else>
    <instantiate from="root/res/layout/activity_main.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />
	</#if>
    <open file="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />
	
    <instantiate from="root/src/app_package/BaseActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/<#if isFirstActivity>base/TitlebarActivity.java<#else>activity/${activityClass}.java</#if>" />

    <open file="${escapeXmlAttribute(srcOut)}/<#if isFirstActivity>base/TitlebarActivity.java<#else>activity/${activityClass}.java</#if>" />
</recipe>
