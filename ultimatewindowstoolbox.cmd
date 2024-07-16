@echo off
cls
call :IsAdmin
echo off
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "VerboseStatus" /t REG_DWORD /d "1" /f

:start
    cls
    title The Ultimate Windows Toolbox
    cls
    color 0f
    echo ============================================================================
    echo "The Ultimate Windows Toolbox - Works in Windows 10 and Windows 11"
    echo ============================================================================                                    
    echo 1. Run the Chris Titus Tech Winutil
    echo 2. Reset Windows Update
    echo 3. Activate Windows for free
    echo 4. Find and Repair Problems in Windows
    echo 5. Test your RAM on next reboot
    echo 0. Exit
    echo ============================================================================
    set choice=
    set /p choice=Choose an option and type the corresponding number. 
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' goto winutil
    if '%choice%'=='2' goto resetupdateverify
    if '%choice%'=='3' goto massgrave
    if '%choice%'=='4' goto repairverify
    if '%choice%'=='5' goto ramtestverify
    if '%choice%'=='0' Exit
    echo "%choice%" is not valid, try again
    echo.
goto start

:winutil
    cls
    echo "Starting Chris Titus Tech Winutil"
    timeout /t 2
    start powershell -noexit -command "irm christitus.com/win | iex"
goto start

:resetupdateverify
    cls
    echo Your PC will reboot after this! Are you sure you would like to proceed?
    echo -----------------------------------------------------------------------------------
    echo 1. YES, Proceed
    echo 2. NO, Go back
    set choice=
    set /p choice=Type the number. 
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' goto resetupdatescript
    if '%choice%'=='2' goto start
    echo "%choice%" is not valid, try again
    
:resetupdatescript
    net stop wuauserv
    net stop cryptSvc
    net stop bits
    net stop msiserver
    Ren C:\Windows\SoftwareDistribution SoftwareDistribution.old
    Ren C:\Windows\System32\catroot2 Catroot2.old
    net start wuauserv
    net start cryptSvc
    net start bits
    net start msiserver
    shutdown /r /c "Shutting down in 10 seconds." /t 10
goto start

:massgrave
    cls
    powershell -command "irm https://get.activated.win | iex"
goto start

:repairverify
    cls
    echo -----------------------------------------------------------------------------------
    echo ****You need to REBOOT your PC after running this script.****
    echo Press 1 to continue and 2 to go back.
    echo -----------------------------------------------------------------------------------
    echo 1. Proceed
    echo 2. Go back
    set choice=
    set /p choice=Type the number. 
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' goto repairscript
    if '%choice%'=='2' goto start
    echo "%choice%" is not valid, try again

:repairscript
    cls
    sfc /scannow
    cls
    DISM /Online /Cleanup-Image /RestoreHealth  
goto start

:ramtestverify
    cls
    echo IMPORTANT INSTRUCTIONS: 
    echo If you decide to proceed, a Memory Diagnostic window will open.
    echo Press the button to restart now and check for problems. 
    echo -----------------------------------------------------------------------
    echo 1. YES, Proceed
    echo 2. NO, Go back
    set choice=
    set /p choice=Type the number. 
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' goto ramtestscript
    if '%choice%'=='2' goto start
    echo "%choice%" is not valid, try again

:ramtestscript
    cls
    start powershell -noexit -command "cmd /k C:\WINDOWS\system32\MdSched.exe"
goto start

:IsAdmin
reg query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & echo You must have administrator privileges to continue ... 
 Pause & Exit
)
Cls
goto:eof
pause
goto :start
