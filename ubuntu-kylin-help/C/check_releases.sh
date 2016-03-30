#!/bin/bash

# Produce a list of all .page files containing
# outdated release names which may or may not
# need to be updated, depending on use.
#
# Instructions
# Type this command in the current directory to run this script:
# bash check_releases.sh
#
# DO NOT TRANSLATE

ReleaseNames=(
Warty
warty
Hoary
hoary
Breezy
breezy
Dapper
dapper
Edgy
edgy
Feisty
feisty
Gutsy
gutsy
Hardy
hardy
Intrepid
intrepid
Jaunty
jaunty
Karmic
karmic
Lucid
lucid
Maverick
maverick
Natty
natty
Oneiric
oneiric
Precise
precise
Quantal
quantal
Raring
raring
Saucy
saucy
Trusty
trusty
Utopic
utopic
Vivid
vivid
Wily
wily
Xenial
xenial
);

for i in "${ReleaseNames[@]}"; # for each name in the ReleaseNames array above
	do # do the following:
		grep -q  $i *.page; # check all .page files for the release name
		if [ "$?" = "0" ]; # if you find it
			then # then
				echo; # display a blank line
				echo "== These pages contain $i =="; # display this header with the release name
				grep -l $i *.page; # display a list of the pages
		else # otherwise
				: # do nothing
		fi; # finished with the .page files
	done; # done with the names in the array
exit 0; # exit with a status code of 0
