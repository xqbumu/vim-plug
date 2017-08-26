" Platform
function! MySys()
	if has("win32")
		retur "windows"
	else
		return "linux"
	endif
endfunction
