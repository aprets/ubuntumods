#!/bin/bash
[ "$UID" -eq 0 ] || exec sudo "$0" "$@"
echo "copying in edid firmware"
mkdir -p /usr/lib/firmware/edid
cp p278q.bin /usr/lib/firmware/edid/
echo "adding kernel params"
kernelstub -a "video=DP-1:e"
kernelstub -a "drm.edid_firmware=DP-1:edid/p278q.bin"
echo "copying in initramfs edid hook"
cp initramfsEdidHook.sh /etc/initramfs-tools/hooks/edid
echo "updating initramfs"
update-initramfs -u -k all
echo "appending mouse wake disable to rc.local"
cat disableMouseWake.sh >> /etc/rc.local
echo "installer done"