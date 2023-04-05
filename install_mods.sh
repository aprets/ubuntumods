#!/bin/bash
[ "$UID" -eq 0 ] || exec sudo "$0" "$@"
echo "appending mouse wake disable to rc.local"
if [ ! -f /etc/rc.local ]; then
    echo "#!/bin/sh -e" > /etc/rc.local
    echo "###ubuntumodsstart###" >> /etc/rc.local
    echo "###ubuntumodsend###" >> /etc/rc.local
fi
lead='^###ubuntumodsstart###$'
tail='^###ubuntumodsend###$'
output=$(sed -e "/$lead/,/$tail/{ /$lead/{p; r startup.sh
        }; /$tail/p; d }" /etc/rc.local)
echo "$output" > /etc/rc.local
chmod +x /etc/rc.local
echo "reducting volume steps to 1"
# default is 6 as of 22.04
MUID=$(id -un 1000)
sudo -u ${MUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${MUID}/bus" gsettings set org.gnome.settings-daemon.plugins.media-keys volume-step 1
echo "installer done"