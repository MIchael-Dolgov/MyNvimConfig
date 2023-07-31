local map = vim.keymap.set
local default_opts = {noremap = true, silent = true}

----------------------------------------------------
-- Shortcuts
----------------------------------------------------
map('i', 'jk', '<Esc>', {noremap = true})

-- Хоткеи для плагинов
map({'n', 'v', 'o'}, '<C-o>', '<Cmd>CocCommand explorer<CR>',  default_opts)
map('n', '<C-p>', [[ <cmd>Minimap<cr> ]], default_opts)
map('n', '<C-l>', [[ <cmd>MinimapClose<cr> ]], default_opts)

map('n', '<C-j>', [[ <cmd>AerialOpen<cr> ]], default_opts)

-- Bufferline 
map('n', '<Tab>', ':BufferLineCycleNext<CR>', default_opts)
map('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', default_opts)

-- Автоформат + сохранение по CTRL-s , как в нормальном, так и в insert режиме
map({'n', 'i', 'v'}, '<C-s>', '<C-c>:update<cr>',  default_opts)

-- Пролистнуть на страницу вниз / вверх (как в браузерах)
map('n', '<Space>', '<PageDown> zz', default_opts)
map('n', '<C-Space>', '<PageUp> zz', default_opts)

-- Functional keymap
map({'n', 'v', 'o'}, '<F1>', [[ <cmd>Telescope find_files<cr> ]], default_opts)
map({'n', 'v', 'o'}, '<F2>', [[ <cmd>Telescope live_grep<cr> ]], default_opts)
map({'n', 'v', 'o'}, '<F3>', [[ <cmd>Telescope buffers<cr> ]], default_opts)
map({'n', 'v', 'o'}, '<F4>', [[ <cmd>Telescope help_tags<cr> ]], default_opts)
map({'n', 'v', 'o'}, '<F5>', [[ <cmd>mksession! /Users/michael/.config/nvim/Session.vim<cr> ]], default_opts)
map({'n', 'v', 'o'}, '<F6>', [[ <cmd>source /Users/michael/.config/nvim/Session.vim<cr> ]], default_opts)
map({'n', 'v', 'o'}, '<F7>', [[ <cmd>term<cr> ]], default_opts)
map({'n', 'v', 'o'}, '<F8>', [[ <cmd>CocDiagnostics<cr> ]], default_opts)
map({'n', 'v', 'o'}, '<F9>', [[ <cmd>TagbarToggle<cr> ]], default_opts)
map({'n', 'v', 'o'}, '<F10>', [[ <cmd>DiffviewFileHistory<cr> ]], default_opts)
map({'n', 'v', 'o'}, '<F12>', [[ <cmd>DiffviewOpen<cr> ]], default_opts)

