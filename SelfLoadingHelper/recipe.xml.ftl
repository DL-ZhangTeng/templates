<?xml version="1.0"?>
<recipe>
    <instantiate from="root/src/app_package/widget/LoadViewHelper.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/utils/LoadViewHelper.java" />
    <instantiate from="root/res/layout/layout_dialog_progress.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/layout_dialog_progress.xml" />
				   
	<instantiate from="root/res/drawable/loadings.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/drawable/loadings.xml" />
	<instantiate from="root/res/drawable/shape_loading.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/drawable/shape_loading.xml" />
				   
	<instantiate from="root/res/drawable/loading_01.png"
                   to="${escapeXmlAttribute(resOut)}/drawable/loading_01.png" />
	<instantiate from="root/res/drawable/loading_02.png"
                   to="${escapeXmlAttribute(resOut)}/drawable/loading_02.png" />
	<instantiate from="root/res/drawable/loading_03.png"
                   to="${escapeXmlAttribute(resOut)}/drawable/loading_03.png" />
	<instantiate from="root/res/drawable/loading_04.png"
                   to="${escapeXmlAttribute(resOut)}/drawable/loading_04.png" />
	<instantiate from="root/res/drawable/loading_05.png"
                   to="${escapeXmlAttribute(resOut)}/drawable/loading_05.png" />
	<instantiate from="root/res/drawable/loading_06.png"
                   to="${escapeXmlAttribute(resOut)}/drawable/loading_06.png" />
	<instantiate from="root/res/drawable/loading_07.png"
                   to="${escapeXmlAttribute(resOut)}/drawable/loading_07.png" />
	<instantiate from="root/res/drawable/loading_08.png"
                   to="${escapeXmlAttribute(resOut)}/drawable/loading_08.png" />
	<instantiate from="root/res/drawable/loading_09.png"
                   to="${escapeXmlAttribute(resOut)}/drawable/loading_09.png" />
	<instantiate from="root/res/drawable/loading_10.png"
                   to="${escapeXmlAttribute(resOut)}/drawable/loading_10.png" />
	<instantiate from="root/res/drawable/loading_11.png"
                   to="${escapeXmlAttribute(resOut)}/drawable/loading_11.png" />
	<instantiate from="root/res/drawable/loading_12.png"
                   to="${escapeXmlAttribute(resOut)}/drawable/loading_12.png" />
				   
    <merge from="root/res/values/styles.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/styles.xml" />

	<open file="${escapeXmlAttribute(srcOut)}/widget/${className}.java" />
    <open file="${escapeXmlAttribute(resOut)}/layout/layout_no_data_view.xml" />
</recipe>
