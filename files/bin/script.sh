#!/bin/bash
#this will make the docker images stay running by calling it !
#if [[ $1 == "-d" ]]; then
#  while true; do sleep 1000; done
#fi
#
#if [[ $1 == "-bash" ]]; then
#  /bin/bash
#fi

#chown the directory to the system user
chown -R media:media /app

#start dependent apps like mysql or cron
sleep 1;
/etc/init.d/cron start;

#initiates a loop by which the container will stay running
if [[ "1" == "1" ]]; then
  while true; do sleep 1000; done
fi
