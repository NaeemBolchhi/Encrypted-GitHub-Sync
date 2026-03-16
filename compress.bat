@echo off

:: ===== USER SETTINGS =====
set "FOLDER_NAME=Working_Folder"
set "SYNCFOLDER_NAME=Sync_Folder"
set "PASSWORD_1=YourStrongPasswordHere"
set "PASSWORD_2=YourStrongPasswordHere"

:: ===== AUTO SETTINGS =====
set "SOURCE_FOLDER=%~dp0%FOLDER_NAME%"
set "OUTPUT_ARCHIVE=%~dp0%SYNCFOLDER_NAME%\%FOLDER_NAME%"

:: ==== MAKE COMPRESSED ====
del /f /q "%OUTPUT_ARCHIVE%.7z" 2>nul
"%~dp07za.exe" a -t7z "%OUTPUT_ARCHIVE%.7z" "%SOURCE_FOLDER%\" -p"%PASSWORD_1%" -mhe -y

del /f /q "%OUTPUT_ARCHIVE%" 2>nul
certutil -encode "%OUTPUT_ARCHIVE%.7z" "%OUTPUT_ARCHIVE%" >nul

del /f /q "%OUTPUT_ARCHIVE%.7z" 2>nul
"%~dp07za.exe" a -t7z "%OUTPUT_ARCHIVE%.7z" "%OUTPUT_ARCHIVE%" -p"%PASSWORD_2%" -mhe -y

del /f /q "%OUTPUT_ARCHIVE%" 2>nul
ren "%OUTPUT_ARCHIVE%.7z" "%FOLDER_NAME%"

timeout 1