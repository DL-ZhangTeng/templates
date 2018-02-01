<?xml version="1.0"?>
<recipe>
	<dependency mavenUrl="commons-codec:commons-codec:1.9"/>
	
    <instantiate from="root/src/app_package/utils/PicCacheUtils.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/utils/${className}.java" />
	<#if isBitmapUtils>
	<instantiate from="root/src/app_package/utils/BitmapUtils.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/utils/${className}.java" />
	<open file="${escapeXmlAttribute(srcOut)}/utils/BitmapUtils.java" />
	</#if>
	<open file="${escapeXmlAttribute(srcOut)}/utils/${className}.java" />
	
</recipe>
