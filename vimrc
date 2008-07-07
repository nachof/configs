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
augroup END

augroup textfiles
  " Make it easier to work with plaintext files
  autocmd FileType text nmap j gj
  autocmd FileType text nmap k gk
  autocmd FileType text set linebreak
augroup END

autocmd FileType ruby,eruby,yaml,html set sw=2
autocmd FileType php set sw=8
autocmd FileType haml set syntax=haml


" Set color scheme for console
set t_Co=16
if !has("gui_running")
  colorscheme nacho
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
