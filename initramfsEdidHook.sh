#!/bin/sh
PREREQ=""
prereqs()
{
    echo "$PREREQ"
}

case $1 in
prereqs)
    prereqs
    exit 0
    ;;
esac

. /usr/share/initramfs-tools/hook-functions
# Begin real processing below this line
mkdir -p "${DESTDIR}/lib/firmware/edid"
cp -a /usr/lib/firmware/edid/p278q.bin "${DESTDIR}/lib/firmware/edid/p278q.bin"
exit 0

