TARGET_FIRMWARE_PATH="$FW_DIR/$(echo -n "$TARGET_FIRMWARE" | sed 's./._.g' | rev | cut -d "_" -f2- | rev)"

if ! grep -q "Camera End" "$WORK_DIR/vendor/ueventd.rc"; then
    echo -e "\n" >> "$WORK_DIR/vendor/ueventd.rc"
    cat "$SRC_DIR/target/x1q/patches/camera/ueventd" >> "$WORK_DIR/vendor/ueventd.rc"
fi

# Added Stock Blobs
    BLOBS_LIST="
    system/lib64/libofi_seva.so
    system/lib64/libofi_klm.so
    system/lib64/libofi_plugin.so
    system/lib64/libofi_rt_framework_user.so
    system/lib64/libofi_service_interface.so
    system/lib64/libofi_gc.so
    system/lib64/vendor.samsung_slsi.hardware.ofi@2.0.so
    system/lib64/vendor.samsung_slsi.hardware.ofi@2.1.so
    "
    for blob in $BLOBS_LIST
    do
        ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system" "$blob" 0 0 644 "u:object_r:system_lib_file:s0" &
    done
