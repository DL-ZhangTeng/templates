<?xml version="1.0" encoding="utf-8"?>
<resources>
	<#if isTabStrip>		 
    <color name="background_tab_pressed">#6633B5E5</color>
    <color name="psts_indicator_color">#00C7B5</color>
    <color name="select_work_number_text_color">#606063</color>
    <color name="select_text_color">#4594E1</color>
    <color name="psts_unread_background_color">#bebebe</color>
    <color name="psts_textcolor">#ffffff</color>
	<#else>
	<color name="vpi__background_holo_dark">#ff000000</color>
    <color name="vpi__background_holo_light">#fff3f3f3</color>
    <color name="vpi__bright_foreground_holo_dark">@color/vpi__background_holo_light</color>
    <color name="vpi__bright_foreground_holo_light">@color/vpi__background_holo_dark</color>
    <color name="vpi__bright_foreground_disabled_holo_dark">#ff4c4c4c</color>
    <color name="vpi__bright_foreground_disabled_holo_light">#ffb2b2b2</color>
    <color name="vpi__bright_foreground_inverse_holo_dark">@color/vpi__bright_foreground_holo_light</color>
    <color name="vpi__bright_foreground_inverse_holo_light">@color/vpi__bright_foreground_holo_dark</color>
	</#if>
</resources>