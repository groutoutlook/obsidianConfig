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
imap -;p <Esc>-;p
" Go to link or open note in new tab(leaf)
" exmap follow obcommand editor:open-link-in-new-window
exmap follow obcommand editor:open-link-in-new-leaf
nmap gfx :follow

nmap gx $%gfx
" Open the link at the end of line.
nmap ;gx $%gx
imap ;gx <Esc>%wgxi

exmap closeall obcommand workspace:close-window
nmap ;wq :closeall

" NOTE: Paste as plain text? In pure Vim, this is no need.
" But in Obsidian, there is a plugin which interfere with that.
nmap <C-v> p
imap ;p <Esc>pa
imap ;u <Esc>2ui
imap ;r <Esc>2<C-r>i

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

" " Surround
" exmap surround_wiki surround [[ ]]
" exmap surround_double_quotes surround " "
" exmap surround_single_quotes surround ' '
" exmap surround_backticks surround ` `
" exmap surround_brackets surround ( )
" exmap surround_square_brackets surround [ ]
" exmap surround_curly_brackets surround { }
"
" map [[ :surround_wiki
" nunmap s
" vunmap s
" map s" :surround_double_quotes
" map s' :surround_single_quotes
" map s` :surround_backticks
" map sb :surround_brackets
" map s( :surround_brackets
" map s) :surround_brackets
" map s[ :surround_square_brackets
" map s] :surround_square_brackets
" map s{ :surround_curly_brackets
" map s} :surround_curly_brackets
