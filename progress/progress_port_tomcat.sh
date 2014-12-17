#!/bin/bash

#tomcat port:8100
num=$( ps aux|grep java|grep tomcat |grep -c 8100 )
if [ $num == 1 ]
  then
    echo 'NORMAL:tomcat port:8100 is running'
  else
    echo -e "\033[47;31;5m ERROR \033[0m :tomcat port:8100 is down"
fi

#tomcat port:8080
num=$( ps aux|grep java|grep tomcat |grep -c 8080 )
if [ $num == 1 ]
  then
    echo 'NORMAL:tomcat port:8080 is running'
  else
    echo -e "\033[47;31;5m ERROR \033[0m :tomcat port:8080 is down"
fi

#tomcat port:8102
num=$( ps aux|grep java|grep tomcat |grep -c 8102 )
if [ $num == 1 ]
  then
    echo 'NORMAL:tomcat port:8102 is running'
  else
    echo -e "\033[47;31;5m ERROR \033[0m :tomcat port:8102 is down"
fi
