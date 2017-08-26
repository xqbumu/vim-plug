if has('cscope' )

	" "set tags=/usr/bin/ctags
	set cscopeprg=/usr/bin/cscope
	" set search cscope first is csto is 0
	set csto=1
	" set ctags and cscope with ctrl+]
	set cscopetag
	" 不显示添加数据库是否成功"
	set nocsverb
	if filereadable('cscope.out')
		cscope add cscope.out
	elseif $CSCOPE_DB!=''
		cs add $CSCOPE_DB
	endif
	" 显示添加数据库是否成功"
	set csverb
endif

nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>
