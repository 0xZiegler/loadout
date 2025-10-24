" === General Settings ===
set nocompatible              " Use Vim, not Vi mode
set encoding=utf-8            " Always use UTF-8
syntax on                     " Enable syntax highlighting
filetype plugin indent on     " Enable filetype detection and indentation

" === UI Enhancements ===
set number                    " Show line numbers
set relativenumber            " Show relative line numbers
set cursorline                " Highlight current line
highlight CursorLine cterm=NONE ctermbg=0
set showmatch                 " Highlight matching brackets
set wildmenu                  " Enhanced command-line completion
set lazyredraw                " Faster scrolling
set title                     " Show file name in terminal title

" === Indentation ===
set tabstop=4                 " Tab = 4 spaces
set shiftwidth=4              " Auto-indent amount
set expandtab                 " Use spaces, not real tabs
set smartindent               " Smart auto-indenting
set autoindent                " Auto-indent new lines

" === Search Settings ===
set ignorecase                " Case-insensitive search...
set smartcase                 " ...unless capital letters in query
set incsearch                 " Show matches while typing
set hlsearch                  " Highlight matches

" === File Handling ===
set hidden                    " Allow hidden unsaved buffers
set nobackup                  " Don't create backup~ files
set nowritebackup             " No write-backups
set noswapfile                " No annoying .swp files
set autoread                  " Auto-reload file if changed outside

" === Better Navigation ===
nnoremap <Space> :nohlsearch<CR>   " Space clears search highlight
nnoremap <C-h> <C-w>h              " Easy window navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" === Quality of Life ===
set clipboard=unnamedplus     " Use system clipboard
set mouse=a                   " Enable mouse
set scrolloff=5               " Keep 5 lines above/below cursor
set updatetime=300            " Faster updates (good for plugins/signcolumn)

" === Colors ===
"colorscheme desert      " warm, earthy tones
colorscheme evening     " cooler, softer tones
colorscheme murphy      " greenish, clean
colorscheme ron         " simple, dark
colorscheme slate       " gray/blue dark
colorscheme torte       " classic, slightly retro


" === Utilities ===