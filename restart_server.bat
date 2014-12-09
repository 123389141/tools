@echo off

set "servername=elong_hotel_Schedule"
:check
for /f "skip=3 tokens=4" %%i in ('sc query %servername%') do set "zt=%%i" &goto :next

:next
if /i "%zt%"=="RUNNING" (
echo 发现服务%servername%在运行，现在停止运行
net stop %servername%
goto check
) else (
echo 服务%servername%现在停止状态,将进行启动
net start %servername%
)
pause