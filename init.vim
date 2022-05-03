:set number
:set relativenumber

:set lcs+=space:·
:let g:indentLine_leadingSpaceChar='·'
:let g:indentLine_leadingSpaceEnabled='1'

:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

:set encoding=UTF-8
" :set noswapfile
:set scrolloff=8
:set fileformat=unix

:set colorcolumn=80

let g:LanguageClient_serverCommands = {
\ 'rust': ['rust-analyzer'],
\ }

" ignoremap jk <esc>

call plug#begin('~/.vim/plugged')

" Color Scheme
Plug 'cocopon/iceberg.vim'
Plug 'https://github.com/morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'EdenEast/nightfox.nvim'
" Plug '

" Hardware
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
"Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
"Plug 'saadparwaiz1/cmp_luasnip'
"Plug 'L3MON4D3/LuaSnip'

" UI/UX
"
" Airline
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/Yggdroot/indentLine'

Plug 'Xuyuanp/scrollbar.nvim'

"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Vimscript
"Plug "nvim-treesitter/nvim-treesitter"
"Plug "SmiteshP/nvim-gps"

Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/ap/vim-css-color'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'https://github.com/terryma/vim-multiple-cursors'
"Plug 'https://github.com/preservim/tagbar'
Plug 'https://github.com/preservim/tagbar'
Plug 'Olical/aniseed'
"Discord
"Plug 'andweeb/presence.nvim'

" Minimap
Plug 'wfxr/minimap.vim', {'do': ':!cargo install --locked code-minimap'}
" Reguipmnets =============
" brew install code-minimap
" =========================

" Plug 'severin-lemaignan/vim-minimap'


call plug#end()

"require("nvim-gps").setup()

" Minimap =======================

"hi MinimapCurrentRange ctermfg=Green guifg=#50FA7B guibg=#50FA7B
"let g:minimap_range_color = 'MinimapCurrentRange'

hi MinimapCurrentLine ctermfg=Green guifg=#50FA7B guibg=#f3f3f3
let g:minimap_cursor_color = 'MinimapCurrentLine'

autocmd ColorScheme *
        \ highlight minimapCursor            ctermbg=59  ctermfg=228 guibg=#5F5F5F guifg=#50FA7B |
        \ highlight minimapRange             ctermbg=242 ctermfg=228 guibg=#4F4F4F guifg=#50FA7B

let g:minimap_highlight_range = 1
let g:minimap_width = 20
let g:minimap_auto_start = 1
let g:minimap_auto_start_win_enter = 1
let g:minimap_highlight_search = 1
let g:minimap_git_colors = 1 

" ===============================

" ScrollBar =====================

"augroup ScrollbarInit
"  autocmd!
"  autocmd WinScrolled,VimResized,QuitPre * silent! lua require('scrollbar').show()
"  autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
"  autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * silent! lua require('scrollbar').clear()
"augroup end

" ScrollBarEnd ==================

"let g:minimap#filetype#excludes = 1
"let g:minimap#window#height = 20

colorscheme iceberg
" colorscheme gruvbox
" colorscheme nord
" colorscheme nightfox
" colorscheme nordfox
" colorscheme duskfox

"noremap <C-9> :call AdjustFontSize(1)<CR>
"noremap <C-0> :call AdjustFontSize(-1)<CR>

nnoremap <C-o> :NERDTreeToggle<CR>

nmap <F8> :TagbarToggle<CR>

" Bad Idea ============================
" nnoremap <C-m> :MinimapOpen<CR>
" nnoremap :MinimapClose
" let g:minimap_highlight='Visual'
" =====================================

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

