require('nvim-treesitter').install({
  "lua", "vim", "vimdoc", "query",
  "python", "javascript", "typescript",
  "html", "css", "json", "markdown",
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
    if lang and pcall(vim.treesitter.start, args.buf, lang) then
      if vim.bo[args.buf].filetype ~= "yaml" then
        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end
    end
  end,
})
