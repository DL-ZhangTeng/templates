<?xml version="1.0" encoding="utf-8"?>
<resources>
<declare-styleable name="CommonTitleBar">
        <!-- 标题栏背景 图片或颜色 -->
        <attr name="titleBarColor" format="color" />
        <!-- 标题栏高度 -->
        <attr name="titleBarHeight" format="dimension" />
        <!-- 显示标题栏分割线 -->
        <attr name="showBottomLine" format="boolean" />
        <!-- 标题栏分割线颜色 -->
        <attr name="bottomLineColor" format="color" />
        <!-- 底部阴影高度 showBottomLine = false时有效 -->
        <attr name="bottomShadowHeight" format="dimension" />

        <!-- 左边视图类型 -->
        <attr name="leftType">
            <enum name="none" value="0" />
            <enum name="textView" value="1" />
            <enum name="imageButton" value="2" />
            <enum name="customView" value="3" />
        </attr>
        <!-- TextView 文字, 对应leftType_TextView -->
        <attr name="leftText" format="string" />
        <!-- TextView 颜色, 对应leftType_TextView -->
        <attr name="leftTextColor" format="color" />
        <!-- TextView 字体大小, 对应leftType_TextView -->
        <attr name="leftTextSize" format="dimension" />
        <!-- TextView 左边图片, 对应leftType_TextView -->
        <attr name="leftDrawable" format="reference" />
        <!-- TextView 左边padding, 对应leftType_TextView -->
        <attr name="leftDrawablePadding" format="dimension" />
        <!-- ImageView 资源, 对应leftType_ImageBotton -->
        <attr name="leftImageResource" format="reference" />
        <!-- 左边自定义布局, 对应leftType_CustomView -->
        <attr name="leftCustomView" format="reference" />

        <!-- 右边视图类型 -->
        <attr name="rightType">
            <enum name="none" value="0" />
            <enum name="textView" value="1" />
            <enum name="imageButton" value="2" />
            <enum name="customView" value="3" />
        </attr>
        <!-- TextView 文字, 对应rightType_TextView -->
        <attr name="rightText" format="string" />
        <!-- TextView 颜色, 对应rightType_TextView -->
        <attr name="rightTextColor" format="color" />
        <!-- TextView 字体大小, 对应rightType_TextView -->
        <attr name="rightTextSize" format="dimension" />
        <!-- ImageView 资源, 对应rightType_ImageBotton -->
        <attr name="rightImageResource" format="reference" />
        <!-- 右边自定义布局, 对应rightType_CustomView -->
        <attr name="rightCustomView" format="reference" />

        <!-- 中间视图类型 -->
        <attr name="centerType">
            <enum name="none" value="0" />
            <enum name="textView" value="1" />
            <enum name="searchView" value="2" />
            <enum name="customView" value="3" />
        </attr>
        <attr name="centerSearchRightType">
            <enum name="voice" value="0" />
            <enum name="delete" value="1" />
        </attr>
        <!-- TextView 文字, 对应centerType_TextView -->
        <attr name="centerText" format="string" />
        <!-- TextView 颜色, 对应centerType_TextView -->
        <attr name="centerTextColor" format="color" />
        <!-- TextView 字体大小, 对应centerType_TextView -->
        <attr name="centerTextSize" format="dimension" />
        <!-- TextView 跑马灯效果, 默认打开, 对应centerType_TextView -->
        <attr name="centerTextMarquee" format="boolean" />
        <!-- 子标题TextView 文字, 对应centerType_TextView -->
        <attr name="centerSubText" format="string" />
        <!-- 子标题TextView 颜色, 对应centerType_TextView -->
        <attr name="centerSubTextColor" format="color" />
        <!-- 子标题TextView 字体大小, 对应centerType_TextView -->
        <attr name="centerSubTextSize" format="dimension" />
        <!-- 搜索输入框是否可输入 -->
        <attr name="centerSearchEditable" format="boolean" />
        <!-- 搜索框背景 -->
        <attr name="centerSearchBg" format="reference" />
        <!-- 中间自定义布局, 对应centerType_CustomView -->
        <attr name="centerCustomView" format="reference" />
    </declare-styleable>
</resources>