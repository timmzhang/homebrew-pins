# Pins Homebrew 配方库

本仓库仅用于分发 Pins 的 Homebrew 二进制 formula 配方。运行包与用户文档放在 [pins-releases](https://github.com/timmzhang/pins-releases)。

## 当前状态

**本分支仅供 Step 5 候选验收。** `pins_p-9fh7` 分支提供 `Formula/pins.rb`，指向 [917fdc7 候选包](https://github.com/timmzhang/pins-releases/releases/tag/v0.1.0-candidate.d6fadba)。默认 `main` 分支和正式 `v0.1.0` 安装入口尚未启用。

## 候选安装

仅在用于验收的 Homebrew 环境执行。先用 `type -a pins` 检查已有命令，已有 tap、同名 formula 或程序时先保留现场，不覆盖。

```sh
brew tap timmzhang/pins https://github.com/timmzhang/homebrew-pins.git
git -C "$(brew --repository timmzhang/pins)" switch pins_p-9fh7
brew trust --formula timmzhang/pins/pins
HOMEBREW_NO_AUTO_UPDATE=1 brew install timmzhang/pins/pins
brew test timmzhang/pins/pins
pins --version
pins setup
```

`brew trust` 适用于要求显式信任自建 tap 的 Homebrew 版本；执行前应阅读配方。候选验收期间关闭本次命令的自动更新，避免分支被后续正式配方影响。安装不改写 shell PATH，已有命令仍可能优先命中。

确认 `pins setup` 的目标路径和冲突提示后，显式运行 `pins setup --apply` 安装共享 Skill 及工具链接。Claude hooks 另选 `pins setup --claude-hooks --apply`；现有不同来源配置会保留并拒绝覆盖。Agent 程序和账号登录另行准备。

## 已确定的首发目标

- 版本：`0.1.0`。
- 架构：Apple Silicon（`arm64`）。
- 最低系统目标：macOS 15；已有 15.0/26.6.2 临时实验，正式安装仍待验收。
- tap：`timmzhang/pins`。
- formula：`pins`，配方文件为 `Formula/pins.rb`。

## 发布后的安装入口

以下是正式发布后的目标命令，**现在不能用于安装**：

```sh
brew install timmzhang/pins/pins
```

配方将在运行包通过验证并可公开下载后提供，记录真实版本、下载地址、SHA-256 和命令入口。

## 安装边界

- 本仓库保存配方与说明，不包含 Pins 的私有实现源码。
- 安装前检查已有 `pins` 命令，保留现有程序和个人配置。
- 默认卸载保留用户的 `~/.pins/` 数据；具体行为需经发行验收后提供正式说明。

## 发行约定

采用预编译完整目录包，内置 Python，免费 ad-hoc 签名，不提供 Apple 公证票据。formula 将完整目录放入 `libexec`、声明 `preserve_rpath`，以 `bin.install_symlink` 提供 `pins`。Git 用于仓库/worktree，Agent 按需另装登录；Homebrew 自身安装要求另行满足。

浏览器下载并经 Finder 解压的隔离副本在现有 macOS 15 实验中受阻；不将该路径作为推荐安装方式。正式发布前目标命令保持未启用。PyInstaller 字节码不保证无法逆向；私有源码仓库与直接源码不公开。
