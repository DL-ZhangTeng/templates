package ${packageName}.widget.footer;

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
public class CustomFooter extends RelativeLayout implements Footer {
    private TextView mFooterText;
    private ProgressBar mFooterProgressBar;

    public CustomFooter(Context context) {
        super(context);
        initView();
    }

    public CustomFooter(Context context, AttributeSet attrs) {
        super(context, attrs);
        initView();
    }

    public CustomFooter(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        initView();
    }

    private void initView() {
        LayoutInflater.from(getContext()).inflate(R.layout.pull_footer, this, true);
        mFooterText = (TextView) findViewById(R.id.footer_text);
        mFooterProgressBar = (ProgressBar) findViewById(R.id.footer_progressbar);
    }
    @Override
    public void pullToLoad(int dy, int footerHeight) {
        if (dy >= footerHeight) {
            mFooterText.setText("松开加载更多");
        } else {
            mFooterText.setText("上拉加载更多");
        }
    }

    @Override
    public void tryLoad() {
        mFooterText.setText("上拉加载更多");
    }

    @Override
    public void loading() {
        mFooterText.setText("正在加载");
        mFooterProgressBar.setVisibility(VISIBLE);
    }

    @Override
    public void finish() {
        mFooterText.setText("上拉加载");
        mFooterProgressBar.setVisibility(GONE);
    }
}
