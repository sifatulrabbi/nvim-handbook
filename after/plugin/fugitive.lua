vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>pp", ':Git push<CR>',
  {
    noremap = true,
    silent = true,
    desc = "push current changes to the git repo",
  }
)
