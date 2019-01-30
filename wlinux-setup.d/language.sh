#!/bin/bash

source $(dirname "$0")/common.sh "$@"

if (whiptail --title "Language" --yesno "Would you like to configure default keyboard input/language?" 8 65) then
    echo "Running $ dpkg-reconfigure locales"
    sudo dpkg-reconfigure locales
fi