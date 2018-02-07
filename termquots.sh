#!/bin/bash
# termquots.sh -> It's refer to name Terminal Quotes
#
# Put quotes on the terminal when it is launched.
# Added option to see authors
# 
# Todo:
# -> quotes per author
#
##Version-1.3 - Create functions for some options
# Version-1.4 - Create a main function and constants of paths
#
# Constants
FILE_DB_PATH=~/bin/termquots/db_quotes.txt
FILE_SHELL_PATH=~/bin/termquots/termquots.sh



ERR_MESSAGE="
	$(basename $0): invalid option $1
	Try '$(basename $0) -h, ' for more information.
"
VERSION=$(egrep "^# Version" "$FILE_SHELL_PATH" | cut -d' ' -f 2)


HELP_MESSAGE(){
	#echo "The name is a abbreviation of Quote of the day" 	
	echo "Name: $(basename "$0") $VERSION"
	echo "Usage: $(basename "$0") [ OPTIONS ]"
	echo "   Without an option  show a famous quote on the screen"
	echo "  -h, --help          show this help and exit"
	echo "  -A, --Authors       show the name of all authors"
    echo "  -v, --version       show the version and exit"
	exit 0
}

DAY_MESSAGE(){
	echo "	*** Frase do dia ***"
	echo ""
	sort -R "$FILE_DB_PATH" | tail -15 | sort -R | tail -1
	echo " "
    exit 0	
}


if [ -n "$1" ]
then
	case "$1" in

		"-h" | "--help") HELP_MESSAGE 
			;;

		"-A" | "--Authors") cat "$FILE_DB_PATH" | cut -d '"' -f 3 | sort | uniq 
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
