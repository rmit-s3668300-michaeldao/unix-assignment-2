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
VCGENCMD=/usr/bin/vcgencmd
AWK=/usr/bin/awk
TR=/usr/bin/tr

function handleTrap() {
	# Call USR1 to exit
	USR1Exit=1
}

# USR1 will signal us to gracefully exit 
trap handleTrap USR1 

# The loop will stop once our USR1 signals us to exit
while [ "$USR1Exit" -eq "0" ];
do
	# 	1. Get temperature output with vcgencmd
	# 	2. Use awk to remove "temp=" and "'C" from output
	# 	3. Use tr to remove newline
	temperature=$($VCGENCMD measure_temp | $AWK -F "=" "{ print $2 }" | $AWK -F "'" "{ print $1 }" | $TR -d "\n")

	# 	1. Get ring oscillator output with vcgencmd
	# 	2. Use awk to isolate the voltage value from the output
	# 	3. Use tr to remove newline
	ringOscVoltage=$($VCGENCMD read_ring_osc | $AWK -F "=" "{ print $2 }" | $AWK -F "MHz" "{ print $1 }" | $TR -d "\n")

	# 	1. Get clock speed from arm block
	# 	2. Use awk to isolate the value from output
	# 	3. Use tr to remove newline
	clockSpeed=$($VCGENCMD measure_clock arm | $AWK -F "=" "{ print $2 }" | $TR -d "\n")

	# Append our performance logs to the output file based on every second that passes
	echo -e "${SECONDS}\t$( $temperature )\t$( $ringOscVoltage )\t$( $clockSpeed )\n" >> $outputFile

	# Wait one tick
	sleep 1
done
