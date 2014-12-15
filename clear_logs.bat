@echo off
rem 删除windows指定目录下log文件，利用window定时任务每小时执行一次。

set "dirc=D:\elong_log\log\rabbitmq_failed\"
del /s %dirc%*.log 

set "dirc=D:\elong_log\log\SendLog\"
del /s %dirc%*.log

echo %date% %time% >> C:\clear_logs.log

pause