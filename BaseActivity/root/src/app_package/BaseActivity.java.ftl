package ${packageName};

import ${superClassFqcn};
<#if includeCppSupport!false>
import android.widget.TextView;
</#if>
<#if applicationPackage??>
import ${applicationPackage}.R;
</#if>

public class ${activityClass} extends ${superClass} {

    @Override
    protected int getResourceId() {
	<#if generateLayout>
        return R.layout.${layoutName};
	</#if>
    }
	
	@Override
    protected void initView() {

    }

    @Override
    protected void initData() {
       
    }
	
	@Override
    public void goBack() {
        super.goBack();
        finish();
    }
}
