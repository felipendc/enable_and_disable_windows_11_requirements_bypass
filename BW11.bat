@echo off
title BW11
mode 80,25
color 07

REM Author: Haitham Aouati
REM GitHub: https://github.com/haithamaouati

cls

net session >nul 2>&1
if %errorlevel% == 0 (
    goto main_menu
) else (
    echo This script must be run as an administrator.
    pause
    exit
)

:main_menu
cls
echo.
echo  ##########  ##########
echo  ##########  ##########
echo  ##########  ##########
echo  ##########  ##########
echo  ##########  ##########
echo.
echo  ##########  ##########
echo  ##########  ##########
echo  ##########  ##########
echo  ##########  ##########
echo  ##########  ##########
echo.
echo Main menu:
echo 1. Disable the Windows 11 Installation Requirements Bypass
echo 2. Exit
echo.

set /p choice=Enter your choice: 

if "%choice%"=="1" goto bypass
if "%choice%"=="2" goto end

echo Invalid choice. Please try again.
goto main_menu

:bypass
echo This section WON'T allow you to bypass various checks.
echo 1. DO NOT Bypass CPU Check
echo 2. DO NOT Bypass Storage Check
echo 3. DO NOT Bypass RAM Check
echo 4. DO NOT Bypass TPM Check
echo 5. DO NOT Bypass SecureBoot Check
echo 6. DO NOT Allow Upgrade With Unsupported TPM or CPU
echo.

echo Adding keys to DISABLE the bypass checks...
REG ADD HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig /v BypassCPUCheck /f /t REG_DWORD /d 00000000
REG ADD HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig /v BypassStorageCheck /f /t REG_DWORD /d 00000000
REG ADD HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig /v BypassRAMCheck /f /t REG_DWORD /d 00000000
REG ADD HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig /v BypassTPMCheck /f /t REG_DWORD /d 00000000
REG ADD HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig /v BypassSecureBootCheck /f /t REG_DWORD /d 00000000
REG ADD HKEY_LOCAL_MACHINE\SYSTEM\Setup\MoSetup /v AllowUpgradesWithUnsupportedTPMOrCPU /f /t REG_DWORD /d 00000000

echo Keys added successfully.
pause
goto main_menu

:end
echo Are you sure you want to exit the script? (y/n)
set /p confirm=
if /i "%confirm%"=="y" exit
if /i "%confirm%"=="n" goto main_menu

goto end
