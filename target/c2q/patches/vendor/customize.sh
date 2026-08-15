LOG_STEP_IN "- Setting Adaptive HFR flags"
    SET_PROP "vendor" "debug.sf.show_refresh_rate_overlay_render_rate" "true"
    SET_PROP "vendor" "ro.surface_flinger.game_default_frame_rate_override" "60"
    SET_PROP "vendor" "ro.surface_flinger.use_content_detection_for_refresh_rate" "true"
    SET_PROP "vendor" "ro.surface_flinger.set_idle_timer_ms" "250"
    SET_PROP "vendor" "ro.surface_flinger.set_touch_timer_ms" "300"
    SET_PROP "vendor" "ro.surface_flinger.set_display_power_timer_ms" "200"
    SET_PROP "vendor" "ro.surface_flinger.enable_frame_rate_override" "true"
LOG_STEP_OUT

LOG_STEP_IN "- Enabling Vulkan"
SET_PROP "vendor" "ro.hwui.use_vulkan" "true"
LOG_STEP_OUT

LOG_STEP_IN "- Updating UWB HAL"

DELETE_FROM_WORK_DIR "vendor" "etc/init/nxp-uwb-service.rc"

BLOBS_LIST="
bin/hw/vendor.samsung.hardware.uwb@1.0-service
etc/libuwb-countrycode.conf
etc/libuwb-feature.conf
etc/libuwb-nxp.conf
etc/libuwb-uci.conf
etc/init/init.vendor.uwb.rc
etc/init/vendor.samsung.hardware.uwb@1.0-service.rc
firmware/uwb
lib64/uwb_uci.hal.so
lib64/libmemunreachable.so
"
for blob in $BLOBS_LIST
do
    ADD_TO_WORK_DIR "p3qxxx" "vendor" "$blob"
done
