# Raspberry Pi performance during compilation report

After running the performance monitoring scripts and gnuplot to plot out our graphs, this is the findings I have come upon.

The graph `temperature.png` shows a logarithmic increase from a core temperature of 50 degrees celsius on average to 70 degrees celsius on average in the first 1000 seconds.

This average temperature slowly rises furthermore after the initial 1000 as we can see temperatures fluctuate towards 75 degrees celsius even more as more time passes in the compilation.

Eventually towards the end the kernel reaches the final stages of compilation and doesn't rely as much on the computing components and the volume dips lower to 67 degree celsius momentarily. The final touches will then perform at around 7000 - 8000 seconds before finishing off.

This shows signs that the raspberry pi is quite healthy, there are four threads going off on the Pi's 4 cores and it is performing at a point where the cpu will slowly heat the device as it works and will throttle itself to prevent it from overheating.

While the pi has no heatsink and a it has a case that has no airflow, it does tend to cool down towards the later stages of compilation as there may be moments where the kernel is taking breaks to start the next stage or there are smaller files to compile.

The ring oscillator had also been measured as seen on `ringSpeed.png`, we can see that the current speed of the ring will alternate between 2.9 Hz to 3.6 Hz intiially, until it alternates between 2.9 Hz and 3.1 Hz throughout the rest of the process.

We can see that the initial onset of the compilation we use a bit more power in the ring, but it eventually levels out as it has reached a more balanced equillibrium.

The arm clock speed of the raspberry pi can be seen on `clock.png`, it is seen alternating between 1.2x10^9 Hz and 6x10^8 Hz speed. the only variation we have is within the beggining stages of the compilation where the higher bound arm clock speed will typically rise up at around 1.4x10^9 (.2 difference) This matches our ring speed in a sense that the initial stage of the compilation a lot initial power comes in to fuel the process.

The Raspberry Pi's Arm Cortex-A53 is 600Mhz with a turbo of 1.2Ghz and it seems like with the data we have been presented in our graph, the Pi is working towards its full load.

#### Michael Dao s3668300