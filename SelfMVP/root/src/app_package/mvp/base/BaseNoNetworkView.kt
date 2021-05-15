package ${packageName}.mvp.base

/**
 * 无网络/无数据
 * Created by swing on 2019/7/25 0025.
 */
interface BaseNoNetworkView<T> : BaseLoadingView<T?> {
    open fun showNoNetwork()
    open fun hideNoNetwork()
    open fun showNoDataView()
    open fun hideNoDataView()
}