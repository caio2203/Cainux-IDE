-- :Home
vim.api.nvim_create_user_command("Home", function()
  vim.cmd("enew | Dashboard")
end, { desc = "Voltar ao dashboard" })

-- :Theme
vim.api.nvim_create_user_command("Theme", function(opts)
  local colors = require("core.colors")
  colors.theme = opts.args
  colors.apply()
end, {
  nargs = 1,
  desc = "Trocar o tema do Cainux",
})


