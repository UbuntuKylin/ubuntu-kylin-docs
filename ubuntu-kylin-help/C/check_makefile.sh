grep '\.page' ../Makefile.am  | sed -e 's/\t*//' -e 's/ *\\//' | sort -u > TMP && ls *.page | diff TMP - && rm TMP

