" Check all obcommand by typing `:obcommand` on Obsidian windows

" Common Vim/Neovim default.
imap jk <Esc>
imap kj <Esc>
imap jj <Esc>


" Cycle betwe.6.6.1.en tabs
exmap tabprev obcommand workspace:previous-tab
nmap H :tabprev
exmap tabnext obcommand workspace:next-tab
nmap L :tabnext

" Yank to system clipboard
set clipboard=unnamed

" NOTE: In Normal Mode, have to unmap. In Insert mode then no need.
unmap <Space>
unmap ;
unmap -
" unmap t

" map workspace
exmap loadworkspace obcommand workspaces:save-and-load
nmap ;ws :loadworkspace<CR>
imap ;ws :loadworkspace<CR>

" This is due to my familiar keystroke in neovim to find last sessions.
nmap <Space>fs :loadworkspace
nmap ;fs :loadworkspace<CR>
imap ;fs :loadworkspace<CR>

" nmap vv v$
imap vv <Esc>v$

" Go to link or open note in new tab(leaf)
" exmap follow obcommand editor:open-link-in-new-window
exmap follow obcommand editor:open-link-in-new-leaf
nmap gl :follow<CR>

nmap gx f]wgl
" Open the link at the end of line.
nmap ;x gx
imap ;x <Esc>%wgxi
imap <C-CR> <Esc>%wgxi
imap gx <Esc>%wgx
imap xx <Esc>%wgxi


exmap closeAll obcommand workspace:close-window
exmap closeTab obcommand workspace:close
nmap qq :closeTab<CR>
nmap ;q :closeTab<CR>
nmap ;wq :closeTab<CR>
imap ;q <Esc>:closeTab<CR>
imap ;wq <Esc>:closeTab<CR>
" exmap q obcommand workspace:close

" INFO: Vimium C mimicking. This is actually restore tab.
exmap undoTab obcommand workspace:undo-close-pane
nmap ;t :undoTab<CR>
nmap tt :undoTab<CR>
imap ;t :undoTab<CR>


" [](obsidian://advanced-uri?vault=Vault_2401&filepath=note_IDEAndTools%252FDev%252FTask%252F001.002-Syntax%2520just.md)
exmap copyURIsimple obcommand workspace:copy-url
" Or you could -> obsidian-advanced-uri:copy-uri-current-file-simple
nmap ;p :copyURIsimple<CR>
imap ;p :copyURIsimple<CR>

" INFO: Copy current block's URI
exmap copyURIAdvanced obcommand obsidian-advanced-uri:copy-uri-block
imap ;ap :copyURIAdvanced<CR>
nmap ;ap :copyURIAdvanced<CR>


" NOTE: Paste as plain text? In pure Vim, this is no need.
" But in Obsidian, there is a plugin which interfere with that.
nmap <C-v> p
imap ;u <Esc>2ui
imap ;r <Esc>2<C-r>i

imap ;lt <Esc><C-k> 


" Insert templates
exmap ins_temp obcommand templater-obsidian:insert-templater
nmap <Space>t :ins_temp

" Focus on global search input
exmap globalSearch obcommand omnisearch:show-modal
nmap <Space>ff :globalSearch<CR>
nmap ;ff :globalSearch<CR>
imap ;ff :globalSearch<CR>


" Splits
exmap vsplit obcommand workspace:split-vertical
nmap <Space>v :vsplit<CR>
exmap hsplit obcommand workspace:split-horizontal
nmap <Space>V :hsplit<CR>


" INFO: Fold in insert mode?
exmap foldToggle obcommand editor:toggle-fold
nmap za :foldToggle<CR>
imap ;za :foldToggle<CR>


" Folding frontmatter
exmap foldProp obcommand editor:toggle-fold-properties
nmap zp :foldProp<CR>
imap ;zp :foldProp<CR>

" Maps pasteinto to Alt-p
imap <A-p> <Esc>p


" INFO: unmap keys
" unmap <C-w>
" imap <c-w> <c-bs>
" imap <c-w> <Esc>dba
nmap <C-BS> db
vmap a <Esc>
vmap i <Esc>


" INFO: PDF++
" Use j/k, instead of J/K, to go to the next page
"map j J
"map k K

" JavaScript commands
" - Hit Ctrl-h in Normal mode to show a message
nmap <C-.> :jscommand {alert("Hello, world!")}<CR>
" - Hit Ctrl-h in Visual mode to run a .js file
vmap <C-.> :jsfile test.js<CR>


" INFO: Hotkey-helper related.

exmap pluginSettings obcommand hotkey-helper:open-settings
exmap pluginHotkeys obcommand hotkey-helper:open-hotkeys
nmap ;,s :pluginSettings<CR>
nmap ;,k :pluginHotkeys<CR>
imap ;,s :pluginSettings<CR>
nmap ;,k :pluginHotkeys<CR>

" INFO: obcommand debugger
" Either the copied lines 
" nmap ;oc :obcommand <c-v>
" imap ;oc <Esc>:obcommand
" INFO: or the current line on the [[All commands]] note or elsewhere..


" nmap <c-w><c-w>
" INFO: mapping the short ci/yi/ca/ya/ct/yt
nmap yi9 yi(
nmap yi; yi"

nmap ci9 ci(
nmap ci; ci"

" INFO: detach from current windows. Purpose is showing note in another places.
" Same as my current VimiumC settings
exmap newWindow obcommand workspace:move-to-new-window
nmap ;w :newWindow<CR>
imap ;w :newWindow<CR>
nmap ;W :newWindow<CR>


nmap <Space>z Gzz
nmap ;z Gzz
imap ;z <Esc>Gzza


exmap jumpToLink obcommand mrj-jump-to-link:activate-lightspeed-jump
nmap gs :jumpToLink<CR>
nmap <CR> :jumpToLink<CR>
