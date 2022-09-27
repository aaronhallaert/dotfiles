#!/usr/local/bin/bash
results=$(find . -iname '*.pdf' | xargs -I {} -P 24 pdfgrep -p -H -i "$1" {})
#results=$(find $1 -iname '*.pdf' -exec pdfgrep -p -i "$2" {} + | xargs -n1 echo)

readarray -t array <<< "$results"
IFS=$'\n' sorted=($(sort <<<"${array[*]}"))
unset IFS

len=${#sorted[@]}
echo "found $len occurences"
if [[ "$len" == 0 ]];
then
    exit
fi

count=0
for value in "${sorted[@]}"
do
     echo "$count: $value"
     let "count+=1"
done


while [ true ]
do
    clear
    count=0
    for value in "${sorted[@]}"
    do
         echo "$count: $value"
         let "count+=1"
    done

    echo "Select PDF to open: "
    read s
    if [[ "$s" == -1 ]];
    then
        exit
    fi
    selected="${sorted[$s]}"
    echo $selected
    IFS=':' read -ra strarr <<< "$selected"
    file=$(echo ${strarr[0]}| sed -r 's/^.{2}//')
    filepath="$(pwd)/${file}"

    opentopage.sh "${filepath}" ${strarr[1]}
done
