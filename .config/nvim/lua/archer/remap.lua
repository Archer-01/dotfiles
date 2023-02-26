vim.g.mapleader = " "

-- Open netrw
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)

-- Move selected lines while in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Join lines while keeping the cursor at its original position
vim.keymap.set("n", "J", "mzJ`z")

-- Move page up/down with the cursor always in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Move between search results with the cursor always in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste without losing the current copy buffer
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Yank to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+y")
vim.keymap.set("v", "<leader>Y", "\"+y")

-- Delete selection without putting it in the copy buffer
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Quit vim
vim.keymap.set("n", "<leader>q", vim.cmd.q)
vim.keymap.set("n", "<leader>Q", vim.cmd.qa)

-- Lazygit
vim.keymap.set("n", "<leader>lg", vim.cmd.LazyGit)

-- Todo Telescope
vim.keymap.set("n", "<leader>td", vim.cmd.TodoTelescope)

-- Floating terminal
vim.keymap.set("n", "<leader>ft", vim.cmd.FloatermToggle)

-- Auto formatter
vim.keymap.set("n", "<leader>cf", vim.cmd.LspZeroFormat)
