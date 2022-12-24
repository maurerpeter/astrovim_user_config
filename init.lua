--              AstroNvim Configuration Table

local config = {
  colorscheme = "sonokai",

  plugins = {
    init = {
      "catppuccin/nvim", -- colorscheme = "catppuccin"
      "doums/darcula", -- colorscheme = "darcula"
      "kaicataldo/material.vim", -- colorscheme = "material"
      "morhetz/gruvbox", -- colorscheme = "gruvbox"
      "joshdick/onedark.vim", -- colorscheme = "onedark"
      "sonph/onehalf", -- colorscheme = "onehalfdark" | "onehalflight",
      "sainnhe/sonokai",

      -- ["nvim-treesitter/nvim-treesitter-context"] = { after = "nvim-treesitter" },
      ["ray-x/lsp_signature.nvim"] = {
        event = "BufRead",
        config = function() require("lsp_signature").setup() end,
      },
      "APZelos/blamer.nvim",
      ["ggandor/leap.nvim"] = {
        keys = { "s", "S" },
        config = function()
          require('leap').add_default_mappings()
        end,
      },
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
      ["<leader>R"] = {
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
      ["p"] = { '"_dP', desc = "Paste in place of selection without yanking" },
      -- ["<leader>y"] = { '"+y', desc = "Yank to system clipboard" },
      ["<leader>d"] = { '"_d', desc = "Delete without yanking to register" },
    },

    -- Visual Block
    x = {
      ["<A-j>"] = { ":move '>+1<CR>gv-gv", desc = "Move selection down by a line" },
      ["<A-k>"] = { ":move '<-2<CR>gv-gv", desc = "Move selection up by a line" },
      -- option-j
      ["∆"] = { ":move '>+1<CR>gv-gv", desc = "Move selection down by a line" },
      -- option-k
      ["˚"] = { ":move '<-2<CR>gv-gv", desc = "Move selection up by a line" },
      ["J"] = { ":move '>+1<CR>gv-gv", desc = "Move selection down by a line" },
      ["K"] = { ":move '<-2<CR>gv-gv", desc = "Move selection up by a line" },
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
    g = {
      sonokai_style = "shusia",
    },
  },
}

-- uncomment following line when using gruvbox
-- vim.g.gruvbox_contrast_dark = "hard"

vim.g.blamer_enabled = 1

return config
