#!/data/data/com.termux/files/usr/bin/bash

GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

REPO_URL="https://github.com/ETF-Devb/ETF-Devb-OS/releases/download/v1.0.0"
TAR_FILE="ETF-Devb_OS.tar.xz"
SHA_FILE="ETF-Devb_OS.tar.xz.sha256"
INSTALL_DIR="$PREFIX/var/lib/proot-distro/installed-rootfs/debian"

clear
echo -e "${CYAN}╭───────────────────────────────────────────────╮${NC}"
echo -e "${CYAN}│${NC} ${GREEN}         🌌 ETF-Devb OS Installer          ${NC} ${CYAN}│${NC}"
echo -e "${CYAN}╰───────────────────────────────────────────────╯${NC}"
echo ""

# التحقق واش النظام مأنستالي ديجا
if [ -d "$INSTALL_DIR" ]; then
    echo -e "${GREEN}[✓] ETF-Devb OS is already installed!${NC}"
    echo -e "${YELLOW}  👉 Type 'etf-cli' to open the Terminal.${NC}"
    echo -e "${YELLOW}  👉 Type 'etf-gui' to start the Desktop Environment.${NC}\n"
    exit 0
fi

echo -e "${YELLOW}[!] ETF-Devb OS not found. Starting installation...${NC}\n"

pkg update -y > /dev/null 2>&1
pkg install wget proot-distro pulseaudio -y > /dev/null 2>&1

mkdir -p "$INSTALL_DIR"
cd $TMPDIR

echo -e "${BLUE}[*] Fetching ETF-Devb OS Image (2GB)...${NC}"
wget -q --show-progress "$REPO_URL/$TAR_FILE"
wget -q "$REPO_URL/$SHA_FILE"
echo ""

echo -e "${BLUE}[*] Verifying Cryptographic Signature...${NC}"
if sha256sum -c "$SHA_FILE" > /dev/null 2>&1; then
    echo -e "${GREEN}[✓] Checksum matches. Image is valid.${NC}\n"
else
    echo -e "${RED}[✗] Fatal Error: Checksum mismatch. Aborting.${NC}"
    rm -f "$TAR_FILE" "$SHA_FILE"
    rm -rf "$INSTALL_DIR"
    exit 1
fi

echo -e "${BLUE}[*] Extracting Subsystem... Please wait.${NC}"
tar -xJf "$TAR_FILE" -C "$INSTALL_DIR" --strip-components=1 2>/dev/null
rm -f "$TAR_FILE" "$SHA_FILE"

echo -e "${BLUE}[*] Creating Global Shortcuts (etf-cli & etf-gui)...${NC}"

# =================================================================
# صناعة أمر التيرمينال (etf-cli)
# =================================================================
cat << 'EOF' > $PREFIX/bin/etf-cli
#!/data/data/com.termux/files/usr/bin/bash
echo -e "\033[0;36m[✓] Entering ETF-Devb OS (CLI Mode)...\033[0m"
proot-distro login debian --shared-tmp
EOF
chmod +x $PREFIX/bin/etf-cli

# =================================================================
# صناعة أمر الواجهة الرسومية والصوت (etf-gui)
# =================================================================
cat << 'EOF' > $PREFIX/bin/etf-gui
#!/data/data/com.termux/files/usr/bin/bash
echo -e "\033[0;36m[*] Initializing X11 & Audio Servers...\033[0m"

pkill -9 termux-x11 2>/dev/null
pkill -9 xfce4-session 2>/dev/null
pkill -9 virgl_test_server_android 2>/dev/null
rm -rf $TMPDIR/.X11-unix/X1 2>/dev/null
rm -f $TMPDIR/.X1-lock 2>/dev/null

termux-x11 :1 -ac &
virgl_test_server_android &
pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1
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
    sleep 10
done
echo -e "\033[1;33m[!] Session Terminated.\033[0m"
EOF
chmod +x $PREFIX/bin/etf-gui

echo -e "${GREEN}╭───────────────────────────────────────────────╮${NC}"
echo -e "${GREEN}│    🎉 Installation Completed Successfully!    │${NC}"
echo -e "${GREEN}╰───────────────────────────────────────────────╯${NC}"
echo -e "${CYAN}To use your new OS, type one of these commands:${NC}"
echo -e "${YELLOW}  👉 etf-cli ${NC}(For pure Terminal mode)"
echo -e "${YELLOW}  👉 etf-gui ${NC}(For full Desktop Environment with Audio)"
echo ""