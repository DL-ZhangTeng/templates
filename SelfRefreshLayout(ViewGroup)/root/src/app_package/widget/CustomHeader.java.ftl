package ${packageName}.widget.header;

import android.content.Context;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.TextView;

import ${packageName}.R;

/**
 * Created by swing on 2018/8/1.
 */
public class CustomHeader extends RelativeLayout implements Header {
    private TextView mHeaderText;
    private ProgressBar mHeaderProgressBar;

    public CustomHeader(Context context) {
        super(context);
        initView();
    }

    public CustomHeader(Context context, AttributeSet attrs) {
        super(context, attrs);
        initView();
    }

    public CustomHeader(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        initView();
    }

    private void initView() {
        LayoutInflater.from(getContext()).inflate(R.layout.pull_header, this, true);
        mHeaderText = (TextView) findViewById(R.id.header_text);
        mHeaderProgressBar = (ProgressBar) findViewById(R.id.header_progressbar);
    }

    @Override
    public void pullToRefresh(int dy, int headerHeight) {
        if (dy <= -headerHeight) {
            mHeaderText.setText("松开刷新");
        } else {
            mHeaderText.setText("下拉刷新");
        }
    }

    @Override
    public void tryRefresh() {
        mHeaderText.setText("下拉刷新");
    }

    @Override
    public void refreshing() {
        mHeaderProgressBar.setVisibility(VISIBLE);
        mHeaderText.setText("正在刷新");
    }

    @Override
    public void finish() {
        mHeaderText.setText("下拉刷新");
        mHeaderProgressBar.setVisibility(GONE);
    }

}
