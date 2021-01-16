#/bin/sh

# requires ports-mgmt/portupgrade for pkgdb

# sync pkgdb with ports tree
pkgdb -F

# delete all packages
pkg_delete -f -a

# delete ports
rm -rf /var/db/pkg/*

rm -rf /var/db/ports/*

rm -rf /usr/local/*

rm -rf /usr/ports/distfiles/*
