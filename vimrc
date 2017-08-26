" Environment {
    if filereadable(expand("~/.vim/bootstrap/b01_environment.vim"))
        source ~/.vim/bootstrap/b01_environment.vim
    endif
" }

" Use before config if available {
    if filereadable(expand("~/.vim/bootstrap/vimrc.before.vim"))
        source ~/.vim/bootstrap/vimrc.before.vim
    endif
" }

" Use bundles config {
    if filereadable(expand("~/.vim/bootstrap/vimrc.bundles.vim"))
        source ~/.vim/bootstrap/vimrc.bundles.vim
    endif
" }

" General {
    if filereadable(expand("~/.vim/bootstrap/b02_general.vim"))
        source ~/.vim/bootstrap/b02_general.vim
    endif
" }

" UI {
    if filereadable(expand("~/.vim/bootstrap/b03_ui.vim"))
        source ~/.vim/bootstrap/b03_ui.vim
    endif
" }

" Formatting {
    if filereadable(expand("~/.vim/bootstrap/b04_formatting.vim"))
        source ~/.vim/bootstrap/b04_formatting.vim
    endif
" }

" Key (re)Mappings {
    if filereadable(expand("~/.vim/bootstrap/b05_key_mapping.vim"))
        source ~/.vim/bootstrap/b05_key_mapping.vim
    endif
" }

" Plugins {
    if filereadable(expand("~/.vim/bootstrap/b06_plugins.vim"))
        source ~/.vim/bootstrap/b06_plugins.vim
    endif
" }

" Functions {
    if filereadable(expand("~/.vim/bootstrap/b07_functions.vim"))
        source ~/.vim/bootstrap/b07_functions.vim
    endif
" }

" Use fork vimrc if available {
    if filereadable(expand("~/.vim/vimrc.fork"))
        source ~/.vim/vimrc.fork
    endif
" }

" Use local vimrc if available {
    if filereadable(expand("~/.vim/vimrc.local.vim"))
        source ~/.vim/vimrc.local.vim
    endif
" }

" Use local gvimrc if available and gui is running {
    if has('gui_running')
        if filereadable(expand("~/.vim/gvimrc.local.vim"))
            source ~/.gvimrc.local.vim
        endif
    endif
" }
