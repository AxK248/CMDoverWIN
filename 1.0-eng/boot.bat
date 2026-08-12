rem =======================================================
rem Автор - AxK248 - https://github.com/AxK248
rem Страница проекта - https://github.com/AxK248/CMDoverWIN
rem MIT license
rem =======================================================
@echo off
chcp 65001 > nul
title BIOS: ---------
color f
cls
echo Start BIOS
timeout /t 3 /nobreak >nul
cls
echo BIOS Started
echo BIOS: boot-menu
title BIOS: boot-menu
timeout /t 1 /nobreak >nul
:bios
cls
echo BOOT-MENU
echo ========================================
echo Select an action for BOOT:
echo.
echo [1] Load the desktop (KDE Plasma)
echo [2] Load the terminal (CLI)
echo [3] Reboot
echo [4] Shutdown
echo [5] Exit (cmd)
echo.
echo ========================================
set "password="
set /p password="Enter: "

if /i "%password%"=="1" goto boot-KDE
if /i "%password%"=="2" goto boot-CLI
if /i "%password%"=="3" goto boot-RESTART
if /i "%password%"=="4" goto boot-SHUTDOWN
if /i "%password%"=="5" goto exit
if /i "%password%"=="menu" goto menu
if /i "%password%"=="reload" goto reload

cls
color c
echo [ERROR]
timeout /t 1 /nobreak >nul
color f
cls
echo An unexpected error occurred, please try again later.
echo Full page reset
timeout /t 3 /nobreak >nul
goto bios

:boot-KDE
echo Transition to desktop... && timeout /t 3 /nobreak >nul && %~dp0\dir\boot-kde.bat && exit /b

:boot-CLI
echo Transition to terminal... && timeout /t 3 /nobreak >nul && %~dp0\dir\boot-cli.bat && exit /b

:boot-SHUTDOWN
%~dp0\dir\boot-shutdown.bat && exit /b

:boot-RESTART
%~dp0\dir\boot-restart.bat && exit /b

:exit
cls && echo Turning off BOOT && timeout /t 3 /nobreak >nul && %~dp0\dir\cmd.bat && exit /b

:menu
cls && echo Turning off BOOT... && timeout /t 3 /nobreak >nul && %~dp0\menu.bat && exit /b