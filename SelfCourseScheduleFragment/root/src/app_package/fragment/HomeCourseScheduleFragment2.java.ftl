package ${packageName}.fragment;

<#if includeNewInstance>
import android.os.Bundle;
</#if>
import android.view.View;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;

import ${packageName}.R;
import ${packageName}.adapter.ScheduleListAdapter;
import ${packageName}.utils.TimeUtils;
import ${packageName}.base.BaseFragment;

import java.sql.Date;
import java.text.SimpleDateFormat;

/**
 * Created by Lanxumit on 2017/12/22.
 */

public class ${className} extends BaseFragment {
    private TextView ssTime;
    private TextView mondaySS;
    private TextView tuesdaySS;
    private TextView wednesdaySS;
    private TextView thursdaySS;
    private TextView fridaySS;
    private TextView saturdaySS;
    private TextView sundaySS;
    private ListView scheduleList;
    private LinearLayout linearSyllabus;
    private ScheduleListAdapter mAdpter;
    private int weekday;

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
    @Override
    protected int getResourceId() {
        return R.layout.${escapeXmlAttribute(fragmentName)};
    }

    @Override
    protected void initView(View view) {
        linearSyllabus = (LinearLayout)view.findViewById(R.id.linear_syllabus);
        ssTime = (TextView)view.findViewById(R.id.ss_time);
        mondaySS = (TextView)view.findViewById(R.id.monday_ss);
        tuesdaySS = (TextView)view.findViewById(R.id.tuesday_ss);
        wednesdaySS = (TextView)view.findViewById(R.id.wednesday_ss);
        thursdaySS = (TextView)view.findViewById(R.id.thursday_ss);
        fridaySS = (TextView)view.findViewById(R.id.friday_ss);
        saturdaySS = (TextView)view.findViewById(R.id.saturday_ss);
        sundaySS = (TextView)view.findViewById(R.id.sunday_ss);
        scheduleList = (ListView)view.findViewById(R.id.schedule_list);

        initdata(ssTime, R.color.white, R.string.week_time);
        initdata(mondaySS, R.color.white, R.string.monday_one);
        initdata(tuesdaySS, R.color.white, R.string.tuesday_two);
        initdata(wednesdaySS, R.color.white, R.string.wednesday_three);
        initdata(thursdaySS, R.color.white, R.string.thursday_four);
        initdata(fridaySS, R.color.white, R.string.friday_five);
        initdata(saturdaySS, R.color.white, R.string.saturday_six);
        initdata(sundaySS, R.color.white, R.string.sunday_seven);
        linearSyllabus.setBackgroundResource(R.color.title_end_color);
        weekday = TimeUtils.getWeekDay(time());

        adapter();
    }

    private void initdata(TextView tv, int color, int str) {
        tv.setText(str);
        tv.setTextColor(getResources().getColor(color));
    }

    private void adapter() {
        mAdpter = new ScheduleListAdapter(getActivity(), weekday);
        scheduleList.setAdapter(mAdpter);
    }

    private String time() {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date curDate = new Date(System.currentTimeMillis());//获取当前时间
        String str = formatter.format(curDate);
        return str;
    }

    @Override
    public void onFragmentBackOrComing() {
        super.onFragmentBackOrComing();
    }
}
