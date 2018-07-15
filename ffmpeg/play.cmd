@echo off
set /p val_addr=please type stream addr(default udp://238.0.0.1:1234):
if "%val_addr%"=="" (
	set val_addr=udp://238.0.0.1:1234 )
echo %val_addr%
set SDL_AUDIODRIVER=directsound
start ffplay.exe %val_addr%