package ${packageName};

import android.annotation.SuppressLint;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.support.v7.widget.RecyclerView;

import ${packageName}.R;

import java.util.ArrayList;

/**
 * Created by swing on 2017/11/28.
 */

public class ${adapterClass} extends RecyclerView.Adapter<${adapterClass}.${viewHolder}>{

    private ArrayList<String> mData;

    public ${adapterClass}(ArrayList<String> data) {
        this.mData = data;
    }

    public void updateData(ArrayList<String> data) {
        this.mData = data;
        notifyDataSetChanged();
    }

    @Override
    public ${viewHolder} onCreateViewHolder(ViewGroup parent, int viewType) {
        // 实例化展示的view
        View v = LayoutInflater.from(parent.getContext()).inflate(R.layout.${layoutName}, parent, false);
        // 实例化viewholder
        ${viewHolder} viewHolder = new ${viewHolder}(v);
        return viewHolder;
    }

    @Override
    public void onBindViewHolder(${viewHolder} holder, int position) {
        // 绑定数据

    }

    @Override
    public int getItemCount() {
        return mData == null&&mData.isEmpty()? 0 : mData.size();
    }

    public class ${viewHolder} extends RecyclerView.ViewHolder {

        public ${viewHolder}(View itemView) {
            super(itemView);

        }
    }
}
