#!/bin/bash
printf "Welcome to the fedora program installation script by Monsieur-Monet.\n"
printf "First, we'll update your system\n"
read -p "Would you like to continue? " -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi
printf "\n\n"
sudo dnf update --refresh
printf "\n"
printf "Now, we'll install a few flatpaks.\n"
printf "The following flatpaks will be installed:\n"
for flatpakList in Spotify Discord VSCode Mattermost GIMP Signal DéjàDupBackups
do
    echo $flatpakList
done
read -p "Would you like to continue? " -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi