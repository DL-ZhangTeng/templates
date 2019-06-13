<?xml version="1.0" encoding="utf-8"?>
<android.support.constraint.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
	android:fitsSystemWindows="true"
    tools:context="com.zhangteng.myapplication.MainActivity">
    <com.zhiyaolai.base.widget.CommonTitleBar
        android:id="@+id/titlebar"
        android:layout_width="match_parent"
        android:layout_height="50dp"
        android:fitsSystemWindows="true"
        app:centerText="标题"
        app:centerTextColor="#ffffffff"
        app:centerTextSize="17sp"
        app:centerType="textView"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent"
        app:leftImageResource="@mipmap/ic_launcher"
        app:leftType="imageButton"
        app:rightImageResource="@mipmap/ic_launcher"
        app:rightType="imageButton"
        app:titleBarColor="#FE5722" />
   

</android.support.constraint.ConstraintLayout>
