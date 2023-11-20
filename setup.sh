#!/bin/bash

    if [ ! -f pybot-install/bot.py ]; then
    echo "Installing important stuff"
    python -m ensurepip --upgrade
    pip install discord.py
    git clone https://github.com/almokeepcalmo/pybot-install.git
    read -p "Please insert Discord Token here: " discord_token
    read -p "Bot installed succesfully! Do you want to start it now? [y/n] " start
    case $start in
    y ) python  pybot-install/bot.py;
        exit;;
    n ) echo "Setup ended succesfully! Exiting";
        exit;;
    esac
    else
        read -p "Bot installed already, do you want to remove it and tokens? [y/n] " choice
        case $choice in
        y ) echo "Deleting bot and environment variables";
            rm -fr pybot-install/.git
            rm -R pybot-install;
            export discord_token= ;
            echo "Deleted succesfully!";
            exit;;
        n ) echo "Process stopped by user, exiting";
            exit;;
    esac
    fi