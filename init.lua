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
      "sonph/onehalf", -- colorscheme = "onehalfdark" | "onehalflight"
    }
  },

  mappings = {
    -- normal mode
    n = {
      ["<leader>r"] = { ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
        desc = "Replace selection occurrences with sed" },
      ["<C-d>"] = { "<C-d>zz", desc = "Scroll down half a screen and center" },
      ["<C-u>"] = { "<C-u>zz", desc = "Scroll up half a screen and center" },
      ["<leader>y"] = { "\"+y", desc = "Yank to system clipboard" },
      ["<leader>D"] = { "<cmd>Alpha<cr>", desc = "Alpha Dashboard" },
      ["<leader>d"] = { "\"_d", desc = "Delete without yanking to register" },
      ["n"] = { "nzzzv", desc = "Go to next match and center" },
      ["N"] = { "Nzzzv", desc = "Go to previous match and center" },
    },

    -- visual mode
    v = {
      ["J"] = { ":m '>+1<CR>gv=gv", desc = "Move selection down by a line" },
      ["K"] = { ":m '<-2<CR>gv=gv", desc = "Move selection up by a line" },
      ["<leader>y"] = { "\"+y", desc = "Yank to system clipboard" },
      ["<leader>d"] = { "\"_d", desc = "Delete without yanking to register" },
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

return config
