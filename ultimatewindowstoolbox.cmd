@echo off
cls
color 0f
goto check_Permissions

:check_Permissions
    echo Administrative permissions required. Detecting permissions...
    ping 127.0.0.1 -n 2 > nul

    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo Success: Administrative permissions confirmed. 
        ping 127.0.0.1 -n 2 > nul
    ) else (
        echo Failure: Current permissions inadequate. Please run the command again as administrator.
        ping 127.0.0.1 -n 2 > nul
        pause
        Exit
    )
    
    goto start
:start
    cls
    title The Ultimate Windows Toolbox
    cls
    echo ============================================================================
    echo "The Ultimate Windows Toolbox - Works in Windows 10 and Windows 11"
    echo ============================================================================                                    
    echo 1. Run the Chris Titus Tech Winutil
    echo 2. Reset Windows Update
    echo 3. Activate Windows for free
    echo 4. Find and Repair Problems in Windows
    echo 5. Test your RAM on next reboot
    echo 6. Remove Microsoft Edge
    echo 7. Install a web browser
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
    if '%choice%'=='7' goto installbrowsers-chocolatey
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
    echo Continuing with this will break Microsoft's TOS. Are you sure you'd like to proceed?
    pause
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

:removemsedge
    cls
    @echo off
    echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    echo                                      WARNING!
    echo Make sure you have another browser downloaded as this will remove Edge permanently!
    echo Tip: You can install a browser by going to the homepage of this utility and selecting option 7!
    echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    pause
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
    
        del "%desktop_folder%\%shortcut_name%"
        echo Edge shortcut removed successfully.

        del "%systemdrive%\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Edge.lnk"
        echo Edge was removed from the start menu successfully. 

        del "%appdata%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Microsoft Edge.lnk"
        del "%userprofile%\AppData\Local\iconcache.db"
        echo Edge was removed from the taskbar successfully. 
      
        pause
goto start

:installbrowsers-chocolatey
    cls
        if exist "C:\ProgramData\chocolatey\bin\choco.exe" (
            echo Chocolatey is installed.
            pause
            goto installbrowsers
        ) else (
            echo Chocolatey not found. Installing...
            @echo off
            @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
            cls
            pause
            goto installbrowsers
        )
    
    
    cls
    pause
    
:installbrowsers
    cls
    echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    echo                          + Web browser installer +
    echo You can install a web browser here. You may want to do this before or after uninstalling Edge or if you'd like a new browser.
    echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    echo 1. Install Chrome
    echo 2. Install Firefox
    echo 3. Install Brave
    echo 0. Go Back
    set choice=
    set /p choice=Type the number. 
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' goto chromeinstall
    if '%choice%'=='2' goto firefoxinstall
    if '%choice%'=='3' goto braveinstall
    if '%choice%'=='0' goto start
    echo "%choice%" is not valid, try again

:chromeinstall
    cls
    start powershell -command "choco install googlechrome -y"
    echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    echo This browser may be out of date. Ensure that it's up to date by going into Settings and checking for updates.
    echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    pause
goto start 

:firefoxinstall
    cls
    start powershell -command "choco install firefox -y"
    echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    echo This browser may be out of date. Ensure that it's up to date by going into Settings and checking for updates.
    echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    pause
goto start

:braveinstall
    cls
    start powershell -command "choco install brave -y"
    echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    echo This browser may be out of date. Ensure that it's up to date by going into Settings and checking for updates.
    echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    pause
goto start

pause
goto start
