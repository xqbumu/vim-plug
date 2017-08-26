" let g:airline_theme='powerlineish'
" let g:airline_theme='luna'
" let g:airline_theme='sol'
let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

"let g:airline_inactive_collapse=1

" Buffer
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#show_tabs = 2
let g:airline#extensions#tabline#show_buffers = 2
let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
let g:airline#extensions#quickfix#location_text = 'Location'
let g:airline#extensions#ctrlp#show_adjacent_modes = 1

"""设置状态栏符号显示，下面编码用双引号"
" let g:Powerline_symbols="fancy"
" let g:airline_symbols = {}
" let g:airline_left_sep = "\u2b80"
" let g:airline_left_alt_sep = "\u2b81"
" let g:airline_right_sep = "\u2b82"
" let g:airline_right_alt_sep = "\u2b83"
" let g:airline_symbols.branch = "\u2b60"
" let g:airline_symbols.readonly = "\u2b64"
" let g:airline_symbols.linenr = "\u2b61"
" let g:airline_left_sep='›'  " Slightly fancier than '>'
" let g:airline_right_sep='‹' " Slightly fancier than '<'

let g:airline_extensions = ['branch', 'tabline']

"设置顶部tabline栏符号显示"
"let g:airline#extensions#tabline#left_sep = "\u2b80"
"let g:airline#extensions#tabline#left_alt_sep = "\u2b81"
