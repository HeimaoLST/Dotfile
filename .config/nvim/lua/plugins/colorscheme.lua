return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine-moon",
    },
  },
  {
    "f-person/auto-dark-mode.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.o.background = "dark"
        vim.cmd.colorscheme("rose-pine-moon")
      end,
      set_light_mode = function()
        vim.o.background = "light"
        vim.cmd.colorscheme("rose-pine-dawn")
      end,
    },
  },
}
