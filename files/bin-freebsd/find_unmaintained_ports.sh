#!/bin/sh
# Script which finds installed packages which do not have a maintainer

sh -c 'cd /usr/ports; grep -F "`for o in \`pkg_info -qao\` ; \
do echo "|/usr/ports/${o}|" ; done`" `make -V INDEXFILE` | \
grep -i \|ports@freebsd.org\| | cut -f 2 -d \| '
