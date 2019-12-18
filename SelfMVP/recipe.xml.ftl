<?xml version="1.0"?>
<recipe>
	<#if isBaseMVP>
    <instantiate from="root/src/app_package/mvp/base/BaseModel.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/mvp/base/BaseModel.java" />
    <instantiate from="root/src/app_package/mvp/base/BasePresenter.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/mvp/base/BasePresenter.java" />
    <instantiate from="root/src/app_package/mvp/base/BaseView.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/mvp/base/BaseView.java" />
    <instantiate from="root/src/app_package/mvp/base/BaseLoadingView.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/mvp/base/BaseLoadingView.java" />
    <instantiate from="root/src/app_package/mvp/base/BaseHttpEntity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/mvp/base/BaseHttpEntity.java" />
    <instantiate from="root/src/app_package/mvp/base/BaseNoNetworkView.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/mvp/base/BaseNoNetworkView.java" />
    <instantiate from="root/src/app_package/mvp/base/BaseRefreshView.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/mvp/base/BaseRefreshView.java" />
	</#if>
    <instantiate from="root/src/app_package/mvp/model/MainModel.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/mvp/model/${model}.java" />
    <instantiate from="root/src/app_package/mvp/presenter/MainPresenter.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/mvp/presenter/${presenter}.java" />
    <instantiate from="root/src/app_package/mvp/view/MainView.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/mvp/view/${view}.java" />

    <open file="${escapeXmlAttribute(srcOut)}/${presenter}.java" />
</recipe>
