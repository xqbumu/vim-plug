"防止错误整行标红导致看不清
highlight clear SpellBad
highlight SpellBad term=underline cterm=underline ctermfg=red gui=undercurl guisp=Red
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline ctermfg=4 gui=undercurl guisp=Blue
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline gui=undercurl guisp=Magenta
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline gui=undercurl guisp=Cyan

" 有问题的单词使用下面的高亮:
"         SpellBad        不能识别的单词 (坏词)                    hl-SpellBad 
"         SpellCap        开头没有大写的单词                       hl-SpellCap 
"         SpellRare       偏僻词                                   hl-SpellRare 
"         SpellLocal      不符合所选区域的拼写方式                 hl-SpellLocal