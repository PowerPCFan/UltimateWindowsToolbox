@echo off
cls
color 0f
goto check_Permissions

:check_Permissions
   

    net session >nul 2>&1
    if %errorLevel% == 0 (
        goto start 
    ) else (
        echo Failure: Current permissions inadequate. Please run the file again as administrator.
        pause
        Exit
    )
:start
    cls
    title The Ultimate Windows Toolbox
    echo ============================================================================
    echo "The Ultimate Windows Toolbox - Works in Windows 10 and Windows 11"
    echo ============================================================================                                    
    echo 1. Run the Chris Titus Tech Winutil
    echo 2. Activate Windows for free
    echo 3. Test your RAM on next reboot
    echo 4. Windows Tweaks
    echo 5. Install Apps (Browsers, Utilities, Etc)
    echo 0. Exit
    echo ============================================================================
    set choice=
    set /p choice=Choose an option and type the corresponding number. 
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' goto winutil
    if '%choice%'=='2' goto massgrave
    if '%choice%'=='3' goto ramtestverify
    if '%choice%'=='4' goto windowstweaks
    if '%choice%'=='5' goto apps-chocolatey
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

:massgrave
    cls
    echo Continuing with this will break Microsoft's TOS. You should pay for a real Windows license. Are you sure you'd like to proceed?
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

:windowstweaks
    cls
    echo ============================================================================
    echo +++ WINDOWS TWEAKS +++
    echo ============================================================================                                    
    echo 1. Uninstall Microsoft Edge
    echo 2. Enable/Disable Bing Search in start menu searchbar
    echo 3. Enable/Disable Verbose Mode
    echo 4. Enable/Disable Hibernation
    echo 5. Reset Windows Update
    echo 6. Find and Repair Problems in Windows 
    echo 0. Go Home
    echo ============================================================================
    set choice=
    set /p choice=Choose an option and type the corresponding number. 
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' goto removemsedge
    if '%choice%'=='2' goto bingsearch
    if '%choice%'=='3' goto verbose
    if '%choice%'=='4' goto hibernate
    if '%choice%'=='5' goto resetupdateverify
    if '%choice%'=='6' goto repairverify
    if '%choice%'=='7' goto 
    if '%choice%'=='0' goto start
    echo "%choice%" is not valid, try again
    echo.
goto start

:removemsedge
    cls
    @echo off
    echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    echo                                      WARNING!
    echo Make sure you have another browser downloaded as this will remove Edge permanently!
    echo Tip: You can install a browser by going to the homepage of this utility and selecting option 5!
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

:bingsearch
    cls
    echo ==================
    echo 1. Disable Bing Search in Start Menu
    echo 2. Enable Bing Search in Start Menu
    set choice=
    set /p choice=Type the number. 
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "DisableSearchBoxSuggestions" /t REG_DWORD /d "1" /f > nul
    if '%choice%'=='2' reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "DisableSearchBoxSuggestions" /t REG_DWORD /d "0" /f > nul
echo Process completed successfully. 
echo Press any key to restart Explorer for the changes to take effect.  
pause > nul
taskkill /f /im explorer.exe > nul
explorer.exe
echo Process complete. Press any key to continue. 
pause > nul
goto windowstweaks

:verbose
    cls
    echo ==================
    echo 1. Enable Verbose Mode
    echo 2. Disable Verbose Mode
    set choice=
    set /p choice=Type the number. 
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "VerboseStatus" /t REG_DWORD /d "1" /f > nul
    if '%choice%'=='2' reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "VerboseStatus" /t REG_DWORD /d "0" /f > nul
cls
echo Process completed successfully. 
pause
goto windowstweaks

:hibernate
cls
    echo ===============================================================================================
    echo Hibernation saves the RAM contents to your hard drive and shuts down as opposed to sleeping.
    echo If you're on a laptop, it's your choice - you can have it on or off. (I prefer off.)
    echo If you're on a desktop, ALWAYS have hibernation turned off.
    echo Some systems might not support hibernation or already have it enabled or disabled.
    echo If you get an error related to that, it's fine.
    echo ===============================================================================================
    echo 1. Disable Hibernation
    echo 2. Enable Hibernation
    set choice=
    set /p choice=Type the number. 
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' powercfg.exe /hibernate off
    if '%choice%'=='2' powercfg.exe /hibernate on
pause
goto windowstweaks

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

:apps-chocolatey
    cls
        if exist "C:\ProgramData\chocolatey\bin\choco.exe" (
            goto apps
        ) else (
            echo Chocolatey needs to be installed. Installing...
            @echo off
            @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
            cls
            echo Chocolatey was installed successfully. Press any key to continue. 
            pause > nul
            goto apps
        )
    
    
    cls
    goto apps

:apps
    cls
    echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    echo      + APP INSTALLER +
    echo You can install apps here!
    echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    echo 1. Install a Web Browser
    echo 0. Go Back
    set choice=
    set /p choice=Type the number. 
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' goto installbrowsers
    if '%choice%'=='0' goto start
    echo "%choice%" is not valid, try again

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
    if '%choice%'=='1' start powershell -command "choco install googlechrome -y"
    if '%choice%'=='2' start powershell -command "choco install firefox -y"
    if '%choice%'=='3' start powershell -command "choco install brave -y"
    if '%choice%'=='0' goto start
    echo "%choice%" is not valid, try again

pause
goto start
