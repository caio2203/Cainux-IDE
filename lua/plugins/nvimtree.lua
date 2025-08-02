vim.api.nvim_create_autocmd("VimEnter", {
  callback = function(data)
    -- data.file é o arquivo ou diretório que foi aberto no nvim
    local directory = vim.fn.isdirectory(data.file) == 1

    if directory then
      -- Abre o nvim-tree na raiz do diretório aberto
      vim.cmd.cd(data.file)
      require("nvim-tree.api").tree.open()
    end
  end,
})

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
    side = "left",
    preserve_window_proportions = true,
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
    },
  },
  filters = {
    dotfiles = false,
  },
  git = {
    enable = true,
    ignore = false,
  },
  update_focused_file = {
    enable = true,
    update_root = true,
  },
})
