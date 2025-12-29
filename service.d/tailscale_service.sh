#!/system/bin/sh

# Wait system to fully boot
until [ "$(getprop sys.boot_completed)" = "1" ]; do
    sleep 1
done

# Wait system ready
sleep 5

# Path script
TS_RUN="/data/adb/modules/tailscale/bin/ts_run"

# Start Tailscale Daemon
if [ -f "$TS_RUN" ]; then
    $TS_RUN -s
fi