-- For lualine pretty battery
vim.cmd([[
    function! Battery_icon()
        let l:battery_icon = {
        \ 5: " ",
        \ 4: " ",
        \ 3: " ",
        \ 2: " ",
        \ 1: " ",
        \ 0: " ",}
    let l:backend = battery#backend()
    let l:nf = float2nr(round(backend.value / 20.0))
    return printf('%s', get(battery_icon, nf))
endfunction]])

-- Packer addons
return require('packer').startup(function()
    -- Hardware use 
    use 'wbthomason/packer.nvim'
    use 'numToStr/Comment.nvim'
    use 'terryma/vim-multiple-cursors'
    use 'ap/vim-css-color'
    use 'nvim-lua/plenary.nvim'
    use 'rcarriga/nvim-dap-ui'
    use 'mfussenegger/nvim-dap' 
    use 'andweeb/presence.nvim'
    use 'wfxr/minimap.vim'
    use 'p00f/nvim-ts-rainbow'
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use 'lambdalisue/battery.vim'
    use 'michaelb/sniprun'
    use 'iamcco/markdown-preview.nvim'
    use 'preservim/tagbar'
    use 'Olical/aniseed'
    use 'psliwka/vim-smoothie'
    use 'stevearc/aerial.nvim'
	
    require('aerial').setup()

    -- Current context
    use 'nvim-treesitter/nvim-treesitter-context'
    require'treesitter-context'.setup{
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
            -- For all filetypes
            -- Note that setting an entry here replaces all other patterns for this entry.
            -- By setting the 'default' entry below, you can control which nodes you want to
            --appear in the context window.
            default = {
                'class',
                'function',
                'method',
                -- 'for', -- These won't appear in the context
                --'while',
                -- 'if',
                -- 'switch',
                -- 'case',
            },
                -- Example for a specific filetype.
                -- If a pattern is missing, *open a PR* so everyone can benefit.
                --   rust = {
                --       'impl_item',
                --   },
        },
        exact_patterns = {
            -- Example for a specific filetype with Lua patterns
            -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
            -- exactly match "impl_item" only)
            -- rust = true,
        },

        -- [!] The options below are exposed but shouldn't require your attention,
        -- you can safely ignore them.
        zindex = 20, -- The Z-index of the context window
        mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
    }



    -- Git
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
    use 'junegunn/gv.vim'
    use 'tpope/vim-fugitive'
    use 'mhinz/vim-signify'

    -- Debug
    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'

    -- Coc
    use {'neoclide/coc.nvim', branch = 'master', run = 'yarn install --frozen-lockfile'}

    -- fzf
    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'

    -- Dashboard
    use 'glepnir/dashboard-nvim'
    local home = os.getenv('HOME')
    local db = require('dashboard')
    db.setup({ 
        hide = {
            statusline = true,
            tabline = true,
            winbar = true,
        },
        preview = {
            command = 'cat | lolcat -F 0.1',
            file_path = home .. '/.config/nvim/static/neovim.cat',
            file_height = 15,
            file_width = 55,
        },
        theme = "doom",
        config = {
        center = {
        {icon = '  ',
        desc = 'Recently latest session                 ',
        shortcut = 'SPC s l',
        action =':source /Users/michael/.config/nvim/Session.vim'},
        {icon = '  ',
        desc = 'Update Plugins                          ',
        action = ':PackerUpdate', ":TSUpdate",
        shortcut = 'SPC f f'},
        {icon = '  ',
        desc ='File Browser                            ',
        action =  'Telescope file_browser',
        shortcut = 'SPC f b'},
        {icon = '  ',
        desc = 'Keyword Docs                            ',
        action = 'Telescope help_tags',
        shortcut = 'SPC f w'},
        {icon = '  ',
        desc = 'NeoVim config                           ',
        action = ':e ~/.config/nvim/lua',
        shortcut = 'SPC f d'},
        {icon = '  ',
        desc = 'Exit NeoVim                             ',
        action = ':q!',
        shortcut = 'SPC f q'},
        },
        footer = {"Welcome Back! 🏡"},
    }
    })

    -- Blankline
    use 'lukas-reineke/indent-blankline.nvim'
    require("indent_blankline").setup {
        -- for example, context is off by default, use this to turn it on
        show_current_context = true,
        show_current_context_start = true,
        space_char_blankline = " ",
    }

    -- Scrollbar
    use 'kevinhwang91/nvim-hlslens'
    use 'petertriho/nvim-scrollbar'
    require("scrollbar").setup()
    require("scrollbar.handlers.search").setup()

    -- Treesitter
    use 'nvim-treesitter/nvim-treesitter'
    vim.cmd([[set foldexpr=nvim_treesitter#foldexpr()
    set foldmethod=expr]])
    require'nvim-treesitter.configs'.setup({
    -- A list of parser names, or "all"
    	ensure_installed = {
    		"c", 
    		"lua",
    		"rust",
    		"python",
    		"go",
    		"html",
    		"css",
    		"javascript",
    		"typescript",
    	},

    	incremental_selection = { enable = true,
    		sync_install = false,
    		ignore_install = {},

    		keymaps = {
    			init_selection = "gnn",
    			node_incremental = "grn",
    			scope_incremental = "grc",
    			node_decremental = "grm",
    		},
    	},

    	highlight = {
    		enable = true,
    		disable = {""},
    		additional_vim_regex_highlighting = true,
    	},	

    	rainbow = {
    		enable = true,
    		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    		max_file_lines = nil, -- Do not enable for files with more than n lines, int
    		-- colors = {}, -- table of hex strings
    		-- termcolors = {} -- table of colour name strings
    	},
    })

    -- Bufferline
    use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
    require("bufferline").setup {
	options = {
		numbers = "ordinal",
		separator_style = "thin",
		mode = "buffers",
		--indicator_icon = '▎',
		buffer_close_icon = '',
		modified_icon = '●',
		close_icon = '',
		left_trunc_marker = '',
		right_trunc_marker = '',
		max_name_length = 18,
		tab_size = 22,
		show_close_icon = true,
		show_buffer_default_icon = true,
		show_buffer_close_icons = true,
		show_buffer_icons = true,
		show_tab_indicators = true,
		color_icons = true,
		diagnostics = "coc",


		diagnostics_indicator = function(count, level, diagnostics_dict, context)
		    local s = " "
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and "E "
					or (e == "warning" and "W " or "H " )
				    s = s .. n .. sym
			    end
			    return s
		    end,
		    custom_areas = {
			    right = function()	
				    time = os.date("%H:%M")	
				    return {{text= "|  Time: " .. time .. "  ", guifg="#1D1D1D", guibg="#617C58"}}
			    end
		    },
		    offsets = {
			    {
			    filetype = "coc-explorer",
			    text = "File Explorer",
			    highlight = "Directory",
			    text_align = "left",
			    },
		    },
	    },
    }

    -- Telescope
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-file-browser.nvim'
    require("telescope").setup {
	    extensions = {
		    file_browser = {
			    theme = "ivy",
			    -- disables netrw and use telescope-file-browser in its place
			    hijack_netrw = true,
			    mappings = {
				    ["i"] = {
					    -- your custom insert mode mappings
				    },
				    ["n"] = {
					    -- your custom normal mode mappings }, },
				    },
			    },
		    },
	    },
    }
    require("telescope").load_extension "file_browser"

    -- Lualine
	use 'nvim-lualine/lualine.nvim'
    require('lualine').setup({
    	options = {
        	icons_enabled = true,
        	theme = 'auto',
        	component_separators = { left = '', right = ''},
        	section_separators = { left = '', right = ''},
        	disabled_filetypes = {},
        	always_divide_middle = true,
        	globalstatus = false,
    	},
        sections = {
            lualine_a = {'mode'},
            lualine_b = {'%{Battery_icon()} %{battery#value()}%%', 'branch', 'diff', 'diagnostics'},
            lualine_c = {'filetype', 'filename'},
            lualine_x = {'filesize', 'encoding', 'fileformat'},
            lualine_y = {'progress'},
            lualine_z = {'location'}
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {'filename'},
            lualine_x = {'location'},
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        extensions = {'quickfix','fugitive','nvim-tree'}
    })

       -- Themes
    use 'morhetz/gruvbox'
    use 'doums/darcula'
    use 'junegunn/seoul256.vim'
    use 'arzg/vim-colors-xcode'
    use 'savq/melange'
    use 'rebelot/kanagawa.nvim'
end)

