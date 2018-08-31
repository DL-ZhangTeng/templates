package ${packageName}.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.support.v7.widget.RecyclerView;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.RelativeLayout;
import android.widget.ScrollView;

import ${packageName}.R;
import ${packageName}.widget.footer.CustomFooter;
import ${packageName}.widget.footer.Footer;
import ${packageName}.widget.header.CustomHeader;
import ${packageName}.widget.header.Header;

/**
 * 刷新布局，仿SwipeRefreshLayout
 * Created by swing on 2018/8/1.
 */
public class RefreshLayout extends ViewGroup {
    /**
     * 最后的子view检索值
     */
    private int lastChildIndex;
    /**
     * 内容view高度
     */
    private int mLayoutContentHeight;
    /**
     * 默认头部
     */
    private Header mHeader;
    /**
     * 默认脚步
     */
    private Footer mFooter;
    /**
     * 可否刷新
     */
    private boolean refreshEable = true;
    /**
     * 可否加载
     */
    private boolean loadEable = true;
    /**
     * 头部高度
     */
    private int mEffectiveHeaderHeight;
    /**
     * 脚步高度
     */
    private int mEffictiveFooterHeight;
    private int mlastMoveY;
    private int mLastYIntercept;

    private Status mStatus = Status.NORMAL;

    private OnRefreshListener mRefreshListener;

    public RefreshLayout(Context context) {
        this(context, null);
    }

    public RefreshLayout(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public RefreshLayout(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        TypedArray array = context.obtainStyledAttributes(attrs, R.styleable.RefreshLayout);
        refreshEable = array.getBoolean(R.styleable.RefreshLayout_rlrefreshenable, true);
        loadEable = array.getBoolean(R.styleable.RefreshLayout_rlloadenable, true);
        array.recycle();
    }

    @Override
    protected void onFinishInflate() {
        super.onFinishInflate();
        lastChildIndex = getChildCount() - 1;
        if (getChildAt(0) instanceof Header) {
            mHeader = (Header) getChildAt(0);
        }
        if (getChildAt(lastChildIndex) instanceof Footer) {
            mFooter = (Footer) getChildAt(lastChildIndex);
        }
        if (!(getChildAt(0) instanceof Header) && refreshEable) {
            addHeader();
        }
        if (!(getChildAt(lastChildIndex) instanceof Footer) && loadEable) {
            addFooter();
        }
    }

    @Override
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        for (int i = 0; i < getChildCount(); i++) {
            measureChild(getChildAt(i), widthMeasureSpec, heightMeasureSpec);
        }
    }

    @Override
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        mLayoutContentHeight = 0;

        for (int i = 0; i < getChildCount(); i++) {
            View child = getChildAt(i);
            if (child instanceof Header) {
                child.layout(0, 0 - child.getMeasuredHeight(), child.getMeasuredWidth(), 0);
                mEffectiveHeaderHeight = child.getHeight();
            } else if (child instanceof Footer) {
                child.layout(0, mLayoutContentHeight, child.getMeasuredWidth(), mLayoutContentHeight + child.getMeasuredHeight());
                mEffictiveFooterHeight = child.getHeight();
            } else {
                child.layout(0, mLayoutContentHeight, child.getMeasuredWidth(), mLayoutContentHeight + child.getMeasuredHeight());
                if (i < getChildCount()) {
                    if (child instanceof ScrollView) {
                        mLayoutContentHeight += getMeasuredHeight();
                        continue;
                    }
                    mLayoutContentHeight += child.getMeasuredHeight();
                }
            }
        }
    }

    @Override
    public boolean dispatchTouchEvent(MotionEvent ev) {
        return super.dispatchTouchEvent(ev);
    }

    @Override
    public boolean onInterceptTouchEvent(MotionEvent event) {
        boolean intercept = false;
        int y = (int) event.getY();

        if (mStatus == Status.REFRESHING || mStatus == Status.LOADING) {
            return false;
        }

        switch (event.getAction()) {
            case MotionEvent.ACTION_DOWN: {
                // 拦截时需要记录点击位置，不然下一次滑动会出错
                mlastMoveY = y;
                intercept = false;
                break;
            }
            case MotionEvent.ACTION_MOVE: {

                //向下滑动
                if (y > mLastYIntercept) {
                    View child = getChildAt(0);
                    intercept = getRefreshIntercept(child);

                    if (intercept) {
                        updateStatus(Status.TRY_REFRESH);
                    }
                }
                //向上滑动
                else if (y < mLastYIntercept) {
                    View child = getChildAt(lastChildIndex);
                    intercept = getLoadMoreIntercept(child);

                    if (intercept) {
                        updateStatus(Status.TRY_LOADMORE);
                    }
                } else {
                    intercept = false;
                }
                break;
            }
            case MotionEvent.ACTION_UP: {
                intercept = false;
                break;
            }
            default:
                break;
        }

        mLastYIntercept = y;
        return intercept;

    }

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        int y = (int) event.getY();

        // 正在刷新或加载更多，避免重复
        if (mStatus == Status.REFRESHING || mStatus == Status.LOADING) {
            return true;
        }

        switch (event.getAction()) {
            case MotionEvent.ACTION_DOWN:
                mlastMoveY = y;
                break;
            case MotionEvent.ACTION_MOVE:
                int dy = mlastMoveY - y;

                // 一直在下拉
                if (getScrollY() <= 0 && dy <= 0) {
                    if (mStatus == Status.TRY_LOADMORE) {
                        scrollBy(0, dy / 100);
                    } else {
                        scrollBy(0, dy / 3);
                    }
                }
                // 一直在上拉
                else if (getScrollY() >= 0 && dy >= 0) {
                    if (mStatus == Status.TRY_REFRESH) {
                        scrollBy(0, dy / 100);
                    } else {
                        scrollBy(0, dy / 3);
                    }
                } else {
                    scrollBy(0, dy / 3);
                }

                beforeRefreshing();
                beforeLoadMore();

                break;
            case MotionEvent.ACTION_UP:
                // 下拉刷新，并且到达有效长度
                if (getScrollY() <= -mEffectiveHeaderHeight) {
                    releaseWithStatusRefresh();
                    if (mRefreshListener != null) {
                        mRefreshListener.onRefresh(this);
                    }
                }
                // 上拉加载更多，达到有效长度
                else if (getScrollY() >= mEffictiveFooterHeight) {
                    releaseWithStatusLoadMore();
                    if (mRefreshListener != null) {
                        mRefreshListener.onLoadMore(this);
                    }
                } else {
                    releaseWithStatusTryRefresh();
                    releaseWithStatusTryLoadMore();
                }
                break;

            default:
                break;
        }

        mlastMoveY = y;
        return super.onTouchEvent(event);
    }

    /**
     * 刷新和加载是否拦截
     */
    private boolean getRefreshIntercept(View child) {
        boolean intercept = false;

        if (child instanceof AdapterView) {
            intercept = adapterViewRefreshIntercept(child);
        } else if (child instanceof ScrollView) {
            intercept = scrollViewRefreshIntercept(child);
        } else if (child instanceof RecyclerView) {
            intercept = recyclerViewRefreshIntercept(child);
        }
        return intercept;
    }


    private boolean getLoadMoreIntercept(View child) {
        boolean intercept = false;

        if (child instanceof AdapterView) {
            intercept = adapterViewLoadMoreIntercept(child);
        } else if (child instanceof ScrollView) {
            intercept = scrollViewLoadMoreIntercept(child);
        } else if (child instanceof RecyclerView) {
            intercept = recyclerViewLoadMoreIntercept(child);
        }
        return intercept;
    }

    /**
     * 具体判断各种View是否应该拦截
     */
    private boolean adapterViewRefreshIntercept(View child) {
        boolean intercept = true;
        AdapterView adapterChild = (AdapterView) child;
        if (adapterChild.getFirstVisiblePosition() != 0
                || adapterChild.getChildAt(0).getTop() != 0) {
            intercept = false;
        }
        return intercept;
    }

    /**
     * 判断AdapterView加载更多是否拦截
     */
    private boolean adapterViewLoadMoreIntercept(View child) {
        boolean intercept = false;
        AdapterView adapterChild = (AdapterView) child;
        if (adapterChild.getLastVisiblePosition() == adapterChild.getCount() - 1 &&
                (adapterChild.getChildAt(adapterChild.getChildCount() - 1).getBottom() >= getMeasuredHeight())) {
            intercept = true;
        }
        return intercept;
    }

    /**
     * 判断ScrollView刷新是否拦截
     */
    private boolean scrollViewRefreshIntercept(View child) {
        boolean intercept = false;
        if (child.getScrollY() <= 0) {
            intercept = true;
        }
        return intercept;
    }

    /**
     * 判断ScrollView加载更多是否拦截
     */
    private boolean scrollViewLoadMoreIntercept(View child) {
        boolean intercept = false;
        ScrollView scrollView = (ScrollView) child;
        View scrollChild = scrollView.getChildAt(0);

        if (scrollView.getScrollY() >= (scrollChild.getHeight() - scrollView.getHeight())) {
            intercept = true;
        }
        return intercept;
    }

    /**
     * 判断RecyclerView刷新是否拦截
     */
    private boolean recyclerViewRefreshIntercept(View child) {
        boolean intercept = false;

        RecyclerView recyclerView = (RecyclerView) child;
        if (recyclerView.computeVerticalScrollOffset() <= 0) {
            intercept = true;
        }
        return intercept;
    }

    /**
     * 判断RecyclerView加载更多是否拦截
     */
    private boolean recyclerViewLoadMoreIntercept(View child) {
        boolean intercept = false;

        RecyclerView recyclerView = (RecyclerView) child;
        if (recyclerView.computeVerticalScrollExtent() + recyclerView.computeVerticalScrollOffset()
                >= recyclerView.computeVerticalScrollRange()) {
            intercept = true;
        }

        return intercept;
    }

    public void beforeRefreshing() {
        if (mHeader != null) {
            mHeader.pullToRefresh(getScrollY(), mEffectiveHeaderHeight);
        }
    }

    public void beforeLoadMore() {
        if (mFooter != null) {
            mFooter.pullToLoad(getScrollY(), mEffictiveFooterHeight);
        }
    }

    private void releaseWithStatusTryRefresh() {
        scrollBy(0, -getScrollY());
        if (mHeader != null) {
            mHeader.tryRefresh();
        }
        updateStatus(Status.NORMAL);
    }

    private void releaseWithStatusTryLoadMore() {
        scrollBy(0, -getScrollY());
        if (mFooter != null) {
            mFooter.tryLoad();
        }
        updateStatus(Status.NORMAL);
    }

    private void releaseWithStatusRefresh() {
        scrollTo(0, -mEffectiveHeaderHeight);
        if (mHeader != null) {
            mHeader.refreshing();
        }
        updateStatus(Status.REFRESHING);
    }

    private void releaseWithStatusLoadMore() {
        scrollTo(0, mEffictiveFooterHeight);
        if (mFooter != null) {
            mFooter.loading();
        }
        updateStatus(Status.LOADING);
    }

    public void refreshFinished() {
        scrollTo(0, 0);
        if (mHeader != null) {
            mHeader.finish();
        }
        updateStatus(Status.NORMAL);
    }

    public void loadMoreFinished() {
        if (mFooter != null) {
            mFooter.finish();
        }
        scrollTo(0, 0);
        updateStatus(Status.NORMAL);
    }

    private void updateStatus(Status status) {
        mStatus = status;
    }

    public void setRefreshListener(OnRefreshListener mRefreshListener) {
        this.mRefreshListener = mRefreshListener;
    }

    private void addHeader() {
        mHeader = new CustomHeader(getContext());
        RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(
                LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT);
        addView((View) mHeader, params);
    }

    private void addFooter() {
        mFooter = new CustomFooter(getContext());
        RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(
                LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT);
        addView((View) mFooter, params);
    }


    private enum Status {
        NORMAL, TRY_REFRESH, REFRESHING, TRY_LOADMORE, LOADING
    }

    public interface OnRefreshListener {
        void onRefresh(RefreshLayout refreshLayout);

        void onLoadMore(RefreshLayout refreshLayout);
    }
}
