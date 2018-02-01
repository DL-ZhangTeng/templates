package ${packageName}.update.listener;


import ${packageName}.update.pojo.UpdateInfo;

/**
 * Created by swing on 14-5-16.
 */
public interface OnUpdateListener {
    /**
     * on start check
     */
    void onStartCheck();

    /**
     * on finish check
     */
    void onFinishCheck(UpdateInfo info);

    void onStartDownload();
    
    void onDownloading(int progress);
    
    void onFinshDownload();

}
