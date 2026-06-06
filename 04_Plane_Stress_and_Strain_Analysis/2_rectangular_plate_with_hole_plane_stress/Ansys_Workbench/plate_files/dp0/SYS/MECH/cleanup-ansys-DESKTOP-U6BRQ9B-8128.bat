@echo off
set LOCALHOST=%COMPUTERNAME%
if /i "%LOCALHOST%"=="DESKTOP-U6BRQ9B" (taskkill /f /pid 21404)
if /i "%LOCALHOST%"=="DESKTOP-U6BRQ9B" (taskkill /f /pid 8128)

del /F cleanup-ansys-DESKTOP-U6BRQ9B-8128.bat
