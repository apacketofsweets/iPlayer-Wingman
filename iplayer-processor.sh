#!/bin/sh

SHOWLIST=showlist.txt

# Reads the showlist, takes each line and individually runs an iplayer search on it

cat $SHOWLIST

while read LINE <&3; do
get_iplayer "$LINE" > tmp.txt

# Reads the results outputted by the above search request, focuses on the first column
# then removes any data after the : character, followed by the removal of any non-numeric
# characters, removes duplicates and removes the first and last line of the file (they'll be
# blank and will make get_iplayer download EVERYTHING). It will then spit out a file ready
# for the pull script to grab it.

cat tmp.txt | awk '{print $1}' | sed 's/:.*//' | sed 's/[^0-9]*//g' | uniq | tail -n +2 | sed '$d' > pullqueue.txt

rm tmp.txt

done 3<$SHOWLIST
