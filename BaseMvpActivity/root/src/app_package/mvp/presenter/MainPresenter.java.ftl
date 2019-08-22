package ${packageName}.mvp.presenter;

import ${packageName}.mvp.base.BasePresenter;
import ${packageName}.mvp.view.${view};
import ${packageName}.mvp.model.${model};

import java.lang.ref.WeakReference;


public class ${presenter} extends BasePresenter<${view}> {
	private ${model} model;
	
    public ${presenter}() {
    }

    public ${presenter}(${view} view) {
        this.view = new WeakReference<>(view);
        this.model = new ${model}();
    }
}