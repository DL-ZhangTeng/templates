<?xml version="1.0"?>
<recipe>
	<dependency mavenUrl="com.android.support:support-annotations:26.1.0"/>
	
    <instantiate from="root/src/app_package/widget/CircleImageView.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/${className}.java" />
    <merge from="root/res/values/attrs.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/attrs.xml" />

	<open file="${escapeXmlAttribute(srcOut)}/widget/${className}.java" />
</recipe>
