# SN2 Player Limit Config Override

[中文](#中文说明) | [English](#english)

## 中文说明

一个用于《Subnautica 2》的多人会话人数上限配置覆盖包。

本项目只提供 Unreal Engine 用户配置覆盖文件，用于尝试让游戏在创建多人会话时读取更高的玩家人数参数。它不会修改游戏可执行文件，不会注入 DLL，也不会绕过 EOS、Steam 或官方在线服务校验。

## 使用方法

### 1. 可选：修改人数

打开：

```text
Config/Game.ini
```

把里面的 `8` 改成你想测试的人数，例如：

```ini
MaxSessionPlayerCount=10
MaxPlayerCount=10
NumPublicConnections=10
```

建议先从较小数值测试，例如 `6` 或 `8`。

### 2. 安装配置覆盖

在 PowerShell 中进入本目录，然后运行：

```powershell
.\install.ps1
```

脚本会把配置复制到：

```text
%LOCALAPPDATA%\Subnautica2\Saved\Config\Windows\Game.ini
```

如果目标位置已经存在 `Game.ini`，脚本会先创建备份。

### 3. 启动游戏测试

启动《Subnautica 2》，创建新的多人会话，然后测试是否可以邀请超过默认人数的玩家。

## 卸载

```powershell
.\uninstall.ps1
```

脚本会删除用户配置目录中的覆盖文件。如果安装前已有自己的 `Game.ini`，可以手动恢复安装脚本生成的备份。

## 重要说明

如果测试后人数没有变化，说明这个上限大概率是在以下位置之一强制决定：

- 打包后的 Unreal Engine 蓝图或数据资产
- `Subnautica2-Win64-Shipping.exe` 中的运行时代码
- EOS、Steam 或官方在线服务的会话校验

这种情况下，单纯配置覆盖无法突破限制。

## 免责声明

本项目仅用于配置覆盖测试和学习研究。

使用前请自行备份存档和配置文件。作者不保证该配置一定生效，也不对游戏崩溃、联机异常、存档损坏、账号风险或违反游戏/平台服务条款造成的后果负责。

请遵守游戏官方规则、平台协议和当地法律法规。

## English

A player-limit configuration override package for multiplayer sessions in Subnautica 2.

This project only provides Unreal Engine user configuration overrides. It attempts to make the game read higher player-count values when creating a multiplayer session. It does not modify the game executable, inject DLLs, or bypass EOS, Steam, or official online-service validation.

## Usage

### 1. Optional: Change the Player Count

Open:

```text
Config/Game.ini
```

Change every `8` to the value you want to test, for example:

```ini
MaxSessionPlayerCount=10
MaxPlayerCount=10
NumPublicConnections=10
```

It is recommended to start with a smaller value such as `6` or `8`.

### 2. Install the Config Override

Open PowerShell in this folder and run:

```powershell
.\install.ps1
```

The script copies the config to:

```text
%LOCALAPPDATA%\Subnautica2\Saved\Config\Windows\Game.ini
```

If a `Game.ini` already exists there, the script creates a backup first.

### 3. Launch and Test

Launch Subnautica 2, create a new multiplayer session, and test whether the game allows more players than the default limit.

## Uninstall

```powershell
.\uninstall.ps1
```

The script removes the override file from the user config folder. If you had your own `Game.ini` before installing, restore the backup created by the installer.

## Important Notes

If the player count does not change after testing, the limit is likely enforced by one of the following:

- Packaged Unreal Engine blueprints or data assets
- Runtime code inside `Subnautica2-Win64-Shipping.exe`
- EOS, Steam, or official online-service session validation

In those cases, changing `Game.ini` alone cannot bypass the limit.

## Disclaimer

This project is provided only for configuration override testing and educational research.

Back up your saves and configuration files before use. The author does not guarantee that this config will work and is not responsible for crashes, multiplayer issues, save corruption, account risks, or consequences related to violating game or platform terms of service.

Please follow the official game rules, platform agreements, and applicable laws.

