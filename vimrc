set nocompatible                  " Must come first because it changes other options.

silent! call pathogen#runtime_append_all_bundles()
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
set runtimepath+=~/.vim/ultisnips_rep

set undofile
set undodir=/tmp/vimundo
syntax enable                     " Turn on syntax highlighting.
filetype off
filetype on
filetype plugin indent on         " Turn on file type detection.

runtime macros/matchit.vim        " Load the matchit plugin.  
set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.
set encoding=utf-8
set fileencoding=utf-8
set backspace=indent,eol,start    " Intuitive backspacing.

let mapleader=','                 " Set leader key

set hidden                        " Handle multiple buffers better.
set number
set numberwidth=1

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.
set incsearch
set hlsearch
set showmatch

"set winwidth=84
"set winheight=5
"set winminheight=5
"set winheight=999

" set mouse=a                       " Automatically enable mouse usage
" set mousehide                     " Hide the mouse cursor while typing
nnoremap <Leader>cl :set cursorline! <CR>
set cursorline
nnoremap <silent><Leader><space> :nohls<CR>
" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc


set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location
set noswapfile
set visualbell



set tabstop=2                    " Global tab width.
"set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P




" Or use vividchalk
set background=dark
colorscheme tomorrow_night          " Tomorrow Theme
"colorscheme molokai

au BufRead,BufNewFile *.ru setfiletype ruby

" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove
nnoremap <F3> :NERDTreeMirror<CR>


" ctrlp
set runtimepath^=~/dotfiles/vim/bundle/ctrlp.vim

" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby setlocal foldmethod=syntax
" autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2

" For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
autocmd BufNewFile,BufRead *_spec.rb compiler rspec

" Buff Explorer
let g:bufExplorerShowRelativePath=1

" toggle list chars
nmap <leader>l :set list!<cr>


set listchars=tab:\.\ ,trail:-,eol:\¬
set softtabstop=2
set shiftwidth=2
set smartindent
set tabstop=2
set list
set expandtab
set shiftround

set timeout
set timeoutlen=1000
set ttimeoutlen=100

set wrap
set linebreak
set showbreak=>\ 
" set scrolloff=5
set nrformats-=octal           " o-prefixed numbers are still decimal

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

set wildmenu
set wildmode=full


function! OpenUrlUnderCursor()
  let url=matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*')
  if url != ""
    silent exec "!open '".url."'" | redraw!
  endif
endfunction
map <leader>o :call OpenUrlUnderCursor()<cr>


" alt+n or alt+p to navigate between entries in QuickFix
map <silent> <m-p> :cp <cr>
map <silent> <m-n> :cn <cr>
" Change which file opens after executing :Rails command
let g:rails_default_file='config/database.yml'


" Syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1    " Put errors on left side
let g:syntastic_quiet_warnings = 1  " Only errors, not warnings please
let g:syntastic_disabled_filetypes = ['html']
if has('unix')
  let g:syntastic_error_symbol = '★'
  let g:syntastic_style_error_symbol = '>'
  let g:syntastic_warning_symbol = '⚠'
  let g:syntastic_style_warning_symbol = '>'
else
  let g:syntastic_error_symbol = '!'
  let g:syntastic_style_error_symbol = '>'
  let g:syntastic_warning_symbol = '.'
  let g:syntastic_style_warning_symbol = '>'
endif

silent! map <F2> :NERDTreeToggle<cr>

set guifont=PragmataPro\ for\ Powerline\ 10

" .ru and .thor are Ruby.
au BufRead,BufNewFile *.ru set filetype=ruby
au BufRead,BufNewFile *.thor set filetype=ruby

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR><CR>
map <Leader>s :split <C-R>=expand("%:p:h") . '/'<CR><CR>
map <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR><CR>

" Run ruby
map <Leader>r :!clear && ruby %<cr>

"Tabularize maps
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<cr>
  vmap <Leader>a= :Tabularize /=<cr>
  nmap <Leader>a: :Tabularize /:<cr>
  vmap <Leader>a: :Tabularize /:<cr>
endif

" Zen Coding
imap <C-e> <C-y>,
let g:user_emmet_mode='a'    "enable all function in all mode.

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd BufNewFile,BufRead *.html.erb set filetype=html
autocmd BufNewFile,BufRead *.css.scss set filetype=css
autocmd FileType haml set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
au! BufRead,BufNewFile *.erb set filetype=eruby




let delimitMate_expand_cr = 1

"Show hidden files in NerdTree
let NERDTreeShowHidden=1
let g:NERDTreeHijackNetrw=0

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
map <Leader>m :call UltiSnips_ListSnippets()<cr>

" Supertab
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n><c-p>"
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]

" delimitMate
imap <C-K> <Plug>delimitMateS-Tab
map <leader>w <c-w>w

" toggle Fold
nnoremap <Space> za
