" Platform-specific settings for Unix/terminal vim

" Save backup files in ~/tmp, not current directory
set backupdir-=.
set backupdir^=~/tmp,/tmp

" Put swap files in ~/tmp
set directory=~/tmp/,/var/tmp/.

" tmux key compatibility
if &term =~ '^screen'
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif
