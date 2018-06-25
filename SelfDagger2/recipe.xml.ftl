<?xml version="1.0"?>
<recipe>
    <instantiate from="root/src/app_package/dagger2/base/BaseModule.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/dagger2/base/BaseModule.java" />
    <instantiate from="root/src/app_package/dagger2/base/BaseComponent.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/dagger2/base/BaseComponent.java" />

    <instantiate from="root/src/app_package/dagger2/module/MainModule.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/dagger2/module/${module}.java" />
    <instantiate from="root/src/app_package/dagger2/component/MainComponent.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/dagger2/component/${component}.java" />

    <open file="${escapeXmlAttribute(srcOut)}/dagger2/module/${module}.java" />
	 <open file="${escapeXmlAttribute(srcOut)}/dagger2/component/${component}.java" />
</recipe>
