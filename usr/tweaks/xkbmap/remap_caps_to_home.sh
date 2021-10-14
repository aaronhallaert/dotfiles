#!/bin/bash

setxkbmap -option caps:none && xmodmap -e "keycode 66 = Home NoSymbol Home"
