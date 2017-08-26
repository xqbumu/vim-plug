" .vimrc.bundles.local.vim` - local user bundle configuration
" Adding new plugins

" plugins for HTML
"Plug 'mattn/emmet-vim'
let g:user_emmet_leader_key = '<c-y>'

Plug 'vim-scripts/vimwiki'
let g:vimwiki_list=[{'path': '~/.vim/vimwiki', 'path_html': '~/.vim/vimwiki/vimwiki_html/', 'html_header': '~/.vim/vimwiki/template/header.html', 'html_footer': '~/.vim/vimwiki/template/footer.html', 'diary_link_conut': 5}]

" Plug 'vim-scripts/openscad.vim'
"Plug 'vim-scripts/vimgdb'

" for sbcl
" Plug 'vim-scripts/slimv.vim'
" let g:slimv_swank_cmd = '! xterm -e sbcl --load ~/.vim/plugged/slime/start-swank.lisp &'
"

"Plug 'mileszs/ack.vim'
"Plug 'Blackrush/vim-gocode'
"Plugin 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/taglist.vim'
