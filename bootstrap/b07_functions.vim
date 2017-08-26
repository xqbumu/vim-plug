" Functions {

    " Initialize directories {
    function! InitializeDirectories()
        let parent = $HOME
        let prefix = 'vim'
        let dir_list = {
                    \ 'backup': 'backupdir',
                    \ 'views': 'viewdir',
                    \ 'swap': 'directory' }

        if has('persistent_undo')
            let dir_list['undo'] = 'undodir'
        endif

        " To specify a different directory in which to place the vimbackup,
        " vimviews, vimundo, and vimswap files/directories, add the following to
        " your .vimrc.before.local.vim file:
        "   let g:invimplug_consolidated_directory = <full path to desired directory>
        "   eg: let g:invimplug_consolidated_directory = $HOME . '/.vim/'
        if exists('g:invimplug_consolidated_directory')
            let common_dir = g:invimplug_consolidated_directory . prefix
        else
            let common_dir = parent . '/.' . prefix
        endif

        for [dirname, settingname] in items(dir_list)
            let directory = common_dir . dirname . '/'
            if exists("*mkdir")
                if !isdirectory(directory)
                    call mkdir(directory)
                endif
            endif
            if !isdirectory(directory)
                echo "Warning: Unable to create backup directory: " . directory
                echo "Try: mkdir -p " . directory
            else
                let directory = substitute(directory, " ", "\\\\ ", "g")
                exec "set " . settingname . "=" . directory
            endif
        endfor
    endfunction
    call InitializeDirectories()
    " }

    " Initialize NERDTree as needed {
    function! NERDTreeInitAsNeeded()
        redir => bufoutput
        buffers!
        redir END
        let idx = stridx(bufoutput, "NERD_tree")
        if idx > -1
            NERDTreeMirror
            NERDTreeFind
            wincmd l
        endif
    endfunction
    " }

    " Strip whitespace {
    function! StripTrailingWhitespace()
        " Preparation: save last search, and cursor position.
        let _s=@/
        let l = line(".")
        let c = col(".")
        " do the business:
        %s/\s\+$//e
        " clean up: restore previous search history, and cursor position
        let @/=_s
        call cursor(l, c)
    endfunction
    " }

    " Shell command {
    function! s:RunShellCommand(cmdline)
        botright new

        setlocal buftype=nofile
        setlocal bufhidden=delete
        setlocal nobuflisted
        setlocal noswapfile
        setlocal nowrap
        setlocal filetype=shell
        setlocal syntax=shell

        call setline(1, a:cmdline)
        call setline(2, substitute(a:cmdline, '.', '=', 'g'))
        execute 'silent $read !' . escape(a:cmdline, '%#')
        setlocal nomodifiable
        1
    endfunction

    command! -complete=file -nargs=+ Shell call s:RunShellCommand(<q-args>)
    " e.g. Grep current file for <search_term>: Shell grep -Hn <search_term> %
    " }

    function! s:IsinvimplugFork()
        let s:is_fork = 0
        let s:fork_files = ["~/.vim/bootstrap/vimrc.fork", "~/.vim/bootstrap/vimrc.before.fork", "~/.vim/bootstrap/vimrc.bundles.fork"]
        for fork_file in s:fork_files
            if filereadable(expand(fork_file, ":p"))
                let s:is_fork = 1
                break
            endif
        endfor
        return s:is_fork
    endfunction

    function! s:ExpandFilenameAndExecute(command, file)
        execute a:command . " " . expand(a:file, ":p")
    endfunction

    function! s:EditinvimplugConfig()
        call <SID>ExpandFilenameAndExecute("tabedit", "~/.vimrc")
        call <SID>ExpandFilenameAndExecute("vsplit", "~/.vim/bootstrap/vimrc.before")
        call <SID>ExpandFilenameAndExecute("vsplit", "~/.vim/bootstrap/vimrc.bundles")

        execute bufwinnr(".vimrc") . "wincmd w"
        call <SID>ExpandFilenameAndExecute("split", "~/.vim/bootstrap/vimrc.local.vim")
        wincmd l
        call <SID>ExpandFilenameAndExecute("split", "~/.vim/bootstrap/vimrc.before.local.vim")
        wincmd l
        call <SID>ExpandFilenameAndExecute("split", "~/.vim/bootstrap/vimrc.bundles.local.vim")

        if <SID>IsinvimplugFork()
            execute bufwinnr(".vimrc") . "wincmd w"
            call <SID>ExpandFilenameAndExecute("split", "~/.vim/bootstrap/vimrc.fork")
            wincmd l
            call <SID>ExpandFilenameAndExecute("split", "~/.vim/bootstrap/vimrc.before.fork")
            wincmd l
            call <SID>ExpandFilenameAndExecute("split", "~/.vim/bootstrap/vimrc.bundles.fork")
        endif

        execute bufwinnr(".vimrc.local.vim") . "wincmd w"
    endfunction

    execute "noremap " . g:invimplug_edit_config_mapping " :call <SID>EditinvimplugConfig()<CR>"
    execute "noremap " . g:invimplug_apply_config_mapping . " :source ~/.vim/bootstrap/vimrc<CR>"
" }
