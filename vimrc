autocmd!

silent! call pathogen#runtime_append_all_bundles()
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
set runtimepath+=~/.vim/ultisnips_rep
runtime macros/matchit.vim
" ctrlp
set runtimepath^=~/dotfiles/vim/bundle/ctrlp.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        BASIC EDITING CONFIGURATION                         "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

set visualbell
set number
set numberwidth=1
set hidden
set history=10000
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set autoindent
set laststatus=2
set showmatch
set showmode
set incsearch
set hlsearch
" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase
set cursorline
set cmdheight=1
set switchbuf=useopen
set showtabline=2
set winwidth=79
"set t_ti= t_te=
set scrolloff=3
set backup
set backupdir=~/.vim-tmp,~/.tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,/var/tmp,/tmp
set backupdir=~/.vim-tmp,~/.tmp,/var/tmp,/tmp
set undofile
set undodir=/tmp/vimundo
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" display incomplete commands
set showcmd
" Enable syntax hightlighting
syntax on
" Enable file type detection.
filetype off
filetype on
filetype plugin indent on
set wildmode=full
" make tab completion for files/buffers act like bash
set wildmenu
" set list chars
set list
set listchars=tab:\.\ ,trail:-,eol:\¬
set linebreak
set showbreak=>\ 
set encoding=utf-8
set fileencoding=utf-8
" o-prefixed numbers are still decimal 
set nrformats-=octal


" leader key
let mapleader=","

" Fix slow O inserts
:set timeout timeoutlen=1000 ttimeoutlen=100
" Set the tag file search order
set tags=./tags;

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                GUI OPTIONS                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set linespace=10
set guioptions-=T
set guioptions-=m
set guioptions-=L
set guioptions-=r
set guioptions+=lrb
set guioptions-=lrb
autocmd GUIEnter * set vb t_vb= " for your GUI
autocmd VimEnter * set vb t_vb=

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              CUSTOM AUTOCMDS                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!
  autocmd FileType text setlocal textwidth=78

  " automatically reload vimrc when it's saved
  au BufWritePost .vimrc so ~/.vimrc

  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  autocmd FileType ruby,haml,eruby,yaml,html,sass,cucumber,css set ai sw=2 sts=2 et
  autocmd FileType python,javascript set ai sw=4 sts=4 et

  autocmd! BufRead,BufNewFile *.sass setfiletype sass

  autocmd BufRead *.mkd set ai formatoptions=tcroqn2 comments=n:&gt;
  autocmd BufRead *.markdown set ai formatoptions=tcroqn2 comments=n:&gt;

  " Indent p tags
  autocmd FileType html,eruby
    \ if g:html_indent_tags !~ '\\|p\>' | let g:html_indent_tags = '\|p\|li\|dt\|dd' endif

  autocmd! FileType mkd setlocal syn=off

  autocmd! CmdwinEnter * :unmap <cr>
  autocmd! CmdwinLeave * :call MapCR

  au BufRead,BufNewFile *.ru setfiletype ruby
  " For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
  autocmd BufNewFile,BufRead *_spec.rb compiler rspec
  " .ru and .thor are Ruby.
  au BufRead,BufNewFile *.ru set filetype=ruby
  au BufRead,BufNewFile *.thor set filetype=ruby


  " Scoala, PASCAL
  autocmd FileType pascal inoremap <C-l> := 

augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   COLOR                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

set background=dark
if !has("gui_running")
  colorscheme t256          " Tomorrow Theme
else
  colorscheme chance-of-storm
endif
set guifont=PragmataPro\ for\ Powerline\ 10

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                STATUS LINE                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               MISC KEY MAPS                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move around split with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" toggle window
map <leader>w <c-w>w
" toggle Fold
nnoremap <Space> za
" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>
" delimitMate
imap <C-K> <Plug>delimitMateS-Tab
" Clear the search buffer when hitting return
function! MapCR()
  nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()

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
" toggle list chars
nmap <leader>l :set list!<cr>
" Run ruby
map <Leader>r :!clear && ruby %<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         ARROW KES ARE UNCCEPTABLE                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                  OPEN FILES IN DIRECTORY OF CURRENT FILE                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR><CR>
map <Leader>s :split <C-R>=expand("%:p:h") . '/'<CR><CR>
map <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR><CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            RENAME CURRENT FILE                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             XMPFILTER SETTINGS                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F5> <Plug>(xmpfilter-run)
imap <F5> <Plug>(xmpfilter-run)

function! Ruby_eval_insert_hash()
  let curline=line(".")
  exec "normal A # => \<esc>\<F5>\0"
  exec "normal ggVG:Tabularize /# =>\<cr>"
  execute 'silent '.curline
  unlet curline
endfunction

function! Ruby_eval_no_align()
  exec "normal A # => \<esc>\<F5>\0"
endfunction

autocmd FileType ruby map <F6> :call Ruby_eval_insert_hash()<cr>
autocmd FileType ruby inoremap <F6> :call Ruby_eval_insert_hash()<cr>
autocmd FileType ruby map <F4> :call Ruby_eval_no_align()<cr>
autocmd FileType ruby inoremap <F4> :call Ruby_eval_no_align()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            OPEN URL UNDERCURSOR                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenUrlUnderCursor()
  let url=matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*')
  if url != ""
    silent exec "!open '".url."'" | redraw!
  endif
endfunction
map <leader>o :call OpenUrlUnderCursor()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              PLUGINS SETTINGS                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""
"  nerdtree  "
""""""""""""""
nnoremap <F3> :NERDTreeMirror<CR>
silent! map <F2> :NERDTreeToggle<cr>
"Show hidden files in NerdTree
let NERDTreeShowHidden=1
let g:NERDTreeHijackNetrw=0
"""""""""""""""""""
"  Buff Explorer  "
"""""""""""""""""""
let g:bufExplorerShowRelativePath=1
"""""""""""""""
"  rails.vim  "
"""""""""""""""
" Change which file opens after executing :Rails command
let g:rails_default_file='config/database.yml'
""""""""""""""
"  syntasic  "
""""""""""""""
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
"""""""""""
"  emmet  "
"""""""""""
imap <C-e> <C-y>,
let g:user_emmet_mode='a'    "enable all function in all mode.
let g:emmet_html5=1
"""""""""""""""""
"  delimitmate  "
"""""""""""""""""
let delimitMate_expand_cr = 1
"""""""""""""""
"  ultisnips  "
"""""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
map <Leader>m :call UltiSnips_ListSnippets()<cr>
