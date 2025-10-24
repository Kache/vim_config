" FZF
if has("gui_macvim")
    macmenu &File.New\ Tab key=<nop>
    nnoremap <D-t> :Files<CR>
endif

" set guifont=SauceCodeProNerdFontCompleteM-Regular:h14,Hack-Regular:h14
let &guifont = "SauceCodePro Nerd Font Mono:h14,Hack:h14"
