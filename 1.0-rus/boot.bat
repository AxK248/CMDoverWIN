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
echo Запуск BIOS
timeout /t 3 /nobreak >nul
cls
echo BIOS Запущен
echo BIOS: boot-menu
title BIOS: boot-menu
timeout /t 1 /nobreak >nul
:bios
cls
echo BOOT-MENU
echo ========================================
echo Выберите действие для BOOT:
echo.
echo [1] Загрузить рабочую среду (KDE Plasma)
echo [2] Загрузить терминал (CLI)
echo [3] Перезагрузить (REBOOT)
echo [4] Завершить работу (SHUTDOWN)
echo [5] Выйти (cmd)
echo.
echo ========================================
set "password="
set /p password="Введите: "

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
echo Непредвиденная ошибка, пожалуйста повторите позже
echo Идёт сброс страницы
timeout /t 3 /nobreak >nul
goto bios

:boot-KDE
echo Переход в рабочую среду... && timeout /t 3 /nobreak >nul && %~dp0\dir\boot-kde.bat && exit /b

:boot-CLI
echo Переход в Терминал... && timeout /t 3 /nobreak >nul && %~dp0\dir\boot-cli.bat && exit /b

:boot-SHUTDOWN
%~dp0\dir\boot-shutdown.bat && exit /b

:boot-RESTART
%~dp0\dir\boot-restart.bat && exit /b

:exit
cls && echo Выключение BOOT && timeout /t 3 /nobreak >nul && %~dp0\dir\cmd.bat && exit /b

:menu
cls && echo Выход из BOOT... && timeout /t 3 /nobreak >nul && %~dp0\menu.bat && exit /b