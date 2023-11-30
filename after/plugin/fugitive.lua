vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Open git fugitive" })
vim.keymap.set("n", "<leader>pp", ':Git push<CR>',
  {
    noremap = true,
    silent = true,
    desc = "Push changes to the git repo",
  }
)
