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
</#if>
<#if isFirstPopupWindow>
    public ${className}(Context context) {
        super(context);
        initView(context);
    }

    private void initView(Context context) {
        View view = LayoutInflater.from(context).inflate(R.layout.self_base_popupwindow, null);
        clTitle = view.findViewById(R.id.self_base_popupwindow_title);
        clContent = view.findViewById(R.id.self_base_popupwindow_content);
        clButton = view.findViewById(R.id.self_base_popupwindow_button);

        if (getSelfTitleView() != 0) {
            LayoutInflater.from(context).inflate(getSelfTitleView(), clTitle, true);
        }

        if (getSelfContentView() != 0) {
            LayoutInflater.from(context).inflate(getSelfContentView(), clContent, true);
        }

        if (getSelfButtonView() != 0) {
            LayoutInflater.from(context).inflate(getSelfButtonView(), clButton, true);
        }
        initView(view);
        this.setContentView(view);

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
        //设置SelectPicPopupWindow弹出窗体动画效果
        //实例化一个ColorDrawable颜色为半透明
        ColorDrawable dw = new ColorDrawable(0x00000000);
        //设置SelectPicPopupWindow弹出窗体的背景
        this.setBackgroundDrawable(dw);
        this.setAnimationStyle(R.style.showAsDropDown);
        //防止被虚拟导航栏阻挡
        this.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
    }

    public abstract int getSelfTitleView();

    public abstract int getSelfContentView();

    public abstract int getSelfButtonView();

    public abstract void initView(View view);

    @Override
    public void setContentView(View view) {
        super.setContentView(view);
    }

    @Override
    public View getContentView() {
        return super.getContentView();
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
