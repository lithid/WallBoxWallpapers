#!/bin/bash
wd=$(pwd)

if [ $# -ne 4 ]; then
	echo "Usage ./script.sh image.jpg author name file.json"
	echo "Need 4 arguments. Got $*"
	exit 1
fi

tools="tr convert"
for i in $tools; do
    hash $i 2>/dev/null || { echo >&2 "I require $i but it's not installed.  Aborting."; exit 1; }
done

image=$1
pre_author=$2
pre_name=$3
author=$(echo $(echo $pre_author |tr '[A-Z]' '[a-z]') |sed 's/ //g')
name=$(echo $(echo $pre_name |tr '[A-Z]' '[a-z]') |sed 's/ //g')
json=$4
ext=${image##*.}

XLARGE=""
LARGE=""
NORMAL=""
PREVIEW=""

com_path="wallpapers/$author/$name"
if [ ! -d $com_path ]; then
    mkdir -p $com_path
    echo "Made directory $com_path"
fi

ar="2160x1920 1440x1280 960x800 500x500 200x200"
count=1
for x in $ar; do
    filenamer=$com_path/$name-$x".$ext"
    echo "Working on $filenamer"
	convert $image -resize $x^ -gravity Center -crop $x+0+0 $filenamer
	if [ -z "$x" -a "${x+xxx}" = "xxx" ]; then echo "$x had an issue, try again, leaving now"; exit 2; fi
	case $count in
	    1)
	        XLARGE="$filenamer";;
	    2)
	        LARGE="$filenamer";;
	    3)
	        NORMAL="$filenamer";;
	    4)
	        PREVIEWHD="$filenamer";;
	    5)
	        PREVIEW="$filenamer";;
	esac
	let count=count+1
done

echo "Completed $ar_txt convert"
echo "Executing json building now..."
python helper.py $json "$pre_author" "$pre_name" "$XLARGE" "$LARGE" "$NORMAL" "$PREVIEWHD" "$PREVIEW"
exit 0
