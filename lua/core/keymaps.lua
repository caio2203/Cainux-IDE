vim.g.mapleader = " "
local map = vim.keymap.set

map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Abrir explorador" })
map("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Buscar arquivos" })
map("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Buscar texto" })
map("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Ver buffers" })
map("i", "jk", "<Esc>", { desc = "Sair do modo inserção" })
