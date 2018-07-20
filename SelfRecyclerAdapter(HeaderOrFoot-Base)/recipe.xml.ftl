<?xml version="1.0"?>
<recipe>
    
    <instantiate from="root/src/app_package/HeaderOrFooterAdapter.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/adapter/HeaderOrFooterAdapter.java" />

    <open file="${escapeXmlAttribute(srcOut)}/adapter/HeaderOrFooterAdapter.java" />
</recipe>
