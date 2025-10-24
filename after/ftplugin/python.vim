nnoremap <silent> <leader>ts :CocCommand pyright.singleTest<CR>
nnoremap <silent> <leader>tq :call term_sendkeys(bufnr("/usr/bin/zsh"), "exit\n")<CR>
nnoremap <silent> <leader>tt :terminal ++norestore ++rows=12 pytest --pdb %<CR>
nnoremap <silent> <leader>ta :terminal ++norestore ++rows=12 pytest --pdb<CR>
