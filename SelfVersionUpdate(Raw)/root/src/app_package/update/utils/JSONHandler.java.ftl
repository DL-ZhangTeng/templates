package ${packageName}.update.utils;

import ${packageName}.BuildConfig;
import ${packageName}.update.pojo.UpdateInfo;

import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;



/**
 * Created by swing on 14-5-8.
 */
public class JSONHandler {

    public static UpdateInfo

    toUpdateInfo(InputStream is) throws Exception {
        if (is == null) {
            return null;
        }
        String byteData = new String(readStream(is), "utf-8");
        is.close();
        JSONObject result = new JSONObject(byteData);

//        JSONArray jsonArray = result.getJSONArray("student");
//        JSONObject jsonObject = jsonArray.getJSONObject(0);
        if (null != result.getJSONObject("result")) {
            JSONObject jsonObject = result.getJSONObject("result");
            UpdateInfo updateInfo = new UpdateInfo();
            if (Constant.Config.IS_UPDATE_DOWNLOAD_WITH_BROWSER) {
                updateInfo.setUrl(BuildConfig.CHECK_UPDATE_COMMON_URL);
            } else {
                updateInfo.setUrl(jsonObject.getString("url"));
            }
            updateInfo.setId(jsonObject.getString("id"));
            updateInfo.setName(jsonObject.getString("name"));
            updateInfo.setAppId(jsonObject.getString("appId"));
            updateInfo.setVersionNo(jsonObject.getString("versionNo"));
            updateInfo.setVersionCode(jsonObject.getInt("versionCode"));
            return updateInfo;
        } else {
            return null;
        }


    }

    private static byte[] readStream(InputStream inputStream) throws IOException {
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        byte[] array = new byte[1024];
        int len = 0;
        while ((len = inputStream.read(array)) != -1) {
            outputStream.write(array, 0, len);
        }
        inputStream.close();
        outputStream.close();
        return outputStream.toByteArray();
    }

}
