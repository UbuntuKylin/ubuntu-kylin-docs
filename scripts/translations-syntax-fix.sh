#!/bin/sh
#
# This script corrects a syntax error commonly found in the translated
# strings, such as '< /gui>' (not valid Mallard syntax) instead of
# '</gui>'. It should be applied to newly exported translations.
#
# Let's expand the command below if we find similar errors which can
# be safely corrected this way.
#
sed -i \
	-e 's,< /,</,g' \
	-e 's,</ ,</,g' \
	../ubuntu-help/*/*.po
