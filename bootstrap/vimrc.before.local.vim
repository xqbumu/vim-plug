" .vimrc.before.local.vim` - before user configuration

let g:invimplug_bundle_groups=['general', 'programming', 'youcompleteme', 'php', 'python', 'javascript', 'html', 'go', 'misc', 'others']
"let g:invimplug_bundle_groups=['general', 'go']
" let g:invimplug_bundle_groups=['programming', 'youcompleteme']

" To disable omni complete
 "let g:invimplug_no_omni_complete = 1

" Specify a different directory in which to place the vimbackup,
" vimviews, vimundo, and vimswap files/directories
let g:invimplug_consolidated_directory = $HOME . '/.vim/helpers/'

" General {
let g:invimplug_no_autochdir = 1
" }

" load configs
if filereadable(expand("~/.vim/bootstrap/configs/cscope.vim"))
    " source ~/.vim/bootstrap/configs/cscope.vim
endif

if filereadable(expand("~/.vim/bootstrap/configs/ctrlp.vim"))
    " source ~/.vim/bootstrap/configs/ctrlp.vim
endif

if filereadable(expand("~/.vim/bootstrap/configs/markdown_preview.vim"))
    " source ~/.vim/bootstrap/configs/markdown_preview.vim
endif

if filereadable(expand("~/.vim/bootstrap/configs/vim-airline.vim"))
    source ~/.vim/bootstrap/configs/vim-airline.vim
endif

" load styles
if filereadable(expand("~/.vim/bootstrap/styles/spell.vim"))
    source ~/.vim/bootstrap/styles/spell.vim
endif
