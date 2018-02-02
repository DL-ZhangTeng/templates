package ${packageName}.utils;

import android.util.Log;

import ${packageName}.base.BaseListener;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.FormBody;
import okhttp3.MediaType;
import okhttp3.MultipartBody;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;


public class ${className} {
    private static final OkHttpClient client = new OkHttpClient();
    private static final MediaType MEDIA_TYPE_MARKDOWN
            = MediaType.parse("text/x-markdown; charset=utf-8");
    private static final MediaType MEDIA_TYPE_PNG = MediaType.parse("image/png");

    public static void executeGet(final String url, final BaseListener baseListener) {
        new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    Request request = new Request.Builder().url(url).build();
                    Response response = client.newCall(request).execute();
                    if (response.isSuccessful()) {
                        String str = response.body().string();
                        int length = str.length();
                        str = str.substring(1, length - 1);
                        str = str.replace("\\", "");
                        str = str.replace("\\\\\"", "");
                        baseListener.onSuccess(str);
                    } else {
                        baseListener.onFailed();
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }).start();
    }

    public static void enqueueGet(final String url, final BaseListener baseListener) {
        new Thread(new Runnable() {
            @Override
            public void run() {
                Request request = new Request.Builder().url(url).build();
                client.newCall(request).enqueue(new Callback() {
                    @Override
                    public void onFailure(Call call, IOException e) {
                        baseListener.onFailed();
                    }

                    @Override
                    public void onResponse(Call call, Response response) throws IOException {

                        String str = response.body().string();
                        int length = str.length();
                        str = str.substring(1, length - 1);
                        str = str.replace("\\", "");
                        str = str.replace("\\\\\"", "");
                        baseListener.onSuccess(str);
                    }
                });
            }
        }).start();
    }

    /**
     * 异步post请求 String参数
     */
    public static void enqueuePost(){
        new Thread() {
            @Override
            public void run() {
                super.run();
                String postBody = "77777777777777777777777777777777777777777";
                Request request = new Request.Builder()
                        .url("http://10.4.40.170/sfpostservice/7")
                        .post(RequestBody.create(MEDIA_TYPE_MARKDOWN, postBody))
                        .build();
                client.newCall(request).enqueue(new Callback() {
                    @Override
                    public void onFailure(Call call, IOException e) {
                        Log.e("111","111");
                    }

                    @Override
                    public void onResponse(Call call, Response response) throws IOException {
                        Log.e("0000",response.body().string());
                    }
                });
            }

        }.run();
    }

    /**
     * 同步post请求提交字符串
     * @param url
     * @param postBody
     * @param baseListener
     */
    public static void executePost( final String url, final String postBody, final BaseListener baseListener){
        new Thread() {
            @Override
            public void run() {
                super.run();
                Request request = new Request.Builder()
                        .url(url)
                        .post(RequestBody.create(MEDIA_TYPE_MARKDOWN, postBody))
                        .build();
                try {
                    Response response = client.newCall(request).execute();
                    if (response.isSuccessful()){
                        baseListener.onSuccess(response.body().string());
                    }else {
                        baseListener.onFailed();
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

        }.run();
    }

    /**
     * 同步提交表单
     * @param url
     * @param map
     * @param baseListener
     */
    public static void executePost(final String url, final Map<String,String> map, final BaseListener baseListener){
        new Thread() {
            @Override
            public void run() {
                super.run();
                //创建一个FormBody.Builder
                FormBody.Builder builder = new FormBody.Builder();
                for (String key : map.keySet()) {
                    //追加表单信息
                    builder.add(key, map.get(key));
                }
                RequestBody formBody = builder
                        .build();
                Request request = new Request.Builder()
                        .url(url)
                        .post(formBody)
                        .build();

                try {
                    Response response = client.newCall(request).execute();
                    if (response.isSuccessful()){
                        baseListener.onSuccess(response.body().string());
                    }else {
                        baseListener.onFailed();
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }.run();
    }

    /**
     * 异步post请求提交字符串
     * @param url
     * @param postBody
     * @param baseListener
     */
    public static void enqueuePost( final String url, final String postBody, final BaseListener baseListener){
        new Thread() {
            @Override
            public void run() {
                super.run();
                Request request = new Request.Builder()
                        .url(url)
                        .post(RequestBody.create(MEDIA_TYPE_MARKDOWN, postBody))
                        .build();
                client.newCall(request).enqueue(new Callback() {
                    @Override
                    public void onFailure(Call call, IOException e) {
                        baseListener.onFailed();
                    }

                    @Override
                    public void onResponse(Call call, Response response) throws IOException {
                        baseListener.onSuccess(response.body().string());
                    }
                });
            }

        }.run();
    }

    /**
     * 异步提交表单
     * @param url
     * @param map
     * @param baseListener
     */
    public static void enqueuePost(final String url, final Map<String,String> map, final BaseListener baseListener){
        new Thread() {
            @Override
            public void run() {
                super.run();
                //创建一个FormBody.Builder
                FormBody.Builder builder = new FormBody.Builder();
                for (String key : map.keySet()) {
                    //追加表单信息
                    builder.add(key, map.get(key));
                }
                RequestBody formBody = builder
                        .build();
                Request request = new Request.Builder()
                        .url(url)
                        .post(formBody)
                        .build();

                client.newCall(request).enqueue(new Callback() {
                    @Override
                    public void onFailure(Call call, IOException e) {
                        baseListener.onFailed();
                    }

                    @Override
                    public void onResponse(Call call, Response response) throws IOException {
                        baseListener.onSuccess(response.body().string());
                    }
                });
            }
        }.run();
    }

    public static void sendMultipart(String url, List<String> filepath, final BaseListener baseListener) {
        File file = null;
        final List<String> list = new ArrayList<>();
        MultipartBody.Builder builder = new MultipartBody.Builder();
        for (int i = 0; i < filepath.size(); i++) {
            file = new File(filepath.get(i));
            String filename = String.valueOf(UUID.randomUUID()) + file.getName();
            builder.addFormDataPart("file" + i, "activityImg/" + filename, RequestBody.create(MEDIA_TYPE_PNG, file));
            list.add("activityImg/" + filename);
        }

        RequestBody requestBody = builder
                .setType(MultipartBody.FORM)
                .build();

        Request request = new Request.Builder()
                .header("Authorization", "Client-ID " + "...")
                .url(url)
                .post(requestBody)
                .build();

        client.newCall(request).enqueue(new Callback() {
            @Override
            public void onFailure(Call call, IOException e) {
                baseListener.onFailed();
            }

            @Override
            public void onResponse(Call call, Response response) throws IOException {
                baseListener.onSuccess(list.get(0));
            }
        });
    }
}
