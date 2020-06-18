
" Set local config ----------------------------------
if filereadable('/usr/local/bin/python3')
  let g:python3_host_prog='/usr/local/bin/python3'
endif
if filereadable('/home/kieran/.nvm/versions/node/v13.6.0/bin/node')
  let g:coc_node_path = "/home/kieran/.nvm/versions/node/v13.6.0/bin/node"
endif
let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'

" Enable theming support
if (has("termguicolors"))
 set termguicolors
endif
" Set local config ----------------------------------
