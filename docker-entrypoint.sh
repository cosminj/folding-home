#!/bin/bash

function check_configuration()
{
  echo "Check environment variables"
  if [ -z "$FAHCLIENT_TEAM" -o -z "$FAHCLIENT_USER" ]
  then
    echo "Please set the variables by editing $0"
    return 1
  fi

  echo "Update configuration"
  local FAHCLIENT_CONF=/etc/fahclient/config.xml
  sed -i s/_POWER_/$FAHCLIENT_POWER/g $FAHCLIENT_CONF
  sed -i s/_TEAM_/$FAHCLIENT_TEAM/g $FAHCLIENT_CONF
  sed -i s/_USER_/$FAHCLIENT_USER/g $FAHCLIENT_CONF
}

function start_fahclient()
{
  echo "Starting FAHclient..."
  /usr/bin/FAHClient /etc/fahclient/config.xml --pid-file=/var/run/fahclient.pid --daemon
}


check_configuration || { echo "Invalid configuration"; exit 1; }
start_fahclient

/bin/sleep infinity
