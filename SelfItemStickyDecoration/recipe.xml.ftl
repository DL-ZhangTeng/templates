<?xml version="1.0"?>
<recipe>
    <instantiate from="root/src/app_package/widget/GroupInfo.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/bean/GroupInfo.java" />
	<instantiate from="root/src/app_package/widget/ItemStickyDecoration.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/ItemStickyDecoration.java" />

	<open file="${escapeXmlAttribute(srcOut)}/widget/ItemStickyDecoration.java" />
	<open file="${escapeXmlAttribute(srcOut)}/bean/GroupInfo.java" />
</recipe>
