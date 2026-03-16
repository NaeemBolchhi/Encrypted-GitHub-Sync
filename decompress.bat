@echo off

:: ===== USER SETTINGS =====
set "FOLDER_NAME=Working_Folder"
set "SYNCFOLDER_NAME=Sync_Folder"
set "PASSWORD_1=YourStrongPasswordHere"
set "PASSWORD_2=YourStrongPasswordHere"

:: ===== AUTO SETTINGS =====
set "OUTPUT_FOLDER=%~dp0%SYNCFOLDER_NAME%"
set "OUTPUT_ARCHIVE=%OUTPUT_FOLDER%\%FOLDER_NAME%"

:: === MAKE DECOMPRESSED ===
copy /y "%OUTPUT_ARCHIVE%" "%OUTPUT_ARCHIVE%.7z"

"%~dp07za.exe" x "%OUTPUT_ARCHIVE%.7z" -o"%OUTPUT_FOLDER%" -p"%PASSWORD_2%" -y

del /f /q "%OUTPUT_ARCHIVE%_tmp.7z" 2>nul
ren "%OUTPUT_ARCHIVE%.7z" "%FOLDER_NAME%_tmp.7z"

certutil -decode "%OUTPUT_ARCHIVE%" "%OUTPUT_ARCHIVE%.7z" >nul

"%~dp07za.exe" x "%OUTPUT_ARCHIVE%.7z" -o"%~dp0" -p"%PASSWORD_1%" -y

del /f /q "%OUTPUT_ARCHIVE%.7z" 2>nul
del /f /q "%OUTPUT_ARCHIVE%" 2>nul
ren "%OUTPUT_ARCHIVE%_tmp.7z" "%FOLDER_NAME%"

timeout 1