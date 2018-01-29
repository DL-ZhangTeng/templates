<?xml version="1.0"?>
<recipe>
	<dependency mavenUrl="com.squareup.retrofit2:retrofit:2.3.0"/>
	<dependency mavenUrl="com.squareup.retrofit2:converter-gson:2.3.0"/>
	<dependency mavenUrl="commons-codec:commons-codec:1.9"/>
	
    <instantiate from="root/src/app_package/callback/ResponseRetrofitCallBack.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/callback/ResponseRetrofitCallBack.java" />
	<instantiate from="root/src/app_package/common/config/NetConfig.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/common/config/NetConfig.java" />
	<instantiate from="root/src/app_package/common/config/SharedPreferencesConfig.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/common/config/SharedPreferencesConfig.java" />			   
	<instantiate from="root/src/app_package/common/entity/LoginEntity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/common/entity/LoginEntity.java" />			   
	<instantiate from="root/src/app_package/common/http/Api.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/common/http/Api.java" />	
	<instantiate from="root/src/app_package/common/http/HttpRequestManager.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/common/http/HttpRequestManager.java" />	
	<instantiate from="root/src/app_package/common/http/HttpService.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/common/http/HttpService.java" />	
	<instantiate from="root/src/app_package/common/http/HttpUtils.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/common/http/HttpUtils.java" />	
	<instantiate from="root/src/app_package/common/http/StringConverterFactory.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/common/http/StringConverterFactory.java" />	
	<instantiate from="root/src/app_package/common/params/BaseParams.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/common/params/BaseParams.java" />
	<instantiate from="root/src/app_package/common/params/LoginParams.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/common/params/LoginParams.java" />
	<#if isEncrypt>
	<instantiate from="root/src/app_package/common/tools/Encryption.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/common/tools/Encryption.java" />
	<instantiate from="root/src/app_package/common/tools/Base64Utils.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/common/tools/Base64Utils.java" />
	</#if>
	<instantiate from="root/src/app_package/common/tools/GsonHelper.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/common/tools/GsonHelper.java" />		
	<instantiate from="root/src/app_package/common/tools/LogUtils.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/common/tools/LogUtils.java" />		
	<instantiate from="root/src/app_package/common/tools/NetUtil.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/common/tools/NetUtil.java" />		
	<instantiate from="root/src/app_package/common/tools/SPFUtils.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/common/tools/SPFUtils.java" />	
				   
	<instantiate from="root/res/drawable/shape_loading.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/drawable/shape_loading.xml" />
	<instantiate from="root/res/layout/layout_dialog_progress.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/layout_dialog_progress.xml" />   
	<merge from="root/res/values/styles.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/styles.xml" />   
	
	<open file="${escapeXmlAttribute(srcOut)}/common/http/Api.java" />
</recipe>
