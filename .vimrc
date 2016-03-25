

set nocompatible              " be iMproved, required
filetype off                  " required
syntax on
set guioptions=
set number
set noerrorbells 
set novisualbell
set macmeta
autocmd! GUIEnter * set vb t_vb=
set noeb vb t_vb=
au GUIEnter * set vb t_vb=


set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'zsoltf/vim-maui.git'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
"Plugin 'skammer/vim-css-color'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-fugitive'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'ap/vim-buftabline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'antlypls/vim-colors-codeschool'
Plugin 'qualiabyte/vim-colorstepper'
Plugin 'flazz/vim-colorschemes'

call vundle#end()            " required
filetype plugin indent on    " required

colorscheme maui

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

set directory^=$HOME/.vim/swap//

let g:airline_powerline_fonts = 1


function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction

:nnoremap <C-e> :NERDTreeToggle<CR>
:nnoremap <C-J> :bnext<CR>
:nnoremap <C-K> :bprev<CR>

:nnoremap <C-x> :call MaximizeToggle()<CR> 

:nnoremap <C-i> :ClearAllCtrlPCaches<CR>

:nnoremap <C-A-u> :Gstatus<CR>
:nnoremap <C-A-i> :Gdiff<CR>





" tricks handlebars syntax highlighting
au BufReadPost *.hbs set syntax=html

" fix backspace issue
set backspace=indent,eol,start

" force lightline
set laststatus=2
