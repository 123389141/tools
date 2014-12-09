@echo off
rem 提供服务名称和服务期望状态
set "servername=%1"
set "stu=%2"

for /f "skip=3 tokens=4" %%i in ('sc query %servername%') do set "zt=%%i" &goto :next

:next
if /i %zt% == %stu% (
	echo 服务%servername%状态为 %zt%，符合业务需求
	goto endl
) 
echo 服务%servername%状态为 %zt%，不符合业务需求
if /i "%stu%" == "RUNNING" (
	echo 执行服务%servername%启动
	net start %servername%
	goto endl
)
if /i "%stu%" == "STOPPED" (
	echo 执行服务%servername%停止
	net stop %servername%
	goto endl
)
:endl
echo 检查%servername%完成
echo.

