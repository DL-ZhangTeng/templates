<?xml version="1.0"?>
<recipe>
    
    <instantiate from="root/src/app_package/TreeRecyclerViewAdapter.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/adapter/TreeRecyclerViewAdapter.java" />
	<instantiate from="root/src/app_package/Node.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/tree/Node.java" />
	<instantiate from="root/src/app_package/TreeHelper.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/tree/TreeHelper.java" />
	<instantiate from="root/src/app_package/TreeNodeChildren.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/tree/TreeNodeChildren.java" />
	<instantiate from="root/src/app_package/TreeNodeId.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/tree/TreeNodeId.java" />
	<instantiate from="root/src/app_package/TreeNodeLabel.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/tree/TreeNodeLabel.java" />
	<instantiate from="root/src/app_package/TreeNodeParent.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/tree/TreeNodeParent.java" />

    <open file="${escapeXmlAttribute(srcOut)}/adapter/TreeRecyclerViewAdapter.java" />
</recipe>
