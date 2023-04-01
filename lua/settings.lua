-----------------------------------------------------------
-- Другое
-----------------------------------------------------------
local cmd = vim.cmd             -- execute Vim commands
local exec = vim.api.nvim_exec  -- execute Vimscript
local g = vim.g                 -- global variables
local opt = vim.opt             -- global/buffer/windows-scoped options
local o = vim.o
local wo = vim.wo
local bo = vim.bo
-- Направление перевода с русского на английский
--g.translate_source = 'ru'
--g.translate_target = 'en'

g.tagbar_compact = 1
g.tagbar_sort = 0
g.smoothie_enabled = 1
-----------------------------------------------------------
-- Главные
-----------------------------------------------------------
opt.encoding = 'UTF-8'
opt.mouse = 'niv'
opt.swapfile = false
opt.colorcolumn = '80'              -- Разделитель на 80 символов
opt.cursorline = true               -- Подсветка строки с курсором
opt.spelllang= { 'en_us', 'ru' }    -- Словари рус eng
opt.number = true                   -- Включаем нумерацию строк
opt.numberwidth = 6
opt.relativenumber = false          -- Вкл. относительную нумерацию строк
opt.undofile = true                 -- Возможность отката назад
opt.splitright = true               -- vertical split вправо
opt.splitbelow = true               -- horizontal split вниз
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.smartindent = true
opt.expandtab = true
opt.scrolloff = 12
opt.completeopt = 'preview'
opt.cmdheight = 1
opt.updatetime = 100
opt.fileformat = 'unix'              -- may be unix for linux
g.Tlist_Ctags_Cmd = '/usr/local/Cellar/ctags/5.8_1/bin/ctags'
-----------------------------------------------------------
-- Цветовая схема
-----------------------------------------------------------
opt.termguicolors = true

--vim.cmd("colorscheme melange")

vim.cmd("colorscheme kanagawa")

--cmd'colorscheme seoul256'
--g.seoul256_background = 233

--cmd'colorscheme gruvbox'
--g.gruvbox_termcolors=256

-- Change color with system time
local time = tonumber(os.date("%H"))
if (time >= 9) and (time <= 16) then
--if false then
	cmd"set background=light"
    --cmd'colorscheme xcodelight'
else
    cmd"set background=dark"
    --cmd'colorscheme xcodedark'
end

cmd'highlight! clear LineNr'
cmd'highlight! LineNr ctermfg=grey ctermbg=white guifg=#848484 guibg=#1b1b1d'
-----------------------------------------------------------
-- Blankline
-----------------------------------------------------------
opt.list = true
opt.listchars:append("space: ")
opt.listchars:append("tab:  ")
-----------------------------------------------------------
-- Minimap
-----------------------------------------------------------
g.minimap_auto_start = 0
g.minimap_highlight_range = 1
g.minimap_width = 21
g.minimap_highlight_search = 1
g.minimap_git_colors = 1
-----------------------------------------------------------
-- Coc
-----------------------------------------------------------
g.coc_global_extensions = {
	'coc-clangd',
	'coc-java',
	'coc-css',
	'coc-html',
	'coc-explorer',
	'coc-go', 
	'coc-python', 
	'coc-rust-analyzer',
	'coc-json',
	'coc-sh',
	'coc-highlight',
}
opt.cmdheight=1
opt.hidden = true
opt.completeopt = 'preview'
cmd[[
nnoremap <silent> K :call ShowDocumentation() <CR>
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
]]
-----------------------------------------------------------
-- TreeSitter
-----------------------------------------------------------
opt.foldlevel = 20

