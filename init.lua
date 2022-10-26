--              AstroNvim Configuration Table

local config = {
  colorscheme = "onedark",

  plugins = {
    init = {
      "catppuccin/nvim", -- colorscheme = "catppuccin"
      "doums/darcula", -- colorscheme = "darcula"
      "kaicataldo/material.vim", -- colorscheme = "material"
      "morhetz/gruvbox", -- colorscheme = "gruvbox"
      "joshdick/onedark.vim", -- colorscheme = "onedark"
      "sonph/onehalf", -- colorscheme = "onehalfdark" | "onehalflight",
    },

    ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
      local null_ls = require "null-ls"

      -- Check supported formatters and linters
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      config.sources = {
        -- Set a formatter
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.formatting.eslint_d,
        null_ls.builtins.formatting.stylua,
      }
      return config
    end,
    -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
    ["mason-null-ls"] = { -- overrides `require("mason-null-ls").setup(...)`
      ensure_installed = { "eslint_d", "stylua" },
    },
  },

  mappings = {
    -- normal mode
    n = {
      ["<leader>r"] = {
        ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
        desc = "Replace selection occurrences with sed",
      },
      ["<C-d>"] = { "<C-d>zz", desc = "Scroll down half a screen and center" },
      ["<C-u>"] = { "<C-u>zz", desc = "Scroll up half a screen and center" },
      ["<leader>y"] = { '"+y', desc = "Yank to system clipboard" },
      ["<leader>D"] = { "<cmd>Alpha<cr>", desc = "Alpha Dashboard" },
      ["<leader>d"] = { '"_d', desc = "Delete without yanking to register" },
      ["n"] = { "nzzzv", desc = "Go to next match and center" },
      ["N"] = { "Nzzzv", desc = "Go to previous match and center" },
      -- unfortunately haven't found a good solution to map SHIFT<CR> to O<Esc>
      -- Probably something like <A-CR> to O<Esc> would work. Need to figure out how to map Option to Alt
      ["<CR>"] = { "o<Esc>", desc = "Add new line and exit Insert mode" },
    },

    -- visual mode
    v = {
      -- need to debug the following two - issues with multi-line selections
      ["J"] = { ":m '>+1<CR>gv=gv", desc = "Move selection down by a line" },
      ["K"] = { ":m '<-2<CR>gv=gv", desc = "Move selection up by a line" },
      ["<leader>y"] = { '"+y', desc = "Yank to system clipboard" },
      ["<leader>d"] = { '"_d', desc = "Delete without yanking to register" },
    },

    -- insert mode
    i = {
      ["<C-c>"] = { "<Esc>", desc = "Exit insert mode via Ctrl+c" },
    },
  },

  options = {
    opt = {
      spell = true, -- sets vim.opt.spell
    },
  },
}

-- uncomment following line when using gruvbox
-- vim.g.gruvbox_contrast_dark = "hard"

return config
