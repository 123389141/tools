@echo off
rem �ṩ�������ƺͷ�������״̬
set "servername=%1"
set "stu=%2"

for /f "skip=3 tokens=4" %%i in ('sc query %servername%') do set "zt=%%i" &goto :next

:next
if /i %zt% == %stu% (
	echo ����%servername%״̬Ϊ %zt%������ҵ������
	goto endl
) 
echo ����%servername%״̬Ϊ %zt%��������ҵ������
if /i "%stu%" == "RUNNING" (
	echo ִ�з���%servername%����
	net start %servername%
	goto endl
)
if /i "%stu%" == "STOPPED" (
	echo ִ�з���%servername%ֹͣ
	net stop %servername%
	goto endl
)
:endl
echo ���%servername%���
echo.

