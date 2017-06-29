call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/seoul256.vim'
Plug 'jacoborus/tender'
Plug 'morhetz/gruvbox'

Plug 'itchyny/lightline.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/vim-easy-align'
Plug 'neomake/neomake'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

Plug 'ludovicchabant/vim-lawrencium' " Mercurial
Plug 'tpope/vim-fugitive'            " Git

call plug#end()

" Colorscheme settings
let g:gruvbox_contrast_dark = 'hard'
let g:seoul256_background = 233

" NERDTree (FontAwesome)
let g:NERDTreeDirArrowExpandable = "\uf0da"
let g:NERDTreeDirArrowCollapsible = "\uf0d7"

" Neomake
autocmd! BufWritePost * Neomake | redraw
let g:neomake_error_sign = {'text': 'E', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {'text': 'W', 'texthl': 'NeomakeWarningSign'}
let g:neomake_message_sign = {'text': '>', 'texthl': 'NeomakeMessageSign'}
let g:neomake_info_sign = {'text': 'i', 'texthl': 'NeomakeInfoSign'}
let g:neomake_verbose = -1

" Tmuxline
let g:tmuxline_theme = 'lightline_insert'
let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '#W',
      \'c'    : '',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : "\uf073 %Y %b %d",
      \'y'    : "\uf017 %R",
      \'z'    : '#H'}

" FZFd
let g:fzf_layout = { 'down': '~20%' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine','CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine','CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Keyword'],
  \ 'marker':  ['fg', 'Exception'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
imap <c-x><c-f> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
nmap <leader>f :FZF<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>h :History<CR>
nmap <leader>q :History:<CR>
nmap <leader>/ :History/<CR>

autocmd! User FzfStatusLine call lightline#update_once()

" Lightline (using Powerline fonts and FontAwesome)
let g:lightline = {
    \ 'colorscheme': 'seoul256',
    \ 'active': {
        \'left': [[ 'mode', 'paste' ],
        \         [ 'fugitive', 'lawrencium', 'filename' ]]
      \ },
    \ 'component_function': {
        \'readonly':     'LightlineReadonly',
        \'modified':     'LightlineModified',
        \'fugitive':     'LightlineFugitive',
        \'filename':     'LightlineFilename',
        \'fileformat':   'LightlineFileformat',
        \'filetype':     'LightlineFiletype',
        \'fileencoding': 'LightlineFileencoding',
        \'lawrencium':   'LightlineLawrencium',
        \'mode':         'LightlineMode',
        \ },
    \ 'separator': { 'left': "", 'right': "" },
    \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
    \}

function! LightlineModified()
    return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? "[+]" : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'vimfiler\|gundo' && &readonly ? "\uf023" : ''
endfunction

function! LightlineFilename()
    let fname = expand('%:t')
    return fname =~ 'NERD_tree\|FZF' ? '' :
        \ ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
    try
    if expand('%:t') !~? 'NERD' && exists('*fugitive#head')
        let branch = fugitive#head()
        return branch !=# '' ?  "\uf09b ".branch." \uf126" : ''
    endif
    catch
    endtry
    return ''
endfunction

function! LightlineLawrencium()
    if exists("*lawrencium#statusline")
        let branch = lawrencium#statusline()
        return branch !=# '' ? "\uf0c3 ".branch." \uf126" : ''
    endif
    return ''
endfunction

function! LightlineFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
    return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
    return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
    let fname = expand('%:t')
    return fname =~ 'NERD_tree' ? 'NERD' :
        \fname =~ 'FZF' ? "FZF" :
        \ winwidth(0) > 50 ? lightline#mode() : ''
endfunction
