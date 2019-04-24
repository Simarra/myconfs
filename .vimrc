"vundle
set nocompatible
filetype off
:set showcmd
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
"git interface
Plugin 'tpope/vim-fugitive'
"git show modifs
Plugin 'airblade/vim-gitgutter'
"filesystem
Plugin 'scrooloose/nerdtree'
"Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim' 
Plugin 'ryanoasis/vim-devicons'
Plugin 'majutsushi/tagbar'
"html
"  isnowfy only compatible with python not python3
"Plugin 'isnowfy/python-vim-instant-markdown'
"Plugin 'jtratner/vim-flavored-markdown'
"Plugin 'suan/vim-instant-markdown'
"Plugin 'nelstrom/vim-markdown-preview'
"Plugin 'vim-scripts/indentpython.vim'
"Plugin 'scrooloose/syntastic'
Plugin 'w0rp/ale'


"auto-completion stuff
Plugin 'python-mode/python-mode'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'davidhalter/jedi-vim'
Plugin 'ambv/black'
Plugin 'Rykka/InstantRst'
"Colors!!!
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'jnurmine/Zenburn'
Plugin 'morhetz/gruvbox'

"beautify
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()

filetype plugin indent on    " enables filetype detection

"autocomplete
let g:ycm_autoclose_preview_window_after_completion=1

"Airline config
let g:airline#extensions#tabline#enabled = 1
autocmd BufDelete * call airline#extensions#tabline#buflist#invalidate()
let g:airline_powerline_fonts = 1
let g:airline_theme='tomorrow'
set noshowmode
"custom keys
let mapleader=","
"
map <F2> :NERDTreeToggle<CR>
map <F7> :PymodeLint<CR>

let NERDTreeIgnore=['\.pyc$', '\~$', '__init__.py$', '\.orig$'] "ignore files in NERDTree

"I don't like swap files
set noswapfile

"turn on numbering
set nu


"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start


"----------Stop python PEP 8 stuff--------------

"js stuff"
" autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

set rtp+=/user/share/powerline/bindings/vim/

" Always show statusline
set laststatus=2


" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
set background=dark


let NERDTreeShowHidden=1

" Plugin python-mode
let g:pymode_python = 'python3'
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8,pylint"
let g:pymode_lint_config = "$HOME/.pylintrc"
let g:pymode_options_max_line_length = 79
let g:pymode_lint_on_write = 1
let g:pymode_virtualenv = 1
let g:pymode_rope = 1
let g:pymode_lint_message = 1
let g:pymode_lint_cwindow = 0
let g:pymode_breakpoint = 1
let g:pymode_motion = 1
let g:pymode_rope_completion = 1
let g:pymode_lint_on_fly = 1
let g:pymode_breakpoint_cmd='import pudb; pudb.set_trace()  # XXX BREAKPOINT'
"pymode symbols
let g:pymode_lint_todo_symbol = ''
let g:pymode_lint_comment_symbol = ''
let g:pymode_lint_visual_symbol = '☲'
let g:pymode_lint_error_symbol = ''
let g:pymode_lint_info_symbol = '☲'
let g:pymode_lint_pyflakes_symbol = '☲'
set wrap

" Disable arrows in normal mode.
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
colorscheme gruvbox

"enable editables buffers
set hidden
" Remap excape key
inoremap jj <Esc> 

