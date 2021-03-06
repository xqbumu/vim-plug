" -*- coding: utf-8 -*-
" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:

let &t_ut=''

" Environment {
    if filereadable(expand("~/.vim/bootstrap/vimrc.environment.vim"))
        source ~/.vim/bootstrap/vimrc.environment.vim
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
    if filereadable(expand("~/.vim/bootstrap/b07_gui.vim"))
        source ~/.vim/bootstrap/b07_gui.vim
    endif
" }

" Functions {
    if filereadable(expand("~/.vim/bootstrap/b08_functions.vim"))
        source ~/.vim/bootstrap/b08_functions.vim
    endif
" }

" Use fork vimrc if available {
    if filereadable(expand("~/.vim/vimrc.fork.vim"))
        source ~/.vim/vimrc.fork.vim
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
