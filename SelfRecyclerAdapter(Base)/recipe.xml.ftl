<?xml version="1.0"?>
<recipe>
    
    <instantiate from="root/src/app_package/BaseAdapter.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/<#if isFirstAdapter>base<#else>adapter</#if>/${adapterClass}.java" />

    <open file="${escapeXmlAttribute(srcOut)}/<#if isFirstAdapter>base<#else>adapter</#if>/${adapterClass}.java" />
</recipe>
