#!/bin/sh

#################################################################################
#
# Copyright (C) 2014 Ubuntu Documentation Team (ubuntu-doc@lists.ubuntu.com)
#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program; if not, write to the Free Software
#    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#    On Debian based systems a copy of the GPL can be found
#    at /usr/share/common-licenses/GPL
#
# remarks: Use this script to validate all the Mallard documents.
#
# usage: ./check_validation.sh
#
# notes:
#
#    The only reason we even have a script is to remind us of the actual
#    desired commands. It will check all the .pages files, but the user can cut
#    and paste the command and modify it for a specific .page file.
#
#    It can be rather difficult to isolate and fix validation errors. Often
#    several unrelated errors can be caused by one simple typo, and rarely is
#    the actual originating line determined or referenced in the messages.
#
#    After building them, Documentation Committers should also be validating all
#    languages. To do so just run the command from one directory level up and
#    with a wild card for the subdirectory. Execution will take awhile.
#    Example:
#    yelp-check validate --strict --allow http://www.w3.org/2005/11/its --allow http://www.w3.org/1999/xlink --allow http://projectmallard.org/experimental/ */*.page
#
#    Currently, February 2014, there is a problem in the package libxml2
#    resulting an severe spew of meaningless errors. Hence the "grep" portion
#    of the command line. The master libxml2 has been fixed, but has not yet
#    propagated to any release.
#
#    Also currently, a newer yelp-tools (yelp-check) than will initially be
#    part of the 14.04 release is needed for the use of --strict.
#
#    This script needs to be modified as the improved tools come on-line so
#    ultimately strict validation is used properly.
#
#    Additionally, this script includes paases that check for ID, orphans
#    and internal link desintation issues.
#    Orphans can be confusing, as there might be a navigation path, but
#    there needs to be a link back trail. If a problem page is idenified, then
#    look for a link back trail at the top of the page when opened with the
#    help system (and probably there won't be one, which is the issue).
#
#    Yelp-check hrefs is not included in this script, but you might want
#    to consider running it on occasion to identify dead external links.
#
#################################################################################

echo " --Validation pass 1: The .page files actual validation pass (syntax):"
#
# The command we eventually want to exectute:
#yelp-check validate --strict --allow http://www.w3.org/2005/11/its --allow http://www.w3.org/1999/xlink --allow http://projectmallard.org/experimental/ *.page
#
# The command we might need in the interim (between newer yelp-tools and newer libxml2):
#yelp-check validate --strict --allow http://www.w3.org/2005/11/its --allow http://www.w3.org/1999/xlink --allow http://projectmallard.org/experimental/ *.page | grep -v "relaxng\.c"
#
# The watered down command we have to use for now:
yelp-check validate *.page

echo " --Validation pass 2: Check the IDs:"
yelp-check ids *.page

echo " --Validation pass 3: Check for orphans (no link back trail):"
yelp-check orphans *.page

echo " --Validation pass 4: Check for non-existent internal links:"
yelp-check links *.page
