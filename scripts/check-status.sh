#!/bin/bash

# Produce a summary of the statuses of all of the .page topics
# (Not done properly, but it's OK for a rough estimate)
#
# How to use the status tags:
# none - no status has been assigned
# stub - contains little to no real content
# incomplete - outline of all information, but lacking content
# draft - all content available, but unpolished
# outdated - was once complete or nearly complete, but needs to
#            be revised to reflect changes
# review - ready to be reviewed by editors
# candidate - reviewed and awaiting a final approval
# final - approved and ready for publication or distribution
#
# DO NOT TRANSLATE

if [ "${PWD##*/}" != 'scripts' -o ! -d ../ubuntu-help ]; then
    echo "ERROR: You should run this script from the 'scripts' directory."
    exit 1
fi
cd ../ubuntu-help/C

PREVIOUS_UBUNTU_VERSIONS=( "4.10" "5.04" "5.10" "6.06" "6.10" "7.04" "7.10" "8.04" "8.10" "9.04" "9.10" "10.04" "10.10" "11.04" "11.10" "12.04" "12.10" "13.04" );
CURRENT_UBUNTU_VERSION="13.10"

if [ "x$1" = "x" -o "x$1" = "x--none" ]; then
    echo " "
    echo "== NONE =="
    grep -l "$CURRENT_UBUNTU_VERSION.*status=\"none" *.page
fi
if [ "x$1" = "x" -o "x$1" = "x--stub" ]; then
    echo " "
    echo "== STUB =="
    grep -l "$CURRENT_UBUNTU_VERSION.*status=\"stub" *
fi
if [ "x$1" = "x" -o "x$1" = "x--incomplete" ]; then
    echo " "
    echo "== INCOMPLETE =="
    grep -l "$CURRENT_UBUNTU_VERSION.*status=\"incomplete" *.page
fi
if [ "x$1" = "x" -o "x$1" = "x--draft" ]; then
    echo " "
    echo "== DRAFT =="
    grep -l "$CURRENT_UBUNTU_VERSION.*status=\"draft" *.page
fi
if [ "x$1" = "x" -o "x$1" = "x--review" ]; then
    echo " "
    echo "== REVIEW =="
    grep -l "$CURRENT_UBUNTU_VERSION.*status=\"review" *.page
fi
if [ "x$1" = "x" -o "x$1" = "x--candidate" ]; then
    echo " "
    echo "== CANDIDATE =="
    grep -l "$CURRENT_UBUNTU_VERSION.*status=\"candidate" *.page
fi
if [ "x$1" = "x" -o "x$1" = "x--final" ]; then
    echo " "
    echo "== FINAL =="
    grep -l "$CURRENT_UBUNTU_VERSION.*status=\"final" *.page
fi
if [ "x$1" = "x" -o "x$1" = "x--outdated" ]; then
    echo " "
    echo "== OUTDATED =="
    grep -l "$CURRENT_UBUNTU_VERSION.*status=\"outdated" *.page
fi

	echo " "
	echo "== EXTINCT =="
	for item in "${PREVIOUS_UBUNTU_VERSIONS[@]}"; do grep -l "revision version=\"$item" *.page; done;

if [ "x$1" = "x" ]; then
    echo " "
fi
if [ "x$1" = "x" -o "x$1" = "x--summary" ]; then
    echo " "
    echo "== SUMMARY =="
    echo "      None: " `grep "$CURRENT_UBUNTU_VERSION.*status=\"none" *.page | wc -l`
    echo "      Stub: " `grep "$CURRENT_UBUNTU_VERSION.*status=\"stub" * | wc -l`
    echo "Incomplete: " `grep "$CURRENT_UBUNTU_VERSION.*status=\"incomplete" *.page | wc -l`
    echo "     Draft: " `grep "$CURRENT_UBUNTU_VERSION.*status=\"draft" *.page | wc -l`
    echo "    Review: " `grep "$CURRENT_UBUNTU_VERSION.*status=\"review" *.page | wc -l`
    echo " Candidate: " `grep "$CURRENT_UBUNTU_VERSION.*status=\"candidate" *.page | wc -l`
    echo "     Final: " `grep "$CURRENT_UBUNTU_VERSION.*status=\"final" *.page | wc -l`
    echo "  Outdated: " `grep "$CURRENT_UBUNTU_VERSION.*status=\"outdated" *.page | wc -l`
    echo "   Extinct: " `for item in "${PREVIOUS_UBUNTU_VERSIONS[@]}"; do grep -l "revision version=\"$item" *.page; done | wc -l`
    fi
echo " "
