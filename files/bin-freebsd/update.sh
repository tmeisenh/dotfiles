#!/bin/sh

su -c 'cd /usr/src;make update;cd /usr/ports;make fetchindex'
