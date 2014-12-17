#!/bin/bash

#mysql port:6015
num=$( ps aux|grep mysql |grep -c port=6015 )
if [ $num == 1 ]
  then
    echo 'NORMAL:mysql port:6015 is running'
  else
    echo -e "\033[47;31;5m ERROR \033[0m :mysql port:6015 is down"
fi
