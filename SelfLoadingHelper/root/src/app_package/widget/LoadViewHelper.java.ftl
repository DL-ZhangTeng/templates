package ${packageName}.utils;

import android.app.Dialog;
import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import ${packageName}.widget.NoDataView;
import ${packageName}.R;

/**
 * 将某个视图替换为正在加载、无数据、加载失败等视图
 * Created by swing on 2018/10/8.
 */
public class LoadViewHelper {
    protected View contentView;
    protected NoDataView noDataView;
    private Dialog mProgressDialog;
    private TextView loadView;

    /**
     * 显示无数据view
     *
     * @param currentView 需要替换的view
     */
    public void showNodataView(View currentView) {
        showNodataView(currentView, R.mipmap.ic_launcher, "无数据");
    }

    private AgainRequestListener againRequestListener;

    /**
     * 显示无数据view
     *
     * @param currentView 需要替换的view
     */
    public void showNodataView(View currentView, int drawableRes, String nodataText) {
        if (contentView == null) {
            contentView = currentView;
        }
        if (noDataView == null) {
            noDataView = new NoDataView(contentView.getContext());
            noDataView.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    if (againRequestListener != null) {
                        againRequestListener.request();
                    }
                }
            });
        }
        noDataView.setNoDataImageResource(drawableRes);
        noDataView.setNoDataText(nodataText);
        if (noDataView.isNoDataViewShow()) {
            return;
        }
        ViewGroup viewGroup = (ViewGroup) contentView.getParent();
        viewGroup.removeView(contentView);
        viewGroup.addView(noDataView, contentView.getLayoutParams());
        noDataView.setNoDataViewShow(true);
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
     * 隐藏无数据view
     *
     * @param currentView 需要替换的view
     */
    public void hiddenNodataView(View currentView) {
        if (contentView == null) {
            contentView = currentView;
        }
        if (noDataView == null) {
            return;
        }
        if (!noDataView.isNoDataViewShow()) {
            return;
        }
        ViewGroup viewGroup = (ViewGroup) noDataView.getParent();
        viewGroup.removeView(noDataView);
        viewGroup.addView(contentView);
        noDataView.setNoDataViewShow(false);
    }

    public void setAgainRequestListener(AgainRequestListener againRequestListener) {
        this.againRequestListener = againRequestListener;
    }

    public interface AgainRequestListener {
        void request();
    }
}
