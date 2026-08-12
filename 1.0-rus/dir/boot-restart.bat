@echo off
chcp 65001 > nul
title BIOS: reboot
echo Перезагрузка...
timeout /t 3 /nobreak > nul
shutdown /r /f /t 0