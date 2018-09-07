<?xml version="1.0"?>
<#import "root://activities/common/kotlin_macros.ftl" as kt>
<recipe>
  
    <merge from="root/res/values/styles.xml" to="${escapeXmlAttribute(resOut)}/values/styles.xml" />
	<merge from="root/res/anim/self_popupwindow_showasdropdown_close.xml" to="${escapeXmlAttribute(resOut)}/anim/self_popupwindow_showasdropdown_close.xml" />
	<merge from="root/res/anim/self_popupwindow_showasdropdown_open.xml" to="${escapeXmlAttribute(resOut)}/anim/self_popupwindow_showasdropdown_open.xml" />
	<merge from="root/res/drawable/self_popupwindow_round_bg.xml" to="${escapeXmlAttribute(resOut)}/drawable/self_popupwindow_round_bg.xml" />

    <#if isFirstPopupWindow>
        <instantiate from="root/res/layout/self_base_popupwindow.xml.ftl"
                       to="${escapeXmlAttribute(resOut)}/layout/self_base_popupwindow.xml" />

        <open file="${escapeXmlAttribute(resOut)}/layout/self_base_popupwindow.xml" />
    </#if>


    <instantiate from="root/src/app_package/BasePopupWindow.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}<#if isFirstPopupWindow>/base<#else>/widget</#if>/${className}.java" />
    <open file="${escapeXmlAttribute(srcOut)}<#if isFirstPopupWindow>/base<#else>/widget</#if>/${className}.java" />

</recipe>
