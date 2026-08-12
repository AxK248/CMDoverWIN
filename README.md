[Русская версия README](README_RU.md)
# CMDoverWIN (API v1.0)
Reimagining Windows as a lightweight, extensible CLI system. No heavy graphical interfaces or hidden system changes—just a clean, full-screen terminal.

The project is designed as an independent open-source framework. You can use the ready-made core, extend it with your own add-ons, or create unique forks.

---

## 🛠️ How the system architecture is structured
1. **`boot.bat`** — Primary bootloader. Sets up the environment and prepares the console.
2. **`menu.bat`** — Main script help.
3. **`addons.bat`** — Isolated add-on manager with strict API version control.

---

## 🛑 IMPORTANT WINDOW SAFETY RULE
The system **intentionally does not use the `call` command** to launch add-ons. Control is passed directly to third-party code. 
* If an add-on is poorly written, crashes, or executes a blind `exit` without returning control to the system, **the console window will close completely**.
* In this case, you will have to open **Task Manager** and launch the Terminal (cmd). The kernel author has warned you!

---

## Fun-fact
The script was written by an enthusiast who hadn't even received his passport yet, so the code—or batch file—reflects his own understanding of CMD.
*The script will be further developed and updated.*

## 🔌 Instructions for Add-on Authors
For your add-on to work correctly and appear in the general list, it must be located in its own subfolder within the `addons/` directory (for example, `addons/my_utility/`).

The folder must contain two files: `info.txt` and `init.bat`.

### 1. Add-on manifest (`info.txt`)
The configuration file must strictly contain the following lines. **Important:** If your API version does not match the script version (currently `1.0`), the add-on manager will simply ignore your mod and hide it from the menu.

```text
Name: Name of your add-on
Author: Your_nickname
Version: 1.0
Code: unique_activation_code
API: 1.0
```

### 2. Startup script (`init.bat`)
Remember that the system executes `cd /d` directly into your addon's folder before starting. To return to the `addons.bat` menu, you **must manually** specify a relative path moving up two levels (or however deep your batch file containing the exit command is nested):

```batch
@echo off
rem =======================================================
rem Your add-on code goes here.
rem =======================================================
echo Hello, world! The add-on has been successfully launched via code.
pause

echo Return to the system...
..\..\addons.bat
```

---

## ⚙️ Installation recommendation
For maximum convenience, it is recommended to add the project's root folder to the system `PATH` variable. This will allow you to instantly invoke `boot`, `menu`, or `addons` from absolutely any location or folder in Windows.

## 📄 License
This project is distributed under the **MIT** open-source license. You are free to modify the code, develop it further, test support, and release your own versions (PowerShell / reStructured).
