" Don't try to be vi compatible
set nocompatible

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Plugins

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'andymass/vim-matchup'
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'
Plug 'mileszs/ack.vim'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'preservim/nerdcommenter'
Plug 'editorconfig/editorconfig-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install --frozen-lockfile'  }
Plug 'terryma/vim-multiple-cursors'
Plug 'w0rp/ale'
Plug 'kaicataldo/material.vim'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'ianks/vim-tsx'
" Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

" If fzf has already been installed via Homebrew, use the existing fzf
" Otherwise, install fzf. The `--all` flag makes fzf accessible outside of vim
if isdirectory("/usr/local/opt/fzf")
  Plug '/usr/local/opt/fzf'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
endif

Plug 'junegunn/fzf.vim'

" coc extensions
" Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile',
  \ 'for': ['javascript', 'typescript', 'css', 'scss', 'json', 'markdown', 'yaml', 'html'] }

::call plug#end()

let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-tslint-plugin', 'coc-html', 'coc-css', 'coc-phpls', 'coc-yaml', 'coc-python', 'coc-highlight', 'coc-emmet', 'coc-svg', 'coc-xml', 'coc-prettier']
let g:loaded_matchit = 1

if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

if (has('termguicolors'))
  set termguicolors
endif

if has('nvim')
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
" Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Respect modeline in files
set modeline
set modelines=4

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

" Enable line numbers
set number

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END

" Enable syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

let mapleader = ","

" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch

" Clean search (highlight)
 nnoremap <silent> <leader><space> :noh<cr>

 " Map Ctrl + t to open fuzzy find (FZF)
nnoremap <c-t> :Files<cr>
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd

" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Whitespace
set wrap
set textwidth=80
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround
set autoindent

" Always try to show a paragraph’s last line.
set display+=lastline
" Avoid wrapping a line in the middle of a word.
set linebreak

" Enhance command-line completion
set wildmenu

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs

set fileformats=unix,dos,mac

" Allow cursor keys in insert mode
" set esckeys

" Cursor Shape
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_SR = "\<Esc>]50;CursorShape=2\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Searching
set smartcase
set showmatch

set lazyredraw
set confirm

" Automatically re-read files if unmodified inside Vim.
set autoread

" Enable spellchecking.
" set spell

" Ignore files matching these patterns when opening files based on a glob pattern.
" set wildignore+=.pyc,.swp

" ST like
let g:prettier#autoformat = 0
let g:deoplete#enable_at_startup = 1

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

" javascript
let g:javascript_enable_domhtmlcss = 1

" vim-javascript
augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript setl tabstop=4|setl shiftwidth=4|setl expandtab softtabstop=4
augroup END

"Recovery commands from history through FZF
nmap <leader>y :History:<CR>

"" Open current line on GitHub
nnoremap <Leader>o :.Gbrowse<CR>

" Color scheme
set t_Co=256
set background=dark
let g:material_terminal_italics = 0
let g:material_theme_style = 'darker'

augroup MaterialDarkerCustom
    autocmd!
    autocmd ColorScheme * highlight Visual cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=#353535 guifg=NONE
                      \ | highlight StatusLine cterm=NONE ctermbg=231 ctermfg=160 gui=NONE guibg=#ffffff guifg=#d70000
                      \ | highlight Normal cterm=NONE ctermbg=17 gui=NONE guibg=#212121
                      \ | highlight NonText cterm=NONE ctermbg=17 gui=NONE guibg=#212121
                      \ | highlight MatchParen ctermfg=red guifg=blue cterm=underline gui=underline
                      "\ | highlight MatchParenCur cterm=underline gui=underline
                      "\ | highlight MatchWordCur cterm=underline gui=underline
augroup END

colorscheme material

" toggle gundo https://docs.stevelosh.com/gundo.vim/#installation
" nnoremap <leader>u :GundoToggle<CR>

" Strip trailing whitespace (,ss)
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
    set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Save a file as root (,W)
" noremap <leader>W :w !sudo tee % > /dev/null<CR>

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

" session management
let g:session_directory = "~/./session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set guifont=Menlo:h12
    set transparency=7
  endif
else
  let g:CSApprox_loaded = 1

  " IndentLine
  let g:indentLine_enabled = 1
  let g:indentLine_concealcursor = 0
  let g:indentLine_char = '┆'
  let g:indentLine_faster = 1


  if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
  else
    if $TERM == 'xterm'
      set term=xterm-256color
    endif
  endif

endif

let g:loaded_python_provider = 0
let g:netrw_banner = 0
let loaded_netrwPlugin = 1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
