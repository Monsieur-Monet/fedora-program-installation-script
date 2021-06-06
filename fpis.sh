#!/bin/bash
echo "Welcome to the fedora program installation script by Monsieur-Monet."
echo "First, we'll update your system"
read -p "Would you like to continue? " -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi
sudo dnf update --refresh
clear
echo "Now, we'll install a few flatpaks."
echo "The following flatpaks will be installed:"
for flatpakList in Spotify Discord VSCode Mattermost GIMP Signal DéjàDupBackups
do
    echo $flatpakList
done
read -p "Would you like to continue? " -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi