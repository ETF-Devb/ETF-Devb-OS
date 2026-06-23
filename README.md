يا سلام عليك، هادشي راه كيتسمى **الشغل ديال الشركات الكبار (Enterprise Level)**! ملي كتحط صورتك أنت اللول كصانع للمشروع (Author/Maintainer)، وعاد كتستف اللقطات ديال الواجهة بانتظام، المستخدم كيعرف راسو كيتعامل مع مطور محترف وعارف شنو كيدير.

بناءً على داكشي اللي طلبتي، وعلى الستيل الواعر اللي كنتي خدام بيه ف الريبو القديم ديالك، صاوبت ليك واحد الـ `README.md` **عالمي**. حطيت صورتك `me.png` فالقمة، زدت البادجات اللي كتدل على (Debian, Termux, Android, XFCE4)، ونظمت الكود ديال التثبيت والأوامر الجديدة (`etf-cli` و `etf-gui`) باش يكون داكشي متسلسل ومنطقي.

إليك الكود كامل، غير دير ليه كوبي وحطو ف ملف `README.md` ديالك:

```markdown
<div align="center">
  <img src="me.png" width="180" style="border-radius: 50%; border: 3px solid #00C853; box-shadow: 0 0 15px rgba(0,200,83,0.5);" alt="Anas - ETF-Devb Creator" />
  
  <h1>🌌 ETF-Devb OS</h1>
  
  <p>
    <img src="https://img.shields.io/badge/OS-Debian_12-A81D33?style=for-the-badge&logo=debian&logoColor=white" />
    <img src="https://img.shields.io/badge/Platform-Termux_Android-00C853?style=for-the-badge&logo=android&logoColor=white" />
    <img src="https://img.shields.io/badge/GUI-XFCE4-466486?style=for-the-badge&logo=xfce4&logoColor=white" />
    <img src="https://img.shields.io/badge/Engine-PRoot-blue?style=for-the-badge&logo=linux&logoColor=white" />
  </p>

  <p><b>A highly optimized, fully automated, and lightweight Debian-based PRoot environment engineered for Android mobile workstations.</b></p>
</div>

---

### [ 🖼️ SYSTEM_SHOWCASE ]

<p align="center">
  <img src="1.png" width="410" alt="UI Preview 1" style="margin: 5px;" />
  <img src="2.png" width="410" alt="UI Preview 2" style="margin: 5px;" />
</p>
<p align="center">
  <img src="3.png" width="410" alt="UI Preview 3" style="margin: 5px;" />
  <img src="4.png" width="410" alt="UI Preview 4" style="margin: 5px;" />
</p>
<p align="center">
  <img src="5.png" width="410" alt="UI Preview 5" style="margin: 5px;" />
  <img src="6.png" width="410" alt="UI Preview 6" style="margin: 5px;" />
</p>

---

### [ 📦 CORE_RESOURCES ]

<a href="https://github.com/ETF-Devb/ETF-Devb-OS/releases/latest">
  <img src="https://img.shields.io/github/v/release/ETF-Devb/ETF-Devb-OS?style=for-the-badge&color=8A2BE2&label=DOWNLOAD%20OFFICIAL%20ASSETS%20&%20APKs&logo=github" />
</a>

> [ # ] Access the core OS image (2GB) and the strictly required Android apps (**Termux** & **Termux-X11**) securely hosted in the official release section above.

---

### [ ⚡ AUTOMATED_DEPLOYMENT ]

We have engineered a fully automated, smart installer. It fetches the system, verifies its cryptographic integrity, extracts it to the correct path, and generates global system shortcuts seamlessly.

Execute this single command in your Termux terminal:

```bash
curl -sL [https://raw.githubusercontent.com/ETF-Devb/ETF-Devb-OS/main/etf-os.sh](https://raw.githubusercontent.com/ETF-Devb/ETF-Devb-OS/main/etf-os.sh) -o etf-os.sh && chmod +x etf-os.sh && ./etf-os.sh

```

---

### [ 🚀 EXECUTION_PROTOCOL ]

> [!IMPORTANT]
> The automated installer handles everything. Once the initial setup is complete, you no longer need to run scripts manually. The system creates two global commands for your convenience.

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

### [ 🛑 SYSTEM_TERMINATION ]

The environment is designed to be self-managing. The `etf-gui` session is linked to your display server and will automatically terminate background processes (PulseAudio, VirGL, etc.) once you close the Termux-X11 display safely.

```

---

