package ${packageName}.mvp.presenter;

import ${packageName}.mvp.base.BasePresenter;
import ${packageName}.mvp.view.${view};
import ${packageName}.mvp.model.${model};


public class ${presenter} extends BasePresenter implements ${view}{
	private ${view} view;
	private ${model} model;

	public ${presenter}(${view} view, ${model} model){
		this.view = view;
		this.model = model;
	}
	
	public ${presenter}(${view} view){
		this.view = view;
		this.model = new ${model}();
	}
}
