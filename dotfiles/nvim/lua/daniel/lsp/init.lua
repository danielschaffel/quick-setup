require("mason").setup()
require("mason-lspconfig").setup()

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
		on_attach = function()
			vim.keymap.set("n","gd", function() vim.lsp.buf.definition() end)
			vim.keymap.set("n","K", function() vim.lsp.buf.hover() end)
			vim.keymap.set("n","<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
			vim.keymap.set("n","<leader>vd", function() vim.diagnostic.open_float() end)
			vim.keymap.set("n","]d", function() vim.diagnostic.goto_next() end)
			vim.keymap.set("n","[d", function() vim.diagnostic.goto_prev() end)
			vim.keymap.set("n","<leader>ca", function() vim.lsp.buf.code_action() end)
			vim.keymap.set("n","<leader>vco", function() vim.lsp.buf.code_action({
                filter = function(code_action)
                    if not code_action or not code_action.data then
                        return false
                    end

                    local data = code_action.data.id
                    return string.sub(data, #data - 1, #data) == ":0"
                end,
                apply = true
            }) end)
			vim.keymap.set("n","<leader>vrr", function() vim.lsp.buf.references() end)
			vim.keymap.set("n","<leader>lf", function() vim.lsp.buf.format() end)
			vim.keymap.set("n","<leader>vrn", function() vim.lsp.buf.rename() end)
			vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end)
		end,
	}, _config or {})
end

-- require("daniel.lsp.handlers").setup()
require("lspconfig").pyright.setup(config(require("daniel.lsp.settings.pyright")))
-- require("lspconfig").lua_ls.setup(config(require("daniel.lsp.settings.sumneko_lua")))
require("lspconfig").tsserver.setup(config())
-- require("lspconfig").svelte.setup(config())
-- require("lspconfig").dockerls.setup(config())
-- require("lspconfig").jsonls.setup(config())
-- require("lspconfig").html.setup(config())
-- require("lspconfig").cssls.setup(config())
-- require("lspconfig").rust_analyzer.setup(config())
-- require("lspconfig").bashls.setup(config())
require("lspconfig").gopls.setup(config())
-- require("lspconfig").tailwindcss.setup(config())
require("lspconfig").intelephense.setup(config())
require("lspconfig").kotlin_language_server.setup(config())
require("lspconfig").sqlls.setup(config())
-- require("lspconfig").cpptools.setup(config())
--
--
-- require "daniel.lsp.null-ls"

