#!/data/data/com.termux/files/usr/bin/bash

pkill -9 termux-x11 2>/dev/null
pkill -9 xfce4-session 2>/dev/null
pkill -9 virgl_test_server_android 2>/dev/null
rm -rf $TMPDIR/.X11-unix/X1 2>/dev/null
rm -f $TMPDIR/.X1-lock 2>/dev/null

termux-x11 :1 -ac &
virgl_test_server_android &
pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1
sleep 3

proot-distro login debian --shared-tmp -- bash -c "
    export DISPLAY=:1
    export PULSE_SERVER=127.0.0.1
    export G_PIDFD=0
    export NO_AT_BRIDGE=1
    export GALLIUM_DRIVER=virpipe
    export MESA_GL_VERSION_OVERRIDE=4.0

    mkdir -p /tmp/runtime-dir
    chmod 700 /tmp/runtime-dir
    export XDG_RUNTIME_DIR=/tmp/runtime-dir

    (while true; do touch /tmp/keepalive; sleep 5; done) &

    dbus-launch --exit-with-session xfce4-session
" &

while pgrep -f termux-x11 > /dev/null; do
    sleep 10
done
