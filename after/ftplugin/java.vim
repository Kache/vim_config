" define :section for java as class signature
map <silent> [[ ?{<CR>w99[{
map <silent> ]] j0[[%/{<CR>
map <silent> ][ /}<CR>b99]}
map <silent> [] k$][%?}<CR>

function NavPrevMethodStart()
  let s = getpos('.')

  " go to 'current method opening', which includes space between methods
  normal! ]M
  let e = getpos('.')
  keepjumps normal! [m

  " if we didn't move twice, we were before the class open, so jump again
  if getpos('.')[1] == e[1]
    keepjumps normal! ]m
  end

  " go to 'current method startline'
  keepjumps call search(')', 'bW')
  keepjumps normal! %B

  " jump to the prev method if started above this line
  if getpos('.')[1] >= s[1]
    keepjumps normal! [m
    let s = getpos('.')

    keepjumps call search(')', 'bW')

    " if not at class signature
    let e = getpos('.')
    if e[1] != s[1] || e[2] != s[2]
      keepjumps normal! %B
    end
  end
endfunction
noremap <silent> [m :call NavPrevMethodStart()<CR>

function NavNextMethodStart()
  let s = getpos('.')

  " go to 'current method opening', which includes space between methods
  normal! ]M
  let e = getpos('.')
  keepjumps normal! [m

  " if we didn't move twice, we were before the class open, so jump again
  if getpos('.')[1] == e[1]
    keepjumps normal! ]m
  end

  " go to 'current method startline'
  keepjumps call search(')', 'bW')
  keepjumps normal! %B

  " jump to next method if we started below this line
  if getpos('.')[1] <= s[1]
    keepjumps normal! ]M]m

    " if not the last line
    if getpos('.')[1] != line('$')
      keepjumps call search(')', 'bW')
      keepjumps normal! %B
    end
  end
endfunction
noremap <silent> ]m :call NavNextMethodStart()<CR>

" JSP comment format for vim-commentary
autocmd FileType jsp setlocal commentstring=<%--\ %s\ --%>
