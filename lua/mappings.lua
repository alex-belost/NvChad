require "nvchad.mappings"

local map = vim.keymap.set
local del = vim.keymap.del

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new { cmd = "lazygit", hidden = true, direction = "float" }

del("n", "<leader>b")

map("n", "<leader>rs", function()
  require("persistence").load { last = true }
end, { desc = "Restore session" })

map("n", "<leader>gg", function()
  lazygit:toggle()
end, { noremap = true, silent = true, desc = "Lazygit toggle" })

map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Tree toggle" })

-- map("n", "<leader>e", "<cmd>Neotree toggle<CR>", { noremap = true, silent = true, desc = "Tree toggle" })
--
-- map("n", "<leader>bf", "<cmd>Neotree focus filesystem left reveal<cr>", { silent = true, desc = "Find current buffer" })

-- map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save" })

map("n", "<leader>bf", "<cmd>NvimTreeFindFile<CR>", { noremap = true, silent = true, desc = "Find Current Buffer" })

map("n", "<leader>ba", function()
  require("nvchad.tabufline").closeAllBufs()
end, { desc = "Close All Buffers" })

map("n", "<leader>bo", function()
  require("nvchad.tabufline").closeAllBufs(false)
end, { desc = "Close Other Buffers" })

map("n", "<leader>cf", function()
  require("conform").format()
end, { desc = "Code Format" })

map("n", "<leader>cl", function()
  vim.lsp.buf.format()
end, { desc = "Format Buffer with Lsp" })

map("n", "<leader>qq", "<cmd>qa!<CR>", { desc = "Quit" })

map("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find Todo" })
map("n", "\\", "<cmd>:vsplit <CR>", { desc = "Vertical Split" })

-- Trouble
map("n", "<leader>qx", "<cmd>TroubleToggle<CR>", { desc = "Open Trouble" })
map("n", "<leader>qw", "<cmd>TroubleToggle workspace_diagnostics<CR>", { desc = "Open Workspace Trouble" })
map("n", "<leader>qd", "<cmd>TroubleToggle document_diagnostics<CR>", { desc = "Open Document Trouble" })
map("n", "<leader>qf", "<cmd>TroubleToggle quickfix<CR>", { desc = "Open Quickfix" })
map("n", "<leader>ql", "<cmd>TroubleToggle loclist<CR>", { desc = "Open Location List" })
map("n", "<leader>qt", "<cmd>TodoTrouble<CR>", { desc = "Open Todo Trouble" })

-- Git
map("n", "<leader>gl", ":Flog<CR>", { desc = "Git Log" })
map("n", "<leader>gf", ":DiffviewFileHistory<CR>", { desc = "Git File History" })
map("n", "<leader>gc", ":DiffviewOpen HEAD~1<CR>", { desc = "Git Last Commit" })
map("n", "<leader>gt", ":DiffviewToggleFile<CR>", { desc = "Git File History" })

-- Terminal
map("n", "<C-]>", function()
  require("nvchad.term").toggle { pos = "vsp", size = 0.4 }
end, { desc = "Toogle Terminal Vertical" })
map("n", "<C-\\>", function()
  require("nvchad.term").toggle { pos = "sp", size = 0.4 }
end, { desc = "Toogle Terminal Horizontal" })
map("n", "<C-f>", function()
  require("nvchad.term").toggle { pos = "float" }
end, { desc = "Toogle Terminal Float" })
map("t", "<C-]>", function()
  require("nvchad.term").toggle { pos = "vsp" }
end, { desc = "Toogle Terminal Vertical" })
map("t", "<C-\\>", function()
  require("nvchad.term").toggle { pos = "sp" }
end, { desc = "Toogle Terminal Horizontal" })
map("t", "<C-f>", function()
  require("nvchad.term").toggle { pos = "float" }
end, { desc = "Toogle Terminal Float" })

-- Basic
vim.keymap.set(
  "n",
  "<leader>co",
  "<cmd>OrganizeImports<CR>",
  { noremap = true, silent = true, desc = "Organize Imports" }
)

map("i", "jj", "<ESC>")
map({ "n" }, "<ESC>", "<cmd>noh<cr>")
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr><ESC>")
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr><ESC>")
