@echo off
rem ɾ��windowsָ��Ŀ¼��log�ļ�������window��ʱ����ÿСʱִ��һ�Ρ�

set "dirc=D:\elong_log\log\rabbitmq_failed\"
del /s %dirc%*.log 

set "dirc=D:\elong_log\log\SendLog\"
del /s %dirc%*.log

echo %date% %time% >> C:\clear_logs.log

pause