let g:coc_global_extensions = [
	\ 'coc-css',
	\ 'coc-html',
	\ 'coc-explorer',
	\ 'coc-go',
	\ 'coc-python', 
	\ 'coc-rust-analyzer',
	\ 'coc-tsserver',
	\ 'coc-json',
	\ 'coc-sh',
	\ 'coc-highlight',
	\]

:set number
:set numberwidth=8
":highlight number ctermfg=black ctermbg=black

:set completeopt=preview
:set guifont=Fira\ Code:h12
:set sessionoptions=curdir,folds,help,slash,tabpages,unix
:set sessionoptions-=blank

:set cmdheight=1
:set signcolumn=yes
:set signcolumn=number
:set shortmess+=c
:set updatetime=200

"Format symbols
":set lcs+=space:·
:let g:indentLine_char = ''
":let g:indentLine_leadingSpaceEnabled='1'

:set cursorline
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

:set encoding=UTF-8
:set noswapfile
:set scrolloff=1
:set fileformat=unix
:set colorcolumn=80

call plug#begin('~/.config/nvim/plugins')

"Dashboard
Plug 'glepnir/dashboard-nvim'

" Color Scheme
Plug 'cocopon/iceberg.vim'
Plug 'https://github.com/morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim' 
Plug 'rose-pine/neovim'
Plug 'sainnhe/everforest'
Plug 'junegunn/seoul256.vim'
Plug 'tomasr/molokai'
Plug 'Shatur/neovim-ayu'

" Airline theme
Plug 'lambdalisue/battery.vim/'
Plug 'vim-airline/vim-airline-themes'

" Hardware
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'terryma/vim-multiple-cursors'
Plug 'tc50cal/vim-terminal'
Plug 'numToStr/Comment.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'tpope/vim-fugitive'
"Plug 'Xuyuanp/nerdtree-git-plugin'

" Airline
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/Yggdroot/indentLine'
"Plug 'bling/vim-bufferline'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }

" Scrollbar
"Plug 'Xuyuanp/scrollbar.nvim'

"Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/ap/vim-css-color'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'https://github.com/preservim/tagbar'
Plug 'Olical/aniseed'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Discord
Plug 'andweeb/presence.nvim'

" Minimap 
Plug 'wfxr/minimap.vim'   " brew install code-minimap

call plug#end()

"require("nvim-gps").setup()

" TreeSitter====================================================
lua << EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
ensure_installed = {"c", 
					"lua",
					"rust",
					"python",
					"go",
					"html",
					"css",
					"javascript",
					"typescript",},

    sync_install = false,
    ignore_install = {},
     highlight = {
    enable = true,
    disable = {},
	additional_vim_regex_highlighting = false,
  },
}
EOF
" ==============================================================

" BlackLine=======================================================
lua << EOF
require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}
EOF
" ================================================================

" Minimap==========================================================
"hi MinimapCurrentRange ctermfg=Green guifg=#f2f2f2 guibg=#2b2f3d
"let g:minimap_range_color = 'MinimapCurrentRange'

"hi MinimapCurrentLine ctermfg=Green guifg=#CC6666 guibg=#f9f0f9
"let g:minimap_cursor_color = 'MinimapCurrentLine'

"autocmd ColorScheme *
		\ highlight minimapCursor ctermbg=59  ctermfg=228 guibg=#1a9F4b guifg=#A39B7C |
		\ highlight minimapRange ctermbg=59 ctermfg=228 guibg=#1a9F4b guifg=#50FA7B

"let g:minimap_enable_highlight_colorgroup = 1
let g:minimap_auto_start = 0
let g:minimap_highlight_range = 1
let g:minimap_width = 21
let g:minimap_highlight_search = 1
let g:minimap_git_colors = 1 
"let g:minimap#filetype#excludes = 1
"let g:minimap#window#height = 20
"=========================================

" other========================
lua require('Comment').setup()
lua << EOF
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
          -- your custom normal mode mappings },
      },
    },
  },
}
}
EOF
lua require("telescope").load_extension "file_browser"
"=====================================

" ScrollBar =====================
"augroup ScrollbarInit
"  autocmd!
"  autocmd WinScrolled,VimResized,QuitPre * silent! lua require('scrollbar').show()
"  autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
"  autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * silent! lua require('scrollbar').clear()
"augroup end
" ScrollBarEnd==================

" Bufferline=================================================
set termguicolors

"May choose style: slant, padded_slant, thick, thin
"numbers = \"ordinal"

lua << EOF
require("bufferline").setup {
	options = {
		numbers = "ordinal",
		separator_style = "thick",
		mode = "buffers",
		indicator_icon = '▎',
		buffer_close_icon = '',
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
				local sym = e == "error" and "  "
					or (e == "warning" and "  " or "  " )
				s = s .. n .. sym
			end
			return s
		end,

		custom_areas = {
			right = function()
				return {{text="| Buffers ",}}
			end
		}
	}
}
EOF
" ==========================================================

"Coc-Explorer=================================================
autocmd ColorScheme *
  \ hi CocExplorerNormalFloatBorder guifg=#414347 guibg=#272B34
  \ | hi CocExplorerNormalFloat guibg=#272B34
  \ | hi CocExplorerSelectUI guibg=blue
"==============================================================

" Airline==================================================
let g:airline_section_z = " %p ☰ %l/%L  ln : %c " 
let g:battery#update_statusline = 1 

function! Battery_icon() 
  let l:battery_icon = {
    \ 5: "",
    \ 4: "",
    \ 3: "",
    \ 2: "",
    \ 1: ""}
    
  let l:backend = battery#backend()
  let l:nf = float2nr(round(backend.value / 20.0))
  return printf('%s', get(battery_icon, nf))
endfunction
let g:airline_section_b = airline#section#create(['%{Battery_icon()} %{battery#value()}%%'])

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" powerline symbols
" let g:airline_left_sep = \"\uE0B4" " ''
" let g:airline_left_alt_sep = '|' "''
" let g:airline_right_sep =  \"\uE0B6" " ''
let g:airline_right_alt_sep = '|' "''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ' '
" let g:airline_symbols.maxlinenr = '' "''
let g:airline_symbols.dirty='⚡'
" let g:airline_symbols.colnr = ' '
" ======================================================

" Shortcuts
" Find files using Telescope command-line sugar.
nnoremap <F1> :Telescope find_files<CR>
nnoremap <F2> :Telescope live_grep<CR>
nnoremap <F3> :Telescope buffers<CR>
nnoremap <F4> :Telescope help_tags<CR>

" function! AdjustFontSize(amount)
"   let s:fontsize = s:fontsize+a:amount
"   :execute /"GuiFont! Consolas:h" . s:fontsize
" endfunction

" noremap <C-kPlus> :call AdjustFontSize(1)<CR>
" noremap <C-kMinus> :call AdjustFontSize(-1)<CR>

nnoremap <C-o> <Cmd> CocCommand explorer <CR>

nnoremap <Tab> :BufferLineCycleNext <CR>
nnoremap <S-Tab> ::BufferLineCyclePrev <CR>

nmap <F9> :Minimap <CR>
nmap <F10> :MinimapClose <CR>

nmap <F12> :mksession /Users/michael/.config/nvim/Session.vim <CR>
nmap <F5> :source /Users/michael/.config/nvim/Session.vim <CR>

nmap <F6> :CocDiagnostics <CR> 
"nmap <F6> :CocList diagnostics <CR>

nmap <F7> :terminal <CR>

nmap <F12> :TagbarToggle<CR>

nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" Dashboard======================================
" brew instal lolcat --thats optional
lua << EOF
local home = os.getenv('HOME')
local db = require('dashboard')
db.preview_command = 'cat | lolcat -F 0.1'
db.preview_file_path = home .. '/.config/nvim/static/neovim.cat'
db.preview_file_height = 12
db.preview_file_width = 55
db.custom_footer = {"Have a nice day Michael 🌞"}
db.hide_statusline = true
db.custom_center = {
      {icon = '  ',
      desc = 'Recently latest session                 ',
      shortcut = 'SPC s l',
      action =':source /Users/michael/.config/nvim/Session.vim'},
      {icon = '  ',
      desc = 'Find  File                              ',
      action = 'Telescope find_files find_command=rg,--hidden,--files',
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
      action = ':e ~/.config/nvim/init.vim',
      shortcut = 'SPC f d'},
      }
vim.g.indentLine_fileTypeExclude = { 'dashboard' }
EOF

" Color Schemas Configs============================================
"let g:airline_theme='transparent'
let g:seoul256_background = 234
" colorscheme molokai
colorscheme seoul256
" colorscheme ayu-dark
" colorscheme nord
" colorscheme rose-pine
" colorscheme everforest
" colorscheme gruvbox
" colorscheme iceberg
"=================================================================

