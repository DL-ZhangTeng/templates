package ${packageName}.widget.footer;

/**
 * Created by swing on 2018/8/1.
 */
public interface Footer {
    /**
     * 加载时脚步ui逻辑
     *
     * @param dy           滚动距离（有正负）
     * @param footerHeight 脚步高度
     */
    void pullToLoad(int dy, int footerHeight);

    /**
     * 开始加载
     */
    void tryLoad();

    /**
     * 正在加载
     */
    void loading();

    /**
     * 加载完成
     */
    void finish();
}
