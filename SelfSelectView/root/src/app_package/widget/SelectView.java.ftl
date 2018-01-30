package ${packageName}.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import android.widget.GridView;
import android.widget.RelativeLayout;
import android.widget.TextView;

import ${packageName}.R;

import java.util.ArrayList;

/**
 * Created by swing on 2018/1/5.
 */

public class SelectView extends RelativeLayout implements AdapterView.OnItemClickListener {
    private GridView gridView;
    private MyGridViewAdapter myGridViewAdapter;
    private String[] courses = {"全部", "语文", "数学", "英语", "物理", "化学", "生物", "历史", "地理", "政治"};
    private OnItemClickListener onItemClickListener = new OnItemClickListener() {
        @Override
        public void onItemClick(AdapterView<?> parent, View view, int position, long id, TextView textView) {

        }
    };
    private int num = courses.length;

    public SelectView(Context context) {
        super(context);
        initView(context);
    }

    public SelectView(Context context, AttributeSet attrs) {
        super(context, attrs);
        initView(context);
    }

    public SelectView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        initView(context);
    }

    private void initView(Context context) {
        LayoutInflater.from(context).inflate(R.layout.widget_select_view, this, true);
        gridView = (GridView) findViewById(R.id.widget_select_view_gv);
        myGridViewAdapter = new MyGridViewAdapter();
        gridView.setOnItemClickListener(this);
        gridView.setAdapter(myGridViewAdapter);
    }

    public void setCourses(ArrayList<Object> courses) {
        myGridViewAdapter.setSubjectInfoEntities(courses);
        num = courses.size();
    }

    public void setSubjectOnClickListener(OnItemClickListener onItemClickListener) {
        this.onItemClickListener = onItemClickListener;
    }

    @Override
    public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
        MyGridViewAdapter.MyViewHolder myViewHolder = (MyGridViewAdapter.MyViewHolder) view.getTag();
        ArrayList<Boolean> selectState = new ArrayList<>();
        for (int i = 0; i < num; i++) {
            if (i == position) {
                selectState.add(i, !myViewHolder.flag);
            } else {
                selectState.add(i, false);
            }
        }
        myGridViewAdapter.setSelectState(selectState);

        onItemClickListener.onItemClick(parent, view, position, id, myViewHolder.textView);
    }

    public interface OnItemClickListener {
        void onItemClick(AdapterView<?> parent, View view, int position, long id, TextView textView);

    }

    private class MyGridViewAdapter extends BaseAdapter {
        ArrayList<Boolean> selectState = new ArrayList<>();
        private ArrayList<Object> subjectInfoEntities;

        public MyGridViewAdapter() {
            this.subjectInfoEntities = new ArrayList<>();
        }

        public MyGridViewAdapter(ArrayList<Object> subjectInfoEntities) {
            this.subjectInfoEntities = subjectInfoEntities;
        }

        @Override
        public int getCount() {
            return subjectInfoEntities.isEmpty() ? courses.length : subjectInfoEntities.size();
        }

        @Override
        public Object getItem(int position) {
            return position;
        }

        @Override
        public long getItemId(int position) {
            return position;
        }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            MyViewHolder myViewHolder = null;
            if (convertView == null) {
                convertView = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_select_view_gridview, null, false);
                myViewHolder = new MyViewHolder(convertView);
                convertView.setTag(myViewHolder);
            } else {
                myViewHolder = (MyViewHolder) convertView.getTag();
            }
            if (!selectState.isEmpty()) {
                myViewHolder.flag = selectState.get(position);
                initItemStyle(convertView);
            }
            myViewHolder.textView.setText(courses[position]);
            return convertView;
        }

        public void setSelectState(ArrayList<Boolean> selectState) {
            this.selectState = selectState;
            notifyDataSetChanged();
        }

        private void initItemStyle(View view) {
            MyGridViewAdapter.MyViewHolder myViewHolder = (MyGridViewAdapter.MyViewHolder) view.getTag();
            if (!myViewHolder.flag) {
                myViewHolder.textView.setBackgroundResource(R.drawable.activity_gridview_unselect_bg);
                myViewHolder.textView.setTextColor(view.getContext().getResources().getColor(R.color.activity_gridview_title_unselect_textcolor));
            } else {
                myViewHolder.textView.setBackgroundResource(R.drawable.activity_gridview_item_bg);
                myViewHolder.textView.setTextColor(view.getContext().getResources().getColor(R.color.activity_gridview_title_select_textcolor));
            }

        }

        public void setSubjectInfoEntities(ArrayList<Object> subjectInfoEntities) {
            this.subjectInfoEntities = subjectInfoEntities;
            notifyDataSetChanged();
        }

        private class MyViewHolder {
            private TextView textView;
            private boolean flag = false;

            public MyViewHolder(View view) {
                textView = (TextView) view.findViewById(R.id.widget_select_view_tv);
            }
        }
    }
}

