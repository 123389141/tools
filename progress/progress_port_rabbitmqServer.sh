#!/bin/bash

#rabbitmq-server
num=$( ps aux|grep rabbitmq-server |grep -c start )
if [ $num == 1 ]
  then
    echo 'NORMAL:rabbitmq-server is running'
  else
    echo -e "\033[47;31;5m ERROR \033[0m :rabbitmq-server is down"
fi
