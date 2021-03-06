" Environment {

  " Setup Plug Support {
    " The next three lines ensure that the ~/.vim/plugged/ system works
    filetype off
    call plug#begin('~/.vim/plugged')
    " 设置插件更新超时时间（单位：秒）
    let g:plug_timeout=600
  " }

  " TODO
    " Add an UnPlug command {
    function! UnPlug(arg, ...)
      let bundle = vundle#config#init_bundle(a:arg, a:000)
      call filter(g:vundle#bundles, 'v:val["name_spec"] != "' . a:arg . '"')
    endfunction
    \ call UnPlug(<args>)
  " }
" }

" Plugs {

  " Deps {
    " l9 is a Vim-script library, which provides some utility functions and commands for programming in Vim.
    "Plug 'vim-scripts/L9'
    Plug 'MarcWeber/vim-addon-mw-utils'
    Plug 'tomtom/tlib_vim'
    if executable('ag')
      Plug 'mileszs/ack.vim'
      let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'
    elseif executable('ack-grep')
      let g:ackprg="ack-grep -H --nocolor --nogroup --column"
      Plug 'mileszs/ack.vim'
    elseif executable('ack')
      Plug 'mileszs/ack.vim'
    endif
  " }

  " In your .vimrc.before.local.vim file
  " list only the plugin groups you will use
  if !exists('g:invimplug_bundle_groups')
    let g:invimplug_bundle_groups=['general', 'writing', 'neocomplete', 'programming', 'php', 'ruby', 'python', 'javascript', 'html', 'markdown', 'misc',]
  endif

  " To override all the included bundles, add the following to your
  " vimrc.bundles.local.vim file:
  " let g:override_invimplug_bundles = 1
  if !exists("g:override_invimplug_bundles")

  " General {
    if count(g:invimplug_bundle_groups, 'general')
      Plug 'scrooloose/nerdtree'
      Plug 'altercation/vim-colors-solarized'
      Plug 'spf13/vim-colors'
      Plug 'tpope/vim-surround'
      Plug 'tpope/vim-repeat'
      Plug 'rhysd/conflict-marker.vim'
      Plug 'jiangmiao/auto-pairs'
      Plug 'ctrlpvim/ctrlp.vim'
      Plug 'tacahiroy/ctrlp-funky'
      Plug 'terryma/vim-multiple-cursors'
      Plug 'vim-scripts/sessionman.vim'
      Plug 'vim-scripts/matchit.zip'
      if (has("python") || has("python3")) && exists('g:invimplug_use_powerline') && !exists('g:invimplug_use_old_powerline')
          Plug 'Lokaltog/powerline', {'rtp':'/powerline/bindings/vim'}
      elseif exists('g:invimplug_use_powerline') && exists('g:invimplug_use_old_powerline')
          Plug 'Lokaltog/vim-powerline'
      else
          Plug 'vim-airline/vim-airline'
          Plug 'vim-airline/vim-airline-themes'
      endif
      Plug 'powerline/fonts'
      Plug 'bling/vim-bufferline' " It could makes set wrong
      Plug 'easymotion/vim-easymotion'
      Plug 'jistr/vim-nerdtree-tabs'
      Plug 'flazz/vim-colorschemes'
      Plug 'mbbill/undotree'
      Plug 'nathanaelkane/vim-indent-guides'
      if !exists('g:invimplug_no_views')
          Plug 'vim-scripts/restore_view.vim'
      endif
      Plug 'mhinz/vim-signify'
      Plug 'tpope/vim-abolish'
      Plug 'osyo-manga/vim-over'
      Plug 'kana/vim-textobj-user'
      Plug 'kana/vim-textobj-indent'
      Plug 'gcmt/wildfire.vim'
    endif
  " }

  " Writing {
    if count(g:invimplug_bundle_groups, 'writing')
      Plug 'reedes/vim-litecorrect'
      Plug 'reedes/vim-textobj-sentence'
      Plug 'reedes/vim-textobj-quote'
      Plug 'reedes/vim-wordy'
    endif
  " }

  " General Programming {
    if count(g:invimplug_bundle_groups, 'programming')
      " Pick one of the checksyntax, jslint, or syntastic
      Plug 'scrooloose/syntastic'
      Plug 'tpope/vim-fugitive'
      Plug 'mattn/webapi-vim'
      Plug 'mattn/gist-vim'
      Plug 'scrooloose/nerdcommenter'
      Plug 'tpope/vim-commentary'
      Plug 'godlygeek/tabular'
      Plug 'luochen1990/rainbow'
      " Plug 'kien/rainbow_parentheses.vim'
      if executable('ctags')
        Plug 'majutsushi/tagbar'
      endif
    endif
  " }

  " Snippets & AutoComplete {
    if count(g:invimplug_bundle_groups, 'snipmate')
      Plug 'garbas/vim-snipmate'
      Plug 'honza/vim-snippets'
      " Source support_function.vim to support vim-snippets.
      if filereadable(expand("~/.vim/plugged/vim-snippets/snippets/support_functions.vim"))
        source ~/.vim/plugged/vim-snippets/snippets/support_functions.vim
      endif
    elseif count(g:invimplug_bundle_groups, 'youcompleteme')
      function! BuildYCM(info)
        " info is a dictionary with 3 fields
        " - name:   name of the plugin
        " - status: 'installed', 'updated', or 'unchanged'
        " - force:  set on PlugInstall! or PlugUpdate!
        if a:info.status == 'installed' || a:info.force
          " !./install.py --clang-completer --gocode-completer --tern-completer --racer-completer
          !./install.py --clang-completer --gocode-completer --tern-completer
        endif
      endfunction
      Plug 'Valloric/YouCompleteMe' , { 'do': function('BuildYCM') }
      Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
      Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
    elseif count(g:invimplug_bundle_groups, 'neocomplcache')
      Plug 'Shougo/neocomplcache'
      Plug 'Shougo/neosnippet'
      Plug 'Shougo/neosnippet-snippets'
      Plug 'honza/vim-snippets'
    elseif count(g:invimplug_bundle_groups, 'neocomplete')
      Plug 'Shougo/neocomplete.vim'
      Plug 'Shougo/neosnippet'
      Plug 'Shougo/neosnippet-snippets'
      Plug 'honza/vim-snippets'
    endif
  " }

  " PHP {
    if count(g:invimplug_bundle_groups, 'php')
      " Plug 'StanAngeloff/php.vim', {'for' : 'php'}
      " Plug 'shawncplus/phpcomplete.vim', {'for' : 'php'}
      " Plug 'm2mdas/phpcomplete-extended', {'for' : 'php'}
      " Plug 'vim-php/phpctags'
      Plug 'spf13/PIV', {'for' : 'php'}
      Plug 'arnaud-lb/vim-php-namespace', {'for' : 'php'}
      Plug 'beyondwords/vim-twig', {'for' : 'php'}
    endif
  " }

  " Python {
    if count(g:invimplug_bundle_groups, 'python')
      " Pick either python-mode or pyflakes & pydoc
      Plug 'klen/python-mode', {'for' : ['py','py2','py3']}
      Plug 'yssource/python.vim', {'for' : ['py','py2','py3']}
      Plug 'vim-scripts/python_match.vim', {'for' : ['py','py2','py3']}
      Plug 'vim-scripts/pythoncomplete', {'for' : ['py','py2','py3']}
    endif
  " }

  " Javascript {
    if count(g:invimplug_bundle_groups, 'javascript')
      Plug 'elzr/vim-json', {'for' : ['javascript', 'json', 'javascript']}
      Plug 'groenewege/vim-less', {'for' : 'less'}
      Plug 'pangloss/vim-javascript', {'for' : 'javascript'}
      Plug 'briancollins/vim-jst', {'for' : 'jst'}
      Plug 'kchmck/vim-coffee-script', {'for' : 'coffee'}
      Plug 'marijnh/tern_for_vim', {'for' : 'javascript'}
    endif
  " }

  " Scala {
    if count(g:invimplug_bundle_groups, 'scala')
      Plug 'derekwyatt/vim-scala'
      Plug 'derekwyatt/vim-sbt'
      Plug 'xptemplate'
    endif
  " }

  " Haskell {
    if count(g:invimplug_bundle_groups, 'haskell')
      Plug 'travitch/hasksyn'
      Plug 'dag/vim2hs'
      Plug 'Twinside/vim-haskellConceal'
      Plug 'Twinside/vim-haskellFold'
      Plug 'lukerandall/haskellmode-vim'
      Plug 'eagletmt/neco-ghc'
      Plug 'eagletmt/ghcmod-vim'
      Plug 'Shougo/vimproc.vim'
      Plug 'adinapoli/cumino'
      Plug 'bitc/vim-hdevtools'
    endif
  " }

  " HTML {
    if count(g:invimplug_bundle_groups, 'html')
      Plug 'vim-scripts/HTML-AutoCloseTag', {'for': ['html', 'php', 'jsp']}
      Plug 'hail2u/vim-css3-syntax', {'for': ['css']}
      Plug 'gorodinskiy/vim-coloresque', {'for': ['css', 'html', 'less', 'sass']}
      Plug 'tpope/vim-haml', {'for': 'haml'}
      Plug 'mattn/emmet-vim', {'for': ['html', 'php', 'jsp']}
    endif
  " }

  " Ruby {
    if count(g:invimplug_bundle_groups, 'ruby')
      Plug 'tpope/vim-rails', {'for': 'ruby'}
      let g:rubycomplete_buffer_loading = 1
      "let g:rubycomplete_classes_in_global = 1
      "let g:rubycomplete_rails = 1
    endif
  " }

  " Puppet {
    if count(g:invimplug_bundle_groups, 'puppet')
      Plug 'rodjek/vim-puppet'
    endif
  " }

  " Go Lang {
    if count(g:invimplug_bundle_groups, 'go')
      "Plug 'Blackrush/vim-gocode'
      Plug 'fatih/vim-go', {'for': 'go', 'do': ':GoInstallBinaries'}
    endif
  " }

  " Elixir {
    if count(g:invimplug_bundle_groups, 'elixir')
      Plug 'elixir-lang/vim-elixir'
      Plug 'carlosgaldino/elixir-snippets'
      Plug 'mattreduce/vim-mix'
    endif
  " }

  " Markdown {
    if count(g:invimplug_bundle_groups, 'markdown')
      " Plug 'tpope/vim-markdown', {'for': ['markdown']}
      Plug 'plasticboy/vim-markdown', {'for': ['markdown']}

      " Plug 'spf13/vim-preview', {'for': ['markdown']}
      " Plug 'greyblake/vim-preview', {'for': ['markdown']}
      " Plug 'suan/vim-instant-markdown', {'for' : ['markdown']}

      Plug 'iamcco/mathjax-support-for-mkdp', {'for': ['markdown']}
      Plug 'iamcco/markdown-preview.vim', {'for': ['markdown']}

      " Plug 'hongqn/vim-osx-ime', {'for' : ['markdown']}

      Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
    endif
  " }

  " Misc {
    if count(g:invimplug_bundle_groups, 'misc')
      Plug 'rust-lang/rust.vim', {'for': 'rust'}
      Plug 'tpope/vim-cucumber', {'for' : 'ruby'}
      Plug 'cespare/vim-toml', {'for' : 'toml'}
      Plug 'quentindecock/vim-cucumber-align-pipes', {'for' : 'ruby'}
      Plug 'saltstack/salt-vim', {'for' : ['yaml']}
      Plug 'tpope/vim-vinegar'
    endif
  " }

  " Others {
    if count(g:invimplug_bundle_groups, 'others')
      Plug 'fatih/vim-nginx' , {'for' : 'nginx'}
      Plug 'ekalinin/Dockerfile.vim', {'for' : 'Dockerfile'}
      Plug 'peterhoeg/vim-qml', {'for' : 'qml' }
      Plug 'editorconfig/editorconfig-vim'
    endif
  " }
  endif

" }

" Use fork bundles config if available {
  if filereadable(expand("~/.vim/bootstrap/vimrc.bundles.fork.vim"))
    source ~/.vim/vimrc.bundles.fork.vim
  endif
" }

" Use local bundles config if available {
  if filereadable(expand("~/.vim/bootstrap/vimrc.bundles.local.vim"))
    source ~/.vim/bootstrap/vimrc.bundles.local.vim
  endif
" }

call plug#end()
