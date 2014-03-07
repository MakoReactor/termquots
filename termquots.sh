#!/bin/bash
# Put quotes on the terminal when it is launched.
# This script uses the sort command with -R, and the tail -1 command to get, just
# one line.
# Added option to see authors
# 
# Todo:
# # quots per author
#
# Version-1.3 - Create functions for some options
#
#




HELP_MESSAGE(){
	#echo "The name is a abbreviation of Quote of the day" 	
	echo "Name: $(basename "$0") version-1.3"
	echo "Usage: $(basename "$0") [ OPTIONS ]"
	echo "  -h, --help          show this help and exit"
	echo "  -A, --Authors       show the name of all authors"
    echo "  -v, --version       show the version and exit"
	exit 0
}

DAY_MESSAGE(){
	echo "	*** Quote of the day ***"
	echo ""
	sort -R ~/bin/termquots/db_quotes.txt | tail -15 | sort -R | tail -1
	echo " "
    exit 0	
}

ERR_MESSAGE="
	$(basename $0): invalid option $1
	Try '$(basename $0) -h, --help' for more informtion.
"

VERSION=$(egrep "^# Version" ~/bin/termquots/termquots.sh | cut -d' ' -f 2)



if [ -n "$1" ]
then
	case "$1" in

		"-h" | "--help") HELP_MESSAGE 
			;;

		"-A" | "--Authors") cat ~/bin/termquots/db_quotes.txt | cut -d '"' -f 3 | sort | uniq 
			;;
                
        "-v" | "--version") echo "$VERSION"
            ;;
        

		*) echo "$ERR_MESSAGE"
	 		exit 1
			;;

	esac

else
	DAY_MESSAGE
fi


		

	

		


