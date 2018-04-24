package ${packageName}.httputils.observer.base;


import ${packageName}.httputils.exception.ApiException;
import ${packageName}.httputils.observer.interfaces.ISubscriber;

import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;

/**
 * Created by swing on 2018/4/24.
 */
public abstract class BaseObserver<T> implements Observer<T>, ISubscriber<T> {

    protected boolean isHideToast() {
        return false;
    }

    @Override
    public void onSubscribe(Disposable d) {
        doOnSubscribe(d);
    }

    @Override
    public void onNext(T o) {
        doOnNext(o);
    }

    @Override
    public void onError(Throwable e) {
        String error = ApiException.handleException(e).getMessage();
        doOnError(error);
    }

    @Override
    public void onComplete() {
        doOnCompleted();
    }
}
