@echo off
echo Running system maintenance tasks...

:: Check and Repair System Files
echo Checking and repairing system files...
sfc /scannow

:: Check Disk for Errors
echo Checking disk for errors...
chkdsk /f /r C:
:: Note: The system may ask to schedule the chkdsk at the next restart. Confirm with 'Y'.

:: Clean Temporary Files
echo Cleaning temporary files...
del /q /f /s %TEMP%\*

:: Clear DNS Cache
echo Clearing DNS cache...
ipconfig /flushdns

:: View and Disable Startup Programs
echo Opening Task Manager to disable startup programs...
start taskmgr

:: Optimize and Defrag Drives
echo Optimizing and defragmenting drives...
defrag C: /O

:: Disable Hibernation
echo Disabling hibernation...
powercfg -h off

:: Adjust Visual Effects
echo Opening Performance Options for visual effects adjustment...
start SystemPropertiesPerformance

:: Release and Renew IP Address
echo Releasing and renewing IP address...
ipconfig /release
ipconfig /renew

echo All tasks completed!
echo Restarting in 10 seconds...
timeout /T 10
shutdown /r

