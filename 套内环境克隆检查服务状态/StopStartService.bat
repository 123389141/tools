@echo off

echo %1
set env=%1

if %env% EQU 61 (
	echo %env%
	rem “将处理语句写到这里”
)

if %env% EQU 62 (
	echo %env%
	rem “将处理语句写到这里”
)

if %env% EQU 63 (
	echo %env%
	rem “将处理语句写到这里”
)

rem 目前各套环境服务状态保持一致，暂时不做专门区分
cmd.exe /c ChackService.bat elong_hotel_Schedule RUNNING


