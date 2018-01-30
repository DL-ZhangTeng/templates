<?xml version="1.0"?>
<recipe>
    <instantiate from="root/src/app_package/widget/ProgressView.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/${className}.java" />
    
	<merge from="root/res/values/colors.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/colors.xml" />
	
	<open file="${escapeXmlAttribute(srcOut)}/widget/${className}.java" />
</recipe>
