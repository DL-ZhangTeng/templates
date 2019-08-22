<#if !isFirstActivity>
package ${packageName}.activity;

import android.os.Bundle;

import ${packageName}.base.BaseMvpActivity;
import ${packageName}.mvp.presenter.${presenter};
import ${packageName}.mvp.view.${view};
import ${packageName}.R;

public class ${activityClass} extends BaseMvpActivity<${view}, ${presenter}> implements ${view} {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.${layoutName});
    }

	@Override
    public ${presenter} createPresenter() {
        return null;
    }
	
    @Override
    protected void initView() {

    }

    @Override
    protected void initData() {

    }
}
<#else>
package ${packageName}.base;

import android.os.Bundle;

import ${packageName}.mvp.base.BasePresenter;
import ${packageName}.mvp.base.BaseView;


/**
 * Created by swing on 2017/11/23.
 */

public abstract class ${activityClass}<V extends BaseView, P extends BasePresenter<V>> extends BaseActivity {
	protected P mPresenter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        mPresenter = createPresenter();
        mPresenter.attachView((V) this);
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        mPresenter.detachView();
    }

    public abstract P createPresenter();
}

</#if>
