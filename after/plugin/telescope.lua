local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Find files' })
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = '[S]earch [G]it files' })
vim.keymap.set('n', '<leader>gh', builtin.help_tags, { desc = 'Help tags' })
vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = 'LSP reference' })
vim.keymap.set('n', 'gs', builtin.lsp_workspace_symbols, { desc = 'LSP Workspace symbols' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })
