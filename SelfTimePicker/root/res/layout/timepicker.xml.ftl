<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:background="@drawable/shadow"
    android:gravity="center"
    android:orientation="vertical">

    <LinearLayout
        android:id="@+id/timepicker"
        android:layout_width="fill_parent"
        android:layout_height="wrap_content"
        android:background="@android:color/white"
        android:gravity="center_horizontal"
        android:orientation="horizontal"
        android:paddingLeft="20dp"
        android:paddingRight="20dp">

        <com.bigkoo.pickerview.lib.WheelView
            android:id="@+id/year"
            android:layout_width="100dp"
            android:layout_height="wrap_content" />

        <TextView
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_gravity="center_vertical"
            android:text="年"
            android:textColor="#000000"
            android:textSize="18sp" />

        <com.bigkoo.pickerview.lib.WheelView

            android:id="@+id/month"
            android:layout_width="100dp"
            android:layout_height="wrap_content" />

        <TextView
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_gravity="center_vertical"
            android:text="月"
            android:textColor="#000000"
            android:textSize="18sp" />
    </LinearLayout>

    <Button
        android:id="@+id/btn_ok"
        android:layout_width="match_parent"
        android:layout_height="40dp"
        android:layout_marginTop="8dp"
        android:background="@drawable/lesson_choose_bg"
        android:gravity="center"
        android:text="确定"
        android:textColor="@color/theme"
        android:textSize="14sp" />
</LinearLayout>
