#!/bin/bash

folderSize=10000000 #unit K default 10000000 10GB
dirc=('/home/work/hotel/dda/dda3/logs/' '/home/work/hotelmis/tomcat_8110/logs/' '/home/work/hotelmis/tomcat_8111/logs/' '/home/work/hotelmis/tomcat_8112/logs/')
echo '========== at' $( date "+%Y-%m-%d %H:%M:%S" ) 'execute clean up =========='
for dir in ${dirc[*]}
do
  echo $dir clearing...
  cd $dir
  i=$( du -s ./ )
  i=${i%%	*}
  if [ $i -gt $folderSize ]
  then
    mkdir ../temp00o0
    for j in ./*
      do
        k=$( stat -c %y $j )
        k=${k%% *}
        dat=$( date "+%Y-%m-%d" )
        if [ $k == $dat ]
          then
            mv $j ../temp00o0 
          fi
      done
    rm -rf ./*
    mv ../temp00o0/* ./
    rm -rf ../temp00o0
    echo 'clean up complate'
    echo ''
  else
    echo 'folder is not bigger(size:' $i 'KB),skip clean up'
    echo ''
  fi

done

#crontab -l  0 23 * * * /bin/sh /home/tester/script/clear_logs.sh >> /home/tester/script/clear_logs.log

