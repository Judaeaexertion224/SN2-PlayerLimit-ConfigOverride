# SN2 Player Limit Config Override
#If this config works for your build, please leave a star and report your game version.
#如果这个配置在你的版本中有效，欢迎点 Star 并反馈游戏版本。
[中文](#中文说明) | [English](#english)

## 中文说明

一个用于《Subnautica 2》的多人会话人数上限配置覆盖包。

本项目只提供 Unreal Engine 用户配置覆盖文件，用于尝试让游戏在创建多人会话时读取更高的玩家人数参数。它不会修改游戏可执行文件，不会注入 DLL，也不会绕过 EOS、Steam 或官方在线服务校验。

### 功能

- 尝试覆盖多人会话人数相关配置
- 默认把人数上限参数设置为 `8`
- 自动备份已有的 `Game.ini`
- 提供一键安装和卸载脚本
- 不修改游戏本体文件

### 文件结构

```text
SN2_PlayerLimit_ConfigMod/
├─ Config/
│  └─ Game.ini
├─ install.ps1
├─ uninstall.ps1
└─ README_zh.md
```

核心配置位于：

```text
SN2_PlayerLimit_ConfigMod/Config/Game.ini
```

默认内容：

```ini
[/Script/UWESonar.UWEOnlineSessionSubsystem]
MaxSessionPlayerCount=8
MaxPlayerCount=8
NumPublicConnections=8

[/Script/UWESonar.UWEHostSessionRequest]
MaxSessionPlayerCount=8
MaxPlayerCount=8
NumPublicConnections=8

[/Script/UWELobby.UWELobbyGameMode]
MaxSessionPlayerCount=8
MaxPlayerCount=8
NumPublicConnections=8
```

### 使用方法

#### 1. 下载项目

下载或克隆本项目到任意位置，例如游戏目录旁边。

#### 2. 可选：修改人数

打开：

```text
SN2_PlayerLimit_ConfigMod/Config/Game.ini
```

把里面的 `8` 改成你想测试的人数，例如：

```ini
MaxSessionPlayerCount=10
MaxPlayerCount=10
NumPublicConnections=10
```

建议先从较小数值测试，例如 `6` 或 `8`。

#### 3. 安装配置覆盖

在 PowerShell 中进入项目目录：

```powershell
cd "你的路径\SN2_PlayerLimit_ConfigMod"
```

运行安装脚本：

```powershell
.\install.ps1
```

脚本会把配置复制到：

```text
%LOCALAPPDATA%\Subnautica2\Saved\Config\Windows\Game.ini
```

如果目标位置已经存在 `Game.ini`，脚本会先创建备份文件，例如：

```text
Game.ini.backup-20260515-153000
```

#### 4. 启动游戏测试

启动《Subnautica 2》，创建新的多人会话，然后测试是否可以邀请超过默认人数的玩家。

### 卸载

在 PowerShell 中进入项目目录，然后运行：

```powershell
.\uninstall.ps1
```

脚本会删除：

```text
%LOCALAPPDATA%\Subnautica2\Saved\Config\Windows\Game.ini
```

如果你安装前已有自己的 `Game.ini`，可以在同一目录中找到安装脚本生成的备份文件，并手动恢复。

### 常见问题

#### 为什么安装后没有效果？

这很正常。该项目只是配置覆盖尝试，不保证一定生效。

如果游戏忽略这些配置，说明人数上限很可能在以下位置之一被强制控制：

- 打包后的 Unreal Engine 蓝图或数据资产
- `Subnautica2-Win64-Shipping.exe` 中的运行时代码
- EOS、Steam 或官方在线服务的会话校验

在这些情况下，单纯修改 `Game.ini` 无法突破限制。

#### 这个项目会修改游戏本体吗？

不会。安装脚本只写入用户配置目录：

```text
%LOCALAPPDATA%\Subnautica2\Saved\Config\Windows\Game.ini
```

不会修改游戏目录里的 `.exe`、`.dll`、`.pak`、`.ucas` 或 `.utoc` 文件。

#### 可以设置成 16、32 或更高吗？

可以编辑 `Config/Game.ini` 后自行测试，但不建议一开始设置过高。即使配置被读取，游戏逻辑、网络同步、性能、存档和在线服务也可能无法承受更高人数。

### 兼容性

当前配置基于 Windows 版《Subnautica 2》的常见 Unreal Engine 配置路径：

```text
%LOCALAPPDATA%\Subnautica2\Saved\Config\Windows
```

不同版本、平台或更新后的游戏构建可能不再读取这些配置项。

### 免责声明

本项目仅用于配置覆盖测试和学习研究。

使用前请自行备份存档和配置文件。作者不保证该配置一定生效，也不对游戏崩溃、联机异常、存档损坏、账号风险或违反游戏/平台服务条款造成的后果负责。

请遵守游戏官方规则、平台协议和当地法律法规。

## English

A player-limit configuration override package for multiplayer sessions in Subnautica 2.

This project only provides Unreal Engine user configuration overrides. It attempts to make the game read higher player-count values when creating a multiplayer session. It does not modify the game executable, inject DLLs, or bypass EOS, Steam, or official online-service validation.

### Features

- Attempts to override multiplayer session player-count settings
- Sets the default player-count values to `8`
- Automatically backs up an existing `Game.ini`
- Provides simple install and uninstall scripts
- Does not modify the original game files

### File Structure

```text
SN2_PlayerLimit_ConfigMod/
├─ Config/
│  └─ Game.ini
├─ install.ps1
├─ uninstall.ps1
└─ README_zh.md
```

Main configuration file:

```text
SN2_PlayerLimit_ConfigMod/Config/Game.ini
```

Default contents:

```ini
[/Script/UWESonar.UWEOnlineSessionSubsystem]
MaxSessionPlayerCount=8
MaxPlayerCount=8
NumPublicConnections=8

[/Script/UWESonar.UWEHostSessionRequest]
MaxSessionPlayerCount=8
MaxPlayerCount=8
NumPublicConnections=8

[/Script/UWELobby.UWELobbyGameMode]
MaxSessionPlayerCount=8
MaxPlayerCount=8
NumPublicConnections=8
```

### Usage

#### 1. Download the Project

Download or clone this project to any location, such as next to your game folder.

#### 2. Optional: Change the Player Count

Open:

```text
SN2_PlayerLimit_ConfigMod/Config/Game.ini
```

Change every `8` to the value you want to test, for example:

```ini
MaxSessionPlayerCount=10
MaxPlayerCount=10
NumPublicConnections=10
```

It is recommended to start with a smaller value such as `6` or `8`.

#### 3. Install the Config Override

Open PowerShell and enter the project folder:

```powershell
cd "YourPath\SN2_PlayerLimit_ConfigMod"
```

Run the install script:

```powershell
.\install.ps1
```

The script copies the config to:

```text
%LOCALAPPDATA%\Subnautica2\Saved\Config\Windows\Game.ini
```

If a `Game.ini` already exists there, the script creates a backup first, for example:

```text
Game.ini.backup-20260515-153000
```

#### 4. Launch and Test

Launch Subnautica 2, create a new multiplayer session, and test whether the game allows more players than the default limit.

### Uninstall

Open PowerShell in the project folder and run:

```powershell
.\uninstall.ps1
```

The script removes:

```text
%LOCALAPPDATA%\Subnautica2\Saved\Config\Windows\Game.ini
```

If you had your own `Game.ini` before installing, restore the backup created by the installer from the same folder.

### FAQ

#### Why does it not work after installation?

That can happen. This project is only a configuration override attempt and is not guaranteed to work.

If the game ignores these settings, the player limit is likely enforced by one of the following:

- Packaged Unreal Engine blueprints or data assets
- Runtime code inside `Subnautica2-Win64-Shipping.exe`
- EOS, Steam, or official online-service session validation

In those cases, changing `Game.ini` alone cannot bypass the limit.

#### Does this project modify the original game files?

No. The install script only writes to the user configuration path:

```text
%LOCALAPPDATA%\Subnautica2\Saved\Config\Windows\Game.ini
```

It does not modify `.exe`, `.dll`, `.pak`, `.ucas`, or `.utoc` files in the game directory.

#### Can I set the limit to 16, 32, or higher?

You can edit `Config/Game.ini` and test higher values, but very high values are not recommended. Even if the config is read, gameplay logic, network synchronization, performance, saves, and online services may not support higher player counts.

### Compatibility

This configuration is based on the common Unreal Engine user config path used by the Windows version of Subnautica 2:

```text
%LOCALAPPDATA%\Subnautica2\Saved\Config\Windows
```

Different versions, platforms, or future game updates may stop reading these settings.

### Disclaimer

This project is provided only for configuration override testing and educational research.

Back up your saves and configuration files before use. The author does not guarantee that this config will work and is not responsible for crashes, multiplayer issues, save corruption, account risks, or consequences related to violating game or platform terms of service.

Please follow the official game rules, platform agreements, and applicable laws.

