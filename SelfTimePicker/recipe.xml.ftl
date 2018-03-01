<?xml version="1.0"?>
<recipe>
	<dependency mavenUrl="com.contrarywind:Android-PickerView:3.2.7"/>
	
    <instantiate from="root/src/app_package/widget/TimePicker.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/TimePicker.java" />
				   
    <instantiate from="root/res/layout/timepicker.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/timepicker.xml" />
				   
	<instantiate from="root/res/drawable/shadow.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/drawable/shadow.xml" />
	<instantiate from="root/res/drawable/lesson_choose_bg.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/drawable/lesson_choose_bg.xml" />
				   
	<instantiate from="root/res/anim/showasdropdown_open.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/anim/showasdropdown_open.xml" />
	<instantiate from="root/res/anim/showasdropdown_close.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/anim/showasdropdown_close.xml" />
				   
	<merge from="root/res/values/colors.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/colors.xml" />
	<merge from="root/res/values/styles.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/styles.xml" />

	<open file="${escapeXmlAttribute(srcOut)}/widget/${className}.java" />
    <open file="${escapeXmlAttribute(resOut)}/layout/timepicker.xml" />
</recipe>
