" adapted from: https://github.com/zackhsi/sorbet.vim/blob/master/syntax/ruby.vim
" and: https://stackoverflow.com/questions/78318245/how-to-vim-syntax-highlight-ruby-sorbet-signatures-as-de-emphasized-comments/78332308#78332308
syntax region SigBlock start="{" end="}" contained
syntax region SigBlock start="\<do\>" end="\<end\>" contained

" Prevent sorbet elements from being contained by vim-ruby elements.
syntax cluster rubyNotTop add=SigBlock

syntax match Sig "\<sig\>" nextgroup=SigBlock skipwhite

" Match vim-ruby:
" https://github.com/vim-ruby/vim-ruby/commit/19c19a54583c3e7c07dce18b844ae104695c41d7.
syntax match rubyMagicComment "\c\%<10l#\s*\zs\%(typed\):" contained nextgroup=rubyBoolean skipwhite

" de-emphasize Sorbet sig
highlight default link Sig      Comment
highlight default link SigBlock Comment
