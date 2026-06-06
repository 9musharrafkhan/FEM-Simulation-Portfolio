@echo off
set LOCALHOST=%COMPUTERNAME%
if /i "%LOCALHOST%"=="DESKTOP-U6BRQ9B" (taskkill /f /pid 13572)
if /i "%LOCALHOST%"=="DESKTOP-U6BRQ9B" (taskkill /f /pid 22588)

del /F cleanup-ansys-DESKTOP-U6BRQ9B-22588.bat
