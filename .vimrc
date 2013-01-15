set tabstop=4
set shiftwidth=4
filetype plugin indent on
syntax on

set number
highlight LineNr ctermfg=LightGrey

set mouse=a
set autowrite

let Tlist_Exit_OnlyWindow = 1

" Quickfix-Fenster automatisch schließen
aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif

set makeprg=(scons\ &&\ ./test)
map <F5> :make<CR>
imap <F5> <Esc>:make<CR>a

" Nach :make in den richtigen Tab springen
set switchbuf=useopen,usetab,newtab

" Zwischen Header und Implementation wechseln
map <F11> :A<CR>
imap <F11> <Esc>:A<CR>a

set ssop-=options " do not store global and local values in a session
set ssop-=folds " do not store folds
map <F12> :wa<CR>:mksession!<CR>:qa<CR>

" make arrow keys work in visual mode
vmap <Esc>OA k
vmap <Esc>OB j
vmap <Esc>OC l
vmap <Esc>OD h
" simulate shift-arrows (select block in windows) with control-arrows
inoremap <Esc>[A <C-O>vk
vnoremap <Esc>[A k
inoremap <Esc>[B <C-O>vj
vnoremap <Esc>[B j
inoremap <Esc>[C <C-O>vl
vnoremap <Esc>[C l
inoremap <Esc>[D <C-O>vh
vnoremap <Esc>[D h
