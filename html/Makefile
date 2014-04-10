####################################################################################           
# Makefile for the GNOME Ubuntu Documentation
# Copyright (C) 2005-2006 Ubuntu Documentation Project (ubuntu-doc@lists.ubuntu.com)
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
####################################################################################

MAKECMD=make
HTMLDESTDIR=build
SRCDIR=../ubuntu-kylin-help
SED=/bin/sed
INSTALLDIR=/var/www/14.04/
URLFIXER=fix-urls.sed

# Space-separated list of language codes for documents. HTML will only be
# built for those codes in the list
# Ex. HELP_LINGUAS=ja it for Japanese and Italian
# Note that the corresponding .page files for the locales must have been built
# for the HTML to be built in turn. This means all the locales for which
# HTML output is needed will have to have been specified in the main
# HELP_LINGUAS variable in the ubuntu-kylinkylin-help Makefile
HELP_LINGUAS = zh_CN

index_file_exists = $(wildcard $(SRCDIR)/$(lingua)/index.page)
linguas := $(HELP_LINGUAS)
help_linguas := \
    $(foreach lingua, $(linguas), \
        $(if $(index_file_exists), \
            $(lingua), \
            $(warning Cannot find source index page for locale: $(lingua), \
                skipping. You will probably have to build it adding it to \
                the HELP_LINGUAS variable in the Makefile at $(SRCDIR) \
                and rebuild)))

# Ubuntu Mallard Customization Layer
UBUNTUXSL=ubuntu.xsl

# Builds the HTML files for all specified language codes, specifiying the
# language in the final documents and performing some other necessary
# text replacements not handled by yelp-build.
# Language codes are normalized to IETF format, as opposed to glibc format
ubuntu-kylin-help: clean style
	for lc in C $(help_linguas); do \
		lang=`echo $$lc | $(SED) -e 's/[@_]/-/'`; \
		if test "$$lang" = "C"; then lang=en; fi; \
		if test "$$lang" = "gl"; then lang=gl-GL; fi; \
		if test "$$lang" = "ms"; then lang=ms-MS; fi; \
		if test "$$lang" = "pl"; then lang=pl-PL; fi; \
		yelp-build html -o "$(HTMLDESTDIR)/$$lang/" -x $(UBUNTUXSL) \
			"$(SRCDIR)/$$lc/"; \
		$(SED) -i \
			-e '1s/^/<!DOCTYPE html\>\n/' \
			-e "s/<html>/<html lang="$$lang">/" \
			-e 's|/usr/share/icons/.*/\(.*\.svg\)|img/\1|'\
			"$(HTMLDESTDIR)/$$lang/"*.html; \
		$(SED) -i -f "$(URLFIXER)" "$(HTMLDESTDIR)/$$lang/"*.html; \
		echo "\nSearching for yelp help system internal links and either changing them to equivalent or related external links or deleting them:"; \
		$(SED) -i -e '/help:language-selector/d' "$(HTMLDESTDIR)/$$lang/"session*.html; \
		grep "href=\"ghelp:" "$(HTMLDESTDIR)/$$lang/"*.html; \
		rm -rf "$(HTMLDESTDIR)/$$lang/usr"; \
	done

clean:
	rm -rf build

# Copy style sheet and common images to build directory
# TODO: copy C/figures to destination only for those cases where there are
# no localized figures
style:
	for lc in C $(help_linguas); do \
		lang=`echo $$lc | $(SED) -e 's/[@_]/-/'`; \
		if test "$$lang" = "C"; then lang=en; fi; \
		if test "$$lang" = "gl"; then lang=gl-GL; fi; \
		if test "$$lang" = "ms"; then lang=ms-MS; fi; \
		if test "$$lang" = "pl"; then lang=pl-PL; fi; \
		mkdir -p "$(HTMLDESTDIR)/$$lang/img"; \
		mkdir -p "$(HTMLDESTDIR)/$$lang/figures"; \
		cp img/* "$(HTMLDESTDIR)/$$lang/img"; \
		cp "$(SRCDIR)/C/figures/"* "$(HTMLDESTDIR)/$$lang/figures"; \
	done

# Installs all HTML files to a multilingual site (e.g. run with Apache and
# MultiViews enabled)
install:
	rm -Rf "$(INSTALLDIR)"/*; \
	cp -R "$(HTMLDESTDIR)/"* "$(INSTALLDIR)"; \
	for lc in C $(help_linguas); do \
		lang=`echo $$lc | $(SED) -e 's/[@_]/-/'`; \
		if test "$$lang" = "C"; then lang=en; fi; \
		if test "$$lang" = "gl"; then lang=gl-GL; fi; \
		if test "$$lang" = "ms"; then lang=ms-MS; fi; \
		if test "$$lang" = "pl"; then lang=pl-PL; fi; \
		find "$(INSTALLDIR)/$$lang" -type f -exec mv {} {}.$$lang \; ; \
		cp -af "$(INSTALLDIR)/$$lang"/* "$(INSTALLDIR)"; \
		rm -Rf "$(INSTALLDIR)/$$lang" ; \
	done
