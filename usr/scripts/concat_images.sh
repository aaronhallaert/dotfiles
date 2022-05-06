
convert $1 -resize 1080x fig1.png
wait
convert $2 -resize 1080x fig2.png
wait

convert fig1.png fig2.png \
    -background white -splice 10x0+0+0  +append -chop 10x0+0+0 \
    $3

wait
rm fig1.png
rm fig2.png
