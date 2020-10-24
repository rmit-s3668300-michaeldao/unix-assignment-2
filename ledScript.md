# Build Kernel Script

###### NAME
    ledScript.sh

###### SYNOPSIS
    Run with ./ledScript.sh

###### DESCRIPTION
    The led script has been written for the second UNIX assignment, what the
    script intends to do is flicker the green led light on the raspberry pi.

    When the script is activated, for every second we want to poll the current 
    cpu load and have the led turn on and off based on the load.

    For example: If cpu load < 20%: led should be on for 1/5 of a second.

    The script will rely on the USR2 signal to stop the process.

###### OPTIONS
    This script can be perfectly run as it is, if there are problems with permissions
    then the user can run it with sudo.

###### FILES
    No extra files are used by this script.

###### ENVIRONMENT
    Can place this script anywhere on a raspberry pi 3+.

###### DIAGNOSTICS
    Must be run with bash. 
    May have errors if run in an environment not on the raspberry pi 3+.

###### BUGS
    Please see the issues on GitHub

###### AUTHOR
    Michael Dao <s3668300@student.rmit.edu.au>

###### REFERENCES
    https://stackoverflow.com/questions/9229333/how-to-get-overall-cpu-usage-e-g-57-on-linux

Linux		Last change: Oct 24
