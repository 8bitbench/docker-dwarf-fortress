#!/bin/bash

ROOT_BIT=`whoami`
if [ $ROOT_BIT != "root" ]
  then
    echo "you need to be root"; exit
fi
#setting up the install directory
CONTAINER_DATA="$1"
if [ -z $CONTAINER_DATA  ]
  then
    echo "you need to provide a directory for container data"
    echo "Example: $0 /storage/container_data/ "; exit
fi
#Setting up the install directory
APP_NAME="dwarf-fortress"
BASE_DIR="$CONTAINER_DATA/$APP_NAME"
DATA_DIR="$CONTAINER_DATA/$APP_NAME/data"
APP_DIR="$CONTAINER_DATA/$APP_NAME/app"

#create save dir for dwarf fortress
SAVES_DIR="$DATA_DIR/saves"
for DIR_TEMP in $APP_DIR $SAVES_DIR
  do
      if [ ! -z $DIR_TEMP ]
        then
          mkdir -p $DIR_TEMP
      fi
  done

chown media:media -R $BASE_DIR

#Clean up the old container. 
docker rm -f $APP_NAME 2>&1 >/dev/null

#Create the new container
#might not need the APP_DIR
docker run -it --name $APP_NAME \
        -v $SAVES_DIR:/df_linux/data/save/current \
        -v $APP_DIR:/toolbox/app \
        --restart=unless-stopped \
        -d 8bitbench/$APP_NAME:16.04



