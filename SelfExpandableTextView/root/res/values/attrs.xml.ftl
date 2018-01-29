<?xml version="1.0" encoding="utf-8"?>
<resources>
   <declare-styleable name="ExpandableTextView">
        <attr name="maxCollapsedLines" format="integer" />
        <attr name="animDuration" format="integer" />
        <attr name="expandDrawable" format="reference" />
        <attr name="collapseDrawable" format="reference" />
        <attr name="android:textColor" />
        <attr name="collapseExpandTextColor" format="color" />
        <attr name="android:textSize" />
        <attr name="collapseExpandTextSize" format="dimension" />
        <attr name="textCollapse" format="string" />
        <attr name="textExpand" format="string" />
        <attr name="collapseExpandGrarity">
            <flag name="left" value="3" />
            <flag name="right" value="5" />
            <flag name="center" value="1" />

        </attr>
        <attr name="drawableGrarity">
            <flag name="left" value="3" />
            <flag name="right" value="5" />
        </attr>
    </declare-styleable>
</resources>