@echo off
set /p val_file=please type stream file(default 1.ts):
if "%val_file%"=="" (
	set val_file=1.ts )
set /p val_addr=please type stream addr(default udp://238.0.0.1:1234):
if "%val_addr%"=="" (
	set val_addr=udp://238.0.0.1:1234 )
::set val=%0
::echo %val:~1,-5%
::set val_file=%val:~1,-5%
echo %val_file%
echo %val_addr%
start ffmpeg.exe -re  -stream_loop -1 -i %val_file% -c copy -f mpegts %val_addr%