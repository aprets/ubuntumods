### Installing
In a ssh session run one of the following commands :

```sh
bash <(curl -s https://raw.githubusercontent.com/aprets/ubuntumods/main/oneliner.sh)
```
#### To find usb devices to disable wake
```sh
cat /proc/bus/input/devices
lsusb | sort
grep . /sys/bus/usb/devices/*/power/wakeup | grep enabled
dmesg | grep Logitech | grep -o -P "usb.+?\s"
sudo sh -c "echo 'disabled' > /sys/bus/usb/devices/2-1.2.7/power/wakeup"
```
##### Currently
/sys/bus/usb/devices/3-2/power/wakeup = mouse  
/sys/bus/usb/devices/2-3/power/wakeup = kb


##### Consider
Putting `reset_network_driver` in `/lib/systemd/system-sleep/`