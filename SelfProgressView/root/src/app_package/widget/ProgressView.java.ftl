package ${packageName}.widget;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Shader;
import android.util.AttributeSet;
import android.view.View;

import ${packageName}.R;


/***
 * 自定义圆弧进度条
 *	Created by swing on 2018/1/8.
 */
public class ${className} extends View {

    private float maxCount;
    private float currentCount;
    private int percent;
    private Paint mPaint;
    private Paint mTextPaint;
    private int mWidth, mHeight;
    private Paint bgPaint;

    public ${className}(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init(context);
    }

    public ${className}(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public ${className}(Context context) {
        this(context, null);
    }

    private void init(Context context) {
        mPaint = new Paint();
        mTextPaint = new Paint();
        bgPaint = new Paint();
    }

    @Override
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        initPaint();
        RectF rectBlackBg = new RectF(40, 40, mWidth - 40, mHeight - 40);
        canvas.drawArc(rectBlackBg, 0, 360, false, bgPaint);
        canvas.drawText(percent + "%", mWidth / 2, mHeight / 2, mTextPaint);
        mTextPaint.setTextSize(50);
        canvas.drawText("我的掌握度", mWidth / 2, mHeight * 2 / 3, mTextPaint);
        float section = currentCount / maxCount;
        if (section <= 1.0f / 3.0f) {
            if (section != 0.0f) {
                mPaint.setColor(this.getResources().getColor(R.color.progress_view_start_color));
            } else {
                mPaint.setColor(Color.TRANSPARENT);
            }
        } else {
            int[] colors = {
                    this.getResources().getColor(R.color.progress_view_start_color),
                    this.getResources().getColor(R.color.progress_view_end_color)
            };
            LinearGradient shader = new LinearGradient(mWidth, 0, 0, mHeight, colors, null,
                    Shader.TileMode.MIRROR);
            mPaint.setShader(shader);
        }
        canvas.drawArc(rectBlackBg, 270, section * 360, false, mPaint);
    }

    private void initPaint() {
        bgPaint.setAntiAlias(true);
        bgPaint.setStrokeWidth((float) 60.0);
        bgPaint.setStyle(Paint.Style.STROKE);
        bgPaint.setStrokeCap(Paint.Cap.ROUND);
        bgPaint.setColor(this.getResources().getColor(R.color.background));

        mPaint.setAntiAlias(true);
        mPaint.setStrokeWidth((float) 60.0);
        mPaint.setStyle(Paint.Style.STROKE);
        mPaint.setStrokeCap(Paint.Cap.ROUND);

        mTextPaint.setAntiAlias(true);
        mTextPaint.setStrokeWidth((float) 1.0);
        mTextPaint.setTextAlign(Paint.Align.CENTER);
        mTextPaint.setTextSize(120);
        mTextPaint.setColor(Color.BLACK);

    }

    private int dipToPx(int dip) {
        float scale = getContext().getResources().getDisplayMetrics().density;
        return (int) (dip * scale + 0.5f * (dip >= 0 ? 1 : -1));
    }

    public int getPercent() {
        return percent;
    }

    public float getMaxCount() {
        return maxCount;
    }

    public float getCurrentCount() {
        return currentCount;
    }

    public void setPercent(int percent) {
        this.percent = percent;
        invalidate();
    }

    /***
     * 设置最大的进度值
     *
     * @param maxCount
     */
    public void setMaxCount(float maxCount) {
        this.maxCount = maxCount;
    }

    /***
     * 设置当前的进度值
     *
     * @param currentCount
     */
    public void setCurrentCount(float currentCount) {
        this.currentCount = currentCount > maxCount ? maxCount : currentCount;
        invalidate();
    }

    @Override
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int widthSpecMode = MeasureSpec.getMode(widthMeasureSpec);
        int widthSpecSize = MeasureSpec.getSize(widthMeasureSpec);
        int heightSpecMode = MeasureSpec.getMode(heightMeasureSpec);
        int heightSpecSize = MeasureSpec.getSize(heightMeasureSpec);
        if (widthSpecMode == MeasureSpec.EXACTLY
                || widthSpecMode == MeasureSpec.AT_MOST) {
            mWidth = widthSpecSize;
        } else {
            mWidth = 0;
        }
        if (heightSpecMode == MeasureSpec.AT_MOST
                || heightSpecMode == MeasureSpec.UNSPECIFIED) {
            mHeight = dipToPx(15);
        } else {
            mHeight = heightSpecSize;
        }
        setMeasuredDimension(mWidth, mHeight);
    }

}