@echo off
title System Cleaning Script
color 0A

echo --------------------------------------------------------------------------------
echo Flushing DNS:
echo --------------------------------------------------------------------------------

ipconfig /flushdns
ipconfig /registerdns
ipconfig /release
ipconfig /renew

echo.
echo DNS Flushed!
echo.

echo --------------------------------------------------------------------------------
echo Deleting Temporary Files:
echo --------------------------------------------------------------------------------

echo.
echo Deleting temporary files from %temp%...
del /S /F /Q "%temp%\*.*"
echo.
echo Temporary files from %temp% deleted!

echo.
echo Deleting temporary files from %Windir%\Temp...
del /S /F /Q "%Windir%\Temp\*.*"
echo.
echo Temporary files from %Windir%\Temp deleted!

echo.
echo All Temporary Files Successfully Deleted!
echo.

echo --------------------------------------------------------------------------------
echo Performance Counters:
echo --------------------------------------------------------------------------------

echo.
echo Rebuild Performance Counters 1
lodctr /r
echo Rebuild Performance Counters 2
lodctr /r
echo.

echo --------------------------------------------------------------------------------
echo Disk Defragmentation:
echo --------------------------------------------------------------------------------

echo.
echo Defragmenting hard disks...
defrag D: /v /o

echo.
echo Disk defragmentation completed successfully!
echo.

