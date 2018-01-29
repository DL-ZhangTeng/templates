<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:id="@+id/title"
    android:layout_width="fill_parent"
    android:orientation="horizontal"
    android:layout_height="@dimen/title_height"
    android:background="@drawable/title_bg"
    android:gravity="center_vertical">

    <RelativeLayout
        android:id="@+id/titlebar_left_back"
        android:layout_width="0dp"
        android:layout_weight="1"
        android:onClick="buttonClick"
        android:layout_height="match_parent">

        <ImageView
            android:id="@+id/titlebar_left"
            android:layout_width="20dp"
            android:layout_height="20dp"
            android:layout_centerVertical="true"
            android:scaleType="fitStart"
            android:onClick="buttonClick"
            android:layout_marginLeft="10dp"
            />


    </RelativeLayout>

    <RelativeLayout
        android:layout_width="0dp"
        android:layout_weight="2"
        android:layout_height="match_parent">

        <TextView
            android:id="@+id/titlebar_title"
            android:drawablePadding="@dimen/chat_address_item_text_margin_v"
            android:maxLines="1"
            android:ellipsize="end"
            style="@style/TitleText"
            />
    </RelativeLayout>


    <RelativeLayout
        android:layout_width="0dp"
        android:layout_weight="1"
        android:layout_height="match_parent">


        <ImageView
            android:id="@+id/titlebar_right_button"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_alignParentRight="true"
            android:layout_centerVertical="true"
            android:layout_marginRight="@dimen/common_title_bar_padding_left"
            android:scaleType="centerInside"
            />
        <Button
            android:id="@+id/titlebar_right"
            style="@style/TitleButton.right"
            android:layout_alignParentRight="true"
            android:layout_marginRight="@dimen/title_btn_margin"
            android:layout_marginTop="@dimen/album_image_margin_top_bottom"
            android:layout_marginBottom="@dimen/album_image_margin_top_bottom"
            android:gravity="right|center_vertical"
            android:scaleType="fitCenter"
            android:textColor="@color/white"
            />

    </RelativeLayout>

</LinearLayout>
