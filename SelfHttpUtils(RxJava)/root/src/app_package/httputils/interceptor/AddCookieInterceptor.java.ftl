package ${packageName}.httputils.interceptor;

import android.util.Log;

import ${packageName}.httputils.config.SPConfig;
import ${packageName}.httputils.http.HttpUtils;
import ${packageName}.httputils.utils.SPUtils;

import java.io.IOException;
import java.util.HashSet;

import okhttp3.Interceptor;
import okhttp3.Request;
import okhttp3.Response;

/**
 * Created by swing on 2018/4/24.
 */
public class AddCookieInterceptor implements Interceptor {
    @Override
    public Response intercept(Chain chain) throws IOException {
        Request.Builder builder = chain.request().newBuilder();
        HashSet<String> preferences = (HashSet<String>) SPUtils.get(HttpUtils.getInstance().getContext(), SPUtils.FILE_NAME, SPConfig.COOKIE, new HashSet<String>());
        if (preferences != null) {
            for (String cookie : preferences) {
                builder.addHeader("Cookie", cookie);
                Log.v("RxHttpUtils", "Adding Header Cookie : " + cookie);
            }
        }
        return chain.proceed(builder.build());
    }
}
