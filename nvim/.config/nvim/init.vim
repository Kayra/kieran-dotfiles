scriptencoding utf-8

" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

highlight Folded guibg=grey guifg=purple

let $NVIM_COC_LOG_LEVEL = 'debug'
let mapleader="\<Space>"

" Plugins ----------------------------------------- 
" auto-install vim-plug
if has("autocmd")
  " Enable file type detection
  filetype plugin indent on

  " autocmd bufwritepost init.vim source $MYVIMRC " for some reason really
  " laggy
  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

  if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
  endif
endif

" Plugins ----------------------------------------- 
call plug#begin('~/.config/nvim/plugged')
Plug 'ambv/black'
Plug 'glepnir/lspsaga.nvim'
Plug 'godlygeek/tabular'
Plug 'hrsh7th/nvim-compe'
Plug 'janko/vim-test'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'puremourning/vimspector'
Plug 'sbdchd/neoformat'
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'simrat39/symbols-outline.nvim'
Plug 'szw/vim-maximizer'
Plug 'takac/vim-hardtime'
Plug 'theprimeagen/vim-be-good'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'unblevable/quick-scope'
Plug 'vim-airline/vim-airline'
Plug 'vim-utils/vim-man'
Plug 'vimwiki/vimwiki'
Plug '~/.config/nvim/plugged/BufOnly' " https://github.com/vim-scripts/BufOnly.vim/blob/master/plugin/BufOnly.vim
Plug '~/.config/nvim/plugged/LocalVim' " local config
call plug#end()

" Mappings ---------------------------------------- 
nmap <F1> :NERDTreeToggle<CR>
nmap <F2> :colorscheme random<CR>
nmap <F3> :TagbarToggle<CR>
nmap <F4> :source $MYVIMRC<CR>
nmap <C-p> :GFiles<CR>
nmap <C-f> :Files<CR>
nmap <C-g> :SearchProjectAndDotfiles<CR>
nmap <leader>v :tabedit $MYVIMRC<CR>
nmap <leader>b :BufOnly<CR>:A<CR>
nmap <leader><Space> :bn<CR>
nmap gb :Buffers<CR>
inoremap jj <ESC>
inoremap jk <esc>
inoremap kj <esc>
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>

" TODO finding
noremap <leader>t :noautocmd vimgrep /TODO/j ./src**/*<CR>:cw<CR>

" permanent very magic mode (for vim regex)
nnoremap / /\v
vnoremap / /\v
cnoremap %s/ %smagic/
cnoremap \>s/ \>smagic/
nnoremap :g/ :g/\v
nnoremap :g// :g//

" jump list
nnoremap <C-L> <C-I>

" Testing mappings
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :w<CR>:TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
" Mappings ---------------------------------------- 

" vim wiki
set nocompatible

set background=light

" Vim hardtime
let g:hardtime_default_on = 0

" FZF
" hide fzf status line
autocmd! FileType fzf set laststatus=0 noshowmode noruler
      \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
command! -bang SearchProjectAndDotfiles call fzf#run(fzf#wrap({ 'source': 'git ls-files ; git --git-dir="$HOME/git/scripts/.git" ls-files | xargs -I {} sh -c "echo $HOME/git/scripts/{};"', 'sink': 'e'}, <bang>0))


" Settings
let g:list_of_normal_keys = ["h", "j", "k", "l", "-", "+"]
let g:list_of_visual_keys = ["h", "j", "k", "l", "-", "+"]
let g:list_of_insert_keys = []
let g:list_of_disabled_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
set clipboard=unnamedplus " see https://vi.stackexchange.com/questions/84/how-can-i-copy-text-to-the-system-clipboard-from-vim
set cmdheight=2 " Better display for messages
set signcolumn=no " always show signcolumns
set autoindent                        " maintain indent of current line
set backspace=indent,start,eol        " allow unrestricted backspacing in insert mode

if exists('$SUDO_USER')
  set nobackup                        " don't create root-owned files
  set nowritebackup                   " don't create root-owned files
  set noswapfile                      " don't create root-owned files
else
  set backupdir=~/.nvim/tmp/backup     " keep backup files out of the way
  set backupdir+=.
  set directory=~/.nvim/tmp/swap//     " keep swap files out of the way
  set directory+=.
endif

if exists('&belloff')
  set belloff=all                     " never ring the bell for any reason
endif

set diffopt+=foldcolumn:0             " don't show fold column in diff view

set noemoji                           " don't assume all emoji are double width
set expandtab                         " always use spaces instead of tabs

if has('folding')
  if has('windows')
    set fillchars=diff:∙               " BULLET OPERATOR (U+2219, UTF-8: E2 88 99)
    set fillchars+=fold:·              " MIDDLE DOT (U+00B7, UTF-8: C2 B7)
    set fillchars+=vert:┃              " BOX DRAWINGS HEAVY VERTICAL (U+2503, UTF-8: E2 94 83)
  endif

  if has('nvim-0.3.1')
    set fillchars+=eob:\              " suppress ~ at EndOfBuffer
  endif

  set foldmethod=indent               " not as cool as syntax, but faster
  set foldlevelstart=5               " start folded
  hi Folded ctermfg=blue
  hi Folded ctermbg=None
endif

if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j                " remove comment leader when joining comment lines
endif

set formatoptions+=n                  " smart auto-indenting inside numbered lists
set guioptions-=T                     " don't show toolbar
set hidden                            " allows you to hide buffers with unsaved changes without being prompted

if !has('nvim')
  set highlight+=@:Conceal            " ~/@ at end of window, 'showbreak'
  set highlight+=D:Conceal            " override DiffDelete
  set highlight+=N:FoldColumn         " make current line number stand out a little
  set highlight+=c:LineNr             " blend vertical separators with line numbers
endif

if exists('&inccommand')
  set inccommand=split                " live preview of :s results
endif

set laststatus=2                      " always show status line
set lazyredraw                        " don't bother updating screen during macro playback

if has('linebreak')
  set linebreak                       " wrap long lines at characters in 'breakat'
endif

set list                              " show whitespace
set listchars=nbsp:⦸                  " CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
set listchars+=tab:▷┅                 " WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7)
" + BOX DRAWINGS HEAVY TRIPLE DASH HORIZONTAL (U+2505, UTF-8: E2 94 85)
set listchars+=extends:»              " RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
set listchars+=precedes:«             " LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
set listchars+=trail:•                " BULLET (U+2022, UTF-8: E2 80 A2)
set modelines=5                       " scan this many lines looking for modeline
set nojoinspaces                      " don't autoinsert two spaces after '.', '?', '!' for join command
set number                            " show line numbers in gutter

if exists('+relativenumber')
  set relativenumber                  " show relative numbers in gutter
endif

set scrolloff=3                       " start scrolling 3 lines before edge of viewport
set shell=sh                          " shell to use for `!`, `:!`, `system()` etc.
set shiftround                        " always indent by multiple of shiftwidth
set shiftwidth=2                      " spaces per tab (when shifting)
set shortmess+=A                      " ignore annoying swapfile messages
set shortmess+=I                      " no splash screen
set shortmess+=O                      " file-read message overwrites previous
set shortmess+=T                      " truncate non-file messages in middle
set shortmess+=W                      " don't echo "[w]"/"[written]" when writing
set shortmess+=a                      " use abbreviations in messages eg. `[RO]` instead of `[readonly]`
if has('patch-7.4.314')
  set shortmess+=c                    " completion messages
endif
set shortmess+=o                      " overwrite file-written messages
set shortmess+=t                      " truncate file messages at start

if has('linebreak')
  let &showbreak='↳ '                 " DOWNWARDS ARROW WITH TIP RIGHTWARDS (U+21B3, UTF-8: E2 86 B3)
endif

if has('showcmd')
  set noshowcmd                       " don't show extra info at end of command line
endif

set sidescroll=0                      " sidescroll in jumps because terminals are slow
set sidescrolloff=3                   " same as scrolloff, but for columns

if v:progname !=# 'vi'
  set softtabstop=-1                  " use 'shiftwidth' for tab/bs at end of line
endif

if has('syntax')
  set spellcapcheck=                  " don't check for capital letters at start of sentence
endif

if has('windows')
  set splitbelow                      " open horizontal splits below current window
endif

if has('vertsplit')
  set splitright                      " open vertical splits to the right of the current window
endif

if exists('&swapsync')
  set swapsync=                       " let OS sync swapfiles lazily
endif
set switchbuf=usetab                  " try to reuse windows/tabs when switching buffers

if has('syntax')
  set synmaxcol=200                   " don't bother syntax highlighting long lines
endif

set tabstop=2                         " spaces per tab


if exists('$SUDO_USER')
  set noundofile                    " don't create root-owned files
else
  set undodir=~/.nvim/tmp/undo       " keep undo files out of the way
  set undodir+=.
  set undofile                      " actually use undo files
endif

set updatecount=80                    " update swapfiles every 80 typed chars
set updatetime=2000                   " CursorHold interval

if has('viminfo') " ie. Vim.
  let s:viminfo='viminfo'
elseif has('shada') " ie. Neovim.
  let s:viminfo='shada'
endif

if exists('s:viminfo')
  if exists('$SUDO_USER')
    " Don't create root-owned files.
    execute 'set ' . s:viminfo . '='
  else
    " Defaults:
    "   Neovim: !,'100,<50,s10,h
    "   Vim:    '100,<50,s10,h
    "
    " - ! save/restore global variables (only all-uppercase variables)
    " - '100 save/restore marks from last 100 files
    " - <50 save/restore 50 lines from each register
    " - s10 max item size 10KB
    " - h do not save/restore 'hlsearch' setting
    "
    " Our overrides:
    " - '0 store marks for 0 files
    " - <0 don't save registers
    " - f0 don't store file marks
    " - n: store in ~/.nvim/tmp
    "
    execute 'set ' . s:viminfo . "='0,<0,f0,n~/.nvim/tmp/" . s:viminfo

    if !empty(glob('~/.nvim/tmp/' . s:viminfo))
      if !filereadable(expand('~/.nvim/tmp/' . s:viminfo))
        echoerr 'warning: ~/.nvim/tmp/' . s:viminfo . ' exists but is not readable'
      endif
    endif
  endif
endif

if has('mksession')
  set viewdir=~/.nvim/tmp/view         " override ~/.nvim/view default
  set viewoptions=cursor,folds        " save/restore just these (with `:{mk,load}view`)
endif

if has('virtualedit')
  set virtualedit=block               " allow cursor to move where there is no text in visual block mode
endif
set visualbell t_vb=                  " stop annoying beeping for non-error errors
set whichwrap=b,h,l,s,<,>,[,],~       " allow <BS>/h/l/<Left>/<Right>/<Space>, ~ to cross line boundaries

" Projectionist settings
let g:projectionist_heuristics = { '*': {} }
" Helper function for batch-updating the g:projectionist_heuristics variable.
function! s:project(...)
  for [l:pattern, l:projection] in a:000
    let g:projectionist_heuristics['*'][l:pattern] = l:projection
  endfor
endfunction

" Set up projections for JS variants.
for s:extension in ['.js', '.jsx', '.ts', '.tsx']
  call s:project(
        \ ['src/*' . s:extension, {
        \   'alternate': [
        \     '__tests__/{}.test' . s:extension,
        \     '__tests__/{dirname}.test' . s:extension
        \   ],
        \   'type': 'source'
        \ }],
        \ ['__tests__/*.test' . s:extension, {
        \   'alternate': [ 
        \     'src/{}' . s:extension,
        \     'src/{}/{basename}' . s:extension
        \  ],
        \   'type': 'test'
        \ }])
endfor
call s:project(
        \ ['*.h', { 'alternate': ['{}.cpp'], 'type': 'source' }],
        \ ['*.cpp', { 'alternate': ['{}.h'], 'type': 'source' }]
        \ )

luafile ~/.config/nvim/lua/plugins/test.lua

" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
"nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
"nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
" auto-format
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)


