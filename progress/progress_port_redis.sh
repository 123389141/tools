#!/bin/bash

#redis port:6379
num=$( ps aux|grep redis |grep -c 6379 )
if [ $num == 1 ]
  then
    echo 'NORMAL:redis port:6379 is running'
  else
    echo -e "\033[47;31;5m ERROR \033[0m :redis port:6379 is down"
fi

#redis port:6380
num=$( ps aux|grep redis |grep -c 6380 )
if [ $num == 1 ]
  then
    echo 'NORMAL:redis port:6380 is running'
  else
    echo -e "\033[47;31;5m ERROR \033[0m :redis port:6380 is down"
fi
