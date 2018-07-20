<?xml version="1.0"?>
<recipe>
    <instantiate from="root/src/app_package/widget/PullDownLoadingRecyclerView.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/widget/PullDownLoadingRecyclerView.java" />
  
    <merge from="root/res/values/dimens.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/dimens.xml" />

	<open file="${escapeXmlAttribute(srcOut)}/widget/PullDownLoadingRecyclerView.java" />
</recipe>
