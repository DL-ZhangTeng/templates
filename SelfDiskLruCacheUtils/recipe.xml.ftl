<?xml version="1.0"?>
<recipe>
	<dependency mavenUrl="com.jakewharton:disklrucache:2.0.2"/>
	
    <instantiate from="root/src/app_package/utils/DiskLruCacheUtils.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/utils/${className}.java" />
	
	<open file="${escapeXmlAttribute(srcOut)}/utils/${className}.java" />
</recipe>
