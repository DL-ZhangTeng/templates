package ${packageName}.mvp.base;

import android.content.Context;

/**
 * Created by swing on 2019/7/16 0016.
 */
public interface BaseContextView<T> extends BaseView {
    Context getViewContext();

    void inflateView(T data);
}
