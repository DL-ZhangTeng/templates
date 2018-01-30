<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="wrap_content"
    android:layout_height="match_parent"
    android:orientation="vertical">

    <FrameLayout
        android:layout_width="wrap_content"
        android:layout_height="wrap_content">

        <LinearLayout
            android:id="@+id/home_course_schedule_pinned"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:orientation="horizontal">

            <TextView
                android:layout_width="50dp"
                android:layout_height="match_parent"
                android:gravity="bottom"
                android:text="科目" />

            <TextView
                android:layout_width="50dp"
                android:layout_height="match_parent"
                android:gravity="top"
                android:text="星期" />

            <${packageName}.widget.MyHorizontalScrollView
                android:id="@+id/home_course_schedule_pinnedhscrollview"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:scrollbars="none">

                <LinearLayout
                    android:layout_width="wrap_content"
                    android:layout_height="wrap_content"
                    android:orientation="horizontal">

                    <TextView
                        android:id="@+id/home_course_schedule_btn_1"
                        android:layout_width="50dp"
                        android:layout_height="match_parent"
                        android:gravity="center"
                        android:padding="10dp"
                        android:text="周一" />

                    <TextView
                        android:id="@+id/home_course_schedule_btn_2"
                        android:layout_width="50dp"
                        android:layout_height="match_parent"
                        android:gravity="center"
                        android:padding="10dp"
                        android:text="周二" />

                    <TextView
                        android:id="@+id/home_course_schedule_btn_3"
                        android:layout_width="50dp"
                        android:layout_height="match_parent"
                        android:gravity="center"
                        android:padding="10dp"
                        android:text="周三" />

                    <TextView
                        android:id="@+id/home_course_schedule_btn_4"
                        android:layout_width="50dp"
                        android:layout_height="match_parent"
                        android:gravity="center"
                        android:padding="10dp"
                        android:text="周四" />

                    <TextView
                        android:id="@+id/home_course_schedule_btn_5"
                        android:layout_width="50dp"
                        android:layout_height="match_parent"
                        android:gravity="center"
                        android:padding="10dp"
                        android:text="周五" />

                    <TextView
                        android:id="@+id/home_course_schedule_btn_6"
                        android:layout_width="50dp"
                        android:layout_height="match_parent"
                        android:gravity="center"
                        android:padding="10dp"
                        android:text="周六" />

                    <TextView
                        android:id="@+id/home_course_schedule_btn_7"
                        android:layout_width="50dp"
                        android:layout_height="match_parent"
                        android:gravity="center"
                        android:padding="10dp"
                        android:text="周日" />
                </LinearLayout>

            </${packageName}.widget.MyHorizontalScrollView>
        </LinearLayout>
    </FrameLayout>

    <${packageName}.widget.ObservableScrollView
        android:id="@+id/home_course_schedule_root_scrollview"
        android:layout_width="match_parent"
        android:layout_height="match_parent">

        <LinearLayout
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:orientation="vertical">


            <${packageName}.widget.ObservableScrollView
                android:id="@+id/home_course_schedule_main_scrollview"
                android:layout_width="match_parent"
                android:layout_height="match_parent">

                <LinearLayout
                    android:layout_width="wrap_content"
                    android:layout_height="wrap_content"
                    android:orientation="horizontal">

                    <${packageName}.widget.WrapContentListView
                        android:id="@+id/home_course_schedule_left_lv"
                        android:layout_width="100dp"
                        android:layout_height="wrap_content"
                        android:scrollbars="none" />

                    <${packageName}.widget.MyHorizontalScrollView
                        android:id="@+id/home_course_schedule_hscrollview"
                        android:layout_width="wrap_content"
                        android:layout_height="wrap_content">

                        <${packageName}.widget.WrapContentListView
                            android:id="@+id/home_course_schedule_right_lv"
                            android:layout_width="wrap_content"
                            android:layout_height="wrap_content" />

                    </${packageName}.widget.MyHorizontalScrollView>
                </LinearLayout>
            </${packageName}.widget.ObservableScrollView>
        </LinearLayout>
    </${packageName}.widget.ObservableScrollView>
</LinearLayout>
