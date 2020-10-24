#!/usr/bin/env bash

# --------------------------------------------------------------------------------------------
# This script has been written for the UNIX assignment 2, it is responsible for logging the
# performance of the rasperry Pi as we are compiling the kernel.
#
# The metrics that will be measured are:
# 1. Temperature
# 2. Speed Voltage of ring oscillator
# 3. Clock speed
#
# Notes:
# - The shebang above is the best for bash portability
#
# By Michael Duy Thong Dao s3668300
# --------------------------------------------------------------------------------------------

# Declare some variables to assist us
outputFile="kernel_performance_data"
USR1Exit=0

function getTemperature() {
	# We are reading temperature gathered from the onboard sensor:
	# 	1. Get temperature output with vcgencmd
	# 	2. Use awk to remove "temp=" and "'C" from output
	# 	3. Use tr to remove newline
	vcgencmd measure_temp | awk -F '=' '{ print $2 }' | awk -F "'" '{ print $1 }' | tr -d '\n'
}

function getRingOscVoltage() {
	# We are reading the current speed voltage of the ring oscillator:
	# 	1. Get ring oscillator output with vcgencmd
	# 	2. Use awk to isolate the voltage value from the output
	# 	3. Use tr to remove newline
	vcgencmd read_ring_osc | awk -F '=' '{ print $2 }' | awk -F 'MHz' '{ print $1 }' | tr -d '\n'
}

function getClockSpeed() {
	# We are reading the clock speed of the Pi:
	# 	1. Get clock speed from arm block
	# 	2. Use awk to isolate the value from output
	# 	3. Use tr to remove newline
	vcgencmd measure_clock arm | awk -F '=' '{ print $2 }' | tr -d '\n'
}

function handleTrap() {
	# Call USR1 to exit
	USR1Exit=1
}

# USR1 will signal us to gracefully exit 
trap handleTrap USR1 

# The loop will stop once our USR1 signals us to exit
while [ "$USR1Exit" -eq "0" ];
do
	# Append our performance logs to the output file based on every second that passes
	echo -e "${SECONDS}\t$( getTemperature )\t$( getRingOscVoltage )\t$( getClockSpeed )\n" >> $outputFile

	# Wait one tick
	sleep 1
done