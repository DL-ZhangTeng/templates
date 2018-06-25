package ${packageName}.dagger2.component;

import ${packageName}.dagger2.base.BaseComponent;
import ${packageName}.dagger2.module.${module};
import dagger.Component;

@Component(modules = {${module}.class}, dependencies = {BaseComponent.class})
public interface ${component} {
}
