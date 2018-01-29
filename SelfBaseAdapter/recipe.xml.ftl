<?xml version="1.0"?>
<recipe>
    
    <instantiate from="root/src/app_package/BaseAdapter.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/adapter/${adapterClass}.java" />

    <open file="${escapeXmlAttribute(srcOut)}/adapter/${adapterClass}.java" />
</recipe>
