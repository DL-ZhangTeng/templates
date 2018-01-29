<?xml version="1.0"?>
<recipe>
    <instantiate from="root/src/app_package/widget/TitleBar.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/TitleBar.java" />
    <instantiate from="root/res/layout/titlebar.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/titlebar.xml" />
	<instantiate from="root/res/drawable/left_back.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/drawable/left_back.xml" />
	<instantiate from="root/res/drawable/right_menu.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/drawable/right_menu.xml" />
	<instantiate from="root/res/drawable/title_bg.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/drawable/title_bg.xml" />
    <merge from="root/res/values/attrs.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/attrs.xml" />
	<merge from="root/res/values/colors.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/colors.xml" />
	<merge from="root/res/values/styles.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/styles.xml" />
	<merge from="root/res/values/dimens.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/dimens.xml" />

	<open file="${escapeXmlAttribute(srcOut)}/widget/${className}.java" />
    <open file="${escapeXmlAttribute(resOut)}/layout/titlebar.xml" />
</recipe>
