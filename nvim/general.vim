" UI options
set termguicolors
set number
set relativenumber
set ruler
set showmatch
set matchtime=2
set breakindent
set colorcolumn=80
set cursorline
set wildmode=longest:full,full
set wildmenu
set background=dark
colorscheme seoul256
set noshowmode
set t_Co=
set guioptions+=a
set mouse=a

" Make Vertical Split nice
set fillchars+=vert:│
hi VertSplit gui=NONE guifg=#4e4e4e

" Look for external vimrc
set exrc


" Clipboard
set clipboard+=unnamed

" Fix background for FZF
highlight Normal ctermbg=none

" Syntax highlighting options for Fortran
let fortran_free_source=1
let fortran_more_precise=1
let fortran_do_enddo=1
autocmd BufRead,BufNewFile *.f syn match fortranComment excludenl "^[!c*].*$" contains=@fortranCommentGroup,@spell


" Seoul256 colors in the terminal
let g:terminal_color_0  = "#4e4e4e"
let g:terminal_color_1  = "#d68787"
let g:terminal_color_2  = "#5f865f"
let g:terminal_color_3  = "#d8af5f"
let g:terminal_color_4  = "#85add4"
let g:terminal_color_5  = "#d7afaf"
let g:terminal_color_6  = "#87afaf"
let g:terminal_color_7  = "#d0d0d0"
let g:terminal_color_8  = "#626262"
let g:terminal_color_9  = "#d75f87"
let g:terminal_color_10 = "#87af87"
let g:terminal_color_11 = "#ffd787"
let g:terminal_color_12 = "#add4fb"
let g:terminal_color_13 = "#ffafaf"
let g:terminal_color_14 = "#87d7d7"
let g:terminal_color_15 = "#e4e4e4"

" Text options
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent
set modeline

" Search options
set ignorecase
set smartcase
set magic
set inccommand=nosplit

" Folding
set foldmethod=syntax

" Buffers
set foldmethod=syntax
set hidden

" Backup
set backupdir=/tmp
set backupskip+=tmp/*

" No trailing whitespace (+ save cursor position)
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Start EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

