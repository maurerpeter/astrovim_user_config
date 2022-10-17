--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
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
    },

    -- visual mode
    v = {
      ["J"] = { ":m '>+1<CR>gv=gv", desc = "Move selection down by a line" },
      ["K"] = { ":m '<-2<CR>gv=gv", desc = "Move selection up by a line" },
    },

    -- insert mode
    i = {
      ["<C-c>"] = { "<Esc>", desc = "Exit insert mode via Ctrl+c" },
    },
  },
}

return config
