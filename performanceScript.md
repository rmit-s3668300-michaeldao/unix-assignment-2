# Build Kernel Script

###### NAME
    performanceScript.sh

###### SYNOPSIS
    Run with ./performanceScript

###### DESCRIPTION
    The performance monitoring script has been written for the second UNIX 
    assignment, what the script intends to do is monitor and log the output
    of the hardware metrics.

    The metrics that are measure is the core temperature, ring oscillator speed
    and the arm clock speed of the raspberry pi.

    This was built for the build_kernel script to analyse metrics while kernel
    compilation was in action.

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
    https://www.raspberrypi.org/documentation/raspbian/applications/vcgencmd.md

Linux		Last change: Oct 24
