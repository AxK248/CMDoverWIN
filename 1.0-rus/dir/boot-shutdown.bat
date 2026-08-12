@echo off
chcp 65001 > nul
title BIOS: shutdown
echo Завершение работы
timeout /t 3 /nobreak > nul
shutdown /s /f /t 0