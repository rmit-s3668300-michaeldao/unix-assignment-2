#!/usr/bin/env bash

# --------------------------------------------------------------------------------------------
# This script has been written for the UNIX assignment 2, it is responsible for controlling
# the flickering led on the raspberry pi.
#
# For each second we want to poll the current cpu load and have the led turn on and off 
# based on the load to seconds:
# -e.g. If cpu load < 20%: led should be on for 1/5 of a second
#
# Notes:
# - The shebang above is the best for bash portability
#
# By Michael Duy Thong Dao s3668300
# --------------------------------------------------------------------------------------------

TOP=/usr/bin/top
AWK=/usr/bin/awk
SED=/bin/sed
GREP=/bin/grep
USR2Exit=0

# Called on USR2 trap to exit
function handleTrap() {
	USR2Exit=1
}

# Gracefully exit on USR2 signal
trap handleTrap USR2

# The loop will stop once our signal tells us to exit
while [ "$USR2Exit" -eq "0" ];
do
    # Get cpu load, sourced from:
    # https://stackoverflow.com/questions/9229333/how-to-get-overall-cpu-usage-e-g-57-on-linux
    cpuUsage=$($TOP -bn1 | $GREP "Cpu(s)" | $SED "s/.*, *\([0-9.]*\)%* id.*/\1/" | $AWK "{print 100 - $1'%'}")
    
    # get time to keep on our blinks according to cpuUsage
    onTime=$(echo "$cpuUsage" | $AWK "{ print $cpuUsage/100 }")
    offTime=$(echo "$onTime" | $AWK "{ print 1-$onTime }")

    # Set green led brightness to full to turn it on
    sudo sh -c "echo 255 > /sys/class/leds/led0/brightness"
    sleep "$onTime"

    # Set green led brightness to 0 to turn it off 
    sudo sh -c "echo 0 > /sys/class/leds/led0/brightness"
    sleep "$offTime"
done
