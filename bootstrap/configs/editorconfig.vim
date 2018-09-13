" Excluded patterns.

" To ensure that this plugin works well with Tim Pope's fugitive, use the following patterns array:
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" If you wanted to avoid loading EditorConfig for any remote files over ssh:
let g:EditorConfig_exclude_patterns = ['scp://.*']

" Of course these two items could be combined into the following:
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Disable rules
" You might want to override some project-specific EditorConfig rules in global or local vimrc in some cases, e.g., to resolve coflicts of trailing whitespace trimming and buffer autosaving.
let g:EditorConfig_disable_rules = ['trim_trailing_whitespace']
" You are able to disable any supported EditorConfig properties.

" Exec Path
" The file path to the EditorConfig core executable. You could set this value in your |vimrc| like this:
" let g:EditorConfig_exec_path = 'Path to your EditorConfig Core executable'
