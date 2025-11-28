require("mason").setup()
require("mason-lspconfig").setup()

-- Common LSP configuration
local function get_capabilities()
	return require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
end

local function on_attach()
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end)
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end)
	vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end)
	vim.keymap.set("n", "<leader>vco", function() vim.lsp.buf.code_action() end)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end)
	vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format() end)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end)
end

-- Helper function to merge configs
local function config(extra_config)
	local base = {
		capabilities = get_capabilities(),
		on_attach = on_attach,
	}
	return vim.tbl_deep_extend("force", base, extra_config or {})
end

-- Configure LSP servers using vim.lsp.config (new API)
vim.lsp.config.pyright = config(require("daniel.lsp.settings.pyright"))
vim.lsp.config.ts_ls = config({})  -- Changed from tsserver to ts_ls
vim.lsp.config.gopls = config({})
vim.lsp.config.intelephense = config({})
vim.lsp.config.kotlin_language_server = config({})
vim.lsp.config.svelte_language_server = config({})
vim.lsp.config.sqlls = config({})
vim.lsp.config.harper_ls = config({})

-- Enable the LSP servers
vim.lsp.enable("pyright")
vim.lsp.enable("ts_ls")
vim.lsp.enable("gopls")
vim.lsp.enable("intelephense")
vim.lsp.enable("kotlin_language_server")
vim.lsp.enable("svelte_language_server")
vim.lsp.enable("sqlls")
vim.lsp.enable("harper_ls")

-- Commented out servers (uncomment and add vim.lsp.enable() as needed)
-- vim.lsp.config.lua_ls = config(require("daniel.lsp.settings.sumneko_lua"))
-- vim.lsp.enable("lua_ls")

-- vim.lsp.config.svelte = config({})
-- vim.lsp.enable("svelte")

-- vim.lsp.config.dockerls = config({})
-- vim.lsp.enable("dockerls")

-- vim.lsp.config.jsonls = config({})
-- vim.lsp.enable("jsonls")

-- vim.lsp.config.html = config({})
-- vim.lsp.enable("html")

-- vim.lsp.config.cssls = config({})
-- vim.lsp.enable("cssls")

-- vim.lsp.config.rust_analyzer = config({})
-- vim.lsp.enable("rust_analyzer")

-- vim.lsp.config.bashls = config({})
-- vim.lsp.enable("bashls")

-- vim.lsp.config.tailwindcss = config({})
-- vim.lsp.enable("tailwindcss")
