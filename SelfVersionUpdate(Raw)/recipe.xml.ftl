<?xml version="1.0"?>
<recipe>
	<dependency mavenUrl="org.apache.httpcomponents:httpclient:4.1.2"/>
	<dependency mavenUrl="org.apache.httpcomponents:httpcore:4.1.2"/>
	
    <instantiate from="root/src/app_package/update/listener/OnUpdateListener.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/update/listener/OnUpdateListener.java" />
				   
				   
	<instantiate from="root/src/app_package/update/pojo/UpdateInfo.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/update/pojo/UpdateInfo.java" />
				   
				   
	<instantiate from="root/src/app_package/update/utils/CommonProgressDialog.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/update/utils/CommonProgressDialog.java" />			   
	<instantiate from="root/src/app_package/update/utils/Constant.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/update/utils/Constant.java" />			   
	<instantiate from="root/src/app_package/update/utils/HttpRequest.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/update/utils/HttpRequest.java" />
	<instantiate from="root/src/app_package/update/utils/JSONHandler.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/update/utils/JSONHandler.java" />	
	<instantiate from="root/src/app_package/update/utils/NetWorkUtils.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/update/utils/NetWorkUtils.java" />	
	<instantiate from="root/src/app_package/update/utils/URLUtils.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/update/utils/URLUtils.java" />		
				   
				   
	<instantiate from="root/src/app_package/update/UpdateDialogFragment.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/update/UpdateDialogFragment.java" />						   
	<instantiate from="root/src/app_package/update/UpdateHelper.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/update/UpdateHelper.java" />
				   
	<open file="${escapeXmlAttribute(srcOut)}/update/UpdateHelper.java" />
</recipe>
