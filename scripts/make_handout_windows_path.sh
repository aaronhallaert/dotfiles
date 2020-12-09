#!/bin/bash
FILE=`wslpath "$1"`
pdfjam --nup 2x2 --frame true --noautoscale false --delta "0.2cm 6cm" --scale 0.90 "$FILE" --outfile "$FILE"
