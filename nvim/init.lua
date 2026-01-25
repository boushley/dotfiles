require('config.initial')
require('config.options')
require('config.keymaps')
require('config.auto-commands')
require('config.directories')
require('config.processing')

-- This is useful on some systems where OSC52 works well, otherwise the universal-clipboard plugin is nice
require('config.clipboard')
require('config.lazy')
require('config.formatting')

require('lazy').setup('plugins')

-- Override plugin that sets clipboard to unnamedplus since I prefer the default behavior where
-- standard deletes, etc in vim overwrite the system buffer.
vim.opt.clipboard = ""
