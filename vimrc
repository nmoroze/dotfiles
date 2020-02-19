" Turn on syntax highlighting
syntax on

" Show hybrid line numbers
set number relativenumber
set nu rnu

" Show file stats
set ruler

filetype plugin indent on

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

set mouse=a

" Remove trailing whitespace on save https://stackoverflow.com/a/356130
autocmd BufWritePre * :%s/\s\+$//e

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

