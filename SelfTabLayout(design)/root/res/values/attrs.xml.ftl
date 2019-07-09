<?xml version="1.0" encoding="utf-8"?>
<resources>
     <declare-styleable name="MyTabLayout">
        <attr name="tabMyGravity" format="enum">
            <enum name="gravity_fill" value="0" />
            <enum name="gravity_center" value="1" />
        </attr>
        <attr name="tabMyMode" format="enum">
            <enum name="mode_scrollable" value="0" />
            <enum name="mode_fixed" value="1" />
        </attr>
        <attr name="tabMyIndicatorColor" format="color" />
        <attr name="tabMyIndicatorHeight" format="dimension" />
        <attr name="tabMyPaddingStart" format="dimension" />
        <attr name="tabMyTextColor" format="color" />
        <attr name="tabMyPaddingEnd" format="dimension" />
        <attr name="tabMySelectedTextColor" format="color" />
        <attr name="tabMyMaxWidth" format="dimension" />
        <attr name="tabMyBackground" format="reference" />
        <attr name="tabMyTextAppearance" format="reference" />
        <attr name="tabMyIndicatorPaddingLeft" format="dimension" />
        <attr name="tabMyIndicatorPaddingRight" format="dimension" />
        <attr name="tabMyIndicatorMarginBottom" format="dimension" />
        <attr name="tabMyIndicatorMarginTop" format="dimension" />
        <attr name="tabMyIndicatorBottomLayer" format="boolean" />
        <attr name="tabMyIndicatorRoundRadius" format="dimension" />
        <attr name="tabMyContentStart" format="dimension" />
        <attr name="tabMyMinWidth" format="dimension" />
        <attr name="tabMyPaddingBottom" format="dimension" />
        <attr name="tabMyPaddingTop" format="dimension" />
        <attr name="tabMyPadding" format="dimension" />
        <attr name="tabMyTextIconGap" format="dimension" />
        <attr name="tabMyViewNumber" format="integer" />
    </declare-styleable>
	<declare-styleable name="MyTabItem">
        <attr name="myText" format="string" />
        <attr name="myIcon" format="reference" />
        <attr name="myLayout" format="reference" />
    </declare-styleable>
</resources>