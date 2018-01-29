package ${packageName}.adapter;

import android.annotation.SuppressLint;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;

import ${packageName}.R;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by swing on 2017/11/28.
 */

public class ${adapterClass} extends BaseAdapter {
    private List<${beanClass}> contentBeans;

    public ${adapterClass}() {
        contentBeans = new ArrayList<>();
    }

    public ${adapterClass}(List<${beanClass}> contentBeans) {
        this.contentBeans = contentBeans;
    }

    @Override
    public int getCount() {
        return contentBeans.isEmpty() ? 0 : contentBeans.size();
    }

    @Override
    public Object getItem(int position) {
        return position;
    }

    @Override
    public long getItemId(int position) {
        return 0;
    }

    @SuppressLint("DefaultLocale")
    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        ViewHolder viewHolder = null;
        if (convertView == null) {
            convertView = LayoutInflater.from(parent.getContext()).inflate(R.layout.${layoutName}, null, false);
            viewHolder = new ViewHolder(convertView);
            convertView.setTag(viewHolder);
        } else {
            viewHolder = (ViewHolder) convertView.getTag();
        }

        return convertView;
    }

    public void setContentBeans(List<${beanClass}> contentBeans) {
        this.contentBeans = contentBeans;
        notifyDataSetChanged();
    }

    public class ${viewHolder} {


        public ${viewHolder}(View view) {
       
        }
    }
}
