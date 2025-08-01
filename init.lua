require("core.options")
require("core.plugins")
require("core.keymaps")
require("core.colors")

-- Plugins carregados após Lazy iniciar
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimStarted",
  callback = function()
    require("plugins.lsp")
    require("plugins.cmp")
    require("plugins.treesitter")
    require("plugins.nvimtree")
    require("plugins.telescope")
    require("plugins.whichkey")
  end,
})
