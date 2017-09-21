#!/bin/sh

if [ "${PWD##*/}" != 'scripts' -o ! -d ../ubuntu-kylin-help ]; then
    echo "ERROR: You should run this script from the 'scripts' directory."
    exit 1
fi
cd ../ubuntu-kylin-help/C

xmllint --noout --schematron gnome-help.sct *.page 2>&1 | grep -v validates
