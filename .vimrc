"---------------------------------------------------------------------------
" basic settings:
set nocompatible                   " use vim defaults rather than vi defaults
set fileencoding=utf-8             " UTF-8, always
set encoding=utf-8                 " UTF-8, always
set autoread                       " reload files if they change
set backspace=indent,eol,start     " allow backspace everywhere
set showfulltag                    " show full tags for completion
set showmatch                      " briefly jump to matching bracket
set diffopt=filler,iwhite          " ignore whitespace in diffs

"---------------------------------------------------------------------------
" tab settings:
set tabstop=2                      " numbers of spaces of tab character
set shiftwidth=2                   " numbers of spaces to (auto)indent
set expandtab                      " spaces, not tabs
set smarttab                       " make tab and backspace smarter

"---------------------------------------------------------------------------
" visual settings:
colorscheme ir_black
set background=dark                " adapt colors for background
set guioptions-=T                  " disable toolbar
set cursorline                     " highlight the current line
set ruler                          " show the cursor position all the time
set number                         " show line numbers
set title                          " show title in console title bar
set ttyfast                        " smoother changes
set lazyredraw                     " don't redraw when we don't have to
set showcmd                        " show extra command info

"---------------------------------------------------------------------------
" Fullscreen options
" There might well be a cleaner way of doing this.
autocmd GUIEnter * set fuoptions=maxvert,maxhorz      " fullscreen should take the whole screen
set guioptions-=L                  " Get rid of left scrollbar on vsplits
set guioptions-=r                  " Get rid of right scrollbar

"---------------------------------------------------------------------------
" window settings:
set laststatus=2                   " always show status line
set hidden                         " make :q hide, rather than destroy, buffers
set scrolloff=3                    " always show some context
set sidescrolloff=5                " even left/right

"---------------------------------------------------------------------------
" search settings:
set hlsearch                       " highlight searches
set incsearch                      " do incremental searching
set ignorecase                     " ignore case when searching
set autoindent                     " always set autoindenting on
set smartindent                    " smart indent
set cindent                        " cindent

"---------------------------------------------------------------------------
" syntax settings:
syntax on                          " syntax highlighing
filetype on                        " enable filetype detection
filetype indent on                 " enable filetype-specific indenting
filetype plugin on                 " enable filetype-specific plugins

"---------------------------------------------------------------------------
" key mappings:
noremap <Space> <PageDown>         " space=pagedown
noremap -       <PageUp>           " -=pageup

" use \d to toggle the NERDTree explorer thingy
nmap <leader>d :NERDTreeToggle<CR>
" use \t to start the FuzzyFinder thingy
map <leader>t :FuzzyFinderTextMate<CR>
" use \T to toggle the taglist
map <leader>T :TlistToggle<CR>
" use \b to start the FuzzyFinder doodad for buffers
map <leader>b :FuzzyFinderBuffer<CR>
 

"---------------------------------------------------------------------------
" modelines:
" rather preposterously, modelines in files can be abused to execute
" arbitrary code: see http://www.guninski.com/vim1.html for details.
" the securemodelines vim plugin limits the options settable in a
" modeline to a more reasonable subset; see 
" http://www.vim.org/scripts/script.php?script_id=1876
set modelines=0                    " disable normal modelines
set nomodeline                     " no, really.
let g:secure_modelines_verbose=1   " make securemodelines complain
let g:secure_modelines_modelines=5 " 5 available modelines

"---------------------------------------------------------------------------
" Auto/Omnicompletion:
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete

"--------------------------------------------------------------------------
" AutoComplPop plugin
let g:AutoComplPop_NotEnableAtStartup = 1 " disable autocomplpop (for now)

"--------------------------------------------------------------------------
" Fixups for text editing
autocmd BufNewFile,BufRead *.txt set nocindent   " C-style indent doesn't work for text
autocmd BufNewFile,BufRead *.txt UniCycleOn      " Enable fancy unicode character editing
autocmd BufNewFile,BufRead *.txt set textwidth=78 " Wrap at a reasonable margin
autocmd BufNewFile,BufRead *.txt set formatoptions=tqn1 " Format paragraphs
autocmd BufNewFile,BufRead *.txt set ft=mkd      " Presume it’s markdown.

au! BufRead,BufNewFile *.json setfiletype json 
