local o = vim.opt
local g = vim.g
local m = vim.keymap
local a = vim.api

-- General
o.laststatus = 3
o.clipboard = "unnamedplus"
o.termguicolors = true
o.fillchars:append({ eob = " " })
o.shortmess:append("aIF") o.cursorline = true
o.cursorlineopt = "number"
o.ruler = true
o.number = true
o.relativenumber = true
o.breakindent = true
o.linebreak = true
o.swapfile = false
o.undofile = true
o.cmdheight = 0
o.winborder = "rounded"

-- Completion and behavior
o.completeopt = { "menuone", "noselect", "noinsert" }
o.wildmenu = true
o.pumheight = 10
o.ignorecase = true
o.smartcase = true
o.timeout = false
o.updatetime = 400
o.confirm = false
o.equalalways = false
o.splitbelow = true
o.splitright = true
o.scrolloff = 2

-- Indenting
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.expandtab = true
o.softtabstop = 2
o.sidescrolloff = 2

-- UI
g.border_style = "rounded"
g.winblend = 0
g.mapleader = " "

-- Disable providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- Status Line
a.nvim_set_hl(0, "StatusLine", { bg = "NONE" })

-- Keymaps
m.set("n", "<C-c>", "<cmd>nohlsearch<CR>")

m.set("n", "<A-k>", ":resize +2<CR>")
m.set("n", "<A-j>", ":resize -2<CR>")
m.set("n", "<A-h>", ":vertical resize +2<CR>")
m.set("n", "<A-l>", ":vertical resize -2<CR>")

m.set("i", "<C-h>", "<Left>")
m.set("i", "<C-j>", "<Down>")
m.set("i", "<C-k>", "<Up>")
m.set("i", "<C-l>", "<Right>")
