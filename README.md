# Pins Homebrew 配方库

本仓库仅用于分发 Pins 的 Homebrew Cask 配方。运行包与用户文档放在 [pins-releases](https://github.com/timmzhang/pins-releases)。

## 当前状态

**首发准备中，当前尚不可安装。** 本仓库尚未提供 `Casks/pins.rb`，也没有可供配方下载的正式安装包。

## 已确定的首发目标

- 版本：`0.1.0`。
- 架构：Apple Silicon（`arm64`）。
- 最低系统目标：macOS 15，兼容性仍待构建和测试验证。
- tap：`timmzhang/pins`。
- Cask：`pins`，配方文件为 `Casks/pins.rb`。

## 发布后的安装入口

以下是正式发布后的目标命令，**现在不能用于安装**：

```sh
brew install --cask timmzhang/pins/pins
```

配方将在运行包通过验证并可公开下载后提供，记录真实版本、下载地址、SHA-256 和命令入口。

## 安装边界

- 本仓库保存配方与说明，不包含 Pins 的私有实现源码。
- 安装前检查已有 `pins` 命令，保留现有程序和个人配置。
- 默认卸载保留用户的 `~/.pins/` 数据；具体行为需经发行验收后提供正式说明。
