<?xml version="1.0"?>
<recipe>
	<!--<dependency mavenUrl="commons-codec:commons-codec:1.9"/>-->
	
    <instantiate from="root/src/app_package/utils/SDCardUtils.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/utils/${className}.java" />
	
	<open file="${escapeXmlAttribute(srcOut)}/utils/${className}.java" />
</recipe>
