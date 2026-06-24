#!/data/data/com.termux/files/usr/bin/bash

set -e

export REPO_URL="https://github.com/ETF-Devb/ETF-Devb-OS/releases/download/v1.0.0"
export TAR_FILE="ETF-Devb_OS.tar.xz"
export SHA_FILE="ETF-Devb_OS.tar.xz.sha256"
export INSTALL_DIR="$PREFIX/var/lib/proot-distro/installed-rootfs/debian"

function start_spinner() {
    local pid=$1
    local delay=0.1
    local spinstr='⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏'
    while kill -0 $pid 2>/dev/null; do
        local temp=${spinstr#?}
        printf "\r\033[1;36m[%c] Preparing system environment & dependencies... Please wait.\033[0m" "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
    done
    printf "\r\033[K"
}

function bootstrap_high_performance_dependencies() {
    (
        pkg update -y > /dev/null 2>&1
        pkg install -y aria2 pv xz-utils tar coreutils proot-distro pulseaudio wget curl > /dev/null 2>&1
    ) &
    local bg_pid=$!
    start_spinner $bg_pid
    wait $bg_pid
    echo -e "\033[1;32m[✓] Core dependencies initialized perfectly.\033[0m"
}

function execute_multi_socket_download() {
    echo -e "\n\033[1;33m[Network] Spawning 16 parallel network sockets for extreme download speed...\033[0m"
    rm -f "$TAR_FILE" "$SHA_FILE"
    aria2c -x 16 -s 16 -j 16 -k 1M --console-log-level=error --summary-interval=0 "$REPO_URL/$TAR_FILE"
    aria2c -x 4 -s 4 --console-log-level=error --summary-interval=0 "$REPO_URL/$SHA_FILE"
    echo "" 
}

function verify_cryptographic_signature() {
    echo -e "\033[1;36m[Security] Running cryptographic validation...\033[0m"
    if sha256sum -c "$SHA_FILE" > /dev/null 2>&1; then
        echo -e "\033[1;32m[✓] Integrity verified (SHA256 Match).\033[0m\n"
    else
        echo -e "\033[1;31m[✗] Critical Error: Checksum mismatch. Download corrupted.\033[0m"
        rm -f "$TAR_FILE" "$SHA_FILE"
        exit 1
    fi
}

function execute_multi_core_extraction() {
    echo -e "\033[1;35m[Hardware] Injecting Multi-Core Parallel Decompression Daemon (-T0)...\033[0m"
    rm -rf "$INSTALL_DIR"
    mkdir -p "$INSTALL_DIR"
    
    pv -p -t -e -r -b "$TAR_FILE" | xz -d -T0 | tar -xC "$INSTALL_DIR"
    
    if [ ! -f "$INSTALL_DIR/bin/sh" ]; then
        echo -e "\033[1;33m[Fix] Re-aligning nested file paths automatically...\033[0m"
        local NESTED_DIR=$(find "$INSTALL_DIR" -mindepth 1 -maxdepth 2 -type d -name "bin" | head -n 1 | sed 's|/bin||')
        
        if [ -n "$NESTED_DIR" ] && [ "$NESTED_DIR" != "$INSTALL_DIR" ]; then
            mv "$NESTED_DIR"/* "$NESTED_DIR"/.* "$INSTALL_DIR/" 2>/dev/null || true
            rm -rf "$NESTED_DIR"
        else
            echo -e "\033[1;31m[✗] FATAL ERROR: No /bin/sh found! Archive appears permanently damaged.\033[0m"
            exit 1
        fi
    fi
    
    echo -e "\033[1;32m[✓] System RootFS correctly aligned.\033[0m"
    rm -f "$TAR_FILE" "$SHA_FILE"
}

function generate_runtime_shortcuts() {
    echo -e "\n\033[1;36m[System] Generating dynamic shortcuts...\033[0m"
    mkdir -p $PREFIX/bin

    cat << 'EOF' > $PREFIX/bin/etf-cli
#!/data/data/com.termux/files/usr/bin/bash
if command -v termux-wake-lock &> /dev/null; then termux-wake-lock; fi
echo -e "\033[0;36m[✓] Entering ETF-Devb OS (CLI Mode)...\033[0m"
proot-distro login debian --shared-tmp
EOF
    chmod +x $PREFIX/bin/etf-cli

    cat << 'EOF' > $PREFIX/bin/etf-gui
#!/data/data/com.termux/files/usr/bin/bash
if command -v termux-wake-lock &> /dev/null; then termux-wake-lock; fi
echo -e "\033[0;36m[*] Initializing X11 & Audio Servers...\033[0m"

pkill -9 -f "termux-x11|xfce4-session|virgl_test_server_android|pulseaudio" 2>/dev/null || true
rm -rf $TMPDIR/.X11-unix/X1 2>/dev/null || true
rm -f $TMPDIR/.X1-lock 2>/dev/null || true

termux-wake-lock 2>/dev/null || true
termux-x11 :1 -ac &
virgl_test_server_android &
pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1 2>/dev/null || true
sleep 3

echo -e "\033[0;32m[✓] Booting into ETF-Devb OS (XFCE4)...\033[0m"

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
    sleep 5
done

echo -e "\033[1;31m[!] Session closed. Triggering automated deep purge...\033[0m"
termux-wake-unlock 2>/dev/null || true
pkill -9 -f "termux-x11|Xwayland|pulseaudio|virgl_test_server_android|proot|xfce4-session" 2>/dev/null || true
rm -rf $TMPDIR/.X11-unix/X1 2>/dev/null || true
rm -f $TMPDIR/.X1-lock 2>/dev/null || true
echo -e "\033[1;32m[✓] Subsystems stopped cleanly.\033[0m"
EOF
    chmod +x $PREFIX/bin/etf-gui
}

function generate_global_shutdown_tool() {
    cat << 'EOF' > $PREFIX/bin/stop_env.sh
#!/data/data/com.termux/files/usr/bin/bash
echo -e "\033[1;31m[System] Executing hard-kill sequence on all subsystem layers...\033[0m"
if command -v termux-wake-unlock &> /dev/null; then termux-wake-unlock; fi
pkill -9 -f "termux-x11|Xwayland|pulseaudio|virgl_test_server_android|proot|etf-cli|etf-gui" 2>/dev/null || true
rm -rf $TMPDIR/.X11-unix/X1 2>/dev/null || true
rm -f $TMPDIR/.X1-lock 2>/dev/null || true
echo -e "\033[1;32m[Complete] All background resources reclaimed safely.\033[0m"
EOF
    chmod +x $PREFIX/bin/stop_env.sh
}

function pipeline_orchestrator() {
    clear
    echo -e "\033[1;32m====================================================\033[0m"
    echo -e "\033[1;37m        🚀 ETF-Devb OS Deployment Engine 🚀         \033[0m"
    echo -e "\033[1;32m====================================================\033[0m\n"

    if [ -f "$INSTALL_DIR/bin/sh" ]; then
        echo -e "\033[1;32m[✓] ETF-Devb OS is already completely installed.\033[0m"
        exit 0
    fi

    bootstrap_high_performance_dependencies
    execute_multi_socket_download
    verify_cryptographic_signature
    execute_multi_core_extraction
    generate_runtime_shortcuts
    generate_global_shutdown_tool
    
    echo -e "\n\033[1;32m====================================================\033[0m"
    echo -e "\033[1;32m[Success] High-speed deployment concluded successfully!\033[0m"
    echo -e "\033[1;37m▶ Commands available globally: \033[1;33metf-gui\033[1;37m, \033[1;33metf-cli\033[1;37m, \033[1;31mstop_env.sh\033[0m"
    echo -e "\033[1;32m====================================================\033[0m"
}

pipeline_orchestrator
