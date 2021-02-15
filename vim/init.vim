"{ Main configurations
" pip install pynvim jedi pylint

let g:config_file_list = ['text.vim',
  \ 'mapping.vim',
  \ 'completion.vim',
  \ 'plugins.vim',
  \ 'airline.vim',
  \ 'theme.vim',
  \ 'nerdtree_ui.vim',
  \ ]

let g:nvim_config_root = expand('<sfile>:p:h')
for s:fname in g:config_file_list
  execute printf('source %s/core/%s', g:nvim_config_root, s:fname)
endfor
execute printf('source %s/specific/python.vim', g:nvim_config_root)
"}
