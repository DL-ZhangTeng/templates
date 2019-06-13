package ${packageName}<#if isFirstFragment>.base<#else>.fragment</#if>;

<#if isFirstFragment>
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.View;
</#if>
<#if !isFirstFragment> 
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import ${packageName}.R;
import ${packageName}.base.BaseFragment;
</#if>

/**
 *
 */
public <#if isFirstFragment> abstract </#if> class ${className} extends <#if isFirstFragment> Fragment <#else> BaseFragment </#if> {
<#if isFirstFragment> 
	private View view;
</#if>
<#if includeNewInstance>
    private static final String ARG_PARAM1 = "param1";
    private static final String ARG_PARAM2 = "param2";

    private String mParam1;
    private String mParam2;
</#if>

<#if includeNewInstance>
    /**
     * @param param1 Parameter 1.
     * @param param2 Parameter 2.
     * @return A new instance of fragment ${className}.
     */
    public static ${className} newInstance(String param1, String param2) {
        ${className} fragment = new ${className}();
        Bundle args = new Bundle();
        args.putString(ARG_PARAM1, param1);
        args.putString(ARG_PARAM2, param2);
        fragment.setArguments(args);
        return fragment;
    }
</#if>
    public ${className}() {
       
    }
<#if includeNewInstance>
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (getArguments() != null) {
            mParam1 = getArguments().getString(ARG_PARAM1);
            mParam2 = getArguments().getString(ARG_PARAM2);
        }
    }
</#if>

<#if !isFirstFragment>
    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        return inflater.inflate(<#if includeLayout>R.layout.${fragmentName}<#else>null</#if>, container, false);
    }
</#if>

<#if !isFirstFragment>
	@Override
</#if>
    protected <#if isFirstFragment> abstract </#if>void initView(View view) <#if isFirstFragment> ; <#else> {

    }
</#if> 
<#if !isFirstFragment>
	@Override
</#if>
    protected void initData() {
<#if !isFirstFragment> 
		super.initData();
</#if> 
    }
<#if isFirstFragment> 
    @Override
    public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
		initView(view);
    }
</#if> 

<#if isFirstFragment> 
    @Override
    public void onActivityCreated(@Nullable Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
		initData();
    }
</#if> 

	
	protected void showToast(String msg) {
	<#if isFirstFragment>
		//create a toast 
	<#else> 
		super.showToast(msg);
	</#if> 
    }
}
