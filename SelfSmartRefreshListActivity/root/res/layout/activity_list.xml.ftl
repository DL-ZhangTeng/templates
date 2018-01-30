<FrameLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:background="@color/background">
	<#if isTitleBar>
	 <${packageName}.widget.TitleBar
        android:id="@+id/titlebar_title"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        app:leftButtonSrc="@mipmap/ic_launcher"
        app:titleText="" />
	</#if>	
	<#if isNoDataView>
    <${packageName}.widget.NoDataView
        android:id="@+id/nodata"
        android:layout_width="match_parent"
        android:layout_height="match_parent"
		android:visibility="gone"
        app:nodataimage="@mipmap/ic_launcher"
        app:nodatatext="" />
	</#if>
     <com.scwang.smartrefresh.layout.SmartRefreshLayout
        android:id="@+id/srl_list"
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:paddingTop="@dimen/list_card_divider_16"
        app:srlEnableLoadmoreWhenContentNotFull="false"
        android:scrollbars="none">

        <ListView
            android:id="@+id/lv_list"
            android:layout_width="match_parent"
            android:layout_height="match_parent"
            android:divider="#00000000"
            android:listSelector="#00000000"
            android:dividerHeight="@dimen/list_card_divider_16"
            android:paddingLeft="@dimen/list_card_margin_leftorright"
            android:paddingRight="@dimen/list_card_margin_leftorright" />
    </com.scwang.smartrefresh.layout.SmartRefreshLayout>

</FrameLayout>
