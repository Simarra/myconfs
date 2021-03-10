"{ Main configurations
" pip install pynvim jedi pylint


call plug#begin('~/.local/share/nvim/plugged')

if executable('python')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'zchee/deoplete-jedi'  "Need pip pynvim and jedi
  Plug 'davidhalter/jedi-vim'  " Used only for go to def
  Plug 'ambv/black'
  " disable jedi plugin autocompletion, because we use deoplete for completion
  let g:jedi#completions_enabled = 0
  let g:deoplete#enable_at_startup = 1
  
  " open the go-to function in split, not another buffer
  let g:jedi#use_splits_not_buffers = "right"
  " let g:python3_host_prog = 'C:\Program Files\Python39\python.exe'
  let g:python_highlight_all = 1
endif

if executable('rustc')
 Plug 'rust-lang/rust.vim'
 Plug 'racer-rust/vim-racer'
endif


Plug 'vim-airline/vim-airline' " beautify
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'  " Universal commenter
Plug 'scrooloose/nerdtree'  " Tree explorer
Plug 'neomake/neomake'  " Universal linter (python -> Pylint)
Plug 'morhetz/gruvbox'  " theming
Plug 'ryanoasis/vim-devicons'  " theming
Plug 'tpope/vim-fugitive'  " git things
Plug 'airblade/vim-gitgutter'  " git things
Plug 'majutsushi/tagbar'  " see class and variables well displayed
Plug 'vim-python/python-syntax'


" FZF / Ctrlp for file navigation
if executable('fzf')
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
else
  Plug 'ctrlpvim/ctrlp.vim'
endif


call plug#end()






"========COSMETICS===============
let g:airline#extensions#tabline#enabled = 1
autocmd BufDelete * call airline#extensions#tabline#buflist#invalidate()
let g:airline_powerline_fonts = 1
" COLORIZE NERDTREE
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

"collor Theme
colorscheme gruvbox
set background=dark
set laststatus=2

let g:airline_theme='tomorrow'
" let g:airline_theme='gruvbox' " <theme> is a valid theme name


set termguicolors
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

" ==================EDITORS========================
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

set title
set hidden

let g:neomake_python_enabled_makers = ['flake8']  " formater with pylint
" Remaps
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
" Remap excape key
inoremap jj <Esc>
map <F2> :NERDTreeToggle<CR>
map <F7> :Black<CR>
nnoremap <silent> <Leader>bu :Buffers<CR>
nnoremap <silent> <Leader>co :Commands<CR>
nnoremap <silent> <Leader>fz :FZF<CR>
nnoremap <silent> <Leader>ta :Tags<CR>
nnoremap <silent> <Leader>tt :TagbarToggle<CR>
nnoremap <silent> <Leader>li :Neomake<CR>

" Remap leader key
let mapleader=","


set hidden
set wildmenu

" if using gui frontend
" GuiPopupmenu 0
" GuiTabline 0
" set guifont=Source\ Code\ Pro\ for\ Powerline:h12:cANSI
" set guifont=RobotoMono\ Nerd\ Font\ Mono:h12:cANSI

