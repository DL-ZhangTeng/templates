<?xml version="1.0" encoding="utf-8"?>
<resources>
   <style name="TitleText">
        <item name="android:layout_width">wrap_content</item>
        <item name="android:layout_height">match_parent</item>
        <item name="android:layout_centerInParent">true</item>
        <item name="android:gravity">center</item>
        <item name="android:textColor">@color/white</item>
        <item name="android:textSize">15sp</item>
        <item name="android:textStyle">normal</item>
    </style>
	
    <style name="TitleButton">
        <item name="android:layout_width">wrap_content</item>
        <item name="android:layout_height">wrap_content</item>
        <item name="android:layout_centerVertical">true</item>
        <item name="android:textColor">@color/white</item>
        <item name="android:text">""</item>
        <item name="android:textSize">15sp</item>
        <item name="android:clickable">true</item>
        <item name="android:background">@null</item>
    </style>
	<style name="TitleButton.left">
        <item name="android:layout_marginLeft">@dimen/title_left_back_margin_left</item>
    </style>

    <style name="TitleButton.right">
        <item name="android:layout_width">wrap_content</item>
        <item name="android:layout_height">wrap_content</item>
        <item name="android:layout_alignParentRight">true</item>
        <item name="android:layout_centerVertical">true</item>
        <item name="android:layout_marginRight">@dimen/title_right_margin_right</item>
        <!--<item name="android:layout_marginTop">@dimen/title_btn_padding_v</item>-->
        <!--<item name="android:layout_marginBottom">@dimen/title_btn_padding_v</item>-->
    </style>
</resources>