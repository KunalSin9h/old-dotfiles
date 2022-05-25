"General Editor Setting
set autoread                    " Auto reload file after external commandset relativenumber
set binary                      " Enable binary support
set number                      " Show line numbers
set ttyfast                     " Fast terminal

" Move between open buffers
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprev<CR>

set nohlsearch
set noerrorbells

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set cindent  
set smartindent

set nowrap
set incsearch
set scrolloff=6
set backspace=indent,eol,start
syntax on
set encoding=utf-8
set nocompatible
set belloff=all
set signcolumn=number

"Cursor Style on diff mode(Insert & Normal)
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

"Esc to jj
imap jj <Esc>
inoremap {<CR> {<CR>}<Esc>O

"Extra file
set noundofile
set noswapfile
set nobackup

"Remember folds
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END

"let g:solarized_termcolors=256
set background=dark
"colorscheme solarized
"colorscheme zenburn
colorscheme gruvbox
"colorscheme onehalfdark
"colorscheme onehalflight

"Append template to new C++ files
autocmd BufNewFile *.cpp 0r ~/.vim/templates/skeleton.cpp

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-dispatch'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'bling/vim-bufferline' "show the list of buffers in the command bar
Plugin 'delimitMate.vim' "completion for quotes, parens, brackets

call vundle#end()            " required
filetype plugin indent on    " required

"Disable new window popin when YouCompleteMe suggest something
set completeopt-=preview

"General shotcut for compiling and running
" you need cp.sh in computer to work 
set makeprg=cp.sh\ %:r
autocmd filetype cpp nnoremap <F5> :w <bar> Make <CR> 
autocmd filetype cpp nnoremap <F6> :vertical terminal ++shell ++cols=40 ./%:r<CR>
autocmd filetype cpp nnoremap <F8> :!./%:r<CR>

"CodeForces specific
nnoremap <F9> :vertical terminal ++shell ++cols=40 cf test<CR>
nnoremap <F12> :vertical terminal ++shell ++cols=40 cf submit<CR>

"vim utility
" :q with <F2>
nnoremap <F2> :q <CR>

"c++ highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1

"trigger through shift
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"
let g:UltiSnipsEditSplit="vertical"
