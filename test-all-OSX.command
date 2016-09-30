#!/bin/bash
# by Joshua Shaffer on September 29, 2016
# Double click this command to test all of the chips in it's directory.

# Channge working directory to this script's location.
cd -- "$(dirname "$0")"

# This must be a path to the HardwareSimulator.sh
# If you are using a relative path it will be realitive to this script file.
SIMULATOR='../../../tools/HardwareSimulator.sh'

# Output coloring controll codes
bold=$(tput bold)
normal=$(tput sgr0)
red=$(tput setaf 1)
green=$(tput setaf 2)

ERR_LIST=""

for TEST_SCRIPT in *.tst
do
    CHIP_NAME=${TEST_SCRIPT%.tst}
    echo -en "Testing ${bold}$CHIP_NAME${normal} ... "
    ERR_MESSAGE="$($SIMULATOR $TEST_SCRIPT 2>&1)"
    
    if [ $? != 0 ]; then
        echo -e "${red}fail${normal}"
        ERR_LIST="$ERR_LIST${red}${bold}$CHIP_NAME${normal}\n$ERR_MESSAGE\n\n"
    else
        echo -e "${green}pass${normal}"
        rm $CHIP_NAME.out
    fi
done

if [ "$ERR_LIST" ]; then
    echo -en "\n${red}Failed Tests:${normal}\n$ERR_LIST"
    echo "If you are haveing difficulty debuging your hdl use the graphical Hardware Simulator. It will give you more information."
else
    echo -e "${green}All tests passed!${normal}"
fi
