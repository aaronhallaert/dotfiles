#!/bin/sh

# first install rclone
rclone config
wait

mkdir ~/onedrive

# mount drive on startup
sudo cp ~/dotfiles/installations/onedrive_linux/onedrive-mount.desktop /etc/xdg/autostart/onedrive-mount.desktop

