<?xml version="1.0"?>
<recipe>
	<dependency mavenUrl="com.squareup.okhttp3:okhttp:3.3.1"/>
	
    <instantiate from="root/src/app_package/okhttp/OkHttpUtils.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/okhttp/${className}.java" />
	<instantiate from="root/src/app_package/okhttp/readme.txt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/okhttp/readme.txt" />
				   
	<instantiate from="root/src/app_package/okhttp/builder/GetBuilder.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/okhttp/builder/GetBuilder.java" />
	<instantiate from="root/src/app_package/okhttp/builder/HasParamsable.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/okhttp/builder/HasParamsable.java" />
	<instantiate from="root/src/app_package/okhttp/builder/HeadBuilder.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/okhttp/builder/HeadBuilder.java" />
	<instantiate from="root/src/app_package/okhttp/builder/OkHttpRequestBuilder.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/okhttp/builder/OkHttpRequestBuilder.java" />
	<instantiate from="root/src/app_package/okhttp/builder/OtherRequestBuilder.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/okhttp/builder/OtherRequestBuilder.java" />
	<instantiate from="root/src/app_package/okhttp/builder/PostFileBuilder.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/okhttp/builder/PostFileBuilder.java" />
	<instantiate from="root/src/app_package/okhttp/builder/PostFormBuilder.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/okhttp/builder/PostFormBuilder.java" />
	<instantiate from="root/src/app_package/okhttp/builder/PostStringBuilder.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/okhttp/builder/PostStringBuilder.java" />


	<instantiate from="root/src/app_package/okhttp/callback/BitmapCallback.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/okhttp/callback/BitmapCallback.java" />
	<instantiate from="root/src/app_package/okhttp/callback/Callback.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/okhttp/callback/Callback.java" />
	<instantiate from="root/src/app_package/okhttp/callback/FileCallBack.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/okhttp/callback/FileCallBack.java" />
	<instantiate from="root/src/app_package/okhttp/callback/GenericsCallback.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/okhttp/callback/GenericsCallback.java" />
	<instantiate from="root/src/app_package/okhttp/callback/IGenericsSerializator.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/okhttp/callback/IGenericsSerializator.java" />
	<instantiate from="root/src/app_package/okhttp/callback/StringCallback.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/okhttp/callback/StringCallback.java" />	

	<instantiate from="root/src/app_package/okhttp/cookie/CookieJarImpl.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/okhttp/cookie/CookieJarImpl.java" />	
	<instantiate from="root/src/app_package/okhttp/cookie/store/CookieStore.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/okhttp/cookie/store/CookieStore.java" />	
	<instantiate from="root/src/app_package/okhttp/cookie/store/HasCookieStore.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/okhttp/cookie/store/HasCookieStore.java" />	
	<instantiate from="root/src/app_package/okhttp/cookie/store/MemoryCookieStore.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/okhttp/cookie/store/MemoryCookieStore.java" />	
	<instantiate from="root/src/app_package/okhttp/cookie/store/PersistentCookieStore.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/okhttp/cookie/store/PersistentCookieStore.java" />	
	<instantiate from="root/src/app_package/okhttp/cookie/store/SerializableHttpCookie.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/okhttp/cookie/store/SerializableHttpCookie.java" />	

	<instantiate from="root/src/app_package/okhttp/https/HttpsUtils.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/okhttp/https/HttpsUtils.java" />	

	<instantiate from="root/src/app_package/okhttp/log/LoggerInterceptor.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/okhttp/log/LoggerInterceptor.java" />			

	<instantiate from="root/src/app_package/okhttp/request/CountingRequestBody.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/okhttp/request/CountingRequestBody.java" />		
	<instantiate from="root/src/app_package/okhttp/request/GetRequest.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/okhttp/request/GetRequest.java" />		
	<instantiate from="root/src/app_package/okhttp/request/OkHttpRequest.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/okhttp/request/OkHttpRequest.java" />		
	<instantiate from="root/src/app_package/okhttp/request/OtherRequest.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/okhttp/request/OtherRequest.java" />		
	<instantiate from="root/src/app_package/okhttp/request/PostFileRequest.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/okhttp/request/PostFileRequest.java" />		
	<instantiate from="root/src/app_package/okhttp/request/PostFormRequest.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/okhttp/request/PostFormRequest.java" />		
	<instantiate from="root/src/app_package/okhttp/request/PostStringRequest.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/okhttp/request/PostStringRequest.java" />		
	<instantiate from="root/src/app_package/okhttp/request/RequestCall.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/okhttp/request/RequestCall.java" />		

	<instantiate from="root/src/app_package/okhttp/utils/Exceptions.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/okhttp/utils/Exceptions.java" />		
	<instantiate from="root/src/app_package/okhttp/utils/ImageUtils.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/okhttp/utils/ImageUtils.java" />		
	<instantiate from="root/src/app_package/okhttp/utils/L.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/okhttp/utils/L.java" />		
	<instantiate from="root/src/app_package/okhttp/utils/Platform.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/okhttp/utils/Platform.java" />		
				   
	<open file="${escapeXmlAttribute(srcOut)}/okhttp/${className}.java" />
</recipe>
