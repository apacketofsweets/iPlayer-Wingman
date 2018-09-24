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
The script's code is divided into two parts, a processor section and a pulling section.

The processor section reads the showlist.txt file, searches for them on iPlayer, if found it'll then extract the show number and output it to a pullqueue.txt file. 

The pulling section reads the show numbers and downloads them from iPlayer one-by-one.

Instructions for use
=====================
Amend the $WORKINGDIR directory at the top of the script to point to the folder the script is located in on your system.

Create a text file named showlist.txt in that location

Add a list of programmes you'd like the script to search for on iPlayer, make sure each show is on its own line in the file

Then run the script - ./sh iplayer-wingman.sh (Make sure it has permissions to be executed)

When the download(s) is complete, the downloaded programme will be sitting in the directory defined by the $WORINGDIR variable. The video will be in a .flv format by default.

Automating it
==============
You can automate iPlayer-Wingman by setting up a cronjob to regularly search for the shows in your showlist.txt file and download them. This is ideal for pulling new episodes of regular programmes.

The below is an example cronjob you could add into your crontab -  Command: crontab -e

00 0    * * *   cd ~/ && ./iplayer-wingman.sh

This will run the script every night at midnight (providing script is in your home directory - hence the cd ~/ command)
