@echo off
set LOCALHOST=%COMPUTERNAME%
if /i "%LOCALHOST%"=="DESKTOP-U6BRQ9B" (taskkill /f /pid 13428)
if /i "%LOCALHOST%"=="DESKTOP-U6BRQ9B" (taskkill /f /pid 1684)

del /F cleanup-ansys-DESKTOP-U6BRQ9B-1684.bat
