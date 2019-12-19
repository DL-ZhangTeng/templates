package ${packageName}.mvp.presenter;

import ${packageName}.mvp.base.BasePresenter;
import ${packageName}.mvp.presenter.ipresenter.${ipresenter};
import ${packageName}.mvp.view.${view};
import ${packageName}.mvp.model.${model};

import java.lang.ref.WeakReference;

public class ${presenter} extends BasePresenter<${view}> implements ${ipresenter}{
	private ${model} model;

    public ${presenter}() {
        this.model = new ${model}();
    }
}