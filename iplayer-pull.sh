#!/bin/sh

PULLQUEUE=pullqueue.txt

# Reads the pullqueue list, takes each line and individually pulls that show from iplayer

cat $PULLQUEUE

while read LINE <&3; do
get_iplayer --get "$LINE" --tvmode=best

done 3<$PULLQUEUE
