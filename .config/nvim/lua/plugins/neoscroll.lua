return {
  {
    "karb94/neoscroll.nvim",
    opts = {
      -- Page scrolling only. Do not animate j/k: repeated tiny animations stutter.
      mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "zt", "zz", "zb" },
      easing = "linear",
      duration_multiplier = 0.3,
      cursor_scrolls_alone = false,
      respect_scrolloff = true,
    },
  },
  {
    "rhysd/accelerated-jk",
    lazy = false,
    init = function()
      -- Start accelerating on the third repeated keypress and cap at 6 lines.
      vim.g.accelerated_jk_acceleration_table = { 2, 4, 6, 8, 10, 12 }
      vim.g.accelerated_jk_acceleration_limit = 250
      vim.g.accelerated_jk_enable_deceleration = 1
    end,
    config = function()
      -- Preserve LazyVim's visual-line movement while replacing its default j/k maps.
      vim.keymap.set("n", "j", "<Plug>(accelerated_jk_gj)", {
        remap = true,
        silent = true,
        desc = "Accelerated down",
      })
      vim.keymap.set("n", "k", "<Plug>(accelerated_jk_gk)", {
        remap = true,
        silent = true,
        desc = "Accelerated up",
      })
    end,
  },
}
