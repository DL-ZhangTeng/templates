<?xml version="1.0" encoding="utf-8"?>
<resources>
    <style name="Theme.PageIndicatorDefaults" parent="android:Theme">
        <item name="vpiIconPageIndicatorStyle">@style/Widget.IconPageIndicator</item>
        <item name="vpiTabPageIndicatorStyle">@style/Widget.TabPageIndicator</item>
        <item name="vpiIconTabPageIndicatorStyle">@style/Widget.IconTabPageIndicator</item>
        <!--         <item name="android:width">300dp</item>
                <item name="android:height">200dp</item> -->
    </style>

    <style name="Widget">
    </style>
    <!-- <item name="android:paddingTop">8dp</item>
            <item name="android:paddingBottom">8dp</item> -->
    <!-- <item name="android:background">@drawable/vpi__tab_indicator</item> -->
    <style name="Widget.TabPageIndicator" parent="Widget">
        <item name="android:gravity">center</item>

        <item name="android:paddingLeft">12dip</item>
        <item name="android:paddingRight">12dip</item>

        <item name="android:textAppearance">@style/TextAppearance.TabPageIndicator</item>
        <item name="android:textSize">12sp</item>
        <item name="android:maxLines">1</item>
    </style>
    <style name="Widget.IconTabPageIndicator" parent="Widget">
        <item name="android:gravity">center</item>

        <item name="android:paddingLeft">22dip</item>
        <item name="android:paddingRight">22dip</item>
        <item name="android:paddingTop">8dp</item>
        <item name="android:paddingBottom">8dp</item>
        <item name="android:textAppearance">@style/TextAppearance.TabPageIndicator</item>
        <item name="android:textSize">12sp</item>
        <item name="android:maxLines">1</item>
    </style>
    <style name="TextAppearance.TabPageIndicator" parent="Widget">
        <item name="android:textStyle">bold</item>
        <item name="android:textColor">@color/vpi__dark_theme</item>
    </style>

    <style name="Widget.IconPageIndicator" parent="Widget">
        <item name="android:layout_marginLeft">6dp</item>
        <item name="android:layout_marginRight">6dp</item>
    </style>
</resources>