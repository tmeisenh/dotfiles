#!/bin/sh

# Stupid script to perform basic hardening to a FreeBSD system.
# Based on ideas from "BSD Hacks" by Dru Lavigne (O'Reilly) 

echo "I am going to perform some basic FreeBSD hardening hacks..."
echo ""

# Prior to 9.1 you'd want to chang this but after 9.1 you don't.

#echo "Editing /etc/login.conf..."
#echo "Changing the default password encryption to blowfish..."
#sed s/md5/blf/ /etc/login.conf >> /etc/login.conf.secure
#mv /etc/login.conf /etc/login.conf.orig.unsecure
#mv /etc/login.conf.secure /etc/login.conf
#echo "Done with /etc/login.conf edits. do a more /etc/login.conf and look for passwors to beginw ith $2"
#echo ""

#echo "Now rebuilding the password database with our new changes..."
#cp /etc/master.passwd /etc/master.passwd.orig.unsecure
#/usr/bin/cap_mkbd /etc/login.conf
#echo "Done with password database updates."
#echo "Please inform all users that they MUST reset their passwords..."
#echo "(passwd is the command to use.)"
#echo ""

#echo "Editing /etc/auth.conf..."
#echo "Changing the default new password encryption to blowfish..."
#cp /etc/auth.conf /etc/auth.conf.orig.unsecure
# echo "crypt_default = blf" >> /etc/auth.conf
#echo "Done with auth.conf edits."
#echo ""

echo "Now removing the standard MOTD and login display informaton"
touch /etc/motd
touch /etc/COPYRIGHT
echo "update_motd=\"no\" >> /etc/rc.conf"
echo "Now preventing ROOT from logging in...you must setup sudo!"
sed s/secure/insecure/ /etc/ttys > /etc/ttys_new
mv /etc/ttys /etc/ttys.orig.unsecure
mv /etc/ttys_new /etc/ttys
echo "Done with /etc/ttys changes."
echo ""

#echo "Editing /etc/gettytab to hide system information..."
#sed s/%s\/%m\ \(%h\)/%h/ /etc/gettytab > /etc/gettytab.secure
#mv /etc/gettytab /etc/gettytab.orig.unsecure
#mv /etc/gettytab.secure /etc/gettytab
#echo "Done with /etc/gettytab changes."
#echo ""

echo "Now restricting various config files within /etc to readonly permissions..."

chmod o= /etc/fstab
chmod o= /etc/ftpusers
chmod o= /etc/group
chmod o= /etc/hosts
chmod o= /etc/hosts.*
chmod o= /etc/inetd.conf
chmod o= /etc/login.access
chmod o= /etc/login.conf
chmod o= /etc/newsyslog.conf
chmod o= /etc/rc.conf
chmod o= /etc/ssh/sshd_config
chmod o= /etc/sysctl.conf
chmod o= /etc/ttys
echo "Done with permission modifications within /etc"
echo ""

echo 'clear_tmp_enable="YES"' >> /etc/rc.conf

echo "Trivial security updates are finished."
echo "Make sure your users change their passwords "
echo "to reflect the changes made in the passwd"
echo "database.  Reboot and enjoy."
