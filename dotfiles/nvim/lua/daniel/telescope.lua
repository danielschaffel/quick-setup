require("telescope").load_extension('harpoon')
builtin = require("telescope.builtin")

vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

