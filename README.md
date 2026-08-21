# Low-RAM Steam Game Launchers 🏴‍☠️
### Engineered by FrankPR07 & Shelly the AI

A collection of lightweight, aggressive optimization batch scripts designed to maximize performance on low-spec systems (such as Intel Celeron processors with 4GB of RAM). 

These scripts completely bypass desktop window bloat by launching Steam silently directly to the system tray, monitoring system memory dynamically, and reclaiming crucial system RAM by shutting down Steam entirely when it is no longer needed.

---

## 🛠️ The Launcher Arsenal

### 1. 💀 The Executioner (`The_Executioner.bat`)
**Best for:** Classic games, older titles, or indie games that do not rely on a persistent Steam connection once active (e.g., *Fallout 1*, *Fallout 2*, *Fallout 3*, *Car Mechanic Simulator 2018*).
* **How it works:** Spawns Steam silently, triggers the game, waits for the game engine to appear in your system processes, allows a built-in safety buffer for input device initialization, and then completely terminates `steam.exe` to free up 100% of background memory while you play.

### 2. 🛡️ The Guardian V.1 (`The_Guardian_V1.bat`)
**Best for:** Modern remasters or titles featuring persistent Steam DRM requirements, cloud saving, or achievement tracking (e.g., *Tomb Raider I-III Remastered*, *Chrono Trigger*).
* **How it works:** Spawns Steam silently to the system tray and holds it active in the background. It continuously loops in the shadows to verify you are still playing. The exact millisecond you close your game, it forces Steam completely closed and shuts down cleanly.

### 3. 🎯 The Guardian V.2 - Unique/Complex Names (`The_Guardian_V2.bat`)
**Best for:** Heavy modern remasters or Unreal Engine titles with complicated capitalization, deep process structures, or long underscore file strings that trip up normal text filtering (e.g., *STAR WARS: Dark Forces Remaster* / `khonsu_Shipping_Steam_x64.exe`).
* **How it works:** Utilizes an optimized substring process filter to track complex process handles flawlessly without getting stuck in infinite matching loops.

---

## 🚀 Setup & Configuration Instructions

Each script contains a user configuration block at the top. Simply update the variables with your specific game details:

```batch
:: CONFIGURATION: Replace these values with your game details
set "GAME_EXE=YOUR_GAME_EXE_HERE.exe"
set "STEAM_ID=YOUR_STEAM_ID_HERE"
```

### How to Find Your Game's True Executable Name
Developers often mask the true engine process name under a friendly display title. To locate the exact filename the script needs to track:
1. Fire up your target game normally.
2. Press `Ctrl + Shift + Esc` to open the **Windows Task Manager**.
3. Head over to the **Details** tab.
4. Locate your active game in the list. The exact text string shown there (e.g., `khonsu_Shipping_Steam_x64.exe`) is what you must paste into the `GAME_EXE` configuration line.

### 💡 Pro-Tip: Cleaner Desktop Shortcuts
To prevent the black command prompt window from popping up over your desktop wallpaper while the background loops are processing:
1. Create a desktop shortcut to your finished `.bat` script.
2. Right-click the shortcut and select **Properties**.
3. Locate the **Run:** dropdown menu (defaulted to *Normal window*).
4. Flip the dropdown option to **Minimized** and click Apply.

---

## 🏆 Community Modding & Troubleshooting Insights

During the development and testing phase, several engine-specific behaviors were resolved. Keep these tips in mind for classic modding environments:

* **The Input Initialization Buffer:** Certain legacy titles (such as *Fallout 1 & 2*) rapidly query Steam upon boot to process hardware mouse/keyboard hookups. The templates feature a specific `timeout /t 10` delay after process detection. If a classic game throws an input error on startup, ensure this buffer is set to 10 seconds to allow the engine to complete its hardware check before Steam is killed.
* **Fallout 2 Restoration Project Updated (RPU) & sfall Graphic Configurations:** When utilizing major graphical overhauls alongside high-resolution community patches, text filters can break. For an optimal experience running RPU, modify your config settings to let the High-Res Patch take control over `fallout2HR.exe` instead of the vanilla binary. In your game directory, set `HiResMode=1` in `f2_res.ini` and set `HiResMode=0` in `ddraw.ini`, then execute `f2_res_config.exe` once and click Enable to unlock comprehensive in-game video scaling control.

---
*Happy gaming! Never let hardware limitations stop the adventure. Yo Ho And a Bucket of Rum We never Stop!*
