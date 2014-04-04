#!/bin/bash

# Ensure we're running from the ubuntu-kylin-docs project root directory
if [ ! -d ubuntu-kylin-help ]; then
    echo "ERROR: You must run this script from the ubuntu-kylin-docs project root directory."
    exit 1
fi

# Ensure the URL to the translation files tarball has been specified
if [ $# -lt 1 ]; then
    echo "Usage: $0 FILE"
    echo ""
    echo "    FILE         The tarball of .po files that Launchpad provides."
    exit 1
fi

# Location to store downloaded tarball
TMPDOCS="$1"

if [ ! -e "$TMPDOCS" ]; then
    echo "ERROR: File $TMPDOCS does not exist!"
    exit 1
fi

echo "Extracting translations from $TMPDOCS..."
tar -zxf "$TMPDOCS" --exclude='*.pot'

echo "Renaming translation files..."
POLANGS=""
for i in ./ubuntu-kylin-help/*/ubuntu-kylin-help-*.po; do
    OLDFILENAME=$i
    NEWFILENAME=$(basename $i | sed -e 's/^ubuntu-kylin-help-//')
    POLANG=$(basename $i .po | sed -e 's/^ubuntu-kylin-help-//')
    POLANGS="$POLANGS $POLANG"
    mkdir -p ./ubuntu-kylin-help/$POLANG
    mv $OLDFILENAME ./ubuntu-kylin-help/$POLANG/$NEWFILENAME
done

echo "Updating Makefile.am..."
cp ./ubuntu-kylin-help/Makefile.am ./ubuntu-kylin-help/Makefile.am.old
sed "s/HELP_LINGUAS = .*$/HELP_LINGUAS =$POLANGS/" ./ubuntu-kylin-help/Makefile.am.old > ./ubuntu-kylin-help/Makefile.am
rm -fr ./ubuntu-kylin-help/Makefile.am.old

echo "Done!"

