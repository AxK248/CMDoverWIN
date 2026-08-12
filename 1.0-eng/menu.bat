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
echo Select an action for CMD:
echo.
echo [1] User Folder ("%USERPROFILE%\")
echo [2] Downloads ("%USERPROFILE%\Downloads\")
echo [3] Desktop ("%USERPROFILE%\Desktop\") 
echo [4] Addons menu
echo [5] Exit (CMD)
echo.
echo more...
echo =================================================
set "password="
set /p password="Enter the code: "

if /i "%password%"=="1" goto userprofile
if /i "%password%"=="2" goto downloads
if /i "%password%"=="3" goto desktop
if /i "%password%"=="5" goto addons
if /i "%password%"=="4" goto exit
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
echo Invalid add-on access token.
echo Full page reset
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
echo Select an action for CMD:
echo.
echo [1] User Folder ("%USERPROFILE%\")
echo [2] Downloads ("%USERPROFILE%\Downloads\")
echo [3] Desktop ("%USERPROFILE%\Desktop\")
echo [4] Addons menu
echo [5] Open the script folder ("%~dp0")
echo [6] Open the Windows folder ("C:\Windows\")
echo [7] Start "%~dp0boot.bat"
echo [8] Back to the simplified menu
echo [9] Exit (CMD)
echo.
echo ======================================================
set "password="
set /p password="Enter the code: "

if /i "%password%"=="1" goto userprofile
if /i "%password%"=="2" goto downloads
if /i "%password%"=="3" goto desktop
if /i "%password%"=="4" goto addons
if /i "%password%"=="5" goto script
if /i "%password%"=="6" goto windows
if /i "%password%"=="7" goto boot
if /i "%password%"=="8" goto menu
if /i "%password%"=="9" goto exit
if /i "%password%"=="reload" goto reload

goto error