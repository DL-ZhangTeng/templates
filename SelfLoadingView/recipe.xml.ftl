<?xml version="1.0"?>
<recipe>
    <instantiate from="root/src/app_package/widget/${className}.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/${className}.java" />
    <merge from="root/res/values/attrs.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/attrs.xml" />
	<merge from="root/res/values/dimens.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/dimens.xml" />

	<open file="${escapeXmlAttribute(srcOut)}/widget/${className}.java" />
</recipe>
