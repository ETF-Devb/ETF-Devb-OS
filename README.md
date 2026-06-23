<div align="center">

<!-- Animated Header -->
<img src="https://readme-typing-svg.herokuapp.com?font=Fira+Code&weight=800&size=45&pause=1000&color=00C853&center=true&vCenter=true&width=800&height=100&lines=ETF-Devb+OS;Ultimate+Desktop+Experience;Powered+by+Termux+%26+Debian" alt="ETF-Devb OS Animated Header" />

**Advanced Linux Subsystem Environment for Android**

<p align="center">
  <a href="https://github.com/ETF-Devb/ETF-Devb-OS">
    <img src="https://img.shields.io/badge/OS-Debian_12-A81D33?style=for-the-badge&logo=debian&logoColor=white" alt="Debian 12" />
  </a>
  <a href="https://github.com/termux/termux-app">
    <img src="https://img.shields.io/badge/Platform-Android_Termux-00C853?style=for-the-badge&logo=android&logoColor=white" alt="Termux" />
  </a>
  <a href="https://xfce.org/">
    <img src="https://img.shields.io/badge/GUI-XFCE4-466486?style=for-the-badge&logo=xfce4&logoColor=white" alt="XFCE4" />
  </a>
  <a href="https://github.com/ETF-Devb/ETF-Devb-OS/releases/latest">
    <img src="https://img.shields.io/github/v/release/ETF-Devb/ETF-Devb-OS?style=for-the-badge&color=8A2BE2&label=Version&logo=github" alt="Release" />
  </a>
</p>

<img src="images/me.png" width="250" alt="Anas Boualem - ETF-Devb Creator" style="border-radius: 50%; border: 3px solid #00C853; margin-top: 15px;" />

<br><br>

> **"Bridging the gap between Mobile Portability and Desktop Productivity."**  
> ETF-Devb OS provides a fully accelerated, macOS-inspired desktop experience directly on your Android device, utilizing X11, PulseAudio, and VirGL for maximum performance.

</div>

<br>

---

## 📸 ❬ SYSTEM_GALLERY ❭

<table align="center" style="border-collapse: collapse; border: none;">
  <tr>
    <td align="center"><img src="images/1.png" width="400" style="border-radius: 10px;" alt="UI Preview 1" /></td>
    <td align="center"><img src="images/2.png" width="400" style="border-radius: 10px;" alt="UI Preview 2" /></td>
  </tr>
  <tr>
    <td align="center"><img src="images/3.png" width="400" style="border-radius: 10px;" alt="UI Preview 3" /></td>
    <td align="center"><img src="images/4.png" width="400" style="border-radius: 10px;" alt="UI Preview 4" /></td>
  </tr>
  <tr>
    <td align="center"><img src="images/5.png" width="400" style="border-radius: 10px;" alt="UI Preview 5" /></td>
    <td align="center"><img src="images/6.png" width="400" style="border-radius: 10px;" alt="UI Preview 6" /></td>
  </tr>
</table>

---

## 📥 ❬ CORE_RESOURCES ❭

To get started, you must download the core image and the required display server infrastructure.

<div align="center">
  
  <a href="https://github.com/ETF-Devb/ETF-Devb-OS/releases/latest">
    <img src="https://img.shields.io/badge/⬇_DOWNLOAD_OFFICIAL_ASSETS-212121?style=for-the-badge&logo=github&logoColor=00C853&labelColor=111111" alt="Download Official Assets" />
  </a>
  
</div>

> **[ # ] REQUIRED:** Ensure you have installed **Termux** and the **Termux-X11** plugin before proceeding. The core OS image (approx. 2GB) is securely hosted in the official release section.

---

## ⚙️ ❬ INSTALLATION_FLOW ❭

### `STEP 1:` Environment Initialization
Prepare your Termux environment and grant storage permissions.
```bash
pkg update && pkg upgrade -y
termux-setup-storage

```

### `STEP 2:` Automated Deployment

Execute the ETF-Devb automated installer. This script securely fetches the system, verifies cryptographic integrity, extracts the subsystem, and automatically generates your global shortcuts.

```bash
curl -sL [https://raw.githubusercontent.com/ETF-Devb/ETF-Devb-OS/main/etf-os.sh](https://raw.githubusercontent.com/ETF-Devb/ETF-Devb-OS/main/etf-os.sh) -o etf-os.sh
chmod +x etf-os.sh
./etf-os.sh

```

---

## 🚀 ❬ EXECUTION_PROTOCOL ❭

> [!IMPORTANT]
> The automated installer handles all heavy lifting. Post-installation, the system is fully integrated. Use the dynamically generated global commands below to initialize your sessions.

### 🖥️ Option A: CLI Mode (Terminal Only)

For a lightning-fast, pure command-line interface directly within Termux:

```bash
etf-cli

```

### 🌌 Option B: GUI Mode (Full Desktop Experience)

Ignite the full XFCE4 desktop environment, complete with PulseAudio routing and VirGL 3D hardware acceleration:

```bash
etf-gui

```

> ⚠️ **CRITICAL:** Ensure the **Termux-X11 app** is active in the background *before* executing this command.

---

## 🛑 ❬ KILL_SWITCH ❭

**Self-Managing Architecture:**

The environment is engineered for stability. The `etf-gui` session is tightly linked to your display server. Once you safely close the Termux-X11 display app, the built-in Kill Switch automatically hunts down and terminates all background ghost processes (PulseAudio, VirGL, D-Bus), ensuring zero battery drain.
؟
