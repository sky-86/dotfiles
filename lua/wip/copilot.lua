local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap


vim.g.copilot_assume_mapped = true
-- (mode, keys, command, options)
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<Right>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- rebind copliot keys to the arrows
keymap('i', '<Up>', '<Plug>(copilot-next)', opts)
keymap('i', '<Down>', '<Plug>(copilot-previous)', opts)
