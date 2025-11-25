-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here


local keymap = vim.keymap.set

-- Move lines in visual mode
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

-- Better navigation
keymap("n", "J", "mzJ`z")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- Paste without losing register
keymap("x", "<leader>p", [["_dP]])

-- System clipboard
keymap({ "n", "v" }, "<leader>y", [["+y]])
keymap("n", "<leader>Y", [["+Y]])

-- Delete to void register
keymap({ "n", "v" }, "<leader>d", [["_d]])

-- Disable Q
keymap("n", "Q", "<nop>")

-- Format
keymap("n", "<leader>f", vim.lsp.buf.format)

-- Quickfix navigation
keymap("n", "<C-k>", "<cmd>cnext<CR>zz")
keymap("n", "<C-j>", "<cmd>cprev<CR>zz")
keymap("n", "<leader>k", "<cmd>lnext<CR>zz")
keymap("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Search and replace word under cursor
keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make file executable
keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Source config
keymap("n", "<leader><leader>", "<cmd>so<CR>")

-- Comments (Mac keybindings)
keymap('n', '<D-/>', 'gcc', { remap = true })
keymap('v', '<D-/>', 'gc', { remap = true })
keymap('n', '<A-S-a>', 'gbc', { remap = true })
keymap('v', '<A-S-a>', 'gb', { remap = true })

-- Navigation shortcuts
keymap('n', 'H', '^', { remap = true })
keymap('n', 'L', '$', { remap = true })
