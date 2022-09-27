#!/bin/bash
pdfjam --nup 1x3 --frame true --noautoscale false --delta "0cm 2.5cm" --offset "-3.5cm 0cm" --scale 0.85 "$1" --outfile "$1"
