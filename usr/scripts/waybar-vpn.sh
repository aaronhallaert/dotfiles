#!/bin/sh

if openvpn3 sessions-list | grep -q televic; then
    echo " "
else
    echo ""
fi
