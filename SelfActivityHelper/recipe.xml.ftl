<?xml version="1.0"?>
<recipe>
    <instantiate from="root/src/app_package/utils/ActivityHelper.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/utils/${className}.java" />
	<instantiate from="root/res/anim/activity_close.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/anim/activity_close.xml" />
	<instantiate from="root/res/anim/activity_close_1.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/anim/activity_close_1.xml" />
	<instantiate from="root/res/anim/activity_show.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/anim/activity_show.xml" />
	<instantiate from="root/res/anim/activity_show_1.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/anim/activity_show_1.xml" />
				   
	<open file="${escapeXmlAttribute(srcOut)}/utils/${className}.java" />
</recipe>
