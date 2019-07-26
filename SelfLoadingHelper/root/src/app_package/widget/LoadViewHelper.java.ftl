package ${packageName}.utils;

import android.app.Dialog;
import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.util.SparseArray;
import android.widget.TextView;

import ${packageName}.widget.NoDataView;
import ${packageName}.R;

/**
 * 将某个视图替换为正在加载、无数据、加载失败等视图
 * Created by swing on 2018/10/8.
 */
public class LoadViewHelper {
    private SparseArray<View> contentViews;
    private SparseArray<NoDataView> noDataViews;
    private Dialog mProgressDialog;
    private TextView loadView;
	private AgainRequestListener againRequestListener;
	
	private final static int FOUNDNODATA = 0;
	private final static int NETWORKNO = 1;
   
    /**
     * 搜索无数据view
     *
     * @param currentView 需要替换的view
     */
    public void showFoundNodataView(View currentView) {
        showNodataView(FOUNDNODATA, currentView, R.mipmap.ic_launcher, "搜索无结果", "");
    }

	/**
     * 网络无数据view
     *
     * @param currentView 需要替换的view
     */
    public void showNetNodataView(View currentView) {
        showNodataView(NETWORKNO, currentView, R.mipmap.ic_launcher, "无网络", "点击重试");
    }
	

    /**
     * 显示无数据view
     *
     * @param currentView 需要替换的view
     */
    private void showNodataView(int type, View currentView, int drawableRes, String nodataText, String nodataAgainText) {
        if (contentViews.get(type, null) == null) {
            contentViews.put(type, currentView);
        }
        if (noDataViews.get(type, null) == null) {
            noDataViews.put(type, new NoDataView(contentViews.get(type).getContext()));
            noDataViews.get(type).setAgainRequestListener(new NoDataView.AgainRequestListener() {
                @Override
                public void request() {
                    if (againRequestListener != null) {
                        againRequestListener.request();
                    }
                }
            });
        }
        noDataViews.get(type).setNoDataImageResource(drawableRes);
        noDataViews.get(type).setNoDataText(nodataText);
        if (null == nodataAgainText || "".equals(nodataAgainText)) {
            noDataViews.get(type).setNoDataAgainVisivility(View.GONE);
        } else {
            noDataViews.get(type).setNoDataAgainText(nodataAgainText);
        }
        if (noDataViews.get(type).isNoDataViewShow()) {
            return;
        }
        ViewGroup viewGroup = (ViewGroup) contentViews.get(type).getParent();
        viewGroup.removeView(contentViews.get(type));
        viewGroup.addView(noDataViews.get(type), contentViews.get(type).getLayoutParams());
        noDataViews.get(type).setNoDataViewShow(true);
    }

    /**
     * 显示dialog
     *
     * @param mContext dialog上下文
     */
    public void showProgressDialog(Context mContext) {
        showProgressDialog(mContext, "加载中...");
    }

    /**
     * 显示dialog
     *
     * @param mContext     dialog上下文
     * @param mLoadingText dialog文本
     */
    public void showProgressDialog(Context mContext, String mLoadingText) {
        showProgressDialog(mContext, mLoadingText, R.layout.layout_dialog_progress);
    }

    /**
     * 显示dialog
     *
     * @param mContext     dialog上下文
     * @param mLoadingText dialog文本
     * @param layoutRes    dialog布局文件
     */
    public void showProgressDialog(Context mContext, String mLoadingText, int layoutRes) {
        if (mProgressDialog == null) {
            mProgressDialog = new Dialog(mContext, R.style.progress_dialog);
            View view = View.inflate(mContext, layoutRes, null);
            loadView = (TextView) view.findViewById(R.id.loadView);
            if (mLoadingText != null) {
                loadView.setText(mLoadingText);
            }
            mProgressDialog.setContentView(view);
            mProgressDialog.setCancelable(true);
            mProgressDialog.setCanceledOnTouchOutside(false);
            mProgressDialog.show();
        } else if (!mProgressDialog.isShowing()) {
            if (mLoadingText != null && loadView != null) {
                loadView.setText(mLoadingText);
            }
            mProgressDialog.show();
        }
    }

    /**
     * 完成dialog
     */
    public void dismissProgressDialog() {
        if (mProgressDialog != null && mProgressDialog.isShowing()) {
            mProgressDialog.dismiss();
        }
    }
	
	/**
     * 搜索无数据view
     *
     * @param currentView 需要替换的view
     */
    public void hiddenFoundNodataView(View currentView) {
        hiddenNodataView(FOUNDNODATA, currentView);
    }
	
	/**
     * 网络无数据view
     *
     * @param currentView 需要替换的view
     */
    public void hiddenNetNodataView(View currentView) {
        hiddenNodataView(NETWORKNO, currentView);
    }
	
	/**
     * 隐藏无数据view
     *
     * @param currentView 需要替换的view
     */
    private void hiddenNodataView(int type, View currentView) {
        if (contentViews.get(type, null) == null) {
            contentViews.put(type, currentView);
        }
        if (noDataViews.get(type, null) == null) {
            return;
        }
        if (!noDataViews.get(type).isNoDataViewShow()) {
            return;
        }
        ViewGroup viewGroup = (ViewGroup) noDataViews.get(type).getParent();
        viewGroup.removeView(noDataViews.get(type));
        viewGroup.addView(contentViews.get(type));
        noDataViews.get(type).setNoDataViewShow(false);
    }

    public void setAgainRequestListener(AgainRequestListener againRequestListener) {
        this.againRequestListener = againRequestListener;
    }

    public interface AgainRequestListener {
        void request();
    }
}
