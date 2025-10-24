" Syntax highlight SQL embedded inside Python triple-quotes

" https://stackoverflow.com/questions/29791199/highlight-sql-inside-python-string-literals

" Temporarily disable current syntax
unlet b:current_syntax

" Load SQL syntax
syn include @SQL syntax/sql.vim

" modified https://thegreata.pe/articles/2020/07/11/vim-syntax-highlighting-for-sql-strings-inside-python-code/
syntax region sqlPythonString
      \ matchgroup=SpecialComment
      \ start=+\v\C\z('''|""")\_s*(--|(ALTER|BEGIN|CALL|COMMENT|COMMIT|CONNECT|CREATE|DELETE|DROP|END|EXPLAIN|EXPORT|GRANT|IMPORT|INSERT|LOAD|LOCK|MERGE|REFRESH|RENAME|REPLACE|REVOKE|ROLLBACK|SELECT|SET|TRUNCATE|UNLOAD|UNSET|UPDATE|UPSERT|COPY|WITH)>)@=+
      \ end=+\z1+
      \ contains=@SQL

syntax region sqlPythonRawString
      \ matchgroup=SpecialComment
      \ start=+\v\Cr\z('''|""")\_s*(--|(ALTER|BEGIN|CALL|COMMENT|COMMIT|CONNECT|CREATE|DELETE|DROP|END|EXPLAIN|EXPORT|GRANT|IMPORT|INSERT|LOAD|LOCK|MERGE|REFRESH|RENAME|REPLACE|REVOKE|ROLLBACK|SELECT|SET|TRUNCATE|UNLOAD|UNSET|UPDATE|UPSERT|COPY|WITH)>)@=+
      \ end=+\z1+
      \ contains=@SQL

syntax region sqlPythonFString
      \ matchgroup=SpecialComment
      \ start=+\v\Cf\z('''|""")\_s*(--|(ALTER|BEGIN|CALL|COMMENT|COMMIT|CONNECT|CREATE|DELETE|DROP|END|EXPLAIN|EXPORT|GRANT|IMPORT|INSERT|LOAD|LOCK|MERGE|REFRESH|RENAME|REPLACE|REVOKE|ROLLBACK|SELECT|SET|TRUNCATE|UNLOAD|UNSET|UPDATE|UPSERT|COPY|WITH)>)@=+
      \ end=+\z1+
      \ contains=@SQL,pythonString

syntax region sqlPythonRawFString
      \ matchgroup=SpecialComment
      \ start=+\v\C(fr|rf)\z('''|""")\_s*(--|(ALTER|BEGIN|CALL|COMMENT|COMMIT|CONNECT|CREATE|DELETE|DROP|END|EXPLAIN|EXPORT|GRANT|IMPORT|INSERT|LOAD|LOCK|MERGE|REFRESH|RENAME|REPLACE|REVOKE|ROLLBACK|SELECT|SET|TRUNCATE|UNLOAD|UNSET|UPDATE|UPSERT|COPY|WITH)>)@=+
      \ end=+\z1+
      \ contains=@SQL,pythonString

" modified https://github.com/sheerun/vim-polyglot/blob/ce31cd1d2f4e8eee9fd91325e4599f15cb9566fd/syntax/python.vim#L273
syn region pythonStrInterpRegion
      \ matchgroup=pythonStrFormat
      \ start="{"
      \ end="\%(![rsa]\)\=\%(:\%({\%(\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\|\d\+\)}\|\%([^}]\=[<>=^]\)\=[ +-]\=#\=0\=\d*,\=\%(\.\d\+\)\=[bcdeEfFgGnosxX%]\=\)\=\)\=}"
      \ extend contained containedin=pythonFString,pythonRawFString,sqlPythonFString,sqlPythonRawFString contains=pythonStrInterpRegion,@pythonExpression

" https://gist.github.com/mdzhang/eaab47b323d49feb5db81a3b92fc128c
" Need to add the keepend here
" syn region pythonString matchgroup=pythonQuotes
"       \ start=+[uU]\=\z(['"]\)+ end="\z1" skip="\\\\\|\\\z1"
"       \ contains=pythonEscape,@Spell keepend
" syn region pythonRawString matchgroup=pythonQuotes
"       \ start=+[uU]\=[rR]\z(['"]\)+ end="\z1" skip="\\\\\|\\\z1"
"       \ contains=@Spell keepend
"
" syn region SQLEmbedded contains=@SQL containedin=pythonString,pythonRawString contained
"     \ start=+\v(ALTER|BEGIN|CALL|COMMENT|COMMIT|CONNECT|CREATE|DELETE|DROP|END|EXPLAIN|EXPORT|GRANT|IMPORT|INSERT|LOAD|LOCK|MERGE|REFRESH|RENAME|REPLACE|REVOKE|ROLLBACK|SELECT|SET|TRUNCATE|UNLOAD|UNSET|UPDATE|UPSERT)+
"     \ end=+;+

" Restore current syntax
let b:current_syntax = 'python'
