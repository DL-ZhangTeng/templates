package ${packageName}.widget;

import android.content.Context;
import android.graphics.drawable.ColorDrawable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.PopupWindow;

import com.bigkoo.pickerview.adapter.ArrayWheelAdapter;
import com.bigkoo.pickerview.lib.WheelView;
import ${packageName}.R;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * Created by swing on 2018/3/1.
 */

public class ${className} extends PopupWindow {
    private Context context;
    private View view;
    private WheelView year, month;
    private Button button;
    private Integer selectedYear;
    private Integer selectedMonth;
    private ArrayList<Integer> listYear;
    private ArrayList<Integer> listMonth;
    private int startYear;

    public ${className}(Context context) {
        super(context);
        this.context = context;
        this.selectedYear = Calendar.getInstance().get(Calendar.YEAR);
        this.selectedMonth = Calendar.getInstance().get(Calendar.MONTH) + 1;
        initView();
    }

    public ${className}(Context context, Integer selectedYear, Integer selectedMonth) {
        super(context);
        this.context = context;
        this.selectedYear = selectedYear;
        this.selectedMonth = selectedMonth;
        initView();
    }

    private void initView() {
        view = LayoutInflater.from(context).inflate(R.layout.dialog_report_date_picker, null);
        year = (WheelView) view.findViewById(R.id.year);
        month = (WheelView) view.findViewById(R.id.month);
        button = (Button) view.findViewById(R.id.btn_ok);
        year.setCyclic(false);
        month.setCyclic(false);
        Calendar calendar = Calendar.getInstance();
        int currentYear = calendar.get(Calendar.YEAR);
        startYear = 2000;
        listYear = new ArrayList<Integer>();
        for (int i = startYear; currentYear - i >= 0; i++) {
            listYear.add(i);
        }
        listMonth = new ArrayList<Integer>();
        for (int i = 0; i < 12; i++) {
            listMonth.add(i + 1);
        }
        year.setAdapter(new ArrayWheelAdapter<Integer>(listYear));
        month.setAdapter(new ArrayWheelAdapter<Integer>(listMonth));
        year.setCurrentItem(selectedYear - startYear);
        month.setCurrentItem(selectedMonth - 1);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                TimePicker.this.dismiss();
                if (onOkClickListener != null)
                    onOkClickListener.onClick(listYear.get(year.getCurrentItem()) + "", listMonth.get(month.getCurrentItem()) + "");
            }
        });
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

    public void setCurrentDate(Integer year, Integer month) {
        this.year.setCurrentItem(year - startYear);
        this.month.setCurrentItem(month - 1);
    }

    public void showdialog(View view) {
        showAsDropDown(view, 0, 0);
    }

    public void setOnOkClickListener(OnOkClickListener onOkClickListener) {
        this.onOkClickListener = onOkClickListener;
    }

    private OnOkClickListener onOkClickListener;

    public interface OnOkClickListener {
        void onClick(String year, String month);
    }
}
