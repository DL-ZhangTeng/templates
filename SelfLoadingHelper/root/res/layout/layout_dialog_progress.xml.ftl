<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:gravity="center"
    android:background="#00000000">

    <RelativeLayout
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_gravity="center"
        android:background="@drawable/shape_loading"
        android:gravity="center"
        android:paddingTop="8dp"
        android:paddingBottom="8dp"
        android:paddingLeft="15dp"
        android:paddingRight="15dp">

        <ProgressBar
            android:id="@+id/progress_bar"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_centerHorizontal="true"
            android:indeterminate="true"
            android:indeterminateDrawable="@drawable/loadings" />

        <TextView
            android:id="@+id/loadView"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_below="@+id/progress_bar"
            android:layout_centerHorizontal="true"
            android:gravity="center"
            android:textColor="#ffffff"
            android:textSize="13sp" />
    </RelativeLayout>
</LinearLayout>

