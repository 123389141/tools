@echo off
rem ɾ��windowsָ��Ŀ¼��log�ļ�������window��ʱ����ÿСʱִ��һ�Ρ�

echo %date% %time% >> C:\hotel_script\clear_logs.log

set "dirc=D:\elong_log\log\rabbitmq_failed\"
del /s %dirc%*.log

set "dirc=D:\elong_log\log\SendLog\"
del /s %dirc%*.log
