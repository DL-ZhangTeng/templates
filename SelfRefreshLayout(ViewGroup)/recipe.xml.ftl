<?xml version="1.0"?>
<recipe>
    <instantiate from="root/src/app_package/widget/CustomFooter.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/footer/CustomFooter.java" />
	<instantiate from="root/src/app_package/widget/Footer.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/footer/Footer.java" />
	<instantiate from="root/src/app_package/widget/CustomHeader.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/header/CustomHeader.java" />
	<instantiate from="root/src/app_package/widget/Header.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/header/Header.java" />
	<instantiate from="root/src/app_package/widget/RefreshLayout.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/RefreshLayout.java" />
    <instantiate from="root/res/layout/pull_footer.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/pull_footer.xml" />
	<instantiate from="root/res/layout/pull_header.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/pull_header.xml" />
    <merge from="root/res/values/attrs.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/attrs.xml" />
	<open file="${escapeXmlAttribute(srcOut)}/widget/CustomHeader.java" />
	<open file="${escapeXmlAttribute(srcOut)}/widget/CustomFooter.java" />
	<open file="${escapeXmlAttribute(srcOut)}/widget/RefreshLayout.java" />
</recipe>
