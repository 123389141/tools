@echo off

set "servername=elong_hotel_Schedule"
:check
for /f "skip=3 tokens=4" %%i in ('sc query %servername%') do set "zt=%%i" &goto :next

:next
if /i "%zt%"=="RUNNING" (
echo ���ַ���%servername%�����У�����ֹͣ����
net stop %servername%
goto check
) else (
echo ����%servername%����ֹͣ״̬,����������
net start %servername%
)
pause