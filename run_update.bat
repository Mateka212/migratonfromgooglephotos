@echo off
REM Make sure PowerShell runs with execution policy that allows scripts
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0update_dates.ps1"
pause
