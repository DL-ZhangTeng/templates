package ${packageName}.mvp.base

interface IPresenter<V : IView?> {
    fun attachView(view: V?)

    fun onStart() {}

    fun detachView()

    fun onDestroy() {}

    fun isAttach(): Boolean
}