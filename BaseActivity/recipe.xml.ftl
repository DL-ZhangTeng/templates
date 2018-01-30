<?xml version="1.0"?>
<recipe>
	<#if isFirstActivity>
	<instantiate from="root/res/layout/activity_base.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />
	<merge from="root/res/values/colors.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/colors.xml" />
	<merge from="root/res/values/dimens.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/dimens.xml" />
	<#else>
    <instantiate from="root/res/layout/activity_main.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />
	</#if>
    <open file="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />
	
    <instantiate from="root/src/app_package/BaseActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/<#if isFirstActivity>base<#else>activity</#if>/${activityClass}.java" />

    <open file="${escapeXmlAttribute(srcOut)}/activity/${activityClass}.java" />
</recipe>
