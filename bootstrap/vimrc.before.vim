" invimplug options {

    " Prevent automatically changing to open file directory
    "   let g:invimplug_no_autochdir = 1

    " Disable views
    "   let g:invimplug_no_views = 1

    " Leader keys
    "   let g:invimplug_leader='\'
    "   let g:invimplug_localleader='_'

    " Disable easier moving in tabs and windows
    "   let g:invimplug_no_easyWindows = 1

    " Disable wrap relative motion for start/end line motions
    "   let g:invimplug_no_wrapRelMotion = 1

    " Disable fast tab navigation
    "   let g:invimplug_no_fastTabs = 1

    " Clear search highlighting
    "   let g:invimplug_clear_search_highlight = 1

    " Disable neosnippet expansion
    " This maps over <C-k> and does some Supertab
    " emulation with snippets
    "   let g:invimplug_no_neosnippet_expand = 1

    " Disable whitespace stripping
    "   let g:invimplug_keep_trailing_whitespace = 1

    " Enable powerline symbols
    "   let g:airline_powerline_fonts = 1

    " vim files directory
    "   let g:invimplug_consolidated_directory = <full path to desired directory>
    "   eg: let g:invimplug_consolidated_directory = $HOME . '/.vim/'

    " This makes the completion popup strictly passive.
    " Keypresses acts normally. <ESC> takes you of insert mode, words don't
    " automatically complete, pressing <CR> inserts a newline, etc. Iff the
    " menu is open, tab will cycle through it. If a snippet is selected, <C-k>
    " expands it and jumps between fields.
    "   let g:invimplug_noninvasive_completion = 1

    " Don't turn conceallevel or concealcursor
    "   let g:invimplug_no_conceal = 1

    " For some colorschemes, autocolor will not work (eg: 'desert', 'ir_black')
    " Indent guides will attempt to set your colors smartly. If you
    " want to control them yourself, do it here.
      let g:indent_guides_auto_colors = 0
      autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#212121 ctermbg=233
      autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#404040 ctermbg=234

    " Leave the default font and size in GVim
    " To set your own font, do it from ~/.vimrc.local.vim
    "   let g:invimplug_no_big_font = 1

    " Disable omni complete
    "   let g:invimplug_no_omni_complete = 1

    " Don't create default mappings for multicursors
    " See :help multiple-cursors-mappings
    "   let g:multi_cursor_use_default_mapping=0
    "   let g:multi_cursor_next_key='<C-n>'
    "   let g:multi_cursor_prev_key='<C-p>'
    "   let g:multi_cursor_skip_key='<C-x>'
    "   let g:multi_cursor_quit_key='<Esc>'
    " Require a special keypress to enter multiple cursors mode
    "   let g:multi_cursor_start_key='+'

    " Mappings for editing/applying invimplug config
      let g:invimplug_edit_config_mapping='<leader>ev'
      let g:invimplug_apply_config_mapping='<leader>sv'

" }

" Use fork before if available {
    if filereadable(expand("~/.vim/bootstrap/vimrc.before.fork.vim"))
        source ~/.vim/bootstrap/vimrc.before.fork.vim
    endif
" }

" Use local before if available {
    if filereadable(expand("~/.vim/bootstrap/vimrc.before.local.vim"))
        source ~/.vim/bootstrap/vimrc.before.local.vim
    endif
" }
