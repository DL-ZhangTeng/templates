<?xml version="1.0"?>
<recipe>
	<dependency mavenUrl="cn.bmob.android:bmob-sdk:3.5.7"/>
	
    <instantiate from="root/src/app_package/bmob/callback/BmobCallBack.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/bmob/callback/BmobCallBack.java" />
	<instantiate from="root/src/app_package/bmob/config/Config.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/bmob/config/Config.java" />		   
	<instantiate from="root/src/app_package/bmob/entity/UserEntity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/bmob/entity/UserEntity.java" />			   
	<instantiate from="root/src/app_package/bmob/http/UserApi.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/bmob/http/UserApi.java" />	
	<instantiate from="root/src/app_package/bmob/params/LoginParams.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/bmob/params/LoginParams.java" />
	<instantiate from="root/src/app_package/bmob/params/RegisterParams.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/bmob/params/RegisterParams.java" />
	<instantiate from="root/src/app_package/bmob/params/UpdateUserParams.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/bmob/params/UpdateUserParams.java" />
	<instantiate from="root/src/app_package/bmob/params/UserParams.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/bmob/params/UserParams.java" />

	<instantiate from="root/src/app_package/bmob/tools/StringUtils.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/bmob/tools/StringUtils.java" />			
	<instantiate from="root/src/app_package/bmob/tools/NetUtil.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/bmob/tools/NetUtil.java" />		

				   
	<instantiate from="root/res/drawable/shape_loading.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/drawable/shape_loading.xml" />
	<instantiate from="root/res/layout/layout_dialog_progress.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/layout_dialog_progress.xml" />   
	<merge from="root/res/values/styles.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/styles.xml" />   
	
	<open file="${escapeXmlAttribute(srcOut)}/bmob/http/UserApi.java" />
</recipe>
