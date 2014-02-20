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
# Version-1.4 - Better sort and fix the err_message about pick up an option
#				that non exist


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
	cat /home/douglas/bin/termquots/db_quotes.txt | sort -R | tail -15 | sort -R | tail -5 | sort -R | tail -1
	echo " "	
}

ERR_MESSAGE="
	$(basename $0): invalid option $1
	Try '$(basename $0) -h, --help' for more informtion.
"



if [ -n "$1" ]
then
	case "$1" in

		"-h" | "--help") HELP_MESSAGE 
			;;

		"-A" | "--Authors") cat ~/bin/termquots/db_quotes.txt | cut -d '"' -f 3 | sort | uniq 
			;;

		*) echo "$ERR_MESSAGE"
	 		exit 1
			;;

	esac

else
	DAY_MESSAGE
fi


		

	

		


