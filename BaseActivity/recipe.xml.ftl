<?xml version="1.0"?>
<recipe>
	<#if isFirstActivity>
	<#else>
    <instantiate from="root/res/layout/activity_main.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />
	</#if>
    <open file="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />
	
    <instantiate from="root/src/app_package/BaseActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/<#if isFirstActivity>base<#else>activity</#if>/${activityClass}.java" />

    <open file="${escapeXmlAttribute(srcOut)}/<#if isFirstActivity>base<#else>activity</#if>/${activityClass}.java" />
</recipe>
