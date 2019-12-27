### If you have tsv file, this script will add HTML tags to this file for generating to as a page.
### Example:   sed.sh test.tsv


#!/bin/sed -f 
s/^/<TR><TD>/
s/$/<\/TD><\/TR>/
s/\t/<\/TD><TD>/g
1s/^/<TABLE>/
$a<\/TABLE>
