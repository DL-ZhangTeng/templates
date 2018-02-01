<?xml version="1.0"?>
<#import "root://activities/common/kotlin_macros.ftl" as kt>
<recipe>
    <@kt.addAllKotlinDependencies />
    <merge from="root/res/values/strings.xml" to="${escapeXmlAttribute(resOut)}/values/strings.xml" />

    <#if includeLayout>
        <instantiate from="root/res/layout/fragment_base.xml.ftl"
                       to="${escapeXmlAttribute(resOut)}/layout/${escapeXmlAttribute(fragmentName)}.xml" />

        <open file="${escapeXmlAttribute(resOut)}/layout/${escapeXmlAttribute(fragmentName)}.xml" />
    </#if>

    <open file="${escapeXmlAttribute(srcOut)}<#if isFirstFragment>/base<#else>/fragment</#if>/${className}.java" />

    <instantiate from="root/src/app_package/BaseFragment.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}<#if isFirstFragment>/base<#else>/fragment</#if>/${className}.java" />

</recipe>
