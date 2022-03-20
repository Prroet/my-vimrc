require('tools')

local vim = vim
local options = { noremap = true }

vim.api.nvim_set_keymap('n', '<F12>', ':lua TerminalToggle.toggle()<CR>', options)
