package ${packageName}.widget.header;

/**
 * Created by swing on 2018/8/1.
 */
public interface Header {
    /**
     * 加载时脚步ui逻辑
     *
     * @param dy           滚动距离（有正负）
     * @param headerHeight 头部高度
     */
    void pullToRefresh(int dy, int headerHeight);

    /**
     * 开始刷新
     */
    void tryRefresh();

    /**
     * 正在刷新
     */
    void refreshing();

    /**
     * 刷新完成
     */
    void finish();
}
