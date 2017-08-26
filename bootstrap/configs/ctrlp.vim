"let g:ctrlp_cmd = 'CtrlPMRU'
"let g:ctrlp_match_func  = {'match' : 'matcher#cmatch'}
"let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
"let g:ctrlp_working_path_mode = 'ra'
"let g:ctrlp_max_height = 10		" maxiumum height of match window
"let g:ctrlp_switch_buffer = 'et'	" jump to a file if it's open already
"let g:ctrlp_mruf_max=450 		" number of recently opened files
"let g:ctrlp_max_files=0  		" do not limit the number of searchable files
"let g:ctrlp_use_caching = 1
"let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.vim/helpers/ctrlp'

let g:ctrlp_buftag_types = {
      \ 'go'     	   : '--language-force=go --golang-types=ftv',
      \ 'coffee'     : '--language-force=coffee --coffee-types=cmfvf',
      \ 'markdown'   : '--language-force=markdown --markdown-types=hik',
      \ 'objc'       : '--language-force=objc --objc-types=mpci',
      \ 'rc'         : '--language-force=rust --rust-types=fTm'
      \ }

func! MyCtrlPTag()
  let g:ctrlp_prompt_mappings = {
        \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
        \ 'AcceptSelection("t")': ['<c-t>'],
        \ }
  CtrlPBufTag
endfunc
command! MyCtrlPTag call MyCtrlPTag()

nmap <C-f> :CtrlPCurWD<cr>
imap <C-f> <esc>:CtrlPCurWD<cr>

nmap <C-b> :CtrlPBuffer<cr>
imap <C-b> <esc>:CtrlPBuffer<cr>
