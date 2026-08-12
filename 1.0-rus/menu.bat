rem =======================================================
rem Автор - AxK248 - https://github.com/AxK248
rem Страница проекта - https://github.com/AxK248/CMDoverWIN
rem MIT license
rem =======================================================
@echo off
:reload
chcp 65001 > nul
:menu
title CMD - [Shortcut Menu]
cls
echo [Shortcut Menu]
echo =================================================
echo Выберите действие для CMD:
echo.
echo [1] Папка пользователя ("%USERPROFILE%\")
echo [2] Загрузки ("%USERPROFILE%\Загрузки\")
echo [3] Рабочий стол ("%USERPROFILE%\Рабочий стол\") 
echo [4] Выход (CMD)
echo [5] Addons меню
echo.
echo more...
echo =================================================
set "password="
set /p password="Введите код: "

if /i "%password%"=="1" goto userprofile
if /i "%password%"=="2" goto downloads
if /i "%password%"=="3" goto desktop
if /i "%password%"=="4" goto exit
if /i "%password%"=="5" goto addons
if /i "%password%"=="boot" goto boot
if /i "%password%"=="script" goto script
if /i "%password%"=="windows" goto windows
if /i "%password%"=="more" goto more
if /i "%password%"=="reload" goto reload

:error
color c
cls
echo [ERROR]
timeout /t 1 /nobreak >nul
color f
cls
echo [-----]
echo Извините ваш код неверный!
echo Идёт сброс страницы
timeout /t 3 /nobreak >nul
goto menu

:userprofile
cd /d "%USERPROFILE%" && title Windows 11 CLI Pro && cls && color f && @echo on && dir && exit /b

:desktop
cd /d "%USERPROFILE%\Desktop" && title Windows 11 CLI Pro && cls && color f && @echo on && dir && exit /b

:exit
title Windows 11 CLI Pro && cls && color f && @echo on && dir && exit /b

:addons
"%~dp0\addons.bat"

:downloads
cd /d "%USERPROFILE%\Downloads" && title Windows 11 CLI Pro && cls && color f && @echo on && dir && exit /b

:windows
cd /d "C:\Windows" && title Windows 11 CLI Pro && cls && color f && @echo on && dir && exit /b

:script
cd /d "%~dp0" && title Windows 11 CLI Pro && cls && color f && @echo on && dir && exit /b

:boot
"%~dp0\boot.bat" && exit /b

:more
title CMD - [Menu]
cls
echo [Menu]
echo ======================================================
echo Выберите действие для CMD:
echo.
echo [1] Папка пользователя ("%USERPROFILE%\")
echo [2] Загрузки ("%USERPROFILE%\Загрузки\")
echo [3] Рабочий стол ("%USERPROFILE%\Рабочий стол\")
echo [4] Выход (CMD)
echo [5] Addons меню
echo [6] Открыть папку скрипта ("%~dp0")
echo [7] Открыть папку Windows ("C:\Windows\")
echo [8] Запустить "%~dp0boot.bat"
echo [9] Назад в упрощённое меню
echo.
echo ======================================================
set "password="
set /p password="Введите код: "

if /i "%password%"=="1" goto userprofile
if /i "%password%"=="2" goto downloads
if /i "%password%"=="3" goto desktop
if /i "%password%"=="4" goto exit
if /i "%password%"=="5" goto addons
if /i "%password%"=="6" goto script
if /i "%password%"=="7" goto windows
if /i "%password%"=="8" goto boot
if /i "%password%"=="9" goto menu
if /i "%password%"=="reload" goto reload

goto error

:cmd
cls && %~dp0\dir\cmd.bat && exit /b