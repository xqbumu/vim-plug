" Plugins {

  " GoLang {
    if filereadable(expand("~/.vim/bootstrap/configs/go.vim"))
        source ~/.vim/bootstrap/configs/go.vim
    endif
  " }

  " TextObj Sentence {
    if count(g:invimplug_bundle_groups, 'writing')
      augroup textobj_sentence
        autocmd!
        autocmd FileType markdown call textobj#sentence#init()
        autocmd FileType textile call textobj#sentence#init()
        autocmd FileType text call textobj#sentence#init()
      augroup END
    endif
  " }

  " TextObj Quote {
    if count(g:invimplug_bundle_groups, 'writing')
      augroup textobj_quote
        autocmd!
        autocmd FileType markdown call textobj#quote#init()
        autocmd FileType textile call textobj#quote#init()
        autocmd FileType text call textobj#quote#init({'educate': 0})
      augroup END
    endif
  " }

  " PIV {
    if isdirectory(expand("~/.vim/plugged/PIV"))
      let g:DisableAutoPHPFolding = 0
      let g:PIVAutoClose = 0
    endif
  " }

  " Misc {
    if isdirectory(expand("~/.vim/plugged/nerdtree"))
      let g:NERDShutUp=1
    endif
    if isdirectory(expand("~/.vim/plugged/matchit.zip"))
      let b:match_ignorecase = 1
    endif
  " }

  " OmniComplete {
    " To disable omni complete, add the following to your .vimrc.before.local.vim file:
    "   let g:invimplug_no_omni_complete = 1
    if !exists('g:invimplug_no_omni_complete')
      if has("autocmd") && exists("+omnifunc")
        autocmd Filetype *
          \if &omnifunc == "" |
          \setlocal omnifunc=syntaxcomplete#Complete |
          \endif
      endif

      hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
      hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
      hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

      " Some convenient mappings
      "inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
      if exists('g:invimplug_map_cr_omni_complete')
        inoremap <expr> <CR>     pumvisible() ? "\<C-y>" : "\<CR>"
      endif
      inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
      inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
      inoremap <expr> <C-d>      pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
      inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

      " Automatically open and close the popup menu / preview window
      au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
      set completeopt=menu,preview,longest
    endif
  " }

  " Ctags {
    set tags=./tags;/,~/.vim/vimtags

    " Make tags placed in .git/tags file available in all levels of a repository
    let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
    if gitroot != ''
      let &tags = &tags . ',' . gitroot . '/.git/tags'
    endif
  " }

  " AutoCloseTag {
    " Make it so AutoCloseTag works for xml and xhtml files as well
    au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
    nmap <Leader>ac <Plug>ToggleAutoCloseMappings
  " }

  " SnipMate {
    " Setting the author var
    " If forking, please overwrite in your .vimrc.local.vim file
    let g:snips_author = 'xqbumu <xqbumu@163.com>'
  " }

  " NerdTree {
    if isdirectory(expand("~/.vim/plugged/nerdtree"))
      map <C-e> <plug>NERDTreeTabsToggle<CR>
      map <leader>e :NERDTreeFind<CR>
      nmap <leader>nt :NERDTreeFind<CR>

      let NERDTreeShowBookmarks=1
      let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
      let NERDTreeChDirMode=0
      let NERDTreeQuitOnOpen=1
      let NERDTreeMouseMode=2
      let NERDTreeShowHidden=1
      let NERDTreeKeepTreeInNewTab=1
      let g:nerdtree_tabs_open_on_gui_startup=0
    endif
  " }

  " Tabularize {
    if isdirectory(expand("~/.vim/plugged/tabular"))
      nmap <Leader>a& :Tabularize /&<CR>
      vmap <Leader>a& :Tabularize /&<CR>
      nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
      vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
      nmap <Leader>a=> :Tabularize /=><CR>
      vmap <Leader>a=> :Tabularize /=><CR>
      nmap <Leader>a: :Tabularize /:<CR>
      vmap <Leader>a: :Tabularize /:<CR>
      nmap <Leader>a:: :Tabularize /:\zs<CR>
      vmap <Leader>a:: :Tabularize /:\zs<CR>
      nmap <Leader>a, :Tabularize /,<CR>
      vmap <Leader>a, :Tabularize /,<CR>
      nmap <Leader>a,, :Tabularize /,\zs<CR>
      vmap <Leader>a,, :Tabularize /,\zs<CR>
      nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
      vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
    endif
  " }

  " Session List {
    set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
    if isdirectory(expand("~/.vim/plugged/sessionman.vim/"))
      nmap <leader>sl :SessionList<CR>
      nmap <leader>ss :SessionSave<CR>
      nmap <leader>sc :SessionClose<CR>
    endif
  " }

  " JSON {
    nmap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>
    let g:vim_json_syntax_conceal = 0
  " }

  " PyMode {
    " Disable if python support not present
    if !has('python') && !has('python3')
      let g:pymode = 0
    endif

    if isdirectory(expand("~/.vim/plugged/python-mode"))
      let g:pymode_lint_checkers = ['pyflakes']
      let g:pymode_trim_whitespaces = 0
      let g:pymode_options = 0
      let g:pymode_rope = 0
    endif
  " }

  " ctrlp {
    if isdirectory(expand("~/.vim/plugged/ctrlp.vim/"))
      let g:ctrlp_working_path_mode = 'ra'
      nnoremap <silent> <D-t> :CtrlP<CR>
      nnoremap <silent> <D-r> :CtrlPMRU<CR>
      let g:ctrlp_custom_ignore = {
        \ 'dir':  '\.git$\|\.hg$\|\.svn$',
        \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

      if executable('ag')
        let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
      elseif executable('ack-grep')
        let s:ctrlp_fallback = 'ack-grep %s --nocolor -f'
      elseif executable('ack')
        let s:ctrlp_fallback = 'ack %s --nocolor -f'
      " On Windows use "dir" as fallback command.
      elseif WINDOWS()
        let s:ctrlp_fallback = 'dir %s /-n /b /s /a-d'
      else
        let s:ctrlp_fallback = 'find %s -type f'
      endif
      if exists("g:ctrlp_user_command")
        unlet g:ctrlp_user_command
      endif
      let g:ctrlp_user_command = {
        \ 'types': {
          \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
          \ 2: ['.hg', 'hg --cwd %s locate -I .'],
        \ },
        \ 'fallback': s:ctrlp_fallback
      \ }

      if isdirectory(expand("~/.vim/plugged/ctrlp-funky/"))
          " CtrlP extensions
          let g:ctrlp_extensions = ['funky']

          "funky
          nnoremap <Leader>fu :CtrlPFunky<Cr>
      endif
    endif
  "}

  " TagBar {
    if isdirectory(expand("~/.vim/plugged/tagbar/"))
      nnoremap <silent> <leader>tt :TagbarToggle<CR>
    endif
  "}

  " Rainbow {
      if isdirectory(expand("~/.vim/plugged/rainbow/"))
        let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
      endif
  "}

  " Fugitive {
    if isdirectory(expand("~/.vim/plugged/vim-fugitive/"))
      nnoremap <silent> <leader>gs :Gstatus<CR>
      nnoremap <silent> <leader>gd :Gdiff<CR>
      nnoremap <silent> <leader>gc :Gcommit<CR>
      nnoremap <silent> <leader>gb :Gblame<CR>
      nnoremap <silent> <leader>gl :Glog<CR>
      nnoremap <silent> <leader>gp :Git push<CR>
      nnoremap <silent> <leader>gr :Gread<CR>
      nnoremap <silent> <leader>gw :Gwrite<CR>
      nnoremap <silent> <leader>ge :Gedit<CR>
      " Mnemonic _i_nteractive
      nnoremap <silent> <leader>gi :Git add -p %<CR>
      nnoremap <silent> <leader>gg :SignifyToggle<CR>
    endif
  "}

  " YouCompleteMe {
    if count(g:invimplug_bundle_groups, 'youcompleteme')
      let g:acp_enableAtStartup = 0

      " enable completion from tags
      let g:ycm_collect_identifiers_from_tags_files = 1

      " remap Ultisnips for compatibility for YCM
      let g:UltiSnipsExpandTrigger = '<C-j>'
      let g:UltiSnipsJumpForwardTrigger = '<C-j>'
      let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

      " Enable omni completion.
      autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
      autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
      autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
      autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
      autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
      autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
      autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

      " Haskell post write lint and check with ghcmod
      " $ `cabal install ghcmod` if missing and ensure
      " ~/.cabal/bin is in your $PATH.
      if !executable("ghcmod")
        autocmd BufWritePost *.hs GhcModCheckAndLintAsync
      endif

      " For snippet_complete marker.
      if !exists("g:invimplug_no_conceal")
        if has('conceal')
          set conceallevel=2 concealcursor=i
        endif
      endif

      " Disable the neosnippet preview candidate window
      " When enabled, there can be too much visual noise
      " especially when splits are used.
      set completeopt-=preview
    endif
  " }

  " neocomplete {
    if count(g:invimplug_bundle_groups, 'neocomplete')
      let g:acp_enableAtStartup = 0
      let g:neocomplete#enable_at_startup = 1
      let g:neocomplete#enable_smart_case = 1
      let g:neocomplete#enable_auto_delimiter = 1
      let g:neocomplete#max_list = 15
      let g:neocomplete#force_overwrite_completefunc = 1


      " Define dictionary.
      let g:neocomplete#sources#dictionary#dictionaries = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

      " Define keyword.
      if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
      endif
      let g:neocomplete#keyword_patterns['default'] = '\h\w*'

      " Plugin key-mappings {
        " These two lines conflict with the default digraph mapping of <C-K>
        if !exists('g:invimplug_no_neosnippet_expand')
          imap <C-k> <Plug>(neosnippet_expand_or_jump)
          smap <C-k> <Plug>(neosnippet_expand_or_jump)
        endif
        if exists('g:invimplug_noninvasive_completion')
          inoremap <CR> <CR>
          " <ESC> takes you out of insert mode
          inoremap <expr> <Esc>   pumvisible() ? "\<C-y>\<Esc>" : "\<Esc>"
          " <CR> accepts first, then sends the <CR>
          inoremap <expr> <CR>    pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
          " <Down> and <Up> cycle like <Tab> and <S-Tab>
          inoremap <expr> <Down>  pumvisible() ? "\<C-n>" : "\<Down>"
          inoremap <expr> <Up>    pumvisible() ? "\<C-p>" : "\<Up>"
          " Jump up and down the list
          inoremap <expr> <C-d>   pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
          inoremap <expr> <C-u>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"
        else
          " <C-k> Complete Snippet
          " <C-k> Jump to next snippet point
          imap <silent><expr><C-k> neosnippet#expandable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ?
            \ "\<C-e>" : "\<Plug>(neosnippet_expand_or_jump)")
          smap <TAB> <Right><Plug>(neosnippet_jump_or_expand)

          inoremap <expr><C-g> neocomplete#undo_completion()
          inoremap <expr><C-l> neocomplete#complete_common_string()
          "inoremap <expr><CR> neocomplete#complete_common_string()

          " <CR>: close popup
          " <s-CR>: close popup and save indent.
          inoremap <expr><s-CR> pumvisible() ? neocomplete#smart_close_popup()."\<CR>" : "\<CR>"

          function! CleverCr()
            if pumvisible()
              if neosnippet#expandable()
                let exp = "\<Plug>(neosnippet_expand)"
                return exp . neocomplete#smart_close_popup()
              else
                return neocomplete#smart_close_popup()
              endif
            else
              return "\<CR>"
            endif
          endfunction

          " <CR> close popup and save indent or expand snippet
          imap <expr> <CR> CleverCr()
          " <C-h>, <BS>: close popup and delete backword char.
          inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
          inoremap <expr><C-y> neocomplete#smart_close_popup()
        endif
        " <TAB>: completion.
        inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
        inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

        " Courtesy of Matteo Cavalleri

        function! CleverTab()
          if pumvisible()
            return "\<C-n>"
          endif
          let substr = strpart(getline('.'), 0, col('.') - 1)
          let substr = matchstr(substr, '[^ \t]*$')
          if strlen(substr) == 0
            " nothing to match on empty string
            return "\<Tab>"
          else
            " existing text matching
            if neosnippet#expandable_or_jumpable()
              return "\<Plug>(neosnippet_expand_or_jump)"
            else
              return neocomplete#start_manual_complete()
            endif
          endif
        endfunction

        imap <expr> <Tab> CleverTab()
      " }

      " Enable heavy omni completion.
      if !exists('g:neocomplete#sources#omni#input_patterns')
          let g:neocomplete#sources#omni#input_patterns = {}
      endif
      let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
      let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
      let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
      let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
      let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
  " }
  " neocomplcache {
    elseif count(g:invimplug_bundle_groups, 'neocomplcache')
      let g:acp_enableAtStartup = 0
      let g:neocomplcache_enable_at_startup = 1
      let g:neocomplcache_enable_camel_case_completion = 1
      let g:neocomplcache_enable_smart_case = 1
      let g:neocomplcache_enable_underbar_completion = 1
      let g:neocomplcache_enable_auto_delimiter = 1
      let g:neocomplcache_max_list = 15
      let g:neocomplcache_force_overwrite_completefunc = 1

      " Define dictionary.
      let g:neocomplcache_dictionary_filetype_lists = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

      " Define keyword.
      if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
      endif
      let g:neocomplcache_keyword_patterns._ = '\h\w*'

      " Plugin key-mappings {
        " These two lines conflict with the default digraph mapping of <C-K>
        imap <C-k> <Plug>(neosnippet_expand_or_jump)
        smap <C-k> <Plug>(neosnippet_expand_or_jump)
        if exists('g:invimplug_noninvasive_completion')
          inoremap <CR> <CR>
          " <ESC> takes you out of insert mode
          inoremap <expr> <Esc>   pumvisible() ? "\<C-y>\<Esc>" : "\<Esc>"
          " <CR> accepts first, then sends the <CR>
          inoremap <expr> <CR>    pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
          " <Down> and <Up> cycle like <Tab> and <S-Tab>
          inoremap <expr> <Down>  pumvisible() ? "\<C-n>" : "\<Down>"
          inoremap <expr> <Up>    pumvisible() ? "\<C-p>" : "\<Up>"
          " Jump up and down the list
          inoremap <expr> <C-d>   pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
          inoremap <expr> <C-u>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"
        else
          imap <silent><expr><C-k> neosnippet#expandable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ?
            \ "\<C-e>" : "\<Plug>(neosnippet_expand_or_jump)")
          smap <TAB> <Right><Plug>(neosnippet_jump_or_expand)

          inoremap <expr><C-g> neocomplcache#undo_completion()
          inoremap <expr><C-l> neocomplcache#complete_common_string()
          "inoremap <expr><CR> neocomplcache#complete_common_string()

          function! CleverCr()
            if pumvisible()
              if neosnippet#expandable()
                let exp = "\<Plug>(neosnippet_expand)"
                return exp . neocomplcache#close_popup()
              else
                return neocomplcache#close_popup()
              endif
            else
              return "\<CR>"
            endif
          endfunction

          " <CR> close popup and save indent or expand snippet
          imap <expr> <CR> CleverCr()

          " <CR>: close popup
          " <s-CR>: close popup and save indent.
          inoremap <expr><s-CR> pumvisible() ? neocomplcache#close_popup()."\<CR>" : "\<CR>"
          "inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"

          " <C-h>, <BS>: close popup and delete backword char.
          inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
          inoremap <expr><C-y> neocomplcache#close_popup()
        endif
        " <TAB>: completion.
        inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
        inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
      " }

      " Enable omni completion.
      autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
      autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
      autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
      autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
      autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
      autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
      autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

      " Enable heavy omni completion.
      if !exists('g:neocomplcache_omni_patterns')
          let g:neocomplcache_omni_patterns = {}
      endif
      let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
      let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
      let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
      let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
      let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
      let g:neocomplcache_omni_patterns.go = '\h\w*\.\?'
  " }
  " Normal Vim omni-completion {
  " To disable omni complete, add the following to your .vimrc.before.local.vim file:
  "   let g:invimplug_no_omni_complete = 1
    elseif !exists('g:invimplug_no_omni_complete')
      " Enable omni-completion.
      autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
      autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
      autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
      autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
      autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
      autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
      autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

    endif
  " }

  " Snippets {
    if count(g:invimplug_bundle_groups, 'neocomplcache') ||
      \ count(g:invimplug_bundle_groups, 'neocomplete')

      " Use honza's snippets.
      let g:neosnippet#snippets_directory='~/.vim/plugged/vim-snippets/snippets'

      " Enable neosnippet snipmate compatibility mode
      let g:neosnippet#enable_snipmate_compatibility = 1

      " For snippet_complete marker.
      if !exists("g:invimplug_no_conceal")
        if has('conceal')
          set conceallevel=2 concealcursor=i
        endif
      endif

      " Enable neosnippets when using go
      let g:go_snippet_engine = "neosnippet"

      " Disable the neosnippet preview candidate window
      " When enabled, there can be too much visual noise
      " especially when splits are used.
      set completeopt-=preview
    endif
  " }

  " FIXME: Isn't this for Syntastic to handle?
  " Haskell post write lint and check with ghcmod
  " $ `cabal install ghcmod` if missing and ensure
  " ~/.cabal/bin is in your $PATH.
  if !executable("ghcmod")
    autocmd BufWritePost *.hs GhcModCheckAndLintAsync
  endif

  " UndoTree {
    if isdirectory(expand("~/.vim/plugged/undotree/"))
      nnoremap <Leader>u :UndotreeToggle<CR>
      " If undotree is opened, it is likely one wants to interact with it.
      let g:undotree_SetFocusWhenToggle=1
    endif
  " }

  " indent_guides {
    if isdirectory(expand("~/.vim/plugged/vim-indent-guides/"))
      let g:indent_guides_start_level = 2
      let g:indent_guides_guide_size = 1
      let g:indent_guides_enable_on_vim_startup = 1
    endif
  " }

  " Wildfire {
    let g:wildfire_objects = {
      \ "*" : ["i'", 'i"', "i)", "i]", "i}", "ip"],
      \ "html,xml" : ["at"],
      \ }
  " }

" }
