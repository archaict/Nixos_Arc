nnoremap : ;
nnoremap ; :

nnoremap j gj
nnoremap k gk

nnoremap J 10j
nnoremap K 10k

inoremap jk <ESC>

nnoremap <Space>ot :call VSCodeNotify("workbench.action.terminal.toggleTerminal")<CR>
nnoremap <Space>dd :call VSCodeNotify("workbench.explorer.fileView.focus")<CR>

nnoremap <Space>wv :call VSCodeNotify("workbench.action.splitEditorRight")<CR>
nnoremap <Space>ww :call VSCodeNotify("workbench.action.focusNextGroup")<CR>
nnoremap <Space>wq :call VSCodeNotify("workbench.action.closeEditorsInGroup")<CR>

nnoremap <C-j> :call VSCodeNotify("workbench.action.focusNextGroup")<CR>
nnoremap <C-k> :call VSCodeNotify("workbench.action.focusPreviousGroup")<CR>

nnoremap <Space>fr :call VSCodeNotify("file-browser.open")<CR>
nnoremap <Space>ff :call VSCodeNotify("workbench.action.quickOpen")<CR>

nnoremap <Space>rr :source /etc/nixos/codex/core/codium/init.vim<CR>