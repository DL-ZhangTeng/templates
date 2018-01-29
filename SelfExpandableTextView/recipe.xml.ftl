<?xml version="1.0"?>
<recipe>
    <instantiate from="root/src/app_package/widget/ExpandableTextView.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/ExpandableTextView.java" />
	<#if isUtils>
	<instantiate from="root/src/app_package/utils/DensityUtil.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/utils/DensityUtil.java" />
	</#if>
    <instantiate from="root/res/layout/item_expand_collapse.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/item_expand_collapse.xml" />
    <merge from="root/res/values/attrs.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/attrs.xml" />
	<merge from="root/res/values/colors.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/colors.xml" />

	<open file="${escapeXmlAttribute(srcOut)}/widget/${className}.java" />
    <open file="${escapeXmlAttribute(resOut)}/layout/item_expand_collapse.xml" />
</recipe>
