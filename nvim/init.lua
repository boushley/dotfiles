require('config.initial')
require('config.options')
require('config.keymaps')
require('config.auto-commands')

-- This is useful on some systems where OSC52 works well, otherwise the universal-clipboard plugin is nice
require('config.clipboard')
require('config.lazy')
require('config.formatting')

require('lazy').setup('plugins')
