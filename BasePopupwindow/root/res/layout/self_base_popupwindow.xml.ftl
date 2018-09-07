<?xml version="1.0" encoding="utf-8"?>
<android.support.constraint.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    android:layout_width="wrap_content"
    android:layout_height="wrap_content"
    android:background="@drawable/self_popupwindow_round_bg">

    <LinearLayout
        android:id="@+id/self_base_popupwindow_title"
        android:layout_width="0dp"
        android:layout_height="wrap_content"
        android:orientation="vertical"
        app:layout_constraintBottom_toTopOf="@id/self_base_popupwindow_content"
        app:layout_constraintLeft_toLeftOf="@id/self_base_popupwindow_content"
        app:layout_constraintRight_toRightOf="@id/self_base_popupwindow_content"
        app:layout_constraintTop_toTopOf="parent"
		app:layout_constraintVertical_bias="1"
        app:layout_constraintVertical_chainStyle="packed"		/>

    <android.support.constraint.ConstraintLayout
        android:id="@+id/self_base_popupwindow_content"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        app:layout_constraintBottom_toTopOf="@id/self_base_popupwindow_button"
        app:layout_constraintLeft_toLeftOf="parent"
        app:layout_constraintRight_toRightOf="parent"
        app:layout_constraintTop_toBottomOf="@id/self_base_popupwindow_title"
		app:layout_constraintVertical_bias="1"
        app:layout_constraintVertical_chainStyle="packed"		/>

    <LinearLayout
        android:id="@+id/self_base_popupwindow_button"
        android:layout_width="0dp"
        android:layout_height="wrap_content"
        android:gravity="center"
        android:orientation="horizontal"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintLeft_toLeftOf="@id/self_base_popupwindow_content"
        app:layout_constraintRight_toRightOf="@id/self_base_popupwindow_content"
        app:layout_constraintTop_toBottomOf="@id/self_base_popupwindow_content"
		app:layout_constraintVertical_bias="1"
        app:layout_constraintVertical_chainStyle="packed"		/>
</android.support.constraint.ConstraintLayout>