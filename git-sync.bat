@echo off

:: ===== USER SETTINGS =====
set "SYNCFOLDER_NAME=Sync_Folder"

:: ===== AUTO SETTINGS =====
for /f "tokens=*" %%i in ('powershell -NoProfile -Command "Get-Date -Format 'yyyyMMddHHmmss'"') do set "TIMESTAMP=%%i"

:: ====== GITHUB SYNC ======
cd %SYNCFOLDER_NAME%
git pull
git add .
git commit -m "%TIMESTAMP%"
git push origin main

timeout 1