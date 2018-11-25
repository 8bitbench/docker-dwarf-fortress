#!/bin/bash

SOURCES=$1
ROOT_DIR=$2
rm /toolbox/app/logs/app.log
for STR in $(cat $SOURCES)
  do
    CHANNEL_DIR=$(echo $STR | cut -f1 -d,)
    URL=$(echo $STR | cut -f2 -d,)
    BASE_DIR="$ROOT_DIR/$CHANNEL_DIR"
    INDEXES="$BASE_DIR/.indexes"
    echo $var1
    echo $var2
  
    if [ ! -z $INDEXES ]
      then
        mkdir -p $INDEXES
    fi
  
    DL_FILE=`echo $URL |sed -e 's/\///g' |sed -e 's/\.//g' |sed -e 's/://g'`
    /usr/local/bin/youtube-dl $URL -i \
        --download-archive $INDEXES/$DL_FILE.txt \
        -o "$BASE_DIR/%(uploader)s/%(title)s.%(ext)s" \
        -f best 2>&1 >> /toolbox/app/logs/app.log
  done
