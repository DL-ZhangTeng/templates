<?xml version="1.0"?>
<recipe>
    <instantiate from="root/src/app_package/widget/MyTabLayout.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/MyTabLayout.java" />
    <instantiate from="root/src/app_package/widget/MyTabItem.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/MyTabItem.java" />
  
    <merge from="root/res/values/attrs.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/attrs.xml" />
	<merge from="root/res/values/styles.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/styles.xml" />

	<open file="${escapeXmlAttribute(srcOut)}/widget/MyTabLayout.java" />
	<open file="${escapeXmlAttribute(srcOut)}/widget/MyTabItem.java" />
</recipe>
