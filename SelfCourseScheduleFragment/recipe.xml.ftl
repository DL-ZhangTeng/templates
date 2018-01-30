<?xml version="1.0"?>
<#import "root://activities/common/kotlin_macros.ftl" as kt>
<recipe>
    <@kt.addAllKotlinDependencies />
    <#if useSupport><dependency mavenUrl="com.android.support:support-v4:${buildApi}.+"/></#if>
    <#if isScroll>
        <instantiate from="root/src/app_package/fragment/HomeCourseScheduleFragment.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/fragment/${className}.java" />
		<instantiate from="root/res/layout/fragment_home_course_schedule.xml.ftl"
                       to="${escapeXmlAttribute(resOut)}/layout/${escapeXmlAttribute(fragmentName)}.xml" />

		<instantiate from="root/res/layout/layout_home_course_schedule_item_left.xml.ftl"
                       to="${escapeXmlAttribute(resOut)}/layout/layout_home_course_schedule_item_left.xml" />			
		<instantiate from="root/res/layout/layout_home_course_schedule_item_right.xml.ftl"
                       to="${escapeXmlAttribute(resOut)}/layout/layout_home_course_schedule_item_right.xml" />

		<instantiate from="root/src/app_package/widget/MyHorizontalScrollView.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/MyHorizontalScrollView.java" />						   
		<instantiate from="root/src/app_package/widget/ObservableScrollView.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/ObservableScrollView.java" />					   
		<instantiate from="root/src/app_package/widget/WrapContentListView.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/WrapContentListView.java" />	
					   
	<#else>
		<instantiate from="root/src/app_package/fragment/HomeCourseScheduleFragment2.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/fragment/${className}.java" />
		<instantiate from="root/res/layout/fragment_course_schedule.xml.ftl"
                       to="${escapeXmlAttribute(resOut)}/layout/${escapeXmlAttribute(fragmentName)}.xml" />	

		<instantiate from="root/res/layout/schedule_item.xml.ftl"
                       to="${escapeXmlAttribute(resOut)}/layout/schedule_item.xml" />	

		<instantiate from="root/src/app_package/adapter/ScheduleListAdapter.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/adapter/ScheduleListAdapter.java" />
    </#if>
	<open file="${escapeXmlAttribute(srcOut)}/fragment/${className}.java" />
	<open file="${escapeXmlAttribute(resOut)}/layout/${escapeXmlAttribute(fragmentName)}.xml" />
	
	<instantiate from="root/src/app_package/utils/TimeUtils.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/utils/TimeUtils.java" />			   		
				   
	<merge from="root/res/values/colors.xml.ftl"
                       to="${escapeXmlAttribute(resOut)}/values/colors.xml" />
	<merge from="root/res/values/strings.xml.ftl"
                       to="${escapeXmlAttribute(resOut)}/values/strings.xml" />
	<merge from="root/res/values/styles.xml.ftl"
                       to="${escapeXmlAttribute(resOut)}/values/styles.xml" />					   
    
</recipe>
