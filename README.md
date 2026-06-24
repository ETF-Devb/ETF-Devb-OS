<div align="center">

<!-- Animated Header -->
<img src="https://readme-typing-svg.herokuapp.com?font=Fira+Code&weight=800&size=40&pause=1000&color=00C853&center=true&vCenter=true&width=800&height=100&lines=ETF-Devb+OS;The+Ultimate+Desktop+Experience;Powered+by+Termux+%26+Debian" alt="ETF-Devb OS Animated Header" />

**Advanced macOS-Inspired Linux Subsystem Environment for Android**

<p align="center">
  <img src="https://img.shields.io/badge/OS-Debian_12-A81D33?style=for-the-badge&logo=debian&logoColor=white" alt="Debian 12" />
  <img src="https://img.shields.io/badge/Platform-Android_Termux-00C853?style=for-the-badge&logo=android&logoColor=white" alt="Termux" />
  <img src="https://img.shields.io/badge/GUI-XFCE4-466486?style=for-the-badge&logo=xfce4&logoColor=white" alt="XFCE4" />
  <img src="https://img.shields.io/badge/License-MIT-F2C53D?style=for-the-badge&logo=opensourceinitiative&logoColor=black" alt="License" />
</p>

<p align="center">
  <img src="images/me.png" width="300" alt="ETF-Devb Creator" />
</p>

<br>

> **"Bridging the gap between Mobile Portability and Desktop Productivity."**  
> ETF-Devb OS provides a fully accelerated, aesthetically perfected desktop experience directly on your Android device, utilizing X11, PulseAudio, and VirGL for maximum performance.

<br>

<!-- Professional Download Button -->
<a href="https://github.com/ETF-Devb/ETF-Devb-OS/releases/latest">
  <img src="https://img.shields.io/badge/📥_DOWNLOAD_OFFICIAL_RELEASE-v1.0.0-8A2BE2?style=for-the-badge&logo=github&logoColor=white&scale=1.2" alt="Download Release" />
</a>

</div>

---

<h2 id="table-of-contents">📑 ❬ TABLE_OF_CONTENTS ❭</h2>

1. <a href="#key-features">🌟 Key Features</a>
2. <a href="#system-requirements">⚙️ System Requirements</a>
3. <a href="#architecture-overview">🏗️ Architecture Overview</a>
4. <a href="#system-gallery">📸 System Gallery</a>
5. <a href="#installation-guide">📥 Installation Guide</a>
6. <a href="#execution-protocol">🚀 Execution Protocol</a>
7. <a href="#uninstallation">🗑️ Uninstallation</a>

---

<h2 id="key-features">🌟 ❬ KEY_FEATURES ❭</h2>

*   **🍏 macOS-Inspired UI/UX:** A heavily customized XFCE4 desktop environment featuring a dock, top panel, and polished icon themes for a premium look and feel.
*   **🚀 Hardware Acceleration:** Native integration with `VirGL` (virpipe) to utilize your Android device's GPU for smooth 3D rendering and window transitions.
*   **🎵 Seamless Audio:** Built-in `PulseAudio` server bridging the Linux environment with Android's audio system with zero noticeable latency.
*   **📦 Out-of-the-Box Ready:** Pre-configured with essential desktop applications, file managers, and network tools (No post-install bloated setup required).
*   **⚡ Automated Deployment:** A robust single-script installer with cryptographic checksum verification (SHA256).

---

<h2 id="system-requirements">⚙️ ❬ SYSTEM_REQUIREMENTS ❭</h2>

Because ETF-Devb OS is a fully-fledged desktop environment, please ensure your device meets the following specifications:

| Requirement | Minimum | Recommended |
| :--- | :--- | :--- |
| **Android Version** | Android 10 | Android 12+ |
| **RAM** | 4 GB | 6 GB or higher |
| **Storage Space** | 8 GB Free Space | 12 GB Free Space (SSD/UFS storage) |
| **Required Apps** | Termux & Termux-X11 | Termux & Termux-X11 (Latest builds) |

> ⚠️ *Note: The compressed image is ~2GB, but expands to ~6-8GB upon extraction.*

---

<h2 id="architecture-overview">🏗️ ❬ ARCHITECTURE_OVERVIEW ❭</h2>

Curious how it works under the hood? Here is the flow of ETF-Devb OS:

```mermaid
graph TD
    A[Android Hardware / OS] -->|Storage & CPU| B(Termux Environment)
    B -->|proot-distro| C{ETF-Devb OS <br> Debian 12 Core}
    C -->|DISPLAY=:1| D[Termux-X11 Server]
    C -->|GALLIUM_DRIVER=virpipe| E[VirGL 3D Server]
    C -->|TCP 127.0.0.1| F[PulseAudio Server]
    D & E & F --> G((XFCE4 macOS-like UI))
    
    style C fill:#A81D33,stroke:#fff,stroke-width:2px,color:#fff
    style G fill:#466486,stroke:#fff,stroke-width:2px,color:#fff

```

---

---

### `STEP 1:` Environment Setup

Launch Termux, update packages, and grant necessary storage permissions:

```bash
pkg update && pkg upgrade -y
termux-setup-storage

```

### `STEP 2:` Execute Deployment Script

Run the automated installer. This will download the image, verify its SHA256 integrity, extract the filesystem, and configure the global commands.

```bash
curl -sL [https://raw.githubusercontent.com/ETF-Devb/ETF-Devb-OS/main/etf-os.sh](https://raw.githubusercontent.com/ETF-Devb/ETF-Devb-OS/main/etf-os.sh) -o etf-os.sh && chmod +x etf-os.sh && ./etf-os.sh

```

---

The installer automatically generates global shortcuts for seamless access.

### 🌌 Full Desktop Experience (GUI Mode)

To launch the full XFCE4 macOS-like desktop with hardware acceleration and audio:

```bash
etf-gui

```

> ⚠️ **CRITICAL:** You must open the **Termux-X11** app in the background *before* executing this command.

### 🖥️ Pure Terminal (CLI Mode)

If you only need quick access to the Debian subsystem via terminal:

```bash
etf-cli

```

---

Need to free up space? You can safely remove the entire OS and its shortcuts by running:

```bash
rm -rf $PREFIX/var/lib/proot-distro/installed-rootfs/debian
rm -f $PREFIX/bin/etf-cli $PREFIX/bin/etf-gui

```
