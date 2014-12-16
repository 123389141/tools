@echo off
rem 删除windows指定目录下log文件，利用window定时任务每小时执行一次。

echo %date% %time% >> C:\hotel_script\clear_logs.log

set "dirc=D:\elong_log\log\rabbitmq_failed\"
del /s %dirc%*.log

set "dirc=D:\elong_log\log\SendLog\"
del /s %dirc%*.log
