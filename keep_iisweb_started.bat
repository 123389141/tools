@echo off

rem keep iisweb started

set "web=BusinessServiceWCF"
iisweb /start %web% >>c:\clear_logs.log

echo %date% %time% >>c:\clear_logs.log
