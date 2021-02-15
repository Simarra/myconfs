call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'  "Need pip pynvim and jedi
Plug 'davidhalter/jedi-vim'  " Used only for go to def
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
Plug 'ctrlpvim/ctrlp.vim'  " fuzzyfind
Plug 'fisadev/vim-ctrlp-cmdpalette'  " fuzzy find
Plug 'ambv/black'
Plug 'vim-python/python-syntax'
call plug#end()




"Enable plugins
let g:deoplete#enable_at_startup = 1

"ctrlp cmdpalette
let g:ctrlp_cmdpalette_execute = 1