vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move HL line up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move HL line up" })
vim.keymap.set("n", "J", "mzJ`z", { desc = "" })

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })


vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

vim.keymap.set({ "n", "v" }, '<Space>', '<Nop>', { silent = true })

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "" })

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Marks the buffer as executable" })
vim.keymap.set("n", "<F3>", ":Ex<CR>", { noremap = true, silent = true, desc = "Go to Netrw file tree" })


vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        vim.lsp.buf.format()
    end
})
