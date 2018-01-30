<?xml version="1.0"?>
<recipe>
	<dependency mavenUrl="com.scwang.smartrefresh:SmartRefreshLayout:1.0.4" />

	<instantiate from="root/src/app_package/ListActivity.java.ftl"
     	to="${escapeXmlAttribute(srcOut)}/activity/${activityClass}.java" />
	<instantiate from="root/src/app_package/Bean.java.ftl"
     	to="${escapeXmlAttribute(srcOut)}/common/entity/${entityName}.java" />
	
	<instantiate from="root/res/layout/activity_list.xml.ftl"
		to="${escapeXmlAttribute(resOut)}/layout/${activityLayoutName}.xml" />

	<merge from="root/res/values/attrs.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/attrs.xml" />
	<merge from="root/res/values/colors.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/colors.xml" />
	<merge from="root/res/values/styles.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/styles.xml" />
	<merge from="root/res/values/dimens.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/dimens.xml" />
	

	<open file="${escapeXmlAttribute(resOut)}/layout/${activityLayoutName}.xml"/>        

 	<open file="${escapeXmlAttribute(srcOut)}/activity/${activityClass}.java" />
</recipe>
