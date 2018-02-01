<?xml version="1.0"?>
<recipe>
	<dependency mavenUrl="com.squareup.okhttp3:okhttp:3.2.0"/>
	<dependency mavenUrl="com.squareup.okio:okio:1.7.0"/>
	
    <instantiate from="root/src/app_package/utils/HttpUtils.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/utils/${className}.java" />
	<instantiate from="root/src/app_package/utils/BaseListener.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/base/BaseListener.java" />
	<open file="${escapeXmlAttribute(srcOut)}/utils/${className}.java" />
	<open file="${escapeXmlAttribute(srcOut)}/base/BaseListener.java" />
</recipe>
