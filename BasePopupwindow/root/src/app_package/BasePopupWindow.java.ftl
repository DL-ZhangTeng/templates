package ${packageName}<#if isFirstPopupWindow>.base<#else>.widget</#if>;

import android.content.Context;
import android.view.View;
<#if isFirstPopupWindow>
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.support.constraint.ConstraintLayout;
import android.view.LayoutInflater;
import android.view.WindowManager;
import android.widget.LinearLayout;
import android.widget.PopupWindow;
<#else>
import android.support.annotation.NonNull;
import ${packageName}.base.BasePopupWindow;
</#if>
import ${packageName}.R;

/**
 * Created by swing on 2018/9/6.
 */
public <#if isFirstPopupWindow> abstract </#if> class ${className} extends <#if isFirstPopupWindow> PopupWindow <#else> BasePopupWindow </#if>{
<#if isFirstPopupWindow>
    protected LinearLayout clTitle;
    protected ConstraintLayout clContent;
    protected LinearLayout clButton;
	protected View parent;
	
	protected OnCancelClickListener onCancelClickListener;
    protected OnConfirmClickListener onConfirmClickListener;
</#if>
<#if isFirstPopupWindow>
    public ${className}(Context context) {
        super(context);
        initView(context);
    }

    private void initView(Context context) {
        parent = LayoutInflater.from(context).inflate(R.layout.self_base_popupwindow, null);
        clTitle = parent.findViewById(R.id.self_base_popupwindow_title);
        clContent = parent.findViewById(R.id.self_base_popupwindow_content);
        clButton = parent.findViewById(R.id.self_base_popupwindow_button);

        if (getSelfTitleView() != 0) {
            LayoutInflater.from(context).inflate(getSelfTitleView(), clTitle, true);
        }

        if (getSelfContentView() != 0) {
            LayoutInflater.from(context).inflate(getSelfContentView(), clContent, true);
        }

        if (getSelfButtonView() != 0) {
            LayoutInflater.from(context).inflate(getSelfButtonView(), clButton, true);
        }
        initView(parent);
        this.setContentView(parent);

        //设置高
        this.setHeight(WindowManager.LayoutParams.WRAP_CONTENT);
        //设置宽
        this.setWidth(WindowManager.LayoutParams.MATCH_PARENT);
        //设置SelectPicPopupWindow弹出窗体可点击
        this.setFocusable(true);
        //设置PopupWindow可触摸
        this.setTouchable(true);
        //设置非PopupWindow区域是否可触摸
        this.setOutsideTouchable(true);
        //实例化一个ColorDrawable颜色为半透明
        ColorDrawable dw = new ColorDrawable(0x00000000);
        //设置SelectPicPopupWindow弹出窗体的背景
        this.setBackgroundDrawable(dw);
        //设置SelectPicPopupWindow弹出窗体动画效果
        this.setAnimationStyle(R.style.showAsDropDown);
        //防止被虚拟导航栏阻挡
        this.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
    }

    public abstract int getSelfTitleView();

    public abstract int getSelfContentView();

    public abstract int getSelfButtonView();

    public abstract void initView(View view);

    /**
     * 对第一个按钮设置确定监听器
     */
    public void setOnCancelClickListener(OnCancelClickListener onCancelClickListener) {
        this.onCancelClickListener = onCancelClickListener;
        if (clButton.getChildCount() > 0 && clButton.getChildAt(0) instanceof ViewGroup) {
            if (((ViewGroup) clButton.getChildAt(0)).getChildAt(0) != null) {
                ((ViewGroup) clButton.getChildAt(0)).getChildAt(0).setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        if (BasePopupWindow.this.onCancelClickListener != null) {
                            BasePopupWindow.this.onCancelClickListener.onCancel(v);
                        }
                    }
                });
            }
        }
    }

    /**
     * 对最后一个按钮设置确定监听器
     */
    public void setOnConfirmClickListener(OnConfirmClickListener onConfirmClickListener) {
        this.onConfirmClickListener = onConfirmClickListener;
        if (clButton.getChildCount() > 0 && clButton.getChildAt(0) instanceof ViewGroup) {
            if (((ViewGroup) clButton.getChildAt(0)).getChildAt(((ViewGroup) clButton.getChildAt(0)).getChildCount() - 1) != null) {
                ((ViewGroup) clButton.getChildAt(0)).getChildAt(((ViewGroup) clButton.getChildAt(0)).getChildCount() - 1).setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        if (BasePopupWindow.this.onConfirmClickListener != null) {
                            BasePopupWindow.this.onConfirmClickListener.onConfirm(v);
                        }
                    }
                });
            }
        }
    }

    @Override
    public View getContentView() {
        return super.getContentView();
    }

    @Override
    public void setContentView(View view) {
        super.setContentView(view);
    }

    @Override
    public void setAnimationStyle(int animationStyle) {
        super.setAnimationStyle(animationStyle);
    }

    @Override
    public void setBackgroundDrawable(Drawable background) {
        super.setBackgroundDrawable(background);
    }

    @Override
    public void showAsDropDown(View view) {
        super.showAsDropDown(view);
    }

    /**
     * 取消监听器
     */
    public interface OnCancelClickListener {
        void onCancel(View view);
    }

    /**
     * 确定监听器
     */
    public interface OnConfirmClickListener {
        void onConfirm(View view);
    }

    public void setDropDown() {
        //设置SelectPicPopupWindow弹出窗体动画效果
        this.setAnimationStyle(R.style.showAsDropDown);
    }

    public void setDropUp() {
        this.setAnimationStyle(R.style.showAsDropUp);
    }

    @Override
    public void showAtLocation(View parent, int gravity, int x, int y) {
        super.showAtLocation(parent, gravity, x, y);
    }

    @Override
    public void showAsDropDown(View anchor, int xoff, int yoff) {
        super.showAsDropDown(anchor, xoff, yoff);
    }

    @Override
    public void showAsDropDown(View anchor, int xoff, int yoff, int gravity) {
        super.showAsDropDown(anchor, xoff, yoff, gravity);
    }

    /**
     * 窗口变暗
     */
    public void showBlackWindowBackground(Activity activity) {
        WindowManager.LayoutParams lp = activity.getWindow()
                .getAttributes();
        lp.alpha = 0.4f;
        activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
        activity.getWindow().setAttributes(lp);
    }

    public void dismissBlackWindowBackground(Activity activity) {
        WindowManager.LayoutParams lp = activity.getWindow()
                .getAttributes();
        lp.alpha = 1f;
        activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
        activity.getWindow().setAttributes(lp);
    }
	<#else>
	public ${className}(@NonNull Context context) {
        super(context);
    }
	
	@Override
    public int getSelfTitleView() {
        return 0;
    }

    @Override
    public int getSelfContentView() {
        return 0;
    }

    @Override
    public int getSelfButtonView() {
        return 0;
    }

    @Override
    public void initView(View view) {
        
    }
	</#if>
}
