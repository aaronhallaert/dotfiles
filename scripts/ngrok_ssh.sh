#!/bin/bash

#2.tcp.eu.ngrok.io:10660
address=$1

IFS=':' read -ra ADDR <<< "$address"
domain="${ADDR[0]}"
port="${ADDR[1]}"

ssh -X aaron@${domain} -p${port}
