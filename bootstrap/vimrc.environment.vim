" Environment {

  " Basics {
    set nocompatible        " Must be first line
    set background=dark     " Assume a dark background
  " }

  " Identify platform {
    silent function! OSX()
      return has('macunix')
    endfunction
    silent function! LINUX()
      return has('unix') && !has('macunix') && !has('win32unix')
    endfunction
    silent function! WINDOWS()
      return  (has('win32') || has('win64'))
    endfunction
  " }

  " Unix Compatible {
    if !WINDOWS()
      set shell=/bin/sh
      set viminfo+=n$HOME/.vim/helpers/viminfo/viminfo
    endif
  " }

  " Windows Compatible {
    " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
    " across (heterogeneous) systems easier.
    if WINDOWS()
      set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after

      " Be nice and check for multi_byte even if the config requires
      " multi_byte support most of the time
      if has("multi_byte")
        " Windows cmd.exe still uses cp850. If Windows ever moved to
        " Powershell as the primary terminal, this would be utf-8
        set termencoding=cp850
        " Let Vim use utf-8 internally, because many scripts require this
        set encoding=utf-8
        setglobal fileencoding=utf-8
        " Windows has traditionally used cp1252, so it's probably wise to
        " fallback into cp1252 instead of eg. iso-8859-15.
        " Newer Windows files might contain utf-8 or utf-16 LE so we might
        " want to try them first.
        set fileencodings=ucs-bom,utf-8,utf-16le,cp1252,iso-8859-15
      endif
    endif
  " }

  " Arrow Key Fix {
    if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
      inoremap <silent> <C-[>OC <RIGHT>
    endif
  " }

" }
