<?xml version="1.0" encoding="utf-8"?>
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    android:background="@color/background"
    android:orientation="vertical">

    <TextView
        android:id="@+id/widget_select_view_tv1"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_marginLeft="@dimen/widget_select_view_height_margin"
        android:layout_marginTop="@dimen/widget_select_view_height_margin"
        android:text="科目"
        android:textColor="@color/widget_select_view_title_text_color"
        android:textSize="@dimen/widget_select_view_textsize" />

    <GridView
        android:id="@+id/widget_select_view_gv"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:layout_below="@id/widget_select_view_tv1"
        android:layout_marginLeft="@dimen/widget_select_view_height_margin"
        android:layout_marginTop="@dimen/widget_select_view_height_margin"
        android:horizontalSpacing="@dimen/widget_select_view_height_margin"
        android:numColumns="5"
        android:verticalSpacing="@dimen/widget_select_view_height_margin" />
</RelativeLayout>

