@echo off

rem keep iisweb started

set "web=BusinessServiceWCF"
iisweb /start %web% >>c:\hotel_script\keep_iisweb_started.log

echo %date% %time% >>c:\hotel_script\keep_iisweb_started.log