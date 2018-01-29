package ${packageName}<#if isFirstFragment>.base<#else>.fragment</#if>;

import android.os.Bundle;
<#if isFirstFragment>
import android.support.annotation.Nullable;
import android${SupportPackage}.app.Fragment;
</#if>
<#if isFirstFragment> 
import android.view.LayoutInflater;
</#if>
import android.view.View;
<#if isFirstFragment> 
import android.view.ViewGroup;
import android.widget.Toast;
import ${applicationPackage}.R;
import ${applicationPackage}.base.BaseFragment;
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
<#if includeNewInstance>
	@Override
</#if>
    protected <#if isFirstFragment> abstract </#if>int getResourceId() <#if isFirstFragment> ; <#else>{
<#if includeLayout>
       return R.layout.${fragmentName};
</#if>
    }
</#if> 

<#if includeNewInstance>
	@Override
</#if>
    protected <#if isFirstFragment> abstract </#if>void initView(View view) <#if isFirstFragment> ; <#else> {

    }
</#if> 
<#if includeNewInstance>
	@Override
</#if>
    protected void initData() {
<#if !isFirstFragment> 
		super.initData();
</#if> 
    }
<#if isFirstFragment> 
	@Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        if (view == null) {
            view = View.inflate(getActivity(), getResourceId(), null);
        } else {
            Object parent = view.getParent();
            if (parent != null && parent instanceof ViewGroup) {
                ((ViewGroup) parent).removeView(view);
            }
        }
        return view;
    }
</#if> 
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

    public void onFragmentBackOrComing() {
	<#if !isFirstFragment>
		super.onFragmentBackOrComing();
	</#if> 
    }
	
}
