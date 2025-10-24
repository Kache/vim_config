set nocompatible              " be iMproved, required
filetype off                  " required

" install plug.vim - https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-polyglot - disable before loading b/c already have vim-sleuth
let g:polyglot_disabled = ["autoindent"]

call plug#begin()

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plug 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plug 'L9'
" Git plugin not hosted on GitHub
"Plug 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plug 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plug 'ascenator/L9', {'name': 'newL9'}

Plug 'chrisbra/csv.vim'
Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-obsession'
Plug 'mbbill/undotree'
Plug 'raimondi/delimitmate'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'mileszs/ack.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'lervag/file-line'
Plug 'mg979/vim-visual-multi'
Plug 'kana/vim-textobj-user'  " see: https://github.com/kana/vim-textobj-user/wiki
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-function'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'thinca/vim-textobj-between'
Plug 'coderifous/textobj-word-column.vim'
Plug 'farmergreg/vim-lastplace'
Plug 'qpkorr/vim-bufkill'
Plug 'vimwiki/vimwiki'
Plug 'chrisbra/colorizer'
Plug 'sheerun/vim-polyglot'
Plug 'chrisbra/recover.vim'
if v:version > 802
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
else
  Plug 'neoclide/coc.nvim', {'tag': 'v0.0.82'}  " latest for vim 8.2
endif
if !has('nvim')
  Plug 'SirVer/ultisnips'
endif
Plug 'ruanyl/vim-gh-line'  " TODO: replace with https://github.com/tpope/vim-rhubarb
" Plug 'cespare/vim-toml'
Plug 'asheq/close-buffers.vim'
Plug 'farfanoide/inflector.vim'
Plug 'andrewradev/splitjoin.vim'
Plug 'tommcdo/vim-exchange'
" Plug 'zackhsi/sorbet.vim'

" Plug 'github/copilot.vim'

" Plug 'file://'.expand('~').'/workplace/VimIon'
" java syntax (too old)
" Plug 'rudes/vim-java'

" Can break syntax highlighting: https://github.com/vim-ruby/vim-ruby/issues/366
" Plug 'valloric/vim-operator-highlight'

" colors
" Plug 'twerth/ir_black'
" Plug 'dracula/vim'
" Plug 'erichdongubler/vim-sublime-monokai'
" Plug 'NLKNguyen/papercolor-theme'
" Plug 'hauleth/blame.vim'
" Plug 'atelierbram/Base2Tone-vim'
" Plug 'Badacadabra/vim-archery'
" Plug 'whatyouhide/vim-gotham'
" Plug 'sjl/badwolf'
" Plug 'lifepillar/vim-solarized8'
" Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'

" All of your Plugins must be added before the following line
call plug#end()
" Put your non-Plugin stuff after this line

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set background=dark
" let g:gruvbox_contrast_dark="hard"
let g:ophigh_color=109
let g:ophigh_color_gui="#83a598"
silent! colorscheme jellybeans

" ft-java-syntax options
let java_minlines=100
let java_comment_strings=1
let java_highlight_all=1
let java_highlight_debug=1
let java_highlight_functions="style"
let java_highlight_java_lang_ids=1

" from https://stackoverflow.com/questions/3878692/aliasing-a-command-in-vim
fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun

""""" behavior

"" already set by sensible.vim
" syntax enable
" set autoindent
" set backspace=indent,eol,start
" set smarttab
"set expandtab
set scrolloff=2
" set laststatus=2
" set wildmenu
set timeout timeoutlen=300
" set incsearch

set synmaxcol=300

set wildmode=list:longest,full
set showcmd

set number relativenumber
set signcolumn=number

"set autochdir
set nostartofline
set nojoinspaces
set confirm
set novisualbell
set belloff=esc,ex,cursor,error

" search
set hlsearch
set ignorecase
set smartcase
set infercase

set nowrap

" italics
if &term =~ 'term'
  set t_ZH=[3m
  set t_ZR=[23m
end

if has("mouse")
  set mouse=a
  if exists('$TMUX')
    set ttymouse=xterm2
  endif
endif

set showtabline=2
set switchbuf=useopen,usetab
set hidden
set encoding=utf-8
set updatetime=500

set directory=~/.vim/tmp//
set backupdir=~/.vim/tmp//
set undodir=~/.vim/tmp//

set splitbelow
set splitright
call SetupCommandAlias('spk', 'above split')
call SetupCommandAlias('sph', 'lefta split')

" clipboard
set clipboard=unnamed
"vnoremap p pgvygv<Esc>
"nnoremap d "_d
"vnoremap d "_d
"vnoremap p "*p
"vnoremap P "*P
"vnoremap y "*y

" For WSL conditionals
function! IsWSL()
  if has("unix") && filereadable("/proc/version")
    " avoid error on Android
    let lines = readfile("/proc/version")
    if lines[0] =~ "microsoft"
      return 1
    endif
  endif
  return 0
endfunction

" Set clipboard on WSL
if IsWSL()
  set clipboard=unnamedplus
  let g:clipboard = {
  \ 'name': 'WslClipboard',
  \ 'copy': {
  \   '+': 'clip.exe',
  \   '*': 'clip.exe',
  \ },
  \ 'paste': {
  \   '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("r", ""))',
  \   '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("r", ""))',
  \ },
  \ 'cache_enabled': 0,
  \ }
endif

" Python isort (pip install isort): https://github.com/pycqa/isort/wiki/isort-Plugins
command! -range=% Isort :<line1>,<line2>! isort -

" JSON formatter, works on files & visual ranges, TODO: replace python usage with jq? avoid "parse as Python float"
function JSONFormat() range
  let l:formatted = system('python -m json.tool', join(getline(a:firstline, a:lastline)))
  if l:formatted == "No JSON object could be decoded\n"
    echo 'No JSON object could be decoded'
  else
    execute a:firstline.",".a:lastline."delete"
    silent put! =l:formatted
  end
endfunction
command -range=% -nargs=0 JSONFormat :<line1>,<line2>call JSONFormat()

" " ION formatter, works on files & visual ranges
" function IONFormat() range
"   let l:formatted = system('ionist --format=pretty | grep .', join(getline(a:firstline, a:lastline)))
"   if l:formatted == "No ION object could be decoded\n"
"     echo 'No ION object could be decoded'
"   else
"     execute a:firstline.",".a:lastline."delete"
"     silent put! =l:formatted
"   end
" endfunction
" command -range=% -nargs=0 IONFormat :<line1>,<line2>call IONFormat()

function DeleteHiddenBuffers()
  let tpbl=[]
  call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
  for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
    silent execute 'bwipeout' buf
  endfor
endfunction
command DeleteHiddenBuffers :call DeleteHiddenBuffers()
call SetupCommandAlias("bhd", "DeleteHiddenBuffers")

" close-buffers.vim
nnoremap <silent> <leader>bd :Bdelete hidden<CR>

function FindBeans()
  Ack "@Bean(\(.*\))?\n(\s*@.*\n)*.* \w*\(.*\)"
endfunction
command Beans :call FindBeans()

" inlined Plugin 'jeffkreeftmeijer/vim-numbertoggle' for gui only, too many redraws in term
if has("gui_running")
  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
  augroup END
end

""""" plugin config

" h sql.txt
let g:sql_type_default = 'postgresql'

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" ack.vim search executable
if executable('rg')
  let g:ackprg = 'rg --vimgrep --smart-case'
  call SetupCommandAlias("rg", "Ack")
elseif executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
  call SetupCommandAlias("ag", "Ack")
elseif !executable('ack')
  let g:ackprg = 'grep --recursive --exclude-dir ".*" --with-filename --line-number'
endif

" NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <silent> <leader>ff :NERDTreeFind<CR>
let NERDTreeMinimalUI = 1
" vim-obsession compatibility: https://github.com/tpope/vim-obsession/issues/5#issuecomment-537717333
set sessionoptions-=blank

" vim-sleuth
nnoremap <leader>s :Sleuth<CR>

" file-line
let g:file_line_crosshairs=0

" vim-gh-line
if IsWSL()
  let g:gh_open_command = 'fn() { echo "$@" | clip.exe; }; fn '
endif

" FZF
" alternative: ln -s $(brew --prefix fzf) ~/.vim/bundle/fzf.vim/after
" set runtimepath+=$HOMEBREW_PREFIX/opt/fzf
nnoremap <silent> <C-p> :Files<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
" Initialize configuration dictionary
let g:fzf_vim = {}

" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Undotree
nnoremap <F5> :UndotreeToggle<CR>
let g:undotree_DiffCommand = "diff -u"

" Vim Fugitive
nnoremap <silent> <leader>bl :Git blame -w -M<CR>
nnoremap <silent> <leader>d :Gdiffsplit HEAD<CR>

" vimwiki config, <Leader>ww to jump to index.wiki
let wiki = { 'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.wiki' }
let wiki.nested_syntaxes = {
\   'python': 'python', 'py': 'python',
\   'javascript': 'javascript', 'js': 'javascript',
\   'ruby': 'ruby', 'rb': 'ruby',
\ }
let g:vimwiki_list = [wiki]

" vimwiki: VimwikiLinkHandler - custom open-in-vim
function! VimwikiLinkHandler(link)
  " Use Vim to open external files with the 'vfile:' scheme.  E.g.:
  "   1) [[vfile:~/Code/PythonProject/abc123.py]]
  "   2) [[vfile:./|Wiki Home]]
  let link = a:link
  if link =~# '^vfile:'
    let link = link[1:]
  else
    return 0
  endif
  let link_infos = vimwiki#base#resolve_link(link)
  if link_infos.filename == ''
    echomsg 'Vimwiki Error: Unable to resolve link!'
    return 0
  else
    exe 'tabnew ' . fnameescape(link_infos.filename)
    return 1
  endif
endfunction

" ft-csv: auto-arrange CSVs less than 1 MB // Size limit isn't working?
" let g:csv_autocmd_arrange = 1
" let g:csv_autocmd_arrange_size = 1024*1024

" bdelete without closing last window, uses vim-bufkill
" nnoremap bd :bp<bar>sp<bar>bn<bar>bdelete<CR>
" call SetupCommandAlias("bd", "BD")

" inflector.vim
let g:inflector_mapping = 'gI'

" splitjoin.vim
let g:splitjoin_trailing_comma = 1

" Ultisnips
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

""" coc.nvim settings, see :h `coc-nvim` and `coc-completion`
"" plugins (switched to using Plugin manager instead)
let g:coc_global_extensions = ['coc-lists', 'coc-pyright', 'coc-sh', 'coc-ultisnips']

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" " Use <c-space> to trigger completion.
" if has('nvim')
"   inoremap <silent><expr> <c-space> coc#refresh()
" else
"   inoremap <silent><expr> <c-@> coc#refresh()
" endif

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"" coc-snippets
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

""""" keymaps

"make vim save and load the folding of the document each time it loads
"also places the cursor in the last place that it was left.
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview

" " ins-completion with Ctrl-Space
" if has("gui_running")
"   inoremap <C-Space> <C-X>
" else
"   inoremap <C-@> <C-X>
" end

" term-like cursor movement
noremap!  <Right>
noremap!  <Left>
if has("gui_running") && has("gui_macvim")
  noremap! ∫ <C-Left>
  noremap! ƒ <C-Right>
else
  noremap! b <C-Left>
  noremap! f <C-Right>
end

"<Ctrl + c> to clear highlight and redraw
" nnoremap <silent> <C-c> :nohlsearch<CR><C-l>
nnoremap <silent> <C-c> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

" diff vertically, ignore whitespace
set diffopt+=vertical,iwhite
if has("patch-8.1.0360")
  set diffopt+=indent-heuristic,algorithm:histogram
endif

" cursor movement
noremap j gj
noremap k gk

" cursor movement between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
" nnoremap <C-S-j> <C-W>j
" nnoremap <C-S-k> <C-W>k
" nnoremap <C-S-h> <C-W>h
" nnoremap <C-S-l> <C-W>l

""" selection
" select text in current line
nnoremap vv ^vg_
" select pasted text
nnoremap gp `[v`]

" set clipboard to relative or absolute file path or filename
nnoremap <leader>fp :redir @*<bar>:echon expand("%")<bar>:redir END<bar>let @+=@*<CR>
nnoremap <leader>fa :redir @*<bar>:echon expand("%:p")<bar>:redir END<bar>let @+=@*<CR>
nnoremap <leader>fn :redir @*<bar>:echon expand("%:t")<bar>:redir END<bar>let @+=@*<CR>

" Map coc-list commands in a vim-unimpaired style
nmap <silent> [r :CocPrev<CR>
nmap <silent> ]r :CocNext<CR>
nmap <silent> [R :CocFirst<CR>
nmap <silent> ]R :CocLast<CR>

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" DISABLED: old version of below
" " Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   elseif (coc#rpc#ready())
"     call CocActionAsync('doHover')
"   else
"     execute '!' . &keywordprg . " " . expand('<cword>')
"   endif
" endfunction

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif
