<?xml version="1.0"?>
<recipe>
    <instantiate from="root/src/app_package/utils/UIManager.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/utils/UIManager.java" />
   
	<open file="${escapeXmlAttribute(srcOut)}/utils/${className}.java" />
</recipe>
