:set number
":set relativenumber
":set macligatures
:set guifont=Fira\ Code:h12

:set lcs+=space:·
:let g:indentLine_leadingSpaceChar='·'
:let g:indentLine_leadingSpaceEnabled='1'

":let g:airline_theme='base16_horizon_terminal_dark' maybe
":let g:airline_theme='base16_cupertino'
":let g:airline_theme='transparent'
":let g:airline_theme='tomorrow'
":let g:airline_theme='ayu_dark'
":let g:airline_theme='transparent'
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
hi MinimapCurrentRange ctermfg=Green guifg=#50FA7B guibg=#50FA7B
let g:minimap_range_color = 'MinimapCurrentRange'

hi MinimapCurrentLine ctermfg=Green guifg=#50FA7B guibg=#f3b9f2
let g:minimap_cursor_color = 'MinimapCurrentLine'

autocmd ColorScheme *
        \ highlight minimapCursor ctermbg=59  ctermfg=228 guibg=#5F5F5F guifg=#A39B7C |
        "\ highlight minimapRange ctermbg=242 ctermfg=228 guibg=#4F4F4F guifg=#50FA7B

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
lua require("bufferline").setup{}
" ==========================================================

" Airline==================================================
let g:airline_section_z = " %p ☰ %l/%L  ln : %c " 

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

