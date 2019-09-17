colorscheme delek   " builtin colorscheme
syntax on   " syntax highlighting
set ruler   " show current line and column
set colorcolumn=80    " highlight 80th column
set wrap   " wrap long lines
set tabstop=4   " spaces per tab
set expandtab   " enable tabs to spaces
set number   "  show line numbers
set showcmd   " show last command entered
set cursorline   " highlight current line
set showmatch   " highight matching braces and parentheses
set incsearch   " search as characters are entered
set hlsearch   " highlight matching searches
"set foldenable   " enable block folding
"set foldnestmax=2    " max nested folds
"set foldlevelstart=2   " collapse all block by default
"set foldmethod=indent " fold based on indentation

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" navigate splits using ctrl+hjkl
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
