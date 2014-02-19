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


HELP_MESSAGE(){	
	echo "Name: $(basename "$0") version-1.3"
	echo "Usage: $(basename "$0") [ OPTIONS ]"
	echo "	-h, --help		show this help and exit"
	echo "	-A, --Authors		show the name of all authors"
	exit 0
}

DAY_MESSAGE(){
	echo "	*** Quote of the day ***"
	echo ""
	cat /home/douglas/bin/termquots/db_quotes.txt | sort -R | sort -R | tail -1
	echo " "	
}

ERR_MESSAGE(){
	echo "  $(basename $0): invalid option: $1"
	echo "  Try '$(basename $0) -h, --help' for more informtion."
	
}


if [ -n "$1" ]
then
	case "$1" in

		"-h" | "--help") HELP_MESSAGE 
			;;

		"-A" | "--Authors") cat ~/bin/termquots/db_quotes.txt | cut -d '"' -f 3 | sort | uniq 
			;;

		*) ERR_MESSAGE	;;

	esac

else
	DAY_MESSAGE
fi

		

	

		


