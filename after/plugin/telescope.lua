local builtin = require("telescope.builtin")

vim.keymap.set("n", '<leader>sf', builtin.find_files, { desc = 'Find files' })
vim.keymap.set("n", '<leader>gf', builtin.git_files, { desc = '[S]earch [G]it files' })
vim.keymap.set("n", '<leader>ds', builtin.lsp_document_symbols, { desc = 'Document symbols' })
vim.keymap.set("n", '<leader>ws', builtin.lsp_dynamic_workspace_symbols, { desc = 'Dynamic workspace symbols' })

vim.keymap.set("n", '<leader>vh', builtin.help_tags, { desc = 'Help tags' })
vim.keymap.set("n", 'gr', builtin.lsp_references, { desc = 'LSP reference' })
vim.keymap.set("n", 'gi', builtin.lsp_implementations, { desc = 'LSP reference' })

vim.keymap.set("n", '<leader>/', function()
  builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = "[/] Fuzzily search in current buffer" })
