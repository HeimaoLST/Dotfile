# Dotfiles

个人配置文件仓库，使用 **bare git repo** 方式同步，无需额外工具。

## 仓库内容

| 文件 | 说明 |
|------|------|
| `.zshrc` | Zsh 配置（含 Powerlevel10k 提示符） |
| `.p10k.zsh` | Powerlevel10k 主题配置 |
| `.gitconfig` | Git 全局配置 |
| `.tmux.conf` | Tmux 配置（Rose Pine Dawn 浅色主题，`Ctrl+a` 前缀） |
| `.config/alacritty/` | Alacritty 终端配置 |
| `.config/ghostty/` | Ghostty 终端配置 |
| `.config/btop/` | btop 系统监视器配置 |
| `.config/fcitx5/` | Fcitx5 输入法配置 |
| `.config/niri/` | Niri 窗口管理器配置 |

## 新机器首次设置

```bash
# 1. 克隆为 bare 仓库
git clone --bare https://github.com/HeimaoLST/Dotfile.git $HOME/.dotfiles

# 2. 设置临时 alias（稍后会加到 .zshrc）
alias dot='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# 3. 让 bare 仓库忽略自己
echo ".dotfiles" >> $HOME/.gitignore

# 4. 检出配置文件到 $HOME
dot checkout
```

### 如果 `dot checkout` 报冲突

说明 `$HOME` 已有同名文件（如系统自带的 `.zshrc`）。先备份：

```bash
mkdir -p $HOME/.dotfiles-backup
dot checkout 2>&1 | grep -E "^\s+\." | awk '{print $1}' | \
  xargs -I{} mv $HOME/{} $HOME/.dotfiles-backup/{}
dot checkout
```

### 收尾

```bash
# 不追踪 $HOME 下的其他文件
dot config --local status.showUntrackedFiles no
```

**然后把下面这行加到 `.zshrc` 里（已经包含在本仓库的 .zshrc 中）：**

```bash
alias dot='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
```

## 日常使用

在 `$HOME` 的任何位置都能用 `dot` 代替 `git`：

```bash
dot status                      # 查看改动
dot diff                        # 查看具体修改
dot add .tmux.conf              # 暂存
dot commit -m "feat: xxx"       # 提交
dot push                        # 同步到 GitHub
dot pull                        # 从其他机器拉取更新
dot log --oneline -10           # 查看历史
```

### 添加新的配置文件

```bash
dot add .config/newapp/config.toml
dot commit -m "feat: add newapp config"
dot push
```

### 在其他机器同步最新

```bash
dot pull
```

## 依赖说明

本仓库假设目标机器已安装：

- **Zsh** + [Oh My Zsh](https://ohmyz.sh/) + [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- **Tmux** ≥ 3.0（支持真彩色）
- **Ghostty** 或 **Alacritty**（任选其一作为终端）
- 可选：**btop**、**fcitx5**、**niri**

## 主题说明

- **Tmux**：Rose Pine Dawn（粉紫浅色系），状态栏在底部
- **Shell**：Powerlevel10k（配置见 `.p10k.zsh`）

---

> 采用 bare git repo 方案参考自 [this Atlassian tutorial](https://www.atlassian.com/git/tutorials/dotfiles)。
