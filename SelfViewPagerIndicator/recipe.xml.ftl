<?xml version="1.0"?>
<recipe>
	<#if isTabStrip>
    <instantiate from="root/src/app_package/widget/PagerCustomSlidingTabStrip.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/PagerCustomSlidingTabStrip.java" />
    <instantiate from="root/src/app_package/widget/PagerSlidingTabStrip.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/PagerSlidingTabStrip.java" />
	<#else>
    <instantiate from="root/src/app_package/widget/CenterTabPageIndicator.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/CenterTabPageIndicator.java" />
    <instantiate from="root/src/app_package/widget/CirclePageIndicator.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/CirclePageIndicator.java" />
    <instantiate from="root/src/app_package/widget/IconPageIndicator.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/IconPageIndicator.java" />
    <instantiate from="root/src/app_package/widget/IconPagerAdapter.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/IconPagerAdapter.java" />
    <instantiate from="root/src/app_package/widget/IconTabPageIndicator.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/IconTabPageIndicator.java" />
    <instantiate from="root/src/app_package/widget/IcsLinearLayout.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/IcsLinearLayout.java" />
    <instantiate from="root/src/app_package/widget/LinePageIndicator.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/LinePageIndicator.java" />
    <instantiate from="root/src/app_package/widget/PageIndicator.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/PageIndicator.java" />
    <instantiate from="root/src/app_package/widget/TabPageIndicator.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/TabPageIndicator.java" />
    <instantiate from="root/src/app_package/widget/TitlePageIndicator.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/TitlePageIndicator.java" />
    <instantiate from="root/src/app_package/widget/UnderlinePageIndicator.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/UnderlinePageIndicator.java" />
	<merge from="root/res/values/vpi_defaults.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/vpi_defaults.xml" />
	</#if>
	<#if isTabStrip>		   
	<instantiate from="root/res/drawable/background_tab.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/drawable/background_tab.xml" />
	<instantiate from="root/res/drawable/psts_unread_bg.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/drawable/psts_unread_bg.xml" />
	<instantiate from="root/res/drawable/work_check.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/drawable/work_check.xml" />
	<instantiate from="root/res/drawable/work_check_type.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/drawable/work_check_type.xml" />
	<instantiate from="root/res/drawable/work_item_check.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/drawable/work_item_check.xml" />
	<instantiate from="root/res/drawable/work_item_uncheck.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/drawable/work_item_uncheck.xml" />
	</#if>
				   
	<merge from="root/res/values/attrs.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/attrs.xml" />
	<merge from="root/res/values/colors.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/colors.xml" />
	<merge from="root/res/values/styles.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/styles.xml" />

</recipe>
