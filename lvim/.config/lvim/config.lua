-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.plugins = {
  {'rose-pine/neovim', name = 'rose-pine' },
  {'neanias/everforest-nvim'},
  {'rebelot/kanagawa.nvim'},
  {'j-morano/buffer_manager.nvim'},
  {"catppuccin/nvim", name = "catppuccin"},
  {"stevearc/oil.nvim"},
  {"christoomey/vim-tmux-navigator"},
  { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...}
}

lvim.transparent_window = true


require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true, -- disables setting the background color.
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Hanhles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {},
    custom_highlights = {},
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"


-- my vars
lvim.colorscheme = "catppuccin"
vim.opt.relativenumber = true


-- my binds
lvim.builtin.which_key.mappings["b"] = {
  name = "+buffers",
  b = { ':lua require("buffer_manager.ui").toggle_quick_menu()<cr>', 'view active buffers'}
}
lvim.builtin.which_key.mappings["e"] = {
  ":Oil<cr>", "file explorer"
}
lvim.builtin.terminal.open_mapping = "<M-i>"
-- press "jj" in insert mode to enter normal mode
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })
vim.o.shell = '/usr/bin/nu'
-- my opts
---- catppuccin
local catppuccin = require("catppuccin")

catppuccin.setup({
  integrations = {
    ts_rainbow = true,
  },
})
---- buffer manager
require("buffer_manager").setup({ })
-- oil.nvim
require("oil").setup()

