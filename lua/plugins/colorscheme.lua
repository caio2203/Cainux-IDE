return {
  {
    "loctvl842/monokai-pro.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      require("monokai-pro").setup({
        filter = "pro", -- opções: "pro", "classic", "octagon", "machine", "ristretto", "spectrum"
        transparent_background = false,
      })
      vim.cmd.colorscheme("monokai-pro")
    end,
  },
}
