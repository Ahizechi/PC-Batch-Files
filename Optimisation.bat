@echo off
title System Cleaning Script
color 0A

echo --------------------------------------------------------------------------------
echo Optimisation Scripts:
echo --------------------------------------------------------------------------------

echo Running the first script...
PowerShell -Command "iwr -useb https://git.io/debloat | iex"
echo First script completed. Please close any opened application before proceeding.

pause

echo Running the second script...
PowerShell -Command "iwr -useb https://christitus.com/win | iex"
echo Second script completed.

pause

echo.
echo --------------------------------------------------------------------------------
echo Cleaning Windows Update Cache...
echo --------------------------------------------------------------------------------
net stop wuauserv
rd /s /q %windir%\SoftwareDistribution
net start wuauserv

echo.
echo Scan and Cleanup Complete!

echo --------------------------------------------------------------------------------
echo Performing System Scan and Repair:
echo --------------------------------------------------------------------------------

echo.
echo Running System File Checker (SFC)...
sfc /scannow

echo.
echo Running CHKDSK to fix errors on drive C:...
chkdsk C: /f /r

echo.
echo Running CHKDSK to fix errors on drive D:...
chkdsk D: /f /r

echo.
echo Running CHKDSK to fix errors on drive E:...
chkdsk E: /f /r

echo.
echo Running DISM (Deployment Image Servicing and Management)...
DISM.exe /Online /Cleanup-image /Restorehealth
DISM /Online /Cleanup-Image /StartComponentCleanup /ResetBase