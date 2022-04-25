" VIMRC
" Settings -------------------------------------------------------- {{{
set encoding=utf-8

set laststatus=2

set number
set relativenumber

set showmode
set showcmd

set list
set listchars=tab:>-,trail:-,nbsp:+,eol:҂,extends:>,precedes:<
" set listchars=tab:>-,trail:-,eol:¶,nbsp:+,extends:>,precedes:<,multispace:---•,lead:𝅛
hi NonText ctermfg=DarkGrey
set colorcolumn=80
hi ColorColumn ctermbg=5 guibg=#423880
hi CursorLine cterm=none ctermbg=Gray ctermfg=0 guibg=Gray
hi CursorColumn cterm=none ctermbg=Gray ctermfg=0 guibg=Gray
set background=dark
hi Normal ctermbg=0 ctermfg=7

set expandtab tabstop=2 shiftwidth=2 textwidth=79

" }}}

" Mappings -------------------------------------------------------- {{{
""  Simple mappings ----------------------------------------------- {{{
" Quicker Escape from insert mode to normal
inoremap jj <ESC>

" Allow crosshair cursor highlighting
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" Toggle search highlight OFF
nnoremap <CR> <CR>:noh<CR>

" Remap Help for object under cursor
nnoremap <C-h> <M-K>
vnoremap <C-h> <M-K>
inoremap <C-h> <Esc><M-K>

" Go to next tab
nnoremap <Leader><Tab> <C-PageDown>
" Go to previous tab
nnoremap <Leader><S-Tab> <C-PageUp>

""" Easier window navigation -------------------------------------- {{{
"""" Terminal mode ------------------------------------------------ {{{
:tnoremap <A-H> <C-\><C-N>:wincmd h<cr>
:tnoremap <A-h> <C-\><C-N>:wincmd h<cr>
:tnoremap <A-J> <C-\><C-N>:wincmd j<cr>
:tnoremap <A-K> <C-\><C-N>:wincmd k<cr>
:tnoremap <A-L> <C-\><C-N>:wincmd l<cr>
:tnoremap <A-l> <C-\><C-N>:wincmd l<cr>
"""" }}}
"""" Insert mode -------------------------------------------------- {{{
:inoremap <A-H> <C-\><C-N>:wincmd h<cr>
:inoremap <A-h> <C-\><C-N>:wincmd h<cr>
:inoremap <A-J> <C-\><C-N>:wincmd j<cr>
:inoremap <A-K> <C-\><C-N>:wincmd k<cr>
:inoremap <A-L> <C-\><C-N>:wincmd l<cr>
:inoremap <A-l> <C-\><C-N>:wincmd l<cr>
"""" }}}
"""" Normal mode -------------------------------------------------- {{{
" Left
:nnoremap <A-H> :wincmd h<cr>
:nnoremap <Leader>h :wincmd h<cr>
:nnoremap <A-h> :wincmd h<cr>
" Down
:nnoremap <Leader>j :wincmd j<cr>
:nnoremap <A-J> :wincmd j<cr>
" Up
:nnoremap <Leader>k :wincmd k<cr>
:nnoremap <A-K> :wincmd k<cr>
" Right
:nnoremap <A-L> :wincmd l<cr>
:nnoremap <Leader>l :wincmd l<cr>
:nnoremap <A-l> :wincmd l<cr>
"""" }}}
""" }}}

""" Terminal mappings --------------------------------------------- {{{
" To map <Esc> to exit terminal-mode:
:tnoremap <Esc> <C-\><C-n>
:tnoremap jj <C-\><C-n>

" To simulate |i_CTRL-R| in terminal-mode:
:tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
""" }}}

""" Move lines ---------------------------------------------------- {{{
"""" Normal mode -------------------------------------------------- {{{
nnoremap <M-Up> :m-2<CR>==
nnoremap <M-k> :m-2<CR>==
nnoremap <M-Down> :m+1<CR>==
nnoremap <M-j> :m+1<CR>==
"""" }}}
"""" Visual mode -------------------------------------------------- {{{
vnoremap <M-Up> :m'<-2<CR>gv=gv
vnoremap <M-k> :m'<-2<CR>gv=gv
vnoremap <M-Down> :m'>+1<CR>gv=gv
vnoremap <M-j> :m'>+1<CR>gv=gv
"""" }}}
"""" Insert mode -------------------------------------------------- {{{
inoremap <M-Up> <Esc>:m.-2<CR>==gi
inoremap <M-k> <Esc>:m.-2<CR>==gi
inoremap <M-Down> <Esc>:m.+1<CR>==gi
inoremap <M-j> <Esc>:m.+1<CR>==gi
"""" }}}
""" }}}
"" }}}

"" Advanced mappings ---------------------------------------------- {{{
""" Toggle Comments ----------------------------------------------- {{{
source ~/.vim/toggleComment.vim
"""" Not inline_mode {{{
""""" Terminal specific mappings {{{
if has('ttyout')
  nnoremap <C-_> :call ToggleComment('n',0)<CR>
  vnoremap <C-_> :call ToggleComment('v',0)<CR>
  inoremap <C-_> <C-o>:call ToggleComment('i',0)<CR>
""""" }}}
""""" GUI specific mappings {{{
else
  nnoremap <C-/> :call ToggleComment('n',0)<CR>
  vnoremap <C-/> :call ToggleComment('v',0)<CR>
  inoremap <C-/> <C-o>:call ToggleComment('i',0)<CR>
endif

""""" }}}
" Go back to visual selection after commenting
vnoremap <Leader>/ :call ToggleComment('v',0)<CR>gv
"""" }}}
"""" inline_mode {{{
nnoremap <Leader>/ :call ToggleComment('n',1)<CR>
inoremap <M-/> <C-o>:call ToggleComment('i',1)<CR>
"""" }}}
""" }}}

""" Smarter db ---------------------------------------------------- {{{
nnoremap db :call DeleteBackWord(0)<CR>
nnoremap dB :call DeleteBackWord(1)<CR>

function! DeleteBackWord(capital_mode)
  " Gets the character after the cursor
  let l:next_char = getline(".")[col(".")]
  " Check if it's a whitespace
  if l:next_char !~# '\S'
    " whitespace, delete around word
    if a:capital_mode == 0
      call feedkeys('daw', 'n')
    else
      call feedkeys('daW', 'n')
    endif
  else
    " NOT whitespace, go 1 char right, then delete backward
    if a:capital_mode == 0
      call feedkeys('ldb', 'n')
    else
      call feedkeys('ldB', 'n')
    endif
  endif
endfunction
""" }}}
"" }}}
" }}}

" filetype settings ----------------------------------------------- {{{
"" Python settings ------------------------------------------------- {{{

let g:python3_host_prog = 'C:\Users\User\AppData\Local\Programs\Python\Python39\python.exe'

autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 textwidth=79
autocmd FileType python map <Leader>p :w<CR>:!python %<CR>
"imap <Leader>p <esc>:w<CR>:exec '!python' shellescape(@%, 1)<CR>
"" }}}

"" HTML, CSS, JS, SHELL settings ----------------------------------- {{{
autocmd FileType html css javascript shell setlocal expandtab tabstop=2 shiftwidth=2 textwidth=79
"" }}}

"" VIM settings ---------------------------------------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
"" }}}
" }}}
