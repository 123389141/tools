#!/bin/bash

#redis port:1212
num=$( ps aux|grep redis |grep -c 1212 )
if [ $num == 1 ]
  then
    echo 'NORMAL:redis port:1212 is running'
  else
    echo -e "\033[47;31;5m ERROR \033[0m :redis port:1212 is down"
fi
