package ${packageName}.mvp.base;

/**
 * model到presenter的回调
 * Created by swing on 2019/7/2 0002.
 */
public abstract class BaseHttpEntity<T> {
    private BaseNoNetworkView baseNoNetworkView;

    public BaseHttpEntity() {
    }

    public BaseHttpEntity(BaseNoNetworkView baseNoNetworkView) {
        this.baseNoNetworkView = baseNoNetworkView;
    }

    public abstract void onSuccess(T data);

    /**
     * 无网络
     */
    public void onNoNetworkError() {
        if (baseNoNetworkView != null)
            baseNoNetworkView.showNoNetwork();
    }

    /**
     * 业务异常处理
     */
    public void onError(int code, String error) {

    }

    /**
     * http异常处理
     */
    public void onHttpError(int code, String error) {

    }

    /**
     * 请求完成
     */
    public void onFinish() {
        if (baseNoNetworkView != null)
            baseNoNetworkView.hideNoNetwork();
		if (baseNoNetworkView instanceof BaseRefreshView)
           ((BaseRefreshView) baseNoNetworkView).finishRefreshOrLoadMore();
    }
}
