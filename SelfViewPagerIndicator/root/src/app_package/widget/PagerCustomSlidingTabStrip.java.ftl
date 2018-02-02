/*
 * Copyright (C) 2013 Andreas Stuetz <andreas.stuetz@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package ${packageName}.widget;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.app.Activity;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.os.Build;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.v4.view.ViewPager;
import android.support.v4.view.ViewPager.OnPageChangeListener;
import android.text.Layout;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.widget.HorizontalScrollView;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.TextView;

import ${packageName}.R;
import ${packageName}.utils.DensityUtils;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Locale;

public class PagerCustomSlidingTabStrip extends HorizontalScrollView {

    private Context mContext;
    private int currentstoppostion = 0;
    private boolean isScrolling = false;
    private boolean isRefresh;

    public interface IconTabProvider {
        public int getPageIconResId(int position);
    }

    // @formatter:off
    private static final int[] ATTRS = new int[]{
            android.R.attr.textSize,
            android.R.attr.textColor
    };
    // @formatter:on

    private LinearLayout.LayoutParams defaultTabLayoutParams;
    private LinearLayout.LayoutParams expandedTabLayoutParams;

    private final PageListener pageListener = new PageListener();
    public OnPageChangeListener delegatePageListener;

    private LinearLayout tabsContainer;
    private ViewPager pager;

    private int tabCount;

    private int currentPosition = 0;
    private float currentPositionOffset = 0f;
    private int currentPositionOffsetPixels = -1;


    private Paint rectPaint;
    private Paint dividerPaint;

    private int indicatorColor = 0xFF666666;
    private int underlineColor = 0x1A000000;
    private int dividerColor = 0x1A000000;

    private boolean shouldExpand = false;
    private boolean textAllCaps = true;

    private int scrollOffset = 0;
    private int indicatorHeight = 8;
    private int indicatorMarginLeftRight = 0;
    private int underlineHeight = 2;
    private int dividerPadding = 12;
    private int tabPadding = 10;
    private int dividerWidth = 1;

    private int tabTextSize = 12;
    //	private int tabTextColor = 0xFF666666;
    private static final int DEFAULT_TAB_TEXT_COLOR = 0xFF666666;
    private int tabSelectedTextColor;
    private int tabUnselectedTextColor;
//    private Typeface tabTypeface = null;
//    private int tabTypefaceStyle = Typeface.BOLD;

    private int lastScrollX = 0;

    private int tabBackgroundResId = R.drawable.background_tab;

    private int tabselectedBackgroundResId;

    private HashSet<Integer> setList = new HashSet<Integer>();
    private HashSet<Integer> unreadlist = new HashSet<Integer>();

    private Locale locale;

    public PagerCustomSlidingTabStrip(Context context) {
        this(context, null);
    }

    public PagerCustomSlidingTabStrip(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public PagerCustomSlidingTabStrip(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.mContext = context;
        setFillViewport(true);
        setWillNotDraw(false);
        tabsContainer = new LinearLayout(context);
        tabsContainer.setOrientation(LinearLayout.HORIZONTAL);
        tabsContainer.setGravity(Gravity.CENTER);
        tabsContainer.setLayoutParams(new LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT));
        addView(tabsContainer);
        DisplayMetrics metrics = new DisplayMetrics();
        ((Activity)context).getWindowManager().getDefaultDisplay().getMetrics(metrics);
        scrollOffset = metrics.widthPixels/2 ;
        DisplayMetrics dm = getResources().getDisplayMetrics();
        indicatorHeight = (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, indicatorHeight, dm);
        indicatorMarginLeftRight = (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, indicatorMarginLeftRight, dm);
        underlineHeight = (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, underlineHeight, dm);
        dividerPadding = (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, dividerPadding, dm);
        tabPadding = (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, tabPadding, dm);
        dividerWidth = (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, dividerWidth, dm);
        tabTextSize = (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP, tabTextSize, dm);

        // get system attrs (android:textSize and android:textColor)

        TypedArray a = context.obtainStyledAttributes(attrs, ATTRS);

        tabTextSize = a.getDimensionPixelSize(0, tabTextSize);
//		tabTextColor = a.getColor(1, tabTextColor);
        a.recycle();

        // get custom attrs

        a = context.obtainStyledAttributes(attrs, R.styleable.PagerSlidingTabStrip);

        indicatorColor = a.getColor(R.styleable.PagerSlidingTabStrip_pstsIndicatorColor, indicatorColor);
        underlineColor = a.getColor(R.styleable.PagerSlidingTabStrip_pstsUnderlineColor, underlineColor);
        dividerColor = a.getColor(R.styleable.PagerSlidingTabStrip_pstsDividerColor, dividerColor);
        indicatorHeight = a.getDimensionPixelSize(R.styleable.PagerSlidingTabStrip_pstsIndicatorHeight, indicatorHeight);
        indicatorMarginLeftRight = a.getDimensionPixelSize(R.styleable.PagerSlidingTabStrip_pstsIndicatorMarginLeftRight, indicatorMarginLeftRight);
        underlineHeight = a.getDimensionPixelSize(R.styleable.PagerSlidingTabStrip_pstsUnderlineHeight, underlineHeight);
        dividerPadding = a.getDimensionPixelSize(R.styleable.PagerSlidingTabStrip_pstsDividerPadding, dividerPadding);
        tabPadding = a.getDimensionPixelSize(R.styleable.PagerSlidingTabStrip_pstsTabPaddingLeftRight, tabPadding);
        tabBackgroundResId = a.getResourceId(R.styleable.PagerSlidingTabStrip_pstsTabBackground, tabBackgroundResId);
        shouldExpand = a.getBoolean(R.styleable.PagerSlidingTabStrip_pstsShouldExpand, shouldExpand);
        scrollOffset = a.getDimensionPixelSize(R.styleable.PagerSlidingTabStrip_pstsScrollOffset, scrollOffset);
        textAllCaps = a.getBoolean(R.styleable.PagerSlidingTabStrip_pstsTextAllCaps, textAllCaps);
        tabSelectedTextColor = a.getColor(R.styleable.PagerSlidingTabStrip_pstsTabSelectedTextColor, DEFAULT_TAB_TEXT_COLOR);
        tabUnselectedTextColor = a.getColor(R.styleable.PagerSlidingTabStrip_pstsTabUnselectedTextColor, DEFAULT_TAB_TEXT_COLOR);

        a.recycle();

        rectPaint = new Paint();
        rectPaint.setAntiAlias(true);
        rectPaint.setStyle(Style.FILL);



        dividerPaint = new Paint();
        dividerPaint.setAntiAlias(true);
        dividerPaint.setStrokeWidth(dividerWidth);

        defaultTabLayoutParams = new LinearLayout.LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.MATCH_PARENT);
        expandedTabLayoutParams = new LinearLayout.LayoutParams(0, LayoutParams.MATCH_PARENT, 1.0f);

        if (locale == null) {
            locale = getResources().getConfiguration().locale;
        }
    }

    public void setViewPager(ViewPager pager) {
        this.pager = pager;

        if (pager.getAdapter() == null) {
            throw new IllegalStateException("ViewPager does not have adapter instance.");
        }

        pager.setOnPageChangeListener(pageListener);

        notifyDataSetChanged();
    }


    @TargetApi(Build.VERSION_CODES.GINGERBREAD)
    private void updateTabsTextColors() {
        for (int i = 0; i < tabCount; i++) {
            View v = tabsContainer.getChildAt(i);
            if (v instanceof TextView) {
                TextView tab = (TextView) v;
                if (pager.getCurrentItem() == i) {
                    if(setList != null) {
                        boolean isother = setList.contains(i + 1);
                        boolean isunread = unreadlist.contains(i + 1);
                        if(isother) {
                            tab.setBackgroundResource(R.drawable.work_item_check);
                            tab.setTextColor(getResources().getColor(R.color.psts_textcolor));
                        }else if(isunread){
                            tab.setBackgroundResource(R.drawable.psts_unread_bg);
                            tab.setTextColor(getResources().getColor(R.color.psts_textcolor));

                        }else {
                            tab.setBackgroundResource(R.drawable.work_item_uncheck);
                            tab.setTextColor(getResources().getColor(R.color.select_work_number_text_color));
                        }
                    }
                    LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(DensityUtils.dp2px(mContext, 30), DensityUtils.dp2px(mContext, 30));
                    params.setMargins(DensityUtils.dp2px(mContext, 9), DensityUtils.dp2px(mContext, 9), DensityUtils.dp2px(mContext, 9), DensityUtils.dp2px(mContext, 9));
                    tab.setLayoutParams(params);
                    tab.setTextSize(16);
                }else {
                    if(setList != null) {
                        boolean isother = setList.contains(i + 1);
                        boolean isunread = unreadlist.contains(i + 1);
                        if(isother) {
                            tab.setBackgroundResource(R.drawable.work_item_check);
                            tab.setTextColor(getResources().getColor(R.color.psts_textcolor));
                        }else if(isunread){
                            tab.setBackgroundResource(R.drawable.psts_unread_bg);
                            tab.setTextColor(getResources().getColor(R.color.psts_textcolor));

                        }else {
                            tab.setBackgroundResource(R.drawable.work_item_uncheck);
                            tab.setTextColor(getResources().getColor(R.color.select_work_number_text_color));
                        }
                    }
                    LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(DensityUtils.dp2px(mContext, 24), DensityUtils.dp2px(mContext, 24));
                    params.setMargins(DensityUtils.dp2px(mContext, 9), DensityUtils.dp2px(mContext, 9), DensityUtils.dp2px(mContext, 9), DensityUtils.dp2px(mContext, 9));
                    tab.setLayoutParams(params);
                    tab.setTextSize(13);
                }
            }
        }
    }


    @TargetApi(Build.VERSION_CODES.GINGERBREAD)
    private void updateTabsTextColors(int position, float positionOffset) {
        if(positionOffset > 0 && positionOffset < 1) {
            Log.i("PagerCustom", "position result:" + position);
            if(position < tabCount) {
                View v = tabsContainer.getChildAt(position);
                TextView tv = (TextView) v;
                View v1 = null;
                if(position == currentstoppostion) {
                    v1 = tabsContainer.getChildAt(currentstoppostion + 1);
                }else if(position == currentstoppostion - 1) {
                    v1 = tabsContainer.getChildAt(currentstoppostion);
                }else {
                    v1 = tabsContainer.getChildAt(currentstoppostion);
                }
                TextView tv1 = (TextView) v1;
                settingTextView(tv, positionOffset);
                settingTextView(tv1, 1 - positionOffset);
            }
        }
    }


    private void settingTextView(TextView tv, float positionOffset) {
        if(tv != null) {
            float size = 30 - 6 * positionOffset;
            float textsize = 16 - 3 * positionOffset;
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(DensityUtils.dp2px(mContext, size), DensityUtils.dp2px(mContext, size));
            params.setMargins(DensityUtils.dp2px(mContext, 9), DensityUtils.dp2px(mContext, 9), DensityUtils.dp2px(mContext, 9), DensityUtils.dp2px(mContext, 9));
            tv.setLayoutParams(params);
            tv.setTextSize(textsize);
        }
    }

    public void setOnPageChangeListener(OnPageChangeListener listener) {
        this.delegatePageListener = listener;
    }

    public void notifyDataSetChanged() {

        tabsContainer.removeAllViews();

        tabCount = pager.getAdapter().getCount();

        for (int i = 0; i < tabCount; i++) {

            if (pager.getAdapter() instanceof IconTabProvider) {
                addIconTab(i, ((IconTabProvider) pager.getAdapter()).getPageIconResId(i));
            } else {
                addTextTab(i, pager.getAdapter().getPageTitle(i).toString());
            }
        }

        updateTabStyles();

        getViewTreeObserver().addOnGlobalLayoutListener(new OnGlobalLayoutListener() {

            @SuppressWarnings("deprecation")
            @SuppressLint("NewApi")
            @Override
            public void onGlobalLayout() {

                if (Build.VERSION.SDK_INT < Build.VERSION_CODES.JELLY_BEAN) {
                    getViewTreeObserver().removeGlobalOnLayoutListener(this);
                } else {
                    getViewTreeObserver().removeOnGlobalLayoutListener(this);
                }
                currentPosition = pager.getCurrentItem();
                scrollToChild(currentPosition, 0);
            }
        });

    }

    private void addTextTab(final int position, String title) {
        TextView tab = new TextView(getContext());
        LinearLayout.LayoutParams params = null;
        if(position == 0) {
            tab.setTextSize(16);
            params = new LinearLayout.LayoutParams(DensityUtils.dp2px(mContext, 30), DensityUtils.dp2px(mContext, 30));
        }else {
            tab.setTextSize(13);
            params = new LinearLayout.LayoutParams(DensityUtils.dp2px(mContext,24), DensityUtils.dp2px(mContext, 24));
        }

        if(setList != null) {
            boolean isother = setList.contains(position + 1);
            boolean isunread = unreadlist.contains(position + 1);
            if(isother) {
                tab.setBackgroundResource(R.drawable.work_item_check);
                tab.setTextColor(Color.WHITE);
            }else if(isunread){
                tab.setBackgroundResource(R.drawable.psts_unread_bg);
                tab.setTextColor(Color.WHITE);
            }else {
                tab.setBackgroundResource(R.drawable.work_item_uncheck);
                tab.setTextColor(getResources().getColor(R.color.select_work_number_text_color));
            }
        }
        params.setMargins(DensityUtils.dp2px(mContext, 9), DensityUtils.dp2px(mContext, 9), DensityUtils.dp2px(mContext, 9), DensityUtils.dp2px(mContext, 9));
        tab.setLayoutParams(params);
        tab.setText(title);
        tab.setGravity(Gravity.CENTER);
        tab.setSingleLine();

        addTab(position, tab);
    }



    private void addIconTab(final int position, int resId) {

        ImageButton tab = new ImageButton(getContext());
        tab.setImageResource(resId);
        addTab(position, tab);

    }



    private void addTab(final int position, View tab) {
        tab.setFocusable(true);
        tab.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                pager.setCurrentItem(position);
            }
        });

        //tab.setPadding(tabPadding, 0, tabPadding, 0);
        tabsContainer.addView(tab, position);
    }

    private void updateTabStyles() {

//        for (int i = 0; i < tabCount; i++) {
//
//            View v = tabsContainer.getChildAt(i);
//
//            v.setBackgroundResource(tabBackgroundResId);
//
//            if (v instanceof TextView) {
//
//                TextView tab = (TextView) v;
//                tab.setTextSize(TypedValue.COMPLEX_UNIT_PX, tabTextSize);
////                tab.setTypeface(tabTypeface, tabTypefaceStyle);
////				tab.setTextColor(tabTextColor);
//
//                // setAllCaps() is only available from API 14, so the upper case is made manually if we are on a
//                // pre-ICS-build
//                if (textAllCaps) {
//                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.ICE_CREAM_SANDWICH) {
//                        tab.setAllCaps(true);
//                    } else {
//                        tab.setText(tab.getText().toString().toUpperCase(locale));
//                    }
//                }
//            }
//        }

    }

    private void scrollToChild(int position, int offset) {

        if (tabCount == 0) {
            return;
        }
        int newScrollX = 0;
        if(position == 0) {
            newScrollX = offset;
        }else {
            newScrollX = tabsContainer.getChildAt(position).getLeft() + offset + DensityUtils.dp2px(mContext, 15);
        }

        if (position > 0 || offset > 0) {
            newScrollX -= scrollOffset;
        }

        if (newScrollX != lastScrollX) {
            lastScrollX = newScrollX;
            scrollTo(newScrollX, 0);
        }

    }

    @Override
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);

        if (isInEditMode() || tabCount == 0) {
            return;
        }

        final int height = getHeight();

        // draw indicator line

        rectPaint.setColor(indicatorColor);

        // default: line below current tab
        View currentTab = tabsContainer.getChildAt(currentPosition);
        float lineLeft = currentTab.getLeft();
        float lineRight = currentTab.getRight();

        // if there is an offset, start interpolating left and right coordinates between current and next tab
        if (currentPositionOffset > 0f && currentPosition < tabCount - 1) {

            View nextTab = tabsContainer.getChildAt(currentPosition + 1);
            final float nextTabLeft = nextTab.getLeft();
            final float nextTabRight = nextTab.getRight();

            lineLeft = (currentPositionOffset * nextTabLeft + (1f - currentPositionOffset) * lineLeft);
            lineRight = (currentPositionOffset * nextTabRight + (1f - currentPositionOffset) * lineRight);
        }

        canvas.drawRect(lineLeft + indicatorMarginLeftRight, height - indicatorHeight, lineRight - indicatorMarginLeftRight, height, rectPaint);

        // draw underline

        rectPaint.setColor(underlineColor);
        canvas.drawRect(0, height - underlineHeight, tabsContainer.getWidth(), height, rectPaint);

        // draw divider

        dividerPaint.setColor(dividerColor);
        for (int i = 0; i < tabCount - 1; i++) {
            View tab = tabsContainer.getChildAt(i);
            canvas.drawLine(tab.getRight(), dividerPadding, tab.getRight(), height - dividerPadding, dividerPaint);
        }
    }

    private class PageListener implements OnPageChangeListener {

        @Override
        public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {
            Log.i("PagerCustom", "positionOffset result is:" + positionOffset + "==positionOffsetPixels result is:" + positionOffsetPixels);
            currentPosition = position;
            currentPositionOffset = positionOffset;
            if(isScrolling) {
                updateTabsTextColors(position, positionOffset);
            }
            scrollToChild(position, (int) (positionOffset * (tabsContainer.getChildAt(position).getWidth() + DensityUtils.dp2px(mContext, 18))));
            invalidate();
            currentPositionOffsetPixels = positionOffsetPixels;
            Log.i("PagerCustom", "onPageScrolled postion result is:" + position);
            if (delegatePageListener != null) {
                delegatePageListener.onPageScrolled(position, positionOffset, positionOffsetPixels);
            }
        }

        @Override
        public void onPageScrollStateChanged(int state) {
            if (state == ViewPager.SCROLL_STATE_IDLE) {
                isScrolling = false;
                updateTabsTextColors();
                scrollToChild(pager.getCurrentItem(), 0);
            }else {
                isScrolling = true;
            }
            Log.i("PagerCustom", "onPageScrollStateChanged state result is:" + state);


            if (delegatePageListener != null) {
                delegatePageListener.onPageScrollStateChanged(state);
            }
        }

        @Override
        public void onPageSelected(int position) {
            currentstoppostion = position;
            if (delegatePageListener != null) {
                delegatePageListener.onPageSelected(position);
            }
        }
    }

    public void setIndicatorColor(int indicatorColor) {
        this.indicatorColor = indicatorColor;
        invalidate();
    }

    public void setIndicatorColorResource(int resId) {
        this.indicatorColor = getResources().getColor(resId);
        invalidate();
    }

    public void setOtherBackgroundList(HashSet<Integer> bglist) {
        if(setList != null) {
            setList.clear();
            setList.addAll(bglist);
        }
    }

    public void setUnreadBackgroundList(HashSet<Integer> list) {
        if(unreadlist != null) {
            unreadlist.clear();
            unreadlist.addAll(list);
        }
    }

    public void addOtherBackGroundList(HashSet<Integer> bglist) {
        setList.addAll(bglist);
    }

    public void addMarkedBackGround(int position) {
        if(setList != null) {
            setList.add(position);
        }
        updateTabsTextColors();
        invalidate();
    }

    public int getIndicatorColor() {
        return this.indicatorColor;
    }

    public void setIndicatorHeight(int indicatorLineHeightPx) {
        this.indicatorHeight = indicatorLineHeightPx;
        invalidate();
    }

    public int getIndicatorHeight() {
        return indicatorHeight;
    }

    public void setUnderlineColor(int underlineColor) {
        this.underlineColor = underlineColor;
        invalidate();
    }

    public void setUnderlineColorResource(int resId) {
        this.underlineColor = getResources().getColor(resId);
        invalidate();
    }

    public int getUnderlineColor() {
        return underlineColor;
    }

    public void setDividerColor(int dividerColor) {
        this.dividerColor = dividerColor;
        invalidate();
    }

    public void setDividerColorResource(int resId) {
        this.dividerColor = getResources().getColor(resId);
        invalidate();
    }

    public int getDividerColor() {
        return dividerColor;
    }

    public void setUnderlineHeight(int underlineHeightPx) {
        this.underlineHeight = underlineHeightPx;
        invalidate();
    }

    public int getUnderlineHeight() {
        return underlineHeight;
    }

    public void setDividerPadding(int dividerPaddingPx) {
        this.dividerPadding = dividerPaddingPx;
        invalidate();
    }

    public int getDividerPadding() {
        return dividerPadding;
    }

    public void setScrollOffset(int scrollOffsetPx) {
        this.scrollOffset = scrollOffsetPx;
        invalidate();
    }

    public int getScrollOffset() {
        return scrollOffset;
    }

    public void setShouldExpand(boolean shouldExpand) {
        this.shouldExpand = shouldExpand;
        requestLayout();
    }

    public boolean getShouldExpand() {
        return shouldExpand;
    }

    public boolean isTextAllCaps() {
        return textAllCaps;
    }

    public void setAllCaps(boolean textAllCaps) {
        this.textAllCaps = textAllCaps;
    }

    public void setTextSize(int textSizePx) {
        this.tabTextSize = textSizePx;
        //updateTabStyles();
        updateTabsTextColors();
    }

    public int getTextSize() {
        return tabTextSize;
    }

    public void setTextColor(int textColor) {
//		this.tabTextColor = textColor;
        updateTabStyles();
        updateTabsTextColors();
    }

    public void setTextColorResource(int resId) {
//		this.tabTextColor = getResources().getColor(resId);
        updateTabStyles();
        updateTabsTextColors();
    }

//	public int getTextColor() {
//		return tabTextColor;
//	}

//    public void setTypeface(Typeface typeface, int style) {
//        this.tabTypeface = typeface;
//        this.tabTypefaceStyle = style;
//        updateTabStyles();
//        updateTabsTextColors();
//    }

    public void setTabBackground(int resId) {
        this.tabBackgroundResId = resId;
    }

    public int getTabBackground() {
        return tabBackgroundResId;
    }

    public void setTabPaddingLeftRight(int paddingPx) {
        this.tabPadding = paddingPx;
        updateTabStyles();
        updateTabsTextColors();
    }

    public int getTabPaddingLeftRight() {
        return tabPadding;
    }

    @Override
    public void onRestoreInstanceState(Parcelable state) {
        SavedState savedState = (SavedState) state;
        super.onRestoreInstanceState(savedState.getSuperState());
        currentPosition = savedState.currentPosition;
        requestLayout();
    }

    @Override
    public Parcelable onSaveInstanceState() {
        Parcelable superState = super.onSaveInstanceState();
        SavedState savedState = new SavedState(superState);
        savedState.currentPosition = currentPosition;
        return savedState;
    }

    static class SavedState extends BaseSavedState {
        int currentPosition;

        public SavedState(Parcelable superState) {
            super(superState);
        }

        private SavedState(Parcel in) {
            super(in);
            currentPosition = in.readInt();
        }

        @Override
        public void writeToParcel(Parcel dest, int flags) {
            super.writeToParcel(dest, flags);
            dest.writeInt(currentPosition);
        }

        public static final Creator<SavedState> CREATOR = new Creator<SavedState>() {
            @Override
            public SavedState createFromParcel(Parcel in) {
                return new SavedState(in);
            }

            @Override
            public SavedState[] newArray(int size) {
                return new SavedState[size];
            }
        };
    }

}
