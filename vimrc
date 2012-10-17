" Directory to store swap files on
set dir=~/tmp

" Show line numbers
set number

" Default tab settings: width 2, expand to spaces
set tabstop=2
set expandtab
set sw=2

" Map 'go to marked line' to 'go to marked char'
nmap ' `

" Add autoclosing of { when pressing enter
inoremap {<Enter> {<Enter>}<Esc>O

" Find matching anything (useful for html tags)
runtime! macros/matchit.vim

" Activate filetype plugin
filetype plugin on

" Activate indentation by filetypes
filetype indent on

augroup filetypedefinitions
  autocmd BufRead,BufNewFile *.txt setfiletype text
  autocmd BufRead,BufNewFile *.haml setfiletype haml
  autocmd BufRead,BufNewFile *.sass setfiletype sass
augroup END

augroup textfiles
  " Make it easier to work with plaintext files
  autocmd FileType text nmap j gj
  autocmd FileType text nmap k gk
  autocmd FileType text set linebreak
augroup END

autocmd FileType ruby,eruby,yaml,html set sw=2
autocmd FileType php set sw=2
autocmd FileType haml set syntax=haml
autocmd FileType haml set ai
autocmd FileType sass set ai
autocmd FileType plaintex inoremap á \'a
autocmd FileType plaintex inoremap é \'e
autocmd FileType plaintex inoremap í \'i
autocmd FileType plaintex inoremap ó \'o
autocmd FileType plaintex inoremap ú \'u
autocmd FileType plaintex inoremap ñ \~n

" show tabs as blank-padded arrows, trailing spaces as middle-dots
set list
set listchars=tab:→\ ,trail:·


" Set color scheme for console
set t_Co=16
if !has("gui_running")
  colorscheme desert
  highlight Normal ctermbg=Black
endif

" TAB completion
function! InsertTabWrapper(direction)
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    elseif "backward" == a:direction
        return "\<c-p>"
    else
        return "\<c-n>"
    endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>
inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<cr>

" File finder
function! EnterGoToFileWrapper()
  if exists("b:isFileList") && b:isFileList
    return "\<Esc>:edit! <cfile>\<cr>"
  else
    return "\<Esc>\<Enter>"
  endif
endfunction

nnoremap <enter> i<c-r>=EnterGoToFileWrapper()<cr>

map <C-F> <ESC>:split<CR>:new<CR>:let b:isFileList=1<CR>:read ! find \| grep 

" Language mappings for Russian (from ':help russian-keymap')
"set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz,жЖбБюЮ;\;\:,\<.\>




"highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
"match OverLength /\%81v.*/

nnoremap y "+y
vnoremap y "+y
nnoremap d "+d
vnoremap d "+d
nnoremap p "+p
nnoremap P "+P
vnoremap p "+p
vnoremap P "+P

syn on


function! MoveToPrevTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() != 1
    close!
    if l:tab_nr == tabpagenr('$')
      tabprev
    endif
    sp
  else
    close!
    exe "0tabnew"
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

function! MoveToNextTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() < tab_nr
    close!
    if l:tab_nr == tabpagenr('$')
      tabnext
    endif
    sp
  else
    close!
    tabnew
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

nnoremap <C-W>> :call MoveToNextTab()<CR>
nnoremap <C-W>< :call MoveToPrevTab()<CR>

set wildmenu
set wildmode=longest:full

set ruler

set visualbell

