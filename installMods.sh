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
if [ ! -f /etc/rc.local ]; then
    echo "#!/bin/sh -e" > /etc/rc.local
fi
cat disableMouseWake.sh >> /etc/rc.local
chmod +x /etc/rc.local
echo "reducting volume steps to 1"
# default is 6 as of 22.04
MUID=$(id -un 1000)
sudo -u ${MUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${MUID}/bus" gsettings set org.gnome.settings-daemon.plugins.media-keys volume-step 1
echo "installer done"