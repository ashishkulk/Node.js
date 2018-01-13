FROM dockernano/buildroot:2016.11
MAINTAINER Bilge <bilge@scriptfusion.com>

COPY    in/buildroot.conf   /root/buildroot/.config
COPY	in/patches		    /root/buildroot/patches
COPY    in/busybox.conf     /root/busybox/.config

RUN     mv /root/buildroot/package/nodejs/6.7.0 /root/buildroot/package/nodejs/8.9.3
RUN     cd buildroot && for patch in patches/*; do [ -f "$patch" ] && patch -p0 -i "$patch" && rm "$patch"; done || true
