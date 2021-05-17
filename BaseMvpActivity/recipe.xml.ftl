<?xml version="1.0"?>
<recipe>
	<#if isFirstActivity>
    <instantiate from="root/src/app_package/mvp/base/BaseModel.kt"
                   to="${escapeXmlAttribute(srcOut)}/mvp/base/BaseModel.kt" />
    <instantiate from="root/src/app_package/mvp/base/BasePresenter.kt"
                   to="${escapeXmlAttribute(srcOut)}/mvp/base/BasePresenter.kt" />
    <instantiate from="root/src/app_package/mvp/base/IView.kt"
                   to="${escapeXmlAttribute(srcOut)}/mvp/base/IView.kt" />
    <instantiate from="root/src/app_package/mvp/base/IPresenter.kt"
                   to="${escapeXmlAttribute(srcOut)}/mvp/base/IPresenter.kt" />
    <instantiate from="root/src/app_package/mvp/base/IModel.kt"
                   to="${escapeXmlAttribute(srcOut)}/mvp/base/IModel.kt" />
    <instantiate from="root/src/app_package/mvp/base/BaseLoadingView.kt"
                   to="${escapeXmlAttribute(srcOut)}/mvp/base/BaseLoadingView.kt" />
    <instantiate from="root/src/app_package/mvp/base/BaseHttpEntity.kt"
                   to="${escapeXmlAttribute(srcOut)}/mvp/base/BaseHttpEntity.kt" />
    <instantiate from="root/src/app_package/mvp/base/BaseNoNetworkView.kt"
                   to="${escapeXmlAttribute(srcOut)}/mvp/base/BaseNoNetworkView.kt" />
    <instantiate from="root/src/app_package/mvp/base/BaseRefreshView.kt"
                   to="${escapeXmlAttribute(srcOut)}/mvp/base/BaseRefreshView.kt" />
    <instantiate from="root/src/app_package/mvp/base/BaseLoadingPresenter.kt"
                   to="${escapeXmlAttribute(srcOut)}/mvp/base/BaseLoadingPresenter.kt" />
    <instantiate from="root/src/app_package/mvp/base/LoadingPresenterHandler.kt"
                   to="${escapeXmlAttribute(srcOut)}/mvp/base/LoadingPresenterHandler.kt" />         
	<#else>
    <instantiate from="root/res/layout/activity_main.xml"
                   to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />
    <instantiate from="root/src/app_package/mvp/model/imodel/IMainModel.kt"
                   to="${escapeXmlAttribute(srcOut)}/mvp/model/imodel/${imodel}.kt" />
	  <instantiate from="root/src/app_package/mvp/model/MainModel.kt"
                   to="${escapeXmlAttribute(srcOut)}/mvp/model/${model}.kt" />
    <instantiate from="root/src/app_package/mvp/presenter/ipresenter/IMainPresenter.kt"
                   to="${escapeXmlAttribute(srcOut)}/mvp/presenter/ipresenter/${ipresenter}.kt" />
    <instantiate from="root/src/app_package/mvp/presenter/MainPresenter.kt"
                   to="${escapeXmlAttribute(srcOut)}/mvp/presenter/${presenter}.kt" />
    <instantiate from="root/src/app_package/mvp/view/IMainView.kt"
                   to="${escapeXmlAttribute(srcOut)}/mvp/view/${view}.kt" />
	</#if>
    <open file="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />
	
    <instantiate from="root/src/app_package/BaseActivity.kt"
                   to="${escapeXmlAttribute(srcOut)}/<#if isFirstActivity>base<#else>activity</#if>/${activityClass}.kt" />

    <open file="${escapeXmlAttribute(srcOut)}/<#if isFirstActivity>base<#else>activity</#if>/${activityClass}.kt" />
</recipe>
