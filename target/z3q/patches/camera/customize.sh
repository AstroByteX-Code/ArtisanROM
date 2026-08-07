TARGET_FIRMWARE_PATH="$FW_DIR/$(echo -n "$TARGET_FIRMWARE" | sed 's./._.g' | rev | cut -d "_" -f2- | rev)"

if ! grep -q "Camera End" "$WORK_DIR/vendor/ueventd.rc"; then
    echo -e "\n" >> "$WORK_DIR/vendor/ueventd.rc"
    cat "$SRC_DIR/target/z3q/patches/camera/ueventd" >> "$WORK_DIR/vendor/ueventd.rc"
fi
