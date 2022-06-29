:set number
":set relativenumber
":set macligatures
:set guifont=Fira\ Code:h12
:set completeopt=preview

:set lcs+=space:·
:let g:indentLine_leadingSpaceChar='·'
:let g:indentLine_leadingSpaceEnabled='1'

":let g:airline_theme='base16_horizon_terminal_dark'
":let g:airline_theme='base16_cupertino'
:let g:airline_theme='transparent'
":let g:airline_theme='tomorrow'
":let g:airline_theme='nord'
":let g:airline_theme='zenburn'

:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

:set encoding=UTF-8
":set noswapfile
:set scrolloff=1
:set fileformat=unix

:set colorcolumn=80

":ignoremap jk <esc>

call plug#begin('~/.vim/plugged')

" Color Scheme
Plug 'cocopon/iceberg.vim'
Plug 'https://github.com/morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim' 
Plug 'EdenEast/nightfox.nvim'
Plug 'rose-pine/neovim'

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

" Airline
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/Yggdroot/indentLine'
"Plug 'bling/vim-bufferline'
Plug 'akinsho/bufferline.nvim'

" Scrollbar
"Plug 'Xuyuanp/scrollbar.nvim'

Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/ap/vim-css-color'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'https://github.com/preservim/tagbar'
Plug 'Olical/aniseed'

" Discord
Plug 'andweeb/presence.nvim'

" Minimap 
Plug 'wfxr/minimap.vim'   " brew install code-minimap

call plug#end()

"require("nvim-gps").setup()

" Minimap==========================================================
hi MinimapCurrentRange ctermfg=Green guifg=#f2f2f2 guibg=#2b2f3d
let g:minimap_range_color = 'MinimapCurrentRange'

hi MinimapCurrentLine ctermfg=Green guifg=#CC6666 guibg=#f9f0f9
let g:minimap_cursor_color = 'MinimapCurrentLine'

"autocmd ColorScheme *
		"\ highlight minimapCursor ctermbg=59  ctermfg=228 guibg=#1a9F4b guifg=#A39B7C |
		"\ highlight minimapRange ctermbg=242 ctermfg=228 guibg=#1a9F4b guifg=#50FA7B

"let g:minimap_enable_highlight_colorgroup = 1
let g:minimap_highlight_range = 1
let g:minimap_width = 20
let g:minimap_auto_start = 1
let g:minimap_auto_start_win_enter = 1
let g:minimap_highlight_search = 1
let g:minimap_git_colors = 1 
"let g:minimap#filetype#excludes = 1
"let g:minimap#window#height = 20
"=========================================

" cometelescope========================
lua require('Comment').setup()
"=====================================

" ScrollBar =====================
"augroup ScrollbarInit
"  autocmd!
"  autocmd WinScrolled,VimResized,QuitPre * silent! lua require('scrollbar').show()
"  autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
"  autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * silent! lua require('scrollbar').clear()
"augroup end
" ScrollBarEnd==================

colorscheme rose-pine
" colorscheme iceberg
" colorscheme gruvbox
" colorscheme nord
" colorscheme nightfox
" colorscheme nordfox
" colorscheme duskfox

" Bufferline=================================================
set termguicolors

"May choose style: slant, padded_slant, thick, thin
"numbers = \"ordinal"

lua << EOF
require("bufferline").setup {
	options = {
		numbers = "ordinal",
		separator_style = "slant",
		mode = "buffers",
		indicator_icon = '▎',
		buffer_close_icon = '',
		modified_icon = '●',
		close_icon = '',
		left_trunc_marker = '',
		right_trunc_marker = '',
		max_name_length = 18,
		tab_size = 25,
		show_close_icon = false,
		show_buffer_default_icon = true,
		show_buffer_close_icons = true,
		show_buffer_icons = true,
		show_tab_indicators = true,
		color_icons = true,
		diagnostics = "coc",

		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
		end,

		custom_areas = {
			right = function()
				local result = {}
				local seve = vim.diagnostic.severity
				local error = #vim.diagnostic.get(0, {severity = seve.ERROR})
				local warning = #vim.diagnostic.get(0, {severity = seve.WARN})
				local info = #vim.diagnostic.get(0, {severity = seve.INFO})
				local hint = #vim.diagnostic.get(0, {severity = seve.HINT})

				if error >= 0 then
					table.insert(result, {text = " " .. "  " .. error, guifg = "#EC5241", guibg = "#4C3C53",})
				end

				if warning >= 0 then
					table.insert(result, {text = "  " .. warning, guifg = "#EFB839", guibg = "#4C3C53",})
				end

				if hint >= 0 then
					table.insert(result, {text = "  " .. hint, guifg = "#A3BA5E", guibg = "#4C3C53",})
				end

				if info >= 0 then
					table.insert(result, {text = "  " .. info .. "   " ,guifg = "#7EA9A7", guibg = "#4C3C53",})
				end
				return result
			end,
		}
	}
}

require('bufferline').exec()
EOF
" ==========================================================

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

" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline#extensions#tabline#formatter = 'default'
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

nnoremap <C-o> :NERDTreeToggle<CR>

nnoremap <Tab> :BufferLineCycleNext <CR>
nnoremap <S-Tab> ::BufferLineCyclePrev <CR>

nmap <F7> :terminal <CR>

nmap <F8> :TagbarToggle<CR>

let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

