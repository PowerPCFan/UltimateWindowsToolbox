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
    echo 6. Remove Microsoft Edge
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
    if '%choice%'=='6' goto removemsedge
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
    shutdown /r /t 10
    start powershell -noexit -command "echo **Your PC will restart in 10 seconds. Please wait.**"
goto start

:massgrave
    cls
    powershell -command "irm https://get.activated.win | iex"
goto start

:repairverify
    cls
    echo Your PC will reboot after this! Are you sure you would like to proceed?
    echo -----------------------------------------------------------------------------------
    echo 1. YES, Proceed
    echo 2. NO, Go back
    set choice=
    set /p choice=Type the number. 
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' goto repairscript
    if '%choice%'=='2' goto start
    echo "%choice%" is not valid, try again

:repairscript
    cls
    sfc /scannow 
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

:removemsedge
    @echo off

    echo Taking ownership of C:\Program Files (x86)\Microsoft...
    takeown /f "C:\Program Files (x86)\Microsoft" /r /d y > nul 2>&1

    echo Granting full control permissions...
    icacls "C:\Program Files (x86)\Microsoft" /grant %username%:F /t > nul 2>&1

    echo Deleting C:\Program Files (x86)\Microsoft directory and its contents...
    rd /s /q "C:\Program Files (x86)\Microsoft"
    echo Deletion complete.

    echo Deleting Microsoft Edge shortcut from desktop...
    del /f "%userprofile%\Desktop\Microsoft Edge.lnk" > nul 2>&1
    echo Shortcut deletion complete.

    echo ============================================================================
    echo                 Do you want to install Google Chrome?
    echo ============================================================================
    echo 1. YES
    echo 2. NO
    echo ============================================================================
     set option=
      set /p option=Choose an option and type the corresponding number. 
        if not '%option%'=='' set choice=%choice:~0,100%
        if '%option%'=='1' goto chromeinstaller


:chromeinstaller
   bitsadmin /transfer ChromeDownload /download /priority normal https://dl.google.com/tag/s/appguid%3D%7B8A69D345-D564-463C-AFF1-A69D9E530F96%7D%26iid%3D%7BFE6517C0-3B35-3DCD-D0DB-66312FA03132%7D%26lang%3Den%26browser%3D3%26usagestats%3D1%26appname%3DGoogle%2520Chrome%26needsadmin%3Dprefers%26ap%3Dx64-statsdef_1%26installdataindex%3Dempty/update2/installers/ChromeSetup.exe "%USERPROFILE%\Downloads\ChromeSetup.exe"
   echo successfully downloaded Google Chrome
   echo go run it from your downloads folder
   pause
   goto start



REM Check if the shortcut exists
if exist "%USERPROFILE%\Desktop"\Microsoft Edge.lnk"" (
    del "%desktop_folder%\%shortcut_name%"
    echo Edge shortcut removed successfully.
) else (
    echo Edge shortcut not found on the desktop.
) 
pause



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
