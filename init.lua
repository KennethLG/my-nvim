-- Load configurations from individual files
require('config.plugins')    -- Plugins
require('config.mason')
require('config.lsp')        -- LSP setup
require('config.settings')   -- Basic settings
require('config.cmp')        -- Autocompletion setup (create cmp.lua as needed)
require('config.telescope')  -- Telescope setup (create telescope.lua as needed)
require('config.toggleterm') -- ToggleTerm setup (create toggleterm.lua as needed)
require('config.bufferline') -- Bufferline setup (create bufferline.lua as needed)
require('config.lint')
require('config.formatter')
require('config.mappings')   -- Key mappings
require('config.null-ls')
require('config.treesitter')
