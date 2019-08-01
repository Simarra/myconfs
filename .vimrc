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
Plugin 'Easymotion/vim-easymotion'
"filesystem
Plugin 'scrooloose/nerdtree'
Plugin 'fisadev/vim-ctrlp-cmdpalette'
"Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim' 
Plugin 'majutsushi/tagbar'

"completion_stuff
Plugin 'w0rp/ale'

"Python stuf
Plugin 'davidhalter/jedi-vim'
Plugin 'deoplete-plugins/deoplete-jedi'
Plugin 'Shougo/deoplete.nvim'
Plugin 'ambv/black'
Plugin 'Rykka/InstantRst'
Plugin 'kiteco/plugins'
Plugin 'plytophogy/vim-virtualenv'

"beautify
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'morhetz/gruvbox'
Plugin 'ryanoasis/vim-devicons'

"Some web stuff
Plugin 'leafgarland/typescript-vim'

call vundle#end()
filetype plugin indent on    " enables filetype detection

"completion
let g:kite_auto_complete = 0
let g:deoplete#enable_at_startup = 1
let g:ale_completion_enabled = 0
"let g:jedi#completions_enabled = 0 "Disable for testing Kite
"let g:jedi#popup_on_dot = 0
"let g:jedi#popup_select_first = 0
let g:deoplete#sources#jedi#show_docstring = 1
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
map <F7> :Black<CR>


"I don't like swap files
set noswapfile

"turn on numbering
set nu

set shell=/usr/bin/zsh

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

"Rope config
"let ropevim_vim_completion=0

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start


"----------Stop python PEP 8 stuff--------------

"js stuff"
" autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

"set rtp+=/user/share/powerline/bindings/vim/

" Always show statusline
set laststatus=2


" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
set background=dark


"Ale config
"let g:ale_echo_msg_error_str = ''
"let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_linters = {'python': ['flake8']}


"let g:pymode_breakpoint_cmd='import pudb; pudb.set_trace()  # XXX BREAKPOINT'
let g:jedi#use_splits_not_buffers = "winwidth"
set wrap

"Navigation stuff

" COLORIZE NERDTREE
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('rst', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('py', 'yellow', 'none', '#F09F17', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('json', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')

"ctrlp cmdpalette
let g:ctrlp_cmdpalette_execute = 1


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
