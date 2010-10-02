imap <buffer> ITM <Plug>Tex_InsertItemOnThisLine
let g:Tex_Com_verb = "\\verb|<++>|<++>"
call IMAP('FEV', '\verb|<++>|<++>', 'tex')
call IMAP('EIM', "\\begin{figure}[ht]\<cr>\\begin{center}\<cr>\\includegraphics[width=120mm\\textwidth]{../images/<+image+>}\<cr>\\end{center}\<cr>\\caption{<+caption text+>}\<cr>\\label{<+label+>}\<cr>\\end{figure}<++>", 'tex')
set textwidth=75
set wrap
