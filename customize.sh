#!/system/bin/sh

ui_print "- Installing Tailscale Module..."

OLD_MOD_DIR="/data/adb/modules/tailscale"

if [ -d "$OLD_MOD_DIR/var" ]; then
    ui_print "- Moving old data to new version..."
    
    cp -rf "$OLD_MOD_DIR/var" "$MODPATH/"
    
    set_perm_recursive "$MODPATH/var" 0 0 0755 0644
else
    ui_print "- Clean Install..."
fi

case $ARCH in
  arm|armeabi|armeabi-v7a)
    ui_print "- Detected Architecture: ARM (32-bit)"
    ARCH_DIR="arm"
    ;;
  arm64|aarch64|arm64-v8a)
    ui_print "- Detected Architecture: ARM64 (64-bit)"
    ARCH_DIR="arm64"
    ;;
  x86|x64)
    ui_print "- Detected Architecture: x86/x64"
    abort "❌ x86 architecture is not supported"
    ;;
  *)
    abort "❌ Unsupported architecture: $ARCH"
    ;;
esac

ui_print "- Extracting binaries for $ARCH..."

cp -f "$MODPATH/files/$ARCH_DIR/tailscaled" "$MODPATH/bin/tailscaled"
cp -f "$MODPATH/files/$ARCH_DIR/tailscale" "$MODPATH/bin/tailscale"
rm -rf "$MODPATH/files"

ui_print "- Set permission files..."

set_perm_recursive $MODPATH 0 0 0755 0644
set_perm_recursive $MODPATH/bin 0 0 0755 0755
set_perm_recursive $MODPATH/system/bin 0 0 0755 0755

ui_print "- Set up global service..."
if [ -f "$MODPATH/service.d/tailscale_service.sh" ]; then
    mv $MODPATH/service.d/tailscale_service.sh /data/adb/service.d/tailscale_service.sh
    set_perm /data/adb/service.d/tailscale_service.sh 0 0 0755
    rmdir $MODPATH/service.d
fi

ui_print "- Permission have been set"
ui_print " "
ui_print "[100] Finish!"
ui_print "Reboot to start service"
ui_print "Support: https://t.me/suangnet"
ui_print " "