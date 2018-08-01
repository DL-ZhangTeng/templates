<?xml version="1.0" encoding="utf-8"?>
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
                android:layout_width="match_parent"
                android:layout_height="wrap_content"
                android:padding="10dp">

  <TextView
    android:textSize="16sp"
    android:id="@+id/header_text"
    android:layout_width="wrap_content"
    android:layout_height="wrap_content"
    android:layout_centerInParent="true"
    android:text="下拉刷新"/>

  <ProgressBar
    android:id="@+id/header_progressbar"
    android:layout_width="30dp"
    android:layout_height="30dp"
    android:layout_toLeftOf="@+id/header_text"
    android:visibility="gone"/>

</RelativeLayout>