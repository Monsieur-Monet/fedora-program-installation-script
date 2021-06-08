#!/bin/bash
printf "Welcome to the fedora program installation script by Monsieur-Monet.\n"
printf "First, we'll update your system\n\n"
sudo dnf -y update --refresh
printf "\n"
read -p "Do you use a NVIDA GPU with your system?" -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    printf "\n\n"
    printf "Continuing without installation of NVIDIA drivers\n"

else
    sudo dnf -y install fedora-workstation-repositories
    sudo dnf config-manager --set-enabled rpmfusion-nonfree-nvidia-driver
    sudo dnf -y install nvidia-settings
fi
printf "\n"
printf "Now, we'll install a few flatpaks.\n"
printf "The following flatpaks will be installed:\n"
for flatpakList in Spotify Discord VSCode Mattermost GIMP Signal
do
    echo $flatpakList
done
printf "\n"
read -p "Would you like to continue?" -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi
printf "\n"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install com.discordapp.Discord com.mattermost.Desktop com.spotify.Client com.visualstudio.code org.signal.Signal org.gimp.GIMP
printf "\n"
printf "Flatpaks have been installed!\n"
printf "Now we will proceed with some essential software using dnf.\n"
printf "The following apps will be installed:\n"
for flatpakList in Steam Terminator Inkscape deja-dup Papirus-Icon-Theme Arc-Icon-Theme Rofi
do
    echo $flatpakList
done
read -p "Would you like to continue?" -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 1
else
sudo dnf -y install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y install steam terminator inkscape deja-dup papirus-icon-theme arc-theme rofi
fi
printf "\n"
printf "Apps have been installed!\n"
printf "\n"
read -p "Would you like to install ZSH on your system?" -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    printf "\n\n"
    printf "Continuing without installation of ZSH\n"

else
    sudo dnf -y install zsh
    chsh -s $(which zsh)
fi
printf "\n"
printf "All done! You need to restart your system to finnish the installation\n"
read -p "Would you like to restart your system now?" -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi
sudo reboot