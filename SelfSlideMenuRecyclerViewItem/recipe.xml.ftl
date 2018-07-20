<?xml version="1.0"?>
<recipe>
    <instantiate from="root/src/app_package/widget/SlideMenuRecyclerViewItem.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/SlideMenuRecyclerViewItem.java" />
    <instantiate from="root/res/layout/content_item.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/content_item.xml" />
	<instantiate from="root/res/layout/menu_item.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/menu_item.xml" />
	<instantiate from="root/res/layout/slide_menu_recyclerview_item.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/slide_menu_recyclerview_item.xml" />
    <merge from="root/res/values/dimens.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/dimens.xml" />

	<open file="${escapeXmlAttribute(srcOut)}/widget/SlideMenuRecyclerViewItem.java" />
    <open file="${escapeXmlAttribute(resOut)}/layout/slide_menu_recyclerview_item.xml" />
	<open file="${escapeXmlAttribute(resOut)}/layout/content_item.xml" />
	<open file="${escapeXmlAttribute(resOut)}/layout/menu_item.xml" />
</recipe>
