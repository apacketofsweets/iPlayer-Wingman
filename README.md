# iPlayer-Wingman
Wrapper for Get-iPlayer - give it a list of shows to search for and it'll find and download them for you. 

This is a command-line only tool, there is no graphical interface.

A simple wrapper for the Get iPlayer utility. Give iPlayer-Wingman a list of programmes you'd like it to search for on iPlayer. If it finds a match it'll download it for you.

Compatible with POSIX systems - Linux, BSD, Solaris etc.

Requirements
=============
get-iplayer needs to be installed on your system. It's included in most Linux and BSD variants' repositories.

How it works
=============
This tool comes in two parts, a processor script and a pulling script. 

The processor script reads the showlist.txt file, searches for them on iPlayer, if found it'll then extract the show number and output it to a pullqueue.txt file. 

The pulling script reads the show numbers and downloads them from iPlayer one-by-one.

Instructions for use
=====================
Make sure you're in the directory where the script is located. 
Create a text file named showlist.txt
Add a list of programmes you'd like the script to search for on iPlayer, make sure each show is on its own line in the file
Save the file then run the processor script - ./iplayer-processor.sh
Once that's finished, run the pull script - ./iplayer-pull.sh (this will take a while!)
When the download(s) is complete, the downloaded programme will be sitting in the directory where the script ran from. The video will be in a .flv format.

Automating it
==============
You can automate iPlayer-Wingman by setting up a cronjob to regularly search for the shows in your showlist.txt file and download them. This is ideal for pulling new episodes of regular programmes.

The below is an example cronjob you could add into your crontab -  Command: crontab -e

00 0    * * *   cd ~/ && ./iplayer-processor.sh && ./iplayer-pull.txt

This will run the scripts every night at midnight (providing script is in your home directory - hence the cd ~/ command)
