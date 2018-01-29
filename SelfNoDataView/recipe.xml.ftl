<?xml version="1.0"?>
<recipe>
    <instantiate from="root/src/app_package/widget/NoDataView.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/NoDataView.java" />
    <instantiate from="root/res/layout/layout_no_data_view.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/layout_no_data_view.xml" />
    <merge from="root/res/values/attrs.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/attrs.xml" />

	<open file="${escapeXmlAttribute(srcOut)}/widget/${className}.java" />
    <open file="${escapeXmlAttribute(resOut)}/layout/layout_no_data_view.xml" />
</recipe>
