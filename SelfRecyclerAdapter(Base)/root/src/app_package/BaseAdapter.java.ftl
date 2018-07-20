package ${packageName}.<#if isFirstAdapter>base<#else>adapter</#if>;

import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView;
import android.view.ViewGroup;
<#if isFirstAdapter>
<#else>
import android.view.LayoutInflater;
import android.view.View;
import ${packageName}.R;

import ${packageName}.base.BaseAdapter;
</#if>
import java.util.List;

/**
 * Created by swing on 2018/5/7.
 */
public class ${adapterClass}<${beanClass}> extends <#if isFirstAdapter>RecyclerView.Adapter<#else>BaseAdapter</#if><<#if !isFirstAdapter>${beanClass}<#else>RecyclerView.ViewHolder</#if>> {
	<#if isFirstAdapter>
    protected boolean hasHeaderOrFooter = false;

    public List<${beanClass}> data;
	</#if>

    public ${adapterClass}(List<${beanClass}> data) {
	<#if !isFirstAdapter>
		super(data);
	</#if>
        this.data = data;
    }

    @NonNull
    @Override
    public <#if !isFirstAdapter>${viewHolder}<#else>RecyclerView.ViewHolder</#if> onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
	
	<#if !isFirstAdapter>
		// 实例化展示的view
		View v = LayoutInflater.from(parent.getContext()).inflate(R.layout.${layoutName}, parent, false);
		// 实例化viewholder
		${viewHolder} viewHolder = new ${viewHolder}(v);
		return viewHolder;
	<#else>
		return null;
	</#if>
    }

    @Override
    public void onBindViewHolder(@NonNull RecyclerView.ViewHolder holder, int position) {

    }
	<#if isFirstAdapter>
    @Override
    public int getItemCount() {
        return data == null || data.isEmpty() ? 0 : data.size();
    }

    @Override
    public int getItemViewType(int position) {
        return super.getItemViewType(position);
    }

    public List<${beanClass}> getData() {
        return data;
    }

    public void setData(List<${beanClass}> data) {
        this.data = data;
        notifyDataSetChanged();
    }

    public boolean isHasHeaderOrFooter() {
        return hasHeaderOrFooter;
    }

    public void setHasHeaderOrFooter(boolean hasHeaderOrFooter) {
        this.hasHeaderOrFooter = hasHeaderOrFooter;
    }
	</#if>
	<#if !isFirstAdapter>
	 public class ${viewHolder} extends RecyclerView.ViewHolder {

        public ${viewHolder}(View itemView) {
            super(itemView);

        }
    }
	</#if>
}
