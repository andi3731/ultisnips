autocmd!

silent! call pathogen#runtime_append_all_bundles()
call pathogen#infect()

"set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
set runtimepath+=~/.vim/ultisnips_rep
runtime macros/matchit.vim
" ctrlp
set runtimepath^=~/dotfiles/vim/bundle/ctrlp.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        BASIC EDITING CONFIGURATION                         "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

set autoread
set visualbell
set number
set numberwidth=1
set hidden
set history=1000
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
set showtabline=1
set winwidth=79
"set t_ti= t_te=
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
":set timeout timeoutlen=1000 ttimeoutlen=100
" Set the tag file search order
set tags=./tags;

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              FOLDING OPTIONS                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldcolumn=1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                GUI OPTIONS                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set linespace=5
set guioptions-=T
set guioptions-=m
set guioptions-=e
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
  autocmd FileType php set keywordprg=pman

  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  autocmd FileType ruby,pascal,haml,eruby,yaml,html,sass,cucumber,css set ai sw=2 sts=2 et
  autocmd FileType python,javascript set ai sw=4 sts=4 et

  autocmd! BufRead,BufNewFile *.sass setfiletype sass

  autocmd BufRead *.mkd set ai formatoptions=tcroqn2 comments=n:&gt;
  autocmd BufRead *.markdown set ai formatoptions=tcroqn2 comments=n:&gt;

  autocmd! FileType mkd setlocal syn=off

  autocmd! CmdwinEnter * :unmap <cr>
  autocmd! CmdwinLeave * :call MapCR



  autocmd! FileType c  map <leader>r :! clear && make %:r && ./%:r<cr>
  autocmd  FileType c map <leader>v :! clear && valgrind ./%:r<cr>
  autocmd  FileType c map <leader>g :! clear && cgdb ./%:r<cr>
  autocmd! FileType pascal map <leader>r :! clear && pc %:r && ./%:r<cr>
  autocmd! FileType php  map <leader>r :! clear && php %<cr>

augroup END

augroup ruby
  autocmd!
  au BufRead,BufNewFile *.ru setfiletype ruby
  " For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
  autocmd BufNewFile,BufRead *_spec.rb compiler rspec
  " .ru and .thor are Ruby.
  au BufRead,BufNewFile *.ru set filetype=ruby
  au BufRead,BufNewFile *.thor set filetype=ruby
augroup END
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   COLOR                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

set background=light
if !has("gui_running")
  colorscheme t256
else
  colorscheme badwolf
endif
set guifont=PragmataPro\ for\ Powerline\ 10

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                STATUS LINE                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               MISC KEY MAPS                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle between two files
map ,f <C-^>
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
" Scoala, PASCAL
autocmd FileType pascal inoremap <C-l> <space>:=<space>
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
autocmd! FileType ruby map <Leader>r :!clear && ruby %<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         ARROW KES ARE UNCCEPTABLE                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Left> :echo "no!"<cr>
map <Right> :echo "no!"<cr>
map <Up> :echo "no!"<cr>
map <Down> :echo "no!"<cr>

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
let g:xmpfilter_cmd = "xmpfilter -a --no-warnings"
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
autocmd FileType ruby inoremap <F6> <C-R>=Ruby_eval_insert_hash()<cr>
autocmd FileType ruby map <F4> :call Ruby_eval_no_align()<cr>
autocmd FileType ruby inoremap <F4> <C-R>=Ruby_eval_no_align()<cr>
autocmd FileType ruby map <leader><leader>m <Plug>(xmpfilter-mark)
autocmd FileType ruby map  <leader><leader>M 0f#Dx0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            OPEN URL UNDERCURSOR                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>o gx

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

""""""""""""""
"  supertab  "
""""""""""""""



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
imap <C-@> <C-y>,
imap <C-e> <C-y>,
let g:user_emmet_mode='a'    "enable all function in all mode.
let g:emmet_html5=1

imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
map <leader>y <C-y>n
map <leader>Y <C-y>N

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
"""""""""""
"  ctrlp  "
"""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       PROMOTE VARIABLE TO RSPEC LET                        "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>p :PromoteToLet<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               get image size                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:getImageSize(path)
  let type = ''
  let width = -1
  let height = -1
  let hex = substitute(system('curl -s "'.a:path.'" | xxd -p'), '\n', '', 'g')
  if hex =~ '^89504e470d0a1a0a'
    let type = 'png'
    let width = eval('0x'.hex[32:39])
    let height = eval('0x'.hex[40:47])
  endif
  if hex =~ '^ffd8'
    let pos = match(hex, 'ffc[02]')
    let type = 'jpg'
    let height = eval('0x'.hex[pos+10:pos+11])*256 + eval('0x'.hex[pos+12:pos+13])
    let width = eval('0x'.hex[pos+14:pos+15])*256 + eval('0x'.hex[pos+16:pos+17])
  endif
  if hex =~ '^47494638'
    let type = 'gif'
    let width = eval('0x'.hex[18:19].hex[16:17])
    let height = eval('0x'.hex[14:15].hex[12:13])
  endif
  return {'type':type, 'width':width, 'height':height}
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           usingvim as hex editor                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>h :%!xxd<cr>
map <leader>H :%!xxd -r<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  vim-over                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" thing about some mapping for this plugin
" :OverCommandLine
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"          Set tabstop, softtabsop and shiftwidth to the same value          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction

function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       toggle beetwen tabs and spces                        "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" allow toggling between local and default mode
function! TabToggle()
  if &expandtab
    set noexpandtab
  else
    set expandtab
  endif
endfunction
nmap <F9> mz:execute TabToggle()<CR>'z
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 live vimrc                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Source the vimrc file after saving it
if has("autocmd")
  autocmd! bufwritepost .vimrc source $MYVIMRC
endif
nmap <leader>vr :tabedit $MYVIMRC<CR>
