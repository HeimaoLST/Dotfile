return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      variant = "auto",      -- 自动跟随系统亮/暗模式
      dark_variant = "moon", -- 深色时用 moon（匹配 Ghostty Rose Pine Moon）
      styles = {
        transparency = false,
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
}
