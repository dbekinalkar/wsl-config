-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.plugins = {
  { "christoomey/vim-tmux-navigator" },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",

  },
  {
    "wfxr/minimap.vim",
    build = "cargo install --locked code-minimap",
    lazy = false,
    cmd = { "Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight" },
    init = function()
      vim.cmd("let g:minimap_width = 12")
      vim.cmd("let g:minimap_auto_start = 1")
      vim.cmd("let g:minimap_auto_start_win_enter = 1")
      vim.cmd("Minimap")
    end,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    lazy = false,
    config = function()
      require("refactoring").setup()
    end,
  },
}

lvim.builtin.telescope.cmd = "Telescope"

lvim.builtin.which_key.mappings["f"] = {
  name = "Find Telescope",
  f = { "<cmd>Telescope find_files<cr>", "Telescope find files" },
  g = { "<cmd>Telescope live_grep<cr>", "Telescope live grep" },
  b = { "<cmd>Telescope buffers<cr>", "Telescope buffers" },
  h = { "<cmd>Telescope help_tags<cr>", "Telescope help tags" },
}

lvim.builtin.which_key.mappings["t"] = {
  name = "Trouble",
  t = { "<cmd>Trouble diagnostics toggle<cr>", "trouble" },
  b = { "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", "buffer" },
  q = { "<cmd>Trouble qflist toggle<cr>", "quickfix" },
  l = { "<cmd>Trouble loclist toggle<cr>", "loclist" },
  r = { "<cmd>Trouble lsp_references<cr>", "references" },
}

lvim.builtin.which_key.mappings["r"] = {
  name = "Refactor",
  e = { "<cmd>Refactor extract<cr>", "Extract" },
  f = { "<cmd>Refactor extract_to_file<cr>", "Extract to file" },
  v = { "<cmd>Refactor extract_var<cr>", "Extract var" },
  i = { "<cmd>Refactor inline_var<cr>", "Inline var" },
  I = { "<cmd>Refactor inline_func<cr>", "Inline func" },
  b = { "<cmd>Refactor extract_block<cr>", "Extract block" },
  B = { "<cmd>Refactor extract_block_to_file<cr>", "Extract block to file" },
}

lvim.format_on_save.enabled = true

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    name = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespace
    -- options such as `--line-width 80` become either `{"--line-width", "80"}` or `{"--line-width=80"}`
    args = { "--print-width", "80" },
    ---@usage only start in these filetypes, by default it will attach to all filetypes it supports
    filetypes = { "typescript", "typescriptreact" },
  },
}
lvim.kormat_on_save.enabled = false
