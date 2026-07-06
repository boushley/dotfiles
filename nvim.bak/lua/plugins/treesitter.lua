-- Highlight, edit, and navigate code
return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
      'bash',
      'c',
      'diff',
      'go',
      'html',
      'javascript',
      'lua',
      'luadoc',
      'markdown',
      'regex',
      'tsx',
      'typescript',
      'vim',
      'vimdoc',
    },
    -- Autoinstall languages that are not installed
    auto_install = true,
    highlight = {
      enable = true,
      -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
      --  If you are experiencing weird indenting issues, add the language to
      --  the list of additional_vim_regex_highlighting and disabled languages for indent.
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
  },
  config = function(_, opts)
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

    local treesitter = require('nvim-treesitter')
    treesitter.setup()

    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('custom-treesitter', { clear = true }),
      callback = function(args)
        local filetype = vim.bo[args.buf].filetype
        local lang = vim.treesitter.language.get_lang(filetype)
        if not lang then
          return
        end

        local ok = pcall(vim.treesitter.start, args.buf, lang)
        if not ok then
          if opts.auto_install then
            pcall(treesitter.install, { lang })
          end
          return
        end

        if opts.indent.enable and not vim.tbl_contains(opts.indent.disable or {}, filetype) then
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })

    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  end,
}
