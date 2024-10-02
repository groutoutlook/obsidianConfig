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
nmap ;ws :loadworkspace
imap ;ws :loadworkspace

" This is due to my familiar keystroke in neovim to find last sessions.
nmap <Space>fs :loadworkspace
nmap ;fs :loadworkspace
imap ;fs :loadworkspace

" nmap vv v$
imap vv <Esc>v$

" Go to link or open note in new tab(leaf)
" exmap follow obcommand editor:open-link-in-new-window
exmap follow obcommand editor:open-link-in-new-leaf
nmap gl :follow

nmap gx f]wgl
" Open the link at the end of line.
nmap ;x gx
imap ;x <Esc>%wgxi
imap <C-CR> <Esc>%wgxi
imap gx <Esc>%wgx
imap xx <Esc>%wgxi


exmap closeAll obcommand workspace:close-window
exmap closeTab obcommand workspace:close
nmap qq :closeTab
nmap ;q :closeTab
imap ;q :closeTab
nmap ;wq :closeTab
" exmap q obcommand workspace:close

" INFO: Vimium C mimicking. This is actually restore tab.
exmap undoTab obcommand workspace:undo-close-pane
nmap ;t :undoTab
nmap tt :undoTab 
imap ;t :undoTab


" [](obsidian://advanced-uri?vault=Vault_2401&filepath=note_IDEAndTools%252FDev%252FTask%252F001.002-Syntax%2520just.md)
exmap copyURIsimple obcommand workspace:copy-url
" Or you could -> obsidian-advanced-uri:copy-uri-current-file-simple
nmap ;p :copyURIsimple
imap ;p :copyURIsimple

" INFO: Copy current block's URI
exmap copyURIAdvanced obcommand obsidian-advanced-uri:copy-uri-block
imap ;ap :copyURIAdvanced
nmap ;ap :copyURIAdvanced


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
nmap <Space>ff :globalSearch
nmap ;ff :globalSearch
imap ;ff :globalSearch


" Splits
exmap vsplit obcommand workspace:split-vertical
nmap <Space>v :vsplit
exmap hsplit obcommand workspace:split-horizontal
nmap <Space>V :hsplit


" INFO: Fold in insert mode?
exmap foldToggle obcommand editor:toggle-fold
nmap za :foldToggle
imap ;za :foldToggle


" Folding frontmatter
exmap foldProp obcommand editor:toggle-fold-properties
nmap zp :foldProp
imap ;zp :foldProp

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
nmap <C-.> :jscommand {alert("Hello, world!")}
" - Hit Ctrl-h in Visual mode to run a .js file
vmap <C-.> :jsfile test.js


" INFO: Hotkey-helper related.

exmap pluginSettings obcommand hotkey-helper:open-settings
exmap pluginHotkeys obcommand hotkey-helper:open-hotkeys
nmap ;,s :pluginSettings
nmap ;,k :pluginHotkeys
imap ;,s :pluginSettings
nmap ;,k :pluginHotkeys

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
nmap ;w :newWindow
imap ;w :newWindow
nmap ;W :newWindow


nmap ;g Gzz
nmap <Space>z Gzz
imap ;g <Esc>Gzza


