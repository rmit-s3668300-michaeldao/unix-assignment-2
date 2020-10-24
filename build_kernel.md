# Build Kernel Script

###### NAME
    build_kernel

###### SYNOPSIS
    Run with ./build_kernel

###### DESCRIPTION
    The build kernel script has been written for the second UNIX assignment, 
    what the script intends to do is run commands for the user so that they 
    can compile a linux kernel on their raspberry pi without much input needed.

    What the script does is it pulls down the repository from linux and the 
    repository with the scripts needed to run the installation.

    The configuration (.config) from the s3668300 'unix-assignment-2' repository 
    will be pasted into the linux repository and then the kernel will be compiled
    with those settings.

    As the kernel is compiling, the monitoring and led script will both activate
    to gather data and make some modifications to the way the Pi is working.

    When compilation has finished, this script will make a backup of the old kernel
    files and tarball it up in case of damages made during the installation, it will
    then complete the installation by copying the newly compiled kernel to the right
    place and reboot the system.

    The new installation can be verified with 'uname -r', this is where we should
    be able to see the kernel version appended with the username 's3668300'

###### OPTIONS
    This script can be perfectly run as it is, if there are problems with permissions
    then the user can run it with sudo.

###### FILES
    Files used: 
    - ledScript.sh 
    - performanceScript.sh
    - .config
    - "Latest Raspberry Pi linux repository"

    Files Output:
    - bootBackup.tar.gz

###### ENVIRONMENT
    Can place this script anywhere.

###### DIAGNOSTICS
    Must be run with bash. 
    May have errors with compilation if not enough storage available.

###### BUGS
    Please see the issues on GitHub

###### AUTHOR
    Michael Dao <s3668300@student.rmit.edu.au>

###### REFERENCES
    https://rmiteduau-my.sharepoint.com/:w:/r/personal/paul_miller_rmit_edu_au/_layouts/15/guestaccess.aspx?e=kftdot&share=EV4_ThoTN6JIkUfLrf7XLyYBLZbHcK9Cbhe8lULq5w8SKw

Linux		Last change: Oct 24
