<?xml version="1.0"?>
<recipe>
    <instantiate from="root/src/app_package/widget/SelectView.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/SelectView.java" />
    <instantiate from="root/res/layout/widget_select_view.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/widget_select_view.xml" />
	<instantiate from="root/res/layout/item_select_view_gridview.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/item_select_view_gridview.xml" />
	<instantiate from="root/res/drawable/activity_gridview_unselect_bg.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/drawable/activity_gridview_unselect_bg.xml" />
	<instantiate from="root/res/drawable/activity_gridview_item_bg.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/drawable/activity_gridview_item_bg.xml" />
    <merge from="root/res/values/attrs.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/attrs.xml" />
	<merge from="root/res/values/colors.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/colors.xml" />
	<merge from="root/res/values/styles.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/styles.xml" />
	<merge from="root/res/values/dimens.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/dimens.xml" />

	<open file="${escapeXmlAttribute(srcOut)}/widget/${className}.java" />
    <open file="${escapeXmlAttribute(resOut)}/layout/widget_select_view.xml" />
</recipe>
