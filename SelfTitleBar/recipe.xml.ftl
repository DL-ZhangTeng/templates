<?xml version="1.0"?>
<recipe>
    <instantiate from="root/src/app_package/widget/CommonTitleBar.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/CommonTitleBar.java" />
  
	<instantiate from="root/res/drawable/comm_titlebar_bottom_shadow.xml"
				   to="${escapeXmlAttribute(resOut)}/drawable/comm_titlebar_bottom_shadow.xml" />
	<instantiate from="root/res/drawable/comm_titlebar_layout_selector.xml"
				   to="${escapeXmlAttribute(resOut)}/drawable/comm_titlebar_layout_selector.xml" />
	<instantiate from="root/res/drawable/comm_titlebar_progress_draw.xml"
				   to="${escapeXmlAttribute(resOut)}/drawable/comm_titlebar_progress_draw.xml" />
	<instantiate from="root/res/drawable/comm_titlebar_reback_selector.xml"
				   to="${escapeXmlAttribute(resOut)}/drawable/comm_titlebar_reback_selector.xml" />
	<instantiate from="root/res/drawable/comm_titlebar_search_gray_shape.xml"
				   to="${escapeXmlAttribute(resOut)}/drawable/comm_titlebar_search_gray_shape.xml" />
	<instantiate from="root/res/drawable/comm_titlebar_search_white_shape.xml"
				   to="${escapeXmlAttribute(resOut)}/drawable/comm_titlebar_search_white_shape.xml" />
	<instantiate from="root/res/drawable/comm_titlebar_search_white_shape.xml"
				   to="${escapeXmlAttribute(resOut)}/drawable/comm_titlebar_search_white_shape.xml" />
				   
	<instantiate from="root/res/drawable-xhdpi/comm_titlebar_back_normal.png"
				   to="${escapeXmlAttribute(resOut)}/drawable-xhdpi/comm_titlebar_back_normal.png" />
	<instantiate from="root/res/drawable-xhdpi/comm_titlebar_delete_normal.png"
				   to="${escapeXmlAttribute(resOut)}/drawable-xhdpi/comm_titlebar_delete_normal.png" />
	<instantiate from="root/res/drawable-xhdpi/comm_titlebar_progress_circular.png"
				   to="${escapeXmlAttribute(resOut)}/drawable-xhdpi/comm_titlebar_progress_circular.png" />
	<instantiate from="root/res/drawable-xhdpi/comm_titlebar_search_normal.png"
				   to="${escapeXmlAttribute(resOut)}/drawable-xhdpi/comm_titlebar_search_normal.png" />
	<instantiate from="root/res/drawable-xhdpi/comm_titlebar_voice.png"
				   to="${escapeXmlAttribute(resOut)}/drawable-xhdpi/comm_titlebar_voice.png" />
	<instantiate from="root/res/drawable-xhdpi/comm_titlebar_left_back.png"
				   to="${escapeXmlAttribute(resOut)}/drawable-xhdpi/comm_titlebar_left_back.png" />

    <merge from="root/res/values/attrs.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/attrs.xml" />
	<merge from="root/res/values/colors.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/colors.xml" />
	<merge from="root/res/values/dimens.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/dimens.xml" />
	<merge from="root/res/values/strings.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/strings.xml" />
	<open file="${escapeXmlAttribute(srcOut)}/widget/CommonTitleBar.java" />
</recipe>
