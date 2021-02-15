"I don't like swap files
set noswapfile

set wrap

"turn on numbering
set nu

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

syntax on

let g:neomake_python_enabled_makers = ['pylint']  " formater with pylint
