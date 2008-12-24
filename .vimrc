colorscheme ir_black
set nocompatible    " use vim defaults
set ls=2            " allways show status line
set tabstop=2       " numbers of spaces of tab character
set shiftwidth=2    " numbers of spaces to (auto)indent
set expandtab 	    " spaces, not tabs
set hlsearch        " highlight searches
set incsearch       " do incremental searching
set ruler           " show the cursor position all the time
set number          " show line numbers
set ignorecase      " ignore case when searching 
set title           " show title in console title bar
set ttyfast         " smoother changes
set modeline        " last lines in document sets vim mode
set modelines=3     " number lines checked for modelines
set autoindent      " always set autoindenting on
set smartindent     " smart indent
set cindent         " cindent
set guioptions-=T   " disable toolbar
syntax on           " syntax highlighing
filetype on         " Enable filetype detection
filetype indent on  " Enable filetype-specific indenting
filetype plugin on  " Enable filetype-specific plugins
set fileencoding=utf-8
set encoding=utf8

set background=dark        " adapt colors for background
" space = pagedown, - = pageup
noremap <Space> <PageDown>
noremap - <PageUp>

" Auto/Omnicompletion for various programming languages
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete

