<?xml version="1.0"?>
<recipe>
    <instantiate from="root/src/app_package/utils/AppManager.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/utils/${className}.java" />

	<open file="${escapeXmlAttribute(srcOut)}/utils/${className}.java" />
</recipe>
