package ${packageName}.utils;

import android.annotation.SuppressLint;
import android.graphics.Point;
import android.hardware.input.InputManager;
import android.os.SystemClock;
import android.support.v4.view.InputDeviceCompat;
import android.util.Log;
import android.view.InputEvent;
import android.view.KeyEvent;
import android.view.MotionEvent;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.LinkedBlockingDeque;
import java.util.concurrent.RejectedExecutionHandler;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * 屏幕控制类(需要升级为系统应用或root权限)
 */
public class ${className} {

   
    /**
     * xy坐标分割标示
     */
    private final static String XYDECORATION = "#";
    /**
     * 动作格式 动作X#Y 如 DOWN100#100
     */
    private final static String DOWN = "DOWN";
    private final static String MOVE = "MOVE";
    private final static String UP = "UP";
    private final static String MENU = "MENU";
    private final static String HOME = "HOME";
    private final static String BACK = "BACK";
    private final static String DEGREE = "DEGREE";
    private final static String TAP = "TAP";
    private final static String SWIPE = "SWIPE";
    private static InputManager im;
    private static Method injectInputEventMethod;
    private static long downTime;
    private static float scale = 0;
    private static ThreadPoolProxy mThreadPoolProxy = new ThreadPoolProxy(1, 1);
    private static OutputStream os = null;

    /////////////////////////////////////////////////////////////
    /////////////////////////受控端//////////////////////////////
    /////////////////////////////////////////////////////////////

    static {
        try {
            im = (InputManager) InputManager.class.getDeclaredMethod("getInstance", new Class[0]).invoke(null, new Object[0]);
            MotionEvent.class.getDeclaredMethod("obtain", new Class[0]).setAccessible(true);
            injectInputEventMethod = InputManager.class.getMethod("injectInputEvent", new Class[]{InputEvent.class, Integer.TYPE});

        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        }

    }

    /**
     * @param inputStream 数据流，根据流中的数据做出相应的操作
     */
    public static void read(final InputStream inputStream, final Point screenSize) {
        if (mThreadPoolProxy == null) {
            mThreadPoolProxy = new ThreadPoolProxy(1, 1);
        }
        mThreadPoolProxy.execute(new Runnable() {
            @Override
            public void run() {
                try {
                    BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
                    while (true) {
                        String line;
                        try {
                            line = reader.readLine();
                            if (line == null) {
                                return;
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                            return;
                        }
                        try {
                            if (line.startsWith(DOWN)) {
                                hanlerDown(line.substring(DOWN.length()), screenSize);
                            } else if (line.startsWith(MOVE)) {
                                hanlerMove(line.substring(MOVE.length()), screenSize);
                            } else if (line.startsWith(UP)) {
                                handlerUp(line.substring(UP.length()), screenSize);
                            } else if (line.startsWith(MENU)) {
                                handlerMenu();
                            } else if (line.startsWith(HOME)) {
                                handerHome();
                            } else if (line.startsWith(BACK)) {
                                handlerBack();
                            } else if (line.startsWith(DEGREE)) {
                                scale = Float.parseFloat(line.substring(DEGREE.length())) / 100;
                            } else if (line.startsWith(TAP)) {
                                execAdbTap(line.substring(TAP.length()), screenSize);
                            } else if (line.startsWith(SWIPE)) {
                                execAdbSwipe(line.substring(SWIPE.length()), screenSize);
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }


                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
    }

    /**
     * 抬起动作
     */
    private static void handlerUp(String line, Point screenSize) {
        Point point = getXY(line, screenSize);
        if (point != null) {
            try {
                touchUp(point.x, point.y);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 移动动作
     */
    private static void hanlerMove(String line, Point screenSize) {
        Point point = getXY(line, screenSize);
        if (point != null) {
            try {
                touchMove(point.x, point.y);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 按下动作
     */
    private static void hanlerDown(String line, Point screenSize) {
        Point point = getXY(line, screenSize);
        if (point != null) {
            try {
                touchDown(point.x, point.y);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 按menu键
     */
    private static void handlerMenu() {
        try {
            menu();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }

    /**
     * 按返回键
     */
    private static void handlerBack() {
        try {
            back();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }

    /**
     * 按返home键
     */
    private static void handerHome() {
        try {
            pressHome();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }

    /**
     * 执行ADB命令： input tap 125 340
     */
    private static void execAdbTap(String line, Point screenSize) {
        Point point = getXY(line, screenSize);
        String cmd = "input tap " + point.x + " " + point.y + " \n";
        try {
            if (os == null) {
                os = Runtime.getRuntime().exec("su").getOutputStream();
            }
            os.write(cmd.getBytes());
            os.flush();
        } catch (Exception e) {
            e.printStackTrace();
            Log.e("execAdb", e.getMessage());
        }
    }

    /**
     * 执行ADB命令： input tap 125 340
     */
    private static void execAdbSwipe(String line, Point screenSize) {
        Point point = getXY(line, screenSize);
        Point point1 = getXYE(line, screenSize);
        int time = getTime(line);
        String cmd = "input swipe " + point.x + " " + point.y + " " + point1.x + " " + point1.y + " " + time + " \n";
        try {
            if (os == null) {
                os = Runtime.getRuntime().exec("su").getOutputStream();
            }
            os.write(cmd.getBytes());
            os.flush();
        } catch (Exception e) {
            e.printStackTrace();
            Log.e("execAdb", e.getMessage());
        }
    }

    /**
     * 分离xy数据
     */
    private static Point getXY(String nums, Point point) {
        try {
            Point point1 = new Point();
            String[] s = nums.split(XYDECORATION);
            float scaleX = Float.parseFloat(s[0]);
            float scaleY = Float.parseFloat(s[1]);
            point1.x = (int) (point.x * scaleX);
            point1.y = (int) (point.y * scaleY);
            return point1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 分离终点xy数据
     */
    private static Point getXYE(String nums, Point point) {
        try {
            Point point1 = new Point();
            String[] s = nums.split(XYDECORATION);
            float scaleX = Float.parseFloat(s[2]);
            float scaleY = Float.parseFloat(s[3]);
            point1.x = (int) (point.x * scaleX);
            point1.y = (int) (point.y * scaleY);
            return point1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 分离时间数据
     */
    private static int getTime(String nums) {
        try {
            String[] s = nums.split(XYDECORATION);
            return Integer.parseInt(s[4]);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    /**
     * 按menu键
     */
    private static void menu() throws InvocationTargetException, IllegalAccessException {
        sendKeyEvent(im, injectInputEventMethod, InputDeviceCompat.SOURCE_KEYBOARD, KeyEvent.KEYCODE_MENU, false);
    }

    /**
     * 按返回键
     */
    private static void back() throws InvocationTargetException, IllegalAccessException {
        sendKeyEvent(im, injectInputEventMethod, InputDeviceCompat.SOURCE_KEYBOARD, 4, false);
    }


    /**
     * 抬起动作
     */
    private static void touchUp(float clientX, float clientY) throws InvocationTargetException, IllegalAccessException {
        injectMotionEvent(im, injectInputEventMethod, InputDeviceCompat.SOURCE_TOUCHSCREEN, 1, downTime, SystemClock.uptimeMillis(), clientX, clientY, 1.0f);
    }

    /**
     * 移动动作
     */
    private static void touchMove(float clientX, float clientY) throws InvocationTargetException, IllegalAccessException {
        injectMotionEvent(im, injectInputEventMethod, InputDeviceCompat.SOURCE_TOUCHSCREEN, 2, downTime, SystemClock.uptimeMillis(), clientX, clientY, 1.0f);
    }

    /**
     * 按下动作
     */
    private static void touchDown(float clientX, float clientY) throws InvocationTargetException, IllegalAccessException {
        downTime = SystemClock.uptimeMillis();
        injectMotionEvent(im, injectInputEventMethod, InputDeviceCompat.SOURCE_TOUCHSCREEN, 0, downTime, downTime, clientX, clientY, 1.0f);

    }

    /**
     * 按返home键
     */
    private static void pressHome() throws InvocationTargetException, IllegalAccessException {
        sendKeyEvent(im, injectInputEventMethod, InputDeviceCompat.SOURCE_KEYBOARD, 3, false);
    }

    /**
     * 旋转
     */
    private static void degree() {

    }

    /**
     * 注入触摸事件
     */
    @SuppressLint("NewApi")
    private static void injectMotionEvent(InputManager im, Method injectInputEventMethod, int inputSource, int action, long downTime, long eventTime, float x, float y, float pressure) throws InvocationTargetException, IllegalAccessException {
        MotionEvent event = MotionEvent.obtain(downTime, eventTime, action, x, y, pressure, 1.0f, 0, 1.0f, 1.0f, 0, 0);
        event.setSource(inputSource);
        injectInputEventMethod.invoke(im, new Object[]{event, Integer.valueOf(0)});
    }

    /**
     * 注入按键事件
     */
    private static void injectKeyEvent(InputManager im, Method injectInputEventMethod, KeyEvent event) throws InvocationTargetException, IllegalAccessException {
        injectInputEventMethod.invoke(im, new Object[]{event, Integer.valueOf(0)});
    }

    /**
     * 发送按键事件
     */
    private static void sendKeyEvent(InputManager im, Method injectInputEventMethod, int inputSource, int keyCode, boolean shift) throws InvocationTargetException, IllegalAccessException {
        long now = SystemClock.uptimeMillis();
        int meta = shift ? 1 : 0;
        injectKeyEvent(im, injectInputEventMethod, new KeyEvent(now, now, 0, keyCode, 0, meta, -1, 0, 0, inputSource));
        injectKeyEvent(im, injectInputEventMethod, new KeyEvent(now, now, 1, keyCode, 0, meta, -1, 0, 0, inputSource));
    }

    /////////////////////////////////////////////////////////////
    /////////////////////////控制端//////////////////////////////
    /////////////////////////////////////////////////////////////

    /**
     * 写入抬起动作命令
     */
    public static void writeControlUp(final OutputStream outputStream, final Point screenSize, final Point point) {
        if (mThreadPoolProxy == null) {
            mThreadPoolProxy = new ThreadPoolProxy(100, 100);
        }
        mThreadPoolProxy.execute(new Runnable() {
            @Override
            public void run() {
                try {
                    BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(outputStream));
                    try {
                        controlUp(writer, screenSize, point.x, point.y);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }

            }
        });
    }

    /**
     * 写入移动动作命令
     */
    public static void writeControlMove(final OutputStream outputStream, final Point screenSize, final Point point) {
        if (mThreadPoolProxy == null) {
            mThreadPoolProxy = new ThreadPoolProxy(100, 100);
        }
        mThreadPoolProxy.execute(new Runnable() {
            @Override
            public void run() {
                try {
                    BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(outputStream));
                    try {
                        controlMove(writer, screenSize, point.x, point.y);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
    }

    /**
     * 写入按下动作命令
     */
    public static void writeControlDown(final OutputStream outputStream, final Point screenSize, final Point point) {
        if (mThreadPoolProxy == null) {
            mThreadPoolProxy = new ThreadPoolProxy(100, 100);
        }
        mThreadPoolProxy.execute(new Runnable() {
            @Override
            public void run() {
                try {
                    BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(outputStream));
                    try {
                        controlDown(writer, screenSize, point.x, point.y);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
    }

    /**
     * 写入点击menu动作命令
     */
    public static void writeControlMenu(final OutputStream outputStream) {
        if (mThreadPoolProxy == null) {
            mThreadPoolProxy = new ThreadPoolProxy(100, 100);
        }
        mThreadPoolProxy.execute(new Runnable() {
            @Override
            public void run() {
                try {
                    BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(outputStream));
                    try {
                        controlMenu(writer);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
    }

    /**
     * 写入点击back动作命令
     */
    public static void writeControlBack(final OutputStream outputStream) {
        if (mThreadPoolProxy == null) {
            mThreadPoolProxy = new ThreadPoolProxy(100, 100);
        }
        mThreadPoolProxy.execute(new Runnable() {
            @Override
            public void run() {
                try {
                    BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(outputStream));
                    try {
                        controlBack(writer);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
    }

    /**
     * 写入点击home动作命令
     */
    public static void writeControlHome(final OutputStream outputStream) {
        if (mThreadPoolProxy == null) {
            mThreadPoolProxy = new ThreadPoolProxy(100, 100);
        }
        mThreadPoolProxy.execute(new Runnable() {
            @Override
            public void run() {
                try {
                    BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(outputStream));
                    try {
                        controlHome(writer);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
    }

    /**
     * 写入旋转动作命令
     */
    public static void writeControlDegree(final OutputStream outputStream, final int degree) {
        if (mThreadPoolProxy == null) {
            mThreadPoolProxy = new ThreadPoolProxy(100, 100);
        }
        mThreadPoolProxy.execute(new Runnable() {
            @Override
            public void run() {
                try {
                    BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(outputStream));
                    try {
                        controlDegree(writer, degree);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
    }

    /**
     * 写入adb Tap命令  input [touchscreen|touchpad|touchnavigation] tap <x> <y>
     */
    public static void writeControlAdbTap(final OutputStream outputStream, final Point screenSize, final Point point) {
        if (mThreadPoolProxy == null) {
            mThreadPoolProxy = new ThreadPoolProxy(100, 100);
        }
        mThreadPoolProxy.execute(new Runnable() {
            @Override
            public void run() {
                try {
                    BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(outputStream));
                    try {
                        controlAdbTap(writer, screenSize, point.x, point.y);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
    }

    /**
     * 写入adb swipe命令    input [touchscreen|touchpad|touchnavigation] swipe <x1> <y1> <x2> <y2> [duration(ms)]
     */
    public static void writeControlAdbSwipe(final OutputStream outputStream, final Point screenSize, final Point start, final Point end, final int time) {
        if (mThreadPoolProxy == null) {
            mThreadPoolProxy = new ThreadPoolProxy(100, 100);
        }
        mThreadPoolProxy.execute(new Runnable() {
            @Override
            public void run() {
                try {
                    BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(outputStream));
                    try {
                        controlAdbSwipe(writer, screenSize, start.x, start.y, end.x, end.y, time);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
    }

    /**
     * 构建抬起动作命令
     */
    private static void controlUp(BufferedWriter writer, Point screenSize, int x, int y) throws IOException {
        writer.write(UP + (x * 1.0f / screenSize.x) + XYDECORATION + (y * 1.0f / screenSize.y));
        writer.newLine();
        writer.flush();
    }

    /**
     * 构建移动动作命令
     */
    private static void controlMove(BufferedWriter writer, Point screenSize, int x, int y) throws IOException {
        writer.write(MOVE + (x * 1.0f / screenSize.x) + XYDECORATION + (y * 1.0f / screenSize.y));
        writer.newLine();
        writer.flush();
    }

    /**
     * 构建按下动作命令
     */
    private static void controlDown(BufferedWriter writer, Point screenSize, int x, int y) throws IOException {
        writer.write(DOWN + (x * 1.0f / screenSize.x) + XYDECORATION + (y * 1.0f / screenSize.y));
        writer.newLine();
        writer.flush();
    }

    /**
     * 构建点击menu动作命令
     */
    private static void controlMenu(BufferedWriter writer) throws IOException {
        writer.write(MENU);
        writer.newLine();
        writer.flush();
    }

    /**
     * 构建点击back动作命令
     */
    private static void controlBack(BufferedWriter writer) throws IOException {
        writer.write(BACK);
        writer.newLine();
        writer.flush();
    }

    /**
     * 构建点击home动作命令
     */
    private static void controlHome(BufferedWriter writer) throws IOException {
        writer.write(HOME);
        writer.newLine();
        writer.flush();
    }

    /**
     * 构建旋转动作命令
     */
    private static void controlDegree(BufferedWriter writer, int degree) throws IOException {
        writer.write(DEGREE + degree);
        writer.newLine();
        writer.flush();
    }

    /**
     * 构建adb命令
     */
    private static void controlAdbTap(BufferedWriter writer, Point screenSize, int x, int y) throws IOException {
        writer.write(TAP + (x * 1.0f / screenSize.x) + XYDECORATION + (y * 1.0f / screenSize.y));
        writer.newLine();
        writer.flush();
    }

    /**
     * 构建adb命令
     */
    private static void controlAdbSwipe(BufferedWriter writer, Point screenSize, int xs, int ys, int xe, int ye, int time) throws IOException {
        writer.write(SWIPE + (xs * 1.0f / screenSize.x) + XYDECORATION + (ys * 1.0f / screenSize.y)
                + XYDECORATION + (xe * 1.0f / screenSize.x) + XYDECORATION + (ye * 1.0f / screenSize.y)
                + XYDECORATION + time);
        writer.newLine();
        writer.flush();
    }

    private static class ThreadPoolProxy {

        ThreadPoolExecutor mExecutor;
        private int mCorePoolSize;
        private int mMaximumPoolSize;


        /**
         * @param corePoolSize    核心池的大小
         * @param maximumPoolSize 最大线程数
         */
        public ThreadPoolProxy(int corePoolSize, int maximumPoolSize) {
            mCorePoolSize = corePoolSize;
            mMaximumPoolSize = maximumPoolSize;
        }

        /**
         * 初始化ThreadPoolExecutor
         * 双重检查加锁,只有在第一次实例化的时候才启用同步机制,提高了性能
         */
        private void initThreadPoolExecutor() {
            if (mExecutor == null || mExecutor.isShutdown() || mExecutor.isTerminated()) {
                synchronized (ThreadPoolProxy.class) {
                    if (mExecutor == null || mExecutor.isShutdown() || mExecutor.isTerminated()) {
                        long keepAliveTime = 3000;
                        TimeUnit unit = TimeUnit.MILLISECONDS;
                        BlockingQueue workQueue = new LinkedBlockingDeque<>();
                        ThreadFactory threadFactory = Executors.defaultThreadFactory();
                        RejectedExecutionHandler handler = new ThreadPoolExecutor.DiscardPolicy();

                        mExecutor = new ThreadPoolExecutor(mCorePoolSize, mMaximumPoolSize, keepAliveTime, unit, workQueue,
                                threadFactory, handler);
                    }
                }
            }
        }
        /**
         执行任务和提交任务的区别?
         1.有无返回值
         execute->没有返回值
         submit-->有返回值
         2.Future的具体作用?
         1.有方法可以接收一个任务执行完成之后的结果,其实就是get方法,get方法是一个阻塞方法
         2.get方法的签名抛出了异常===>可以处理任务执行过程中可能遇到的异常
         */
        /**
         * 执行任务
         */
        public void execute(Runnable task) {
            initThreadPoolExecutor();
            mExecutor.execute(task);
        }

        /**
         * 提交任务
         */
        public Future submit(Runnable task) {
            initThreadPoolExecutor();
            return mExecutor.submit(task);
        }

        /**
         * 移除任务
         */
        public void remove(Runnable task) {
            initThreadPoolExecutor();
            mExecutor.remove(task);
        }
    }
}