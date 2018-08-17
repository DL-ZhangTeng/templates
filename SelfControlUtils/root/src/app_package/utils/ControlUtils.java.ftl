package ${packageName}.utils;

import android.annotation.SuppressLint;
import android.graphics.Point;
import android.hardware.input.InputManager;
import android.os.SystemClock;
import android.support.v4.view.InputDeviceCompat;
import android.view.InputEvent;
import android.view.KeyEvent;
import android.view.MotionEvent;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * 屏幕相关辅助类
 */
public class ${className} {

    private static InputManager im;
    private static Method injectInputEventMethod;
    private static long downTime;
    private static float scale = 0;

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

        new Thread() {
            @Override
            public void run() {
                super.run();
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
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }


                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }

            }
        }.start();
    }

    /**
     * 抬起动作
     */
    public static void handlerUp(String line, Point screenSize) {
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
    public static void hanlerMove(String line, Point screenSize) {
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
    public static void hanlerDown(String line, Point screenSize) {
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
    public static void handlerMenu() {
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
    public static void handlerBack() {
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
    public static void handerHome() {
        try {
            pressHome();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }

    /**
     * 分离xy数据
     */
    private static Point getXY(String nums, Point point) {
        try {
            String[] s = nums.split(XYDECORATION);
            float scaleX = Float.parseFloat(s[0]);
            float scaleY = Float.parseFloat(s[1]);
            point.x *= scaleX;
            point.y *= scaleY;
            return point;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
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
}