package ${packageName}.okhttp.builder;

import ${packageName}.okhttp.OkHttpUtils;
import ${packageName}.okhttp.request.OtherRequest;
import ${packageName}.okhttp.request.RequestCall;

/**
 * Created by zhy on 16/3/2.
 */
public class HeadBuilder extends GetBuilder {
    @Override
    public RequestCall build() {
        return new OtherRequest(null, null, OkHttpUtils.METHOD.HEAD, url, tag, params, headers, id).build();
    }
}
