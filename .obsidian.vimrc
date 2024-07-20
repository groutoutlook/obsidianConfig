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

" Make a newline with a link.
nmap ;p A<space>[](<Esc>pa)<Esc>%ba
nmap -;p o-<Esc>;p
imap ;p <Esc>;p
imap -;p <Esc>-;p
" Go to link or open note in new tab(leaf)
" exmap follow obcommand editor:open-link-in-new-window
exmap follow obcommand editor:open-link-in-new-leaf
nmap glx :follow

nmap gx f]wglx
" Open the link at the end of line.
nmap ;gx gx
imap ;gx <Esc>%wgxi
imap <C-CR> <Esc>%wgxi
imap gxx <Esc>%wgxi
imap ggx <Esc>%wgxi

exmap closeAll obcommand workspace:close-window
exmap closeTab obcommand workspace:close
nmap ;q :closeTab
imap ;q :closeTab
nmap ;wq :closeTab
exmap q obcommand workspace:close
" template
" exmap insertTemplate obcommand insert-template 
" nmap ;t :insertTemplate
exmap undoTab obcommand workspace:undo-close-pane
nmap ;t :undoTab
imap ;t :undoTab






" NOTE: Paste as plain text? In pure Vim, this is no need.
" But in Obsidian, there is a plugin which interfere with that.
nmap <C-v> p
" imap ;p <Esc>pa
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


" INFO: Copy current block's URI
exmap makeLink obcommand obsidian-advanced-uri:copy-uri-block
imap ;ml :makeLink
nmap ;ml :makeLink
"


" INFO: unmap keys
" unmap <C-w>
" imap <c-w> <c-bs>
imap <c-w> <Esc>dba
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
imap ;,k :pluginHotkeys

" INFO: obcommand debugger
" Either the copied lines 
" nmap ;oc :obcommand <c-v>
" imap ;oc <Esc>:obcommand
" INFO: or the current line on the [[All commands]] note or elsewhere..

