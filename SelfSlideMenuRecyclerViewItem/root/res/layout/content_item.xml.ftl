<?xml version="1.0" encoding="utf-8"?>
<android.support.constraint.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    android:layout_width="@dimen/content_width"
    android:layout_height="60dp"
    android:layout_gravity="center_vertical"
    android:paddingStart="16dp">

    <com.zhangteng.swiperecyclerview.widget.CircleImageView
        android:id="@+id/content_avatar"
        android:layout_width="48dp"
        android:layout_height="48dp"
        app:civ_border_color="#ffffff"
        app:civ_border_width="1dp"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent" />

    <TextView
        android:id="@+id/content_title"
        android:layout_width="wrap_content"
        android:layout_height="30dp"
        android:layout_marginStart="16dp"
        android:gravity="left|bottom"
        android:textColor="#000000"
        android:textSize="16sp"
        app:layout_constraintStart_toEndOf="@+id/content_avatar" />

    <TextView
        android:id="@+id/content_content"
        android:layout_width="0dp"
        android:layout_height="30dp"
        android:layout_marginStart="16dp"
        android:gravity="left|top"
        android:textColor="#989898"
        android:ellipsize="end"
        android:maxEms="13"
        android:maxLines="1"
        android:textSize="14sp"
        app:layout_constraintStart_toEndOf="@+id/content_avatar"
        app:layout_constraintTop_toBottomOf="@id/content_title" />

    <TextView
        android:id="@+id/content_time"
        android:layout_width="60dp"
        android:layout_height="30dp"
        android:layout_marginEnd="16dp"
        android:gravity="bottom"
        android:textColor="#989898"
        android:textSize="12sp"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintTop_toTopOf="parent" />
</android.support.constraint.ConstraintLayout>