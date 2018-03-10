" GUI Settings {

  " GVIM- (here instead of .gvimrc)
  if has('gui_running')
    set clipboard+=unnamed
    " set vb t_vb=
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r  "no scrollbar
    set guioptions-=R

    set guioptions-=T           " Remove the toolbar
    set lines=40                " 40 lines of text instead of 24

    " colorscheme ----
    "set background=dark
    "colorscheme Tomorrow-Night-Eighties
    colorscheme Tomorrow-Night
    "colorscheme Tomorrow

    "colorscheme molokai
    "let g:molokai_original=1
    "let g:rehash256 = 1

    "set background=light
    "let g:solarized_termcolors=256
    "colorscheme solarized

    "let macvim_skip_colorscheme=1
    highlight SignColumn guibg=#272822

    " Open ctrlp with cmd+p
    " let g:ctrlp_map = '<D-p>'

    " Open goto symbol on current buffer
    nmap <D-r> :MyCtrlPTag<cr>
    imap <D-r> <esc>:MyCtrlPTag<cr>

    " Open goto symbol on all buffers
    nmap <D-R> :CtrlPBufTagAll<cr>
    imap <D-R> <esc>:CtrlPBufTagAll<cr>

    " Open goto file
    nmap <D-t> :CtrlP<cr>
    imap <D-t> <esc>:CtrlP<cr>

    " Comment lines with cmd+/
    map <D-/> :TComment<cr>
    vmap <D-/> :TComment<cr>gv

    " Indent lines with cmd+[ and cmd+]
    nmap <D-]> >>
    nmap <D-[> <<
    vmap <D-[> <gv
    vmap <D-]> >gv

    " This mapping makes Ctrl-Tab switch between tabs.
    " Ctrl-Shift-Tab goes the other way.
    noremap <C-Tab> :tabnext<CR>
    noremap <C-S-Tab> :tabprev<CR>

    " switch between tabs with cmd+1, cmd+2,..."
    map <D-1> 1gt
    map <D-2> 2gt
    map <D-3> 3gt
    map <D-4> 4gt
    map <D-5> 5gt
    map <D-6> 6gt
    map <D-7> 7gt
    map <D-8> 8gt
    map <D-9> 9gt

    " until we have default MacVim shortcuts this is the only way to use it in
    " insert mode
    imap <D-1> <esc>1gt
    imap <D-2> <esc>2gt
    imap <D-3> <esc>3gt
    imap <D-4> <esc>4gt
    imap <D-5> <esc>5gt
    imap <D-6> <esc>6gt
    imap <D-7> <esc>7gt
    imap <D-8> <esc>8gt
    imap <D-9> <esc>9gt

    " Font Set
    if !exists("g:invimplug_no_big_font")
      if LINUX() && has("gui_running")
        " 设置powerline字体"
        " set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12,Andale\ Mono\ Regular\ 12,Menlo\ Regular\ 11,Consolas\ Regular\ 12,Courier\ New\ Regular\ 14
        " set guifont=Source\ Code\ Pro\ for\ Powerline\ Medium\ 10
        set guifont=Roboto\ Mono\ for\ Powerline\ 10
        " set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 10
        " set guifont=Consolas\ for\ Powerline\ FixedD:h11
        " set guifont=Source\ Code\ Pro\ for\ Powerline\ 12
        " set guifont=Sauce\ Code\ Powerline:h12
        "set guifont=Ubuntu\ Mono\ derivative\ Powerline:h12
        set guifontwide=Courier\ New\ 11
        " set guifontwide=Noto\ Sans\ 10
      elseif OSX() && has("gui_running")
        " set guifont=Andale\ Mono\ Regular:h12,Menlo\ Regular:h11,Consolas\ Regular:h12,Courier\ New\ Regular:h14
        set guifont=Source\ Code\ Pro\ for\ Powerline:h12
      elseif WINDOWS() && has("gui_running")
        set guifont=Andale_Mono:h10,Menlo:h10,Consolas:h10,Courier_New:h10
      endif
    endif
  else
    if &term == 'xterm' || &term == 'screen'
      set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
    endif
    "set term=builtin_ansi       " Make arrow and other keys work
  endif

" }
