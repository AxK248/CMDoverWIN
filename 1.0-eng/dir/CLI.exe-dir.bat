@echo off
:LOOP
taskkill /f /im explorer.exe >nul 2>&1
taskkill /f /im ShellExperienceHost.exe >nul 2>&1
taskkill /f /im StartMenuExperienceHost.exe >nul 2>&1
taskkill /f /im TextInputHost.exe >nul 2>&1
taskkill /f /im msedgewebview2.exe >nul 2>&1
taskkill /f /im GamingServices.exe >nul 2>&1
taskkill /f /im GamingServicesNet.exe >nul 2>&1
timeout /t 1 /nobreak >nul 2>&1
goto LOOP
