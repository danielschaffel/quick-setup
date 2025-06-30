local harpoon = require("harpoon")

local keymap = vim.api.nvim_set_keymap

harpoon.setup()

keymap("n", "<leader>e", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { noremap = true, silent = true })
keymap("n", "<leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", { noremap = true, silent = true })
keymap("n", "<leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", { noremap = true, silent = true })
keymap("n", "<leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", { noremap = true, silent = true })
keymap("n", "<leader>4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", { noremap = true, silent = true })
keymap("n", "<leader>5", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", { noremap = true, silent = true })

keymap("n", "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>", { noremap = true, silent = true })
