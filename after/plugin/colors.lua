require("github-theme").setup({
  options = {
    transparent = true,
  },
})

require("rose-pine").setup({
  --- @usage "auto"|"main"|'moon'|'dawn'
  variant = "main",
  --- @usage "main"|"moon"|'dawn'
  dark_variant = "main",
  dim_nc_background = false,
  disable_background = true,
  disable_float_background = true,
  disable_italics = true,
})

function ColorMyPencils(color)
  color = color or "github_dark_dimmed"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils("rose-pine")
-- ColorMyPencils()
