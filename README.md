# ETF-Devb OS

<p align="center">
  <img src="https://img.shields.io/badge/OS-Debian_12-A81D33?style=for-the-badge&logo=debian&logoColor=white" />
  <img src="https://img.shields.io/badge/Platform-Android_Termux-00C853?style=for-the-badge&logo=android&logoColor=white" />
  <img src="https://img.shields.io/badge/GUI-XFCE4-466486?style=for-the-badge&logo=xfce4&logoColor=white" />
</p>

<p align="center">
  <img src="me.png" width="300" alt="ETF-Devb Creator" />
</p>

<p align="center">
  <img src="1.png" width="400" alt="UI Preview 1" />
  <img src="2.png" width="400" alt="UI Preview 2" />
  <img src="3.png" width="400" alt="UI Preview 3" />
  <img src="4.png" width="400" alt="UI Preview 4" />
  <img src="5.png" width="400" alt="UI Preview 5" />
  <img src="6.png" width="400" alt="UI Preview 6" />
</p>

---

### [ >_ CORE_RESOURCES ]
<a href="https://github.com/ETF-Devb/ETF-Devb-OS/releases/latest">
  <img src="https://img.shields.io/github/v/release/ETF-Devb/ETF-Devb-OS?style=for-the-badge&color=8A2BE2&label=DOWNLOAD%20OFFICIAL%20ASSETS&logo=github" />
</a>

> [ # ] Access the core OS image (2GB) and the strictly required Android apps (**Termux** & **Termux-X11**) securely hosted in the official release section above.

---

### [ >_ INSTALLATION_FLOW ]

#### 1. Environment Setup
Initialize the Termux environment and ensure permissions are set.
```bash
pkg update && pkg upgrade -y
termux-setup-storage

```

#### 2. System Deployment

Execute the automated installer. This script will fetch the system, verify its integrity, extract it to the environment, and generate global system shortcuts automatically.

```bash
curl -sL [https://raw.githubusercontent.com/ETF-Devb/ETF-Devb-OS/main/etf-os.sh](https://raw.githubusercontent.com/ETF-Devb/ETF-Devb-OS/main/etf-os.sh) -o etf-os.sh && chmod +x etf-os.sh && ./etf-os.sh

```

---

### [ !_ EXECUTION_PROTOCOL ]

> [!IMPORTANT]
> The automated installer handles everything. Once the setup is complete, you no longer need to run manual scripts. The system generates global commands for your convenience.

#### Option A: CLI Mode (Terminal Only)

If you only need a fast, pure command-line interface:

```bash
etf-cli

```

#### Option B: GUI Mode (Full Desktop Experience)

If you want the full XFCE4 desktop environment with Audio and VirGL hardware acceleration:

```bash
etf-gui

```

*(⚠️ Ensure the **Termux-X11 app** is opened in the background before running this command).*

---

### [ X_ KILL_SWITCH ]

The environment is designed to be self-managing. The `etf-gui` session is linked to your display server and will automatically terminate background processes (PulseAudio, VirGL, etc.) once you close the Termux-X11 display safely.

---
