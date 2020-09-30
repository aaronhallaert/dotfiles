# Install i3 on a fresh xubuntu

## Install i3
- sudo apt install i3-wm
- sudo apt install i3-status

## Remove all super-shortcuts on xubuntu
- Keyboard shortcuts
- Window manager

## Setup background
- sudo apt install nitrogen
- open and setup nitrogen for first time
- already in config file to open and restore nitrogen immediately

## Change the window manager
- Sessions and Startup
    - Session Tab
        - xfdesktop - from Immediately to Never
        - xfwm4 - from Immediately to Never
        - Save Session
    - Application Autostart
        - Add i3
            - Name: i3-wm
            - Command: i3

## Final Steps
- Now you can reboot but it will be better if you configure i3 immediately
- Clone aaronhallaert/dotfiles repo in home dir
    - cd into ~/dotfiles/i3
    - `bash install_linux.sh`

