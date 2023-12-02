local lsp = require("lsp-zero")

lsp.preset("recommended")
lsp.ensure_installed({
  "tsserver",
  "eslint",
  "gopls",
  "pyright",
  "pylsp",
  "html",
  "cssls",
  "volar", -- or "vuels" for Vue 2
})

require("mason").setup({
  ensure_installed = {
    "gofumpt",
    "goimports",
    "black",
    "pyright",
    "bashls",
    "cssls",
    "cssmodules_ls",
    "docker_compose_language_service",
    "dockerls",
    "eslint",
    "html",
    "htmx",
    "jsonls",
    "nginx-language-server",
    "tailwindcss",
    "tsserver",
    "yamlls",
  },
  auto_install = true,
})

-- Fix Undefined global "vim"
lsp.nvim_workspace()

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
  ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
  ["<C-y>"] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = "E",
    warn = "W",
    hint = "H",
    info = "I"
  }
})

lsp.on_attach(function(client, bufnr)
  local function set_keymap(mode, key, action, desc)
    vim.keymap.set(mode, key, action, { desc = desc, buffer = bufnr, remap = false })
  end

  set_keymap("n", "K", vim.lsp.buf.hover, "Show info")
  set_keymap("n", "<leader>F", vim.lsp.buf.format, "Format buffer")
  set_keymap("n", "<leader>q", vim.diagnostic.setloclist, "Open diagnostic panel")
  set_keymap("n", "<leader>vca", vim.lsp.buf.code_action, "Run code actions")
  set_keymap("n", "<leader>vrn", vim.lsp.buf.rename, "Rename symbol")
  set_keymap("i", "<C-h>", vim.lsp.buf.signature_help, "Show help")
end)
lsp.setup()

vim.diagnostic.config({
  virtual_text = true
})

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

-- configure gopls for Go
lspconfig.gopls.setup({
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
})

-- configure the pyright python lsp
lspconfig.pyright.setup({
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
      },
      formatting = {
        provider = "black",
      },
    },
  },
})
lspconfig.pylsp.setup({
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = { enabled = false },
        flake8 = { enabled = false },
        autopep8 = { enabled = false },
        yapf = { enabled = false },
        black = { enabled = true },
      },
    },
  },
})
