# $Id$
#
# Z shell configuration file
#
# Author: Travis Meisenheimer <travis@indexoutofbounds.com>
#
# Works on zsh versions > 4.0.9.
#********************************************************************


# System  specific environment variables and settings
export VIM=/usr/local/share/vim/vim73
export MANPAGER="col -b | $VIM/macros/less.sh -c 'set ft=man nomod nolist nofoldenable' -"

# Hash common directories
hash -d log=/var/log
hash -d ports=/usr/ports
hash -d src=/usr/src
hash -d doc=/usr/share/doc
hash -d pdoc=/usr/local/share/doc
hash -d www=/usr/local/www

# End