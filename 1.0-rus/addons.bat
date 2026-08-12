rem =======================================================
rem Автор - AxK248 - https://github.com
rem Страница проекта - https://github.com/CMDoverWIN
rem MIT license
rem =======================================================
@echo off
title Addon Menu Debug
endlocal 2>nul
chcp 65001 >nul
setlocal enabledelayedexpansion

:: Твоя версия API
set "current_api_name=API"
set "current_api_ver=1.0"

:addons
cls
echo ==================================================
echo  CLI Addons Core: API ^| VER: %current_api_ver%
echo ==================================================
echo [1] Перезагрузить страницу
echo [2] Назад в menu
echo.
echo --- ДОСТУПНЫЕ ДОПОЛНЕНИЯ (АДДОНЫ) ---

:: Сбрасываем старые пути перед обновлением списка
for /f "tokens=1 delims==" %%a in ('set mod_path[ 2^>nul') do set "%%a="
set "mod_count=0"

if not exist "%~dp0addons" mkdir "%~dp0addons"

for /d %%d in ("%~dp0addons\*") do (
    
    if exist "%%~d\init.bat" (
        
        set "mod_name=Без названия"
        set "mod_author=Неизвестен"
        set "mod_ver=1.0"
        set "mod_code="
        set "mod_api="
        
        if exist "%%~d\info.txt" (
            
            for /f "tokens=1,2* delims=: " %%a in ('type "%%~d\info.txt"') do (
                if /i "%%a"=="Name" set "mod_name=%%b %%c"
                if /i "%%a"=="Author" set "mod_author=%%b %%c"
                if /i "%%a"=="Version" set "mod_ver=%%b"
                if /i "%%a"=="Code" set "mod_code=%%b"
                if /i "%%a"=="API" set "mod_api=%%b"
            )
        )
        :: Твоя проверка совпадения версий
        if "!mod_api!"=="%current_api_ver%" (
            if not "!mod_code!"=="" (
                set "mod_path[!mod_code!]=%%~d"
                echo [!mod_code!] !mod_name! ^(v!mod_ver!^) от !mod_author!
                set /a mod_count+=1
            )
		)
	)
)
echo.

if %mod_count% equ 0 echo [Аддоны не найдены или не подходят под версию API %current_api_ver%]
echo.

set "user_choice="
set /p user_choice="Выберите код: "

if "%user_choice%"=="1" goto reload
if "%user_choice%"=="2" goto exit

if defined mod_path[%user_choice%] (
    set "target_dir=!mod_path[%user_choice%]!"
    cls
    cd /d "!target_dir!"
    "init.bat"
    exit
)

goto error

:error
echo Access Denied. Неверный токен доступа к дополнению.
echo Полный сброс страницы
timeout /t 3 /nobreak >nul
goto addons

:exit
%~dp0menu.bat && exit /b

:reload
echo Перезагрузка страницы... && timeout /t 1 /nobreak >nul && goto addons
