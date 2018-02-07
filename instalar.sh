#!/bin/bash

FOLDER=~/bin
FOLDER2=~/bin/termquots

if [[ ! -d "$FOLDER" ]]
	then
	#"$FOLDER not exist, creating one"
	mkdir "$FOLDER"
fi

if [[ ! -d "$FOLDER2" ]]
	then
	#"$FOLDER2 not exist, creating one"
	mkdir "$FOLDER2"
fi

cp db_quotes.txt "$FOLDER2"
cp termquots.sh "$FOLDER2" && chmod +x "$FOLDER2"/termquots.sh

#qotd = quote of the day
cd "$FOLDER" && ln -s "$FOLDER2"/termquots.sh qotd

echo "Ready"
