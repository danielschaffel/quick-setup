-- local configs = require("nvim-treesitter.configs")
-- configs.setup {
--   -- ensure_installed = "maintained",
--   sync_install = false,
--   ignore_install = { "" }, -- List of parsers to ignore installing
--   highlight = {
--     enable = true, -- false will disable the whole extension
--     disable = { "" }, -- list of language that will be disabled
--     additional_vim_regex_highlighting = true,
-- 
--   },
--     rainbow = {
--     enable = true,
--     -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
--     extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
--     max_file_lines = nil, -- Do not enable for files with more than n lines, int
--     -- colors = {}, -- table of hex strings
--     -- termcolors = {"gruvbox"} -- table of colour name strings
--   },
--   indent = { enable = true, disable = { "yaml" } },
-- }

local configs = require("nvim-treesitter.configs")
configs.setup {
  -- Use a list of specific parsers instead of "maintained" (deprecated)
  ensure_installed = { 
    "lua", "vim", "vimdoc", "query",
    "python", "javascript", "typescript", 
    "html", "css", "json", "markdown"
  },
  
  sync_install = false,
  
  -- auto_install is the modern replacement for ignore_install
  auto_install = true,
  
  highlight = {
    enable = true,
    disable = {}, -- list of languages to disable
    -- additional_vim_regex_highlighting can cause performance issues
    -- Consider setting to false or specific languages only
    additional_vim_regex_highlighting = false,
  },
  
  indent = { 
    enable = true, 
    disable = { "yaml" } 
  },
}
