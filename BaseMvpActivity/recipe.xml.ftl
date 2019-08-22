<?xml version="1.0"?>
<recipe>
	<#if isFirstActivity>
	<instantiate from="root/src/app_package/mvp/base/BaseModel.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/mvp/base/BaseModel.java" />
    <instantiate from="root/src/app_package/mvp/base/BasePresenter.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/mvp/base/BasePresenter.java" />
    <instantiate from="root/src/app_package/mvp/base/BaseView.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/mvp/base/BaseView.java" />
    <instantiate from="root/src/app_package/mvp/base/BaseContextView.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/mvp/base/BaseContextView.java" />
    <instantiate from="root/src/app_package/mvp/base/BaseHttpEntity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/mvp/base/BaseHttpEntity.java" />
    <instantiate from="root/src/app_package/mvp/base/BaseNoNetworkView.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/mvp/base/BaseNoNetworkView.java" />
    <instantiate from="root/src/app_package/mvp/base/BaseRefreshView.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/mvp/base/BaseRefreshView.java" />
	<#else>
    <instantiate from="root/res/layout/activity_main.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />
	<instantiate from="root/src/app_package/mvp/model/MainModel.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/mvp/model/${model}.java" />
    <instantiate from="root/src/app_package/mvp/presenter/MainPresenter.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/mvp/presenter/${presenter}.java" />
    <instantiate from="root/src/app_package/mvp/view/MainView.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/mvp/view/${view}.java" />
	</#if>
    <open file="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />
	
    <instantiate from="root/src/app_package/BaseActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/<#if isFirstActivity>base<#else>activity</#if>/${activityClass}.java" />

    <open file="${escapeXmlAttribute(srcOut)}/<#if isFirstActivity>base<#else>activity</#if>/${activityClass}.java" />
</recipe>
