filetype plugin on
set dir=~/tmp

set tabstop=2
set expandtab
set sw=2

set number

inoremap {<Enter> {<Enter>}<Esc>O
nmap ' `

syn on

let java_highlight_java_lang_ids=1
let java_highlight_functions="indent"

" TAB completa
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

filetype indent on

runtime! macros/matchit.vim

augroup filetypedefinitions
  autocmd BufRead,BufNewFile *.txt setfiletype text
augroup END

augroup textfiles
  autocmd FileType text nmap j gj
  autocmd FileType text nmap k gk
  autocmd FileType text set linebreak
augroup END

autocmd FileType ruby,eruby,yaml,html set sw=2
autocmd FileType php set sw=8

set t_Co=16

if !has("gui_running")
  colorscheme nacho
  highlight Normal ctermbg=Black
endif


set modeline
set modelines=2
