@echo off
title The Ultimate Windows Toolbox
cls
set white=[97m
set pink=[95m
set blue=[96m
color 0f
mode 175,38

:: Enable ANSI Escape Sequences
reg add "HKCU\CONSOLE" /v "VirtualTerminalLevel" /t REG_DWORD /d "1" /f  > nul

:: Enable Delayed Expansion
setlocal enabledelayedexpansion

:: Enable command extensions
verify on

net session >nul 2>&1
if %errorLevel% == 0 (
    goto choco-check 
) else (
    echo Failure: Current permissions inadequate. Please run the file again as administrator.
    pause
    Exit
)


:choco-check
    cls
        if exist "%systemdrive%\ProgramData\chocolatey\bin\choco.exe" (
            goto start
        ) else (
            echo Chocolatey needs to be installed. Installing...
            @echo off
            @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
            cls
            echo Chocolatey was installed successfully. Press any key to continue. 
            pause > nul
            goto start
        )

:start
	cls
	chcp 65001 >nul 2>&1
    	echo. !pink!
    	type "%temp%\UltimateWindowsToolbox\welcome.txt"
	echo.
    echo                             !blue!===================================================================================================================
    echo                             !white!              The Ultimate Windows Toolbox is the ULTIMATE Windows 10 and Windows 11 tweaking utility!
    echo                             !blue!===================================================================================================================               
    echo                                     !pink![!white!1!pink!]!white! Run the Chris Titus Tech Winutil          !pink![!white!2!pink!]!white! Activate Windows for free
    echo.
    echo                                     !pink![!white!3!pink!]!white! Find and Repair Problems in Windows       !pink![!white!4!pink!]!white! Test your RAM on next reboot
    echo.
    echo                                     !pink![!white!5!pink!]!white! Windows Tweaks                            !pink![!white!6!pink!]!white! Install Apps (Browsers, Utilities, Etc)
    echo.
    echo                                     !pink![!white!7!pink!]!white! All-in-one Windows Tweak Script           !pink![!white!8!pink!]!white! Wallpaper Switcher
    echo.
    echo.
    echo                                     !pink![!white!C!pink!]!white! Credits
    echo.
    echo                                     !pink![!white!E!pink!]!white! Exit
    echo                             !blue!================================================================================================================
    echo. !white!
    choice /c 12345678ce /n /m "» "
    if errorlevel 10 exit
    if errorlevel 9 goto credits
    if errorlevel 8 goto wallpaper
    if errorlevel 7 goto tweak-script
    if errorlevel 6 goto apps
    if errorlevel 5 goto windowstweaks
    if errorlevel 4 goto ramtest
    if errorlevel 3 goto repair
    if errorlevel 2 goto massgrave
    if errorlevel 1 goto winutil

    :: OLD CODE ::
    :: set choice=
    :: set /p choice= »
    :: if not '%choice%'=='' set choice=%choice:~0,100%
    :: if '%choice%'=='1' goto winutil
    :: if '%choice%'=='2' goto massgrave
    :: if '%choice%'=='3' goto repairverify
    :: if '%choice%'=='4' goto ramtestverify
    :: if '%choice%'=='5' goto windowstweaks
    :: if '%choice%'=='6' goto apps
    :: if '%choice%'=='7' goto tweak-script
    :: if '%choice%'=='c' goto credits
    :: if '%choice%'=='e' Exit
    :: echo "%choice%" is not valid, try again
    :: echo.

goto start

:winutil
    cls
    echo !blue!===================================================================
    echo       !white!Would you like to start the Chris Titus Tech Winutil?
    echo !blue!===================================================================
    choice /c yn /n /m "!pink![!white!Y!pink!] !white!Yes !pink![!white!N!pink!] !white!No"
    if errorlevel 2 goto start
    if errorlevel 1 start powershell -noexit -command "irm christitus.com/win | iex"
goto start

:massgrave
    cls
    echo !blue!======================================================
    echo   !white!Continuing with this will break Microsoft's EULA. 
    echo       !white!You should pay for a real Windows license. 
    echo          !white!Are you sure you'd like to proceed?
    echo !blue!======================================================
    choice /c yn /n /m "!pink![!white!Y!pink!] !white!Yes !pink![!white!N!pink!] !white!No"
    if errorlevel 2 goto start
    if errorlevel 1 start powershell -command "irm https://get.activated.win | iex"
goto start

:repair
    cls
    echo !blue!-----------------------------------------------------------------------------------
    choice /c sde /n /m "!pink![!white!S!pink!] !white!Run System File Checker !pink![!white!D!pink!] !white!Run DISM !pink![!white!E!pink!] !white!Exit"
    echo !blue!-----------------------------------------------------------------------------------!white!
    if errorlevel 3 goto start
    if errorlevel 2 DISM /Online /Cleanup-Image /RestoreHealth
    if errorlevel 1 sfc /scannow

:ramtest
    cls
    echo !white!IMPORTANT INSTRUCTIONS: 
    echo If you decide to proceed, a Memory Diagnostic window will open.
    echo Press the button to restart now and check for problems. 
    echo !blue!-----------------------------------------------------------------------
    echo !white!Would you like to proceed?
    choice /c yn /n /m "!pink![!white!Y!pink!] !white!Yes !pink![!white!N!pink!] !white!No"
    if errorlevel 2 goto start
    if errorlevel 1 cmd /c %SystemRoot%\System32\MdSched.exe
   

:windowstweaks
    cls
    echo !blue!============================================================================
    echo                      !pink!+++ !white!WINDOWS TWEAKS (Page 1) !pink!+++
    echo !blue!============================================================================!white!
    echo !pink![!white!1!pink!]!white! Uninstall Microsoft Edge
    echo !pink![!white!2!pink!]!white! Enable/Disable Bing Search in start menu searchbar
    echo !pink![!white!3!pink!]!white! Enable/Disable Verbose Mode
    echo !pink![!white!4!pink!]!white! Enable/Disable Hibernation
    echo !pink![!white!5!pink!]!white! Enable/Disable Long Paths
    echo !pink![!white!6!pink!]!white! Reset Windows Update
    echo !pink![!white!7!pink!]!white! Change the alignment of the Taskbar
    echo !pink![!white!8!pink!]!white! Change the behavior of UAC (User Account Control)
    echo !pink![!white!9!pink!]!white! Change Windows SmartScreen settings
    echo.
    echo !pink![!white!0!pink!]!white! Go Back
    echo Press !pink![!white!N!pink!]!white! to go to the next page
    echo !blue!============================================================================!white!
    choice /c 1234567890n /n /m "» "
    if errorlevel 11 goto windowstweakspage2
    if errorlevel 10 goto start
    if errorlevel 9 goto smartscreen
    if errorlevel 8 goto uac
    if errorlevel 7 goto taskbaralignment
    if errorlevel 6 goto resetupdateverify
    if errorlevel 5 goto longpaths
    if errorlevel 4 goto hibernate
    if errorlevel 3 goto verbose
    if errorlevel 2 goto bingsearch
    if errorlevel 1 goto removemsedge
goto start

:windowstweakspage2
    cls
    echo !blue!============================================================================
    echo                      !pink!+++ !white!WINDOWS TWEAKS (Page 2) !pink!+++
    echo !blue!============================================================================!white!                       
    echo !pink![!white!1!pink!]!white! Enable/Disable Windows Error Reporting
    echo !pink![!white!2!pink!]!white! Enable/Disable Location Services
    echo !pink![!white!3!pink!]!white! Enable/Disable Storage Sense
    echo !pink![!white!4!pink!]!white! Enable/Disable Teredo IPv6 Tunneling
    echo !pink![!white!5!pink!]!white! Enable/Disable WiFi-Sense
    echo !pink![!white!6!pink!]!white! Configure the HOSTS file to block telemetry in Windows
    echo !pink![!white!7!pink!]!white! Make Windows use UTC Time
    echo !pink![!white!8!pink!]!white! Disable/Enable Windows Copilot
    echo.
    echo !pink![!white!0!pink!]!white! Go Back
    echo Press !pink![!white!B!pink!]!white! to go to the previous page
    echo Press !pink![!white!N!pink!]!white! to go to the next page
    echo !blue!============================================================================!white!
    choice /c 123456780bn /n /m "» "
    if errorlevel 11 goto windowstweakspage3
    if errorlevel 10 goto windowstweaks
    if errorlevel 9 goto start
    if errorlevel 8 goto copilot
    if errorlevel 7 goto utc-time
    if errorlevel 6 goto hosts-telemetry
    if errorlevel 5 goto wifi-sense
    if errorlevel 4 goto teredo
    if errorlevel 3 goto storagesense
    if errorlevel 2 goto locationservices
    if errorlevel 1 goto winerrorreporting
goto start

:windowstweakspage3
    cls
    echo !blue!============================================================================
    echo                      !pink!+++ !white!WINDOWS TWEAKS (Page 3) !pink!+++
    echo !blue!============================================================================!white!                    
    echo !pink![!white!1!pink!]!white! Configure Google Chrome Manifest V2 support
    echo !pink![!white!2!pink!]!white! Enable Dark Mode
    echo !pink![!white!3!pink!]!white! Disable Cortana
    echo !pink![!white!4!pink!]!white! Lower Keyboard + Mouse Data Queue to reduce input lag
    echo.
    echo !pink![!white!0!pink!]!white! Go Back
    echo Press !pink![!white!B!pink!]!white! to go to the previous page
    echo !blue!============================================================================!white!
    choice /c 12340b /n /m "» "
    if errorlevel 6 goto windowstweakspage2
    if errorlevel 5 goto start
    if errorlevel 4 reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "30" /f & reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "35" /f
    if errorlevel 3 goto cortana
    if errorlevel 2 goto darkmode
    if errorlevel 1 goto chrome-mv2
goto start

:removemsedge
    @echo off
    cls
    echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    echo                                      WARNING!
    echo            This will permanently remove Edge and all of its components!
    echo    You can install another web browser in the apps category after Edge is removed.
    echo         If you'd like to cancel the Edge uninstallation, close this window.
    echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    pause
        echo Setting environment variables...
        set desktop=%userprofile%\Desktop
        set onedrivedesktop=%userprofile%\OneDrive\Desktop

        echo Taking ownership of C:\Program Files (x86)\Microsoft...
        takeown /f "C:\Program Files (x86)\Microsoft" /r /d y > nul 2>&1
    
        echo Granting full control permissions...
        icacls "C:\Program Files (x86)\Microsoft" /grant %username%:F /t > nul 2>&1
    
        echo Deleting C:\Program Files (x86)\Microsoft directory and its contents...
        rd /s /q "C:\Program Files (x86)\Microsoft" > nul 2>&1
        echo Deletion complete.
    
        echo Deleting Microsoft Edge shortcut from desktop...
        del /f "%desktop%\Microsoft Edge.lnk" > nul 2>&1
        :: Just in case the person uses OneDrive
        del /f "%onedrivedesktop%\Microsoft Edge.lnk" > nul 2>&1
        echo Shortcut deletion complete.

        del "%systemdrive%\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Edge.lnk" > nul 2>&1
        echo Edge was removed from the start menu successfully. 

        del "%appdata%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Microsoft Edge.lnk" > nul 2>&1
        del "%localappdata%\iconcache.db" > nul 2>&1
        echo Edge was removed from the taskbar successfully.
        echo.
        echo Restarting Explorer for changes to take effect...
        taskkill /f /im explorer.exe > nul 2>&1
        start explorer.exe
        pause
goto start

:bingsearch
    cls
    echo !blue!==================
    echo !pink![!white!1!pink!]!white! Disable Bing Search in Start Menu
    echo !pink![!white!2!pink!]!white! Enable Bing Search in Start Menu
    echo !pink![!white!0!pink!]!white! Go Back
    choice /c 120 /n /m "» "
    if errorlevel 3 goto windowstweaks
    if errorlevel 2 reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "DisableSearchBoxSuggestions" /t REG_DWORD /d "1" /f > nul
    if errorlevel 1 reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "DisableSearchBoxSuggestions" /t REG_DWORD /d "0" /f > nul
echo Process completed successfully. 
echo Press any key to restart Explorer for the changes to take effect.  
pause > nul
taskkill /f /im explorer.exe > nul
start explorer.exe
echo Process complete. Press any key to continue. 
pause > nul
goto windowstweaks

:verbose
    cls
    echo !blue!==================
    echo !pink![!white!1!pink!]!white! Enable Verbose Mode
    echo !pink![!white!2!pink!]!white! Disable Verbose Mode
    echo !pink![!white!0!pink!]!white! Go Back
    choice /c 120 /n /m "» "
    if errorlevel 3 goto windowstweaks
    if errorlevel 2 reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "VerboseStatus" /t REG_DWORD /d "0" /f > nul
    if errorlevel 1 reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "VerboseStatus" /t REG_DWORD /d "1" /f > nul
cls
echo Process completed successfully. 
pause
goto windowstweaks

:hibernate
cls
    echo !blue!===============================================================================================!white!
    echo Hibernation saves the RAM contents to your hard drive and shuts down as opposed to sleeping.
    echo If you're on a laptop, it's your choice - you can have it on or off. (I prefer off.)
    echo If you're on a desktop, ALWAYS have hibernation turned off.
    echo Some systems might not support hibernation or already have it enabled or disabled.
    echo If you get an error related to that, it's fine.
    echo !blue!===============================================================================================
    echo !pink![!white!1!pink!]!white! Disable Hibernation
    echo !pink![!white!2!pink!]!white! Enable Hibernation
    echo !pink![!white!0!pink!]!white! Go Back
    choice /c 120 /n /m "» "
    if errorlevel 3 goto windowstweaks
    if errorlevel 2 powercfg.exe /hibernate on
    if errorlevel 1 powercfg.exe /hibernate off
pause
goto windowstweaks

:longpaths
cls
    echo !blue!================================================================================================!white!
    echo                       +++ Background Info about File Paths in Windows +++
    echo.
    echo By default, there is a file path limit of 260 characters in Windows.
    echo For the average person this isn't a problem but for some people this will cause issues.
    echo With the settings below, you can enable Long File Paths which bypasses the 260 character limit.
    echo Even though there is a limit set by default, there isn't a good reason to have it on.
    echo Therefore I strongly recommend enabling Long File Paths below.
    echo !blue!================================================================================================
    echo !pink![!white!1!pink!]!white! Enable Long File Paths (Recommended)
    echo !pink![!white!2!pink!]!white! Disable Long File Paths
    echo !pink![!white!0!pink!]!white! Go Back
    choice /c 120 /n /m "» "
    if errorlevel 3 goto windowstweaks
    if errorlevel 2 reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "LongPathsEnabled" /t REG_DWORD /d "0" /f > nul
    if errorlevel 1 reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "LongPathsEnabled" /t REG_DWORD /d "1" /f > nul
    cls
    echo Process completed successfully. 
    pause
goto windowstweaks


:resetupdateverify
    cls
    echo !white!Your PC will reboot after this! Are you sure you would like to proceed?
    echo !blue!-----------------------------------------------------------------------------------!white!
    choice /c yn /n /m "!pink![!white!Y!pink!] !white!Yes !pink![!white!N!pink!] !white!No"
    if errorlevel 2 goto start
    if errorlevel 1 goto resetupdatescript
goto start

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
    shutdown /r /c "Shutting down in 15 seconds." /t 10
goto start

:taskbaralignment
cls
    echo !blue!====================!white!
    echo   Taskbar Alignment
    echo !blue!====================!white!
    echo !pink![!white!1!pink!]!white! Left Align
    echo !pink![!white!2!pink!]!white! Center Align
    echo !pink![!white!3!pink!]!white! Right Align (only works on Windows 10)
    echo !pink![!white!0!pink!]!white! Go Back
    choice /c 1230 /n /m "» "
    if errorlevel 4 goto windowstweaks
    if errorlevel 3 reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAl" /t REG_DWORD /d "2" /f > nul
    if errorlevel 2 reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAl" /t REG_DWORD /d "1" /f > nul
    if errorlevel 1 reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAl" /t REG_DWORD /d "0" /f > nul

    cls
    echo Process completed successfully. 
    pause
goto windowstweaks

:uac
cls
    echo !blue!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!white!
    echo                                 USER ACCOUNT CONTROL SETTINGS
    echo.
    echo Choose when to be notified about changes to your computer
    echo User Account Control helps prevent potentially harmful programs from making changes to your computer.
    echo !blue!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!white!
    echo !pink![!white!1!pink!]!white! Always notify me about any changes made to my computer, even if done by me (most secure)
    echo !pink![!white!2!pink!]!white! Notify me only when apps try to make changes to my computer (Default)
    echo !pink![!white!3!pink!]!white! Notify me only when apps try to make changes to my computer (Don't dim my desktop)
    echo !pink![!white!4!pink!]!white! NEVER notify me about any changes made to my computer (NOT RECOMMENDED)
    echo !pink![!white!0!pink!]!white! Go Back
    choice /c 12340 /n /m "» "
    if errorlevel 5 goto windowstweaks
    if errorlevel 4 reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop" /t REG_DWORD /d "0" /f > nul & reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d "1" /f > nul & reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d "0" /f > nul
    if errorlevel 3 reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop" /t REG_DWORD /d "0" /f > nul & reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d "1" /f > nul & reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d "5" /f > nul
    if errorlevel 2 reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop" /t REG_DWORD /d "1" /f > nul & reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d "1" /f > nul & reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d "5" /f > nul
    if errorlevel 1 reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop" /t REG_DWORD /d "1" /f > nul & reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d "1" /f > nul & reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d "2" /f > nul
    cls
    echo Process completed successfully. 
    pause
goto windowstweaks

:smartscreen
cls
    echo !blue!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!white!
    echo                                        Microsoft Defender SmartScreen
    echo.
    echo Windows automatically shields you from threats with Microsoft Defender SmartScreen. 
    echo This feature checks the reputation of websites and apps before you access them, blocking anything potentially harmful. 
    echo While it rarely makes mistakes, you have the option to disable it if needed.
    echo.
    echo There are two versions of SmartScreen built into Windows. 
    echo One version is for the Microsoft Edge web browser and it protects against malicious downloads and websites.
    echo The other version is integrated with Windows Security/Defender and protects against malicious apps and executables.
    echo.
    echo Below, you can disable the Windows Security version of SmartScreen. The Edge version can be disabled in Edge settings.
    echo !blue!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!white!
    echo !pink![!white!1!pink!]!white! Enable SmartScreen for Windows Security (default)
    echo !pink![!white!2!pink!]!white! Disable SmartScreen for Windows Security
    echo !pink![!white!0!pink!]!white! Go Back
    choice /c 120 /n /m "» "
    if errorlevel 3 goto windowstweaks
    if errorlevel 2 reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d "0" /f > nul
    if errorlevel 1 reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d "1" /f > nul
    cls
    echo Process completed successfully. 
    pause
goto windowstweaks

:winerrorreporting
    cls
    echo !blue!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!white!
    echo                                        Windows Error Reporting
    echo.
    echo Windows Error Reporting (WER) is a built-in system in Windows that gathers information when apps (or the system) crashes. 
    echo With your permission, the information can be sent to Microsoft to help them identify and fix bugs in Windows or software. 
    echo
    echo You may want to disable this because it gathers tons of crash data and system data to send to Microsoft.
    echo Its data collection is anonymous but it offers no benefit to you and could compromise your privacy. 
    echo Disabling it lets you troubleshoot issues yourself without being bugged by Microsoft asking for your data.
    echo.
    echo Below, you can enable or disable Windows Error Reporting, for the current user or all users. 
    echo !blue!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!white!
    echo !pink![!white!1!pink!]!white! Enable Windows Error Reporting for the current user (default)
    echo !pink![!white!2!pink!]!white! Disable Windows Error Reporting for the current user
    echo !pink![!white!3!pink!]!white! Enable Windows Error Reporting for ALL USERS (default)
    echo !pink![!white!4!pink!]!white! Disable Windows Error Reporting for ALL USERS
    echo !pink![!white!0!pink!]!white! Go Back
    choice /c 12340 /n /m "» "
    if errorlevel 5 goto windowstweakspage2
    if errorlevel 4 reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f > nul
    if errorlevel 3 reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "0" /f > nul
    if errorlevel 2 reg add "HKCU\Software\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f > nul
    if errorlevel 1 reg add "HKCU\Software\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "0" /f > nul
    cls
    echo Process completed successfully. 
    pause
goto windowstweakspage2

:locationservices
cls
    echo !blue!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!white!
    echo                                    Location Services
    echo.
    echo Location Services are tracking your location 24/7. It might seem helpful for maps or weather,
    echo but it isn't worth it to be constantly giving Microsoft your location. They're just harvesting data. 
    echo.
    echo Below, you can enable or disable Location Services. I would HIGHLY recommend disabling it.
    echo !blue!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!white!
    echo !pink![!white!1!pink!]!white! Enable Location Services (please don't do this...)
    echo !pink![!white!2!pink!]!white! Disable Location Services (Highly Recommended)
    echo !pink![!white!0!pink!]!white! Go Back
    choice /c 120 /n /m "» "
    if errorlevel 3 goto windowstweakspage2
    if errorlevel 2 reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Deny" /f > nul
    if errorlevel 1 reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Allow" /f > nul
    cls
    echo Process completed successfully. 
    pause
goto windowstweakspage2

:storagesense
cls
    echo !blue!============================================================================================!white!
    echo                                     Storage Sense
    echo !blue!--------------------------------------------------------------------------------------------!white!
    echo Storage Sense is a built-in Windows feature that automatically frees up disk space. 
    echo It can clean temporary files, empty the recycle bin, and even remove old versions of files. 
    echo This is helpful for keeping your drive from becoming full and improving performance. 
    echo However, you might want to disable it if you prefer more control over what gets deleted.
    echo !blue!============================================================================================!white!
    echo !pink![!white!1!pink!]!white! Enable Storage Sense (default)
    echo !pink![!white!2!pink!]!white! Disable Storage Sense
    echo !pink![!white!0!pink!]!white! Go Back
    choice /c 120 /n /m "» "
    if errorlevel 3 goto windowstweakspage2
    if errorlevel 2 reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\StorageSense" /v "AllowStorageSenseGlobal" /t REG_DWORD /d "0" /f > nul
    if errorlevel 1 reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\StorageSense" /v "AllowStorageSenseGlobal" /t REG_DWORD /d "1" /f > nul
    cls
    echo Process completed successfully. 
    pause
goto windowstweakspage2


:teredo
cls
    echo !blue!===============================================================================================================================!white!
    echo                                                  Teredo IPv6 Tunneling
    echo.
    echo Teredo is a tunneling protocol that facilitates IPv6 connectivity over IPv4 networks.
    echo It encapsulates IPv6 packets within IPv4 UDP datagrams, enabling communication between IPv6-only clients and IPv4-based servers.
    echo.
    echo.
    echo Pros and Cons of Enabling Teredo (it's enabled by default):
    echo.
    echo Pro: Allows IPv6 connectivity on networks that primarily use IPv4.
    echo Con: Adds an extra layer of encapsulation/decapsulation, potentially increasing latency.
    echo.
    echo.
    echo Pros and Cons of Disabling Teredo:
    echo.
    echo Pro: Streamlines network communication path, potentially improving performance for tasks that don't require IPv6.
    echo Con: Disables IPv6 connectivity on IPv4-only networks, limiting access to some resources.
    echo !blue!===============================================================================================================================!white!
    echo !pink![!white!1!pink!]!white! Enable Teredo (default)
    echo !pink![!white!2!pink!]!white! Disable Teredo
    echo !pink![!white!0!pink!]!white! Go Back
    choice /c 120 /n /m "» "
    if errorlevel 3 goto windowstweakspage2
    if errorlevel 2 netsh interface teredo set state disabled
    if errorlevel 1 netsh interface teredo set state enabled
    cls
    echo Process completed successfully. 
    pause
goto windowstweakspage2

:wifi-sense
cls
    echo !blue!===============================================================================================!white!
    echo                                        WiFi-Sense
    echo -----------------------------------------------------------------------------------------------
    echo Wi-Fi Sense SOUNDS convenient, automatically connecting you to public Wi-Fi. 
    echo But it's a huge security risk. Connecting to unknown public Wi-Fi can leave your data vulnerable. 
    echo To add to this, Wi-Fi Sense spies on your geolocation 24/7. 
    echo Disabling it protects your privacy and gives you control over choosing secure Wi-Fi networks.
    echo !blue!===============================================================================================!white!
    echo !pink![!white!1!pink!]!white! Enable WiFi-Sense (default)
    echo !pink![!white!2!pink!]!white! Disable WiFi-Sense
    echo !pink![!white!0!pink!]!white! Go Back
    choice /c 120 /n /m "» "
    if errorlevel 3 goto windowstweakspage2
    if errorlevel 2 reg add "HKLM\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config" /v "AutoConnectAllowedOEM" /t REG_DWORD /d "0" /f > nul
    if errorlevel 1 reg add "HKLM\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config" /v "AutoConnectAllowedOEM" /t REG_DWORD /d "1" /f > nul
    cls
    echo Process completed successfully. 
    pause
goto windowstweakspage2

:hosts-telemetry
cls
    echo !blue!=====================================================================================================!white!
    echo                                    HOSTS file and telemetry
    echo !blue!-----------------------------------------------------------------------------------------------------!white!
    echo The HOSTS file has been around for years and it can be used to block websites and connections.
    echo Windows 10 and especially Windows 11 have a ton of telemetry and data that gets sent to Microsoft.
    echo You can use the HOSTS file to block the websites that Microsoft uses to harvest data from you.
    echo.
    echo If you experience problems with Microsoft services: 
    echo * Use the "Revert to default HOSTS file" option below
    echo * Use the "Revert to previous HOSTS file before tweaks" option below
    echo !blue!=====================================================================================================!white!
    echo !pink![!white!1!pink!]!white! Enable the custom HOSTS file to block telemetry (Last Updated September 5, 2024)
    echo !pink![!white!2!pink!]!white! Revert to default HOSTS file
    echo !pink![!white!3!pink!]!white! Revert to previous HOSTS file before tweaks (only works if you've done tweaks previously)
    echo !pink![!white!0!pink!]!white! Go Back
    choice /c 1230 /n /m "» "
    if errorlevel 4 goto windowstweakspage2
    if errorlevel 3 goto previoushosts
    if errorlevel 2 goto stockhosts
    if errorlevel 1 goto customhosts-wget
cls
echo Process completed successfully. 
pause
goto windowstweakspage2


:customhosts-wget
    cls
        if exist "C:\ProgramData\chocolatey\bin\wget.exe" (
            goto customhosts
        ) else (
            echo Wget needs to be installed. Installing...
            start powershell -command "choco install wget -y"
            pause
            goto customhosts
        )

:customhosts
    cls
    rename %windir%\System32\drivers\etc\hosts hosts.bak
    wget https://raw.githubusercontent.com/PowerPCFan/UltimateWindowsToolbox/main/hosts -O %windir%\System32\drivers\etc\hosts
    echo Successfully enabled the custom HOSTS file to block telemetry.
    pause
goto hosts-telemetry

:stockhosts
cls
DEL %windir%\System32\drivers\etc\hosts
wget https://raw.githubusercontent.com/PowerPCFan/UltimateWindowsToolbox/main/defaulthosts -O %windir%\System32\drivers\etc\hosts
copy %windir%\System32\drivers\etc\defaulthosts %windir%\System32\drivers\etc\hosts
echo Successfully reverted to the default Windows HOSTS file.
pause
goto hosts-telemetry

:previoushosts
cls
DEL %windir%\System32\drivers\etc\hosts
copy %windir%\System32\drivers\etc\hosts.bak %windir%\System32\drivers\etc\hosts
echo Successfully reverted to previous HOSTS file before tweaks.
pause
goto hosts-telemetry

:utc-time
cls
    echo !blue!=================================================================!white!
    echo                           UTC Time
    echo !blue!-------------------------------------------------!white!
    echo By default, Windows uses Local Time and Linux uses UTC Time.
    echo If you're dual-booting, there will be time errors and problems.
    echo You can fix this by forcing Windows to use UTC Time.
    echo !blue!=================================================================!white!
    echo !pink![!white!1!pink!]!white! Enable UTC Time
    echo !pink![!white!2!pink!]!white! Disable UTC Time (default)
    echo !pink![!white!0!pink!]!white! Go Back
    choice /c 120 /n /m "» "
    if errorlevel 3 goto windowstweakspage2
    if errorlevel 2 reg delete "HKLM\SYSTEM\CurrentControlSet\Control\TimeZoneInformation" /v "RealTimeIsUniversal" /f > nul
    if errorlevel 1 reg add "HKLM\SYSTEM\CurrentControlSet\Control\TimeZoneInformation" /v "RealTimeIsUniversal" /t REG_DWORD /d "1" /f > nul
cls
echo Process completed successfully. 
pause
goto windowstweakspage2

:copilot
cls
    echo !blue!=================================================================!white!
    echo                            Windows Copilot
    echo !blue!-----------------------------------------------------------------!white!
    echo Some Windows users like me find Copilot to be annoying and intrusive.
    echo You can disable or enable Copilot with the options below.
    echo You may need to restart your computer for changes to take effect.
    echo !blue!=================================================================!white!
    echo !pink![!white!1!pink!]!white! Enable Copilot (default setting)
    echo !pink![!white!2!pink!]!white! Disable Copilot
    echo !pink![!white!0!pink!]!white! Go Back
    choice /c 120 /n /m "» "
    if errorlevel 3 goto windowstweakspage2
    if errorlevel 2 reg add "HKCU\Software\Policies\Microsoft\Windows\WindowsCopilot" /v "TurnOffWindowsCopilot" /t REG_DWORD /d "1" /f > nul
    if errorlevel 1 reg delete "HKCU\Software\Policies\Microsoft\Windows\WindowsCopilot" /v "TurnOffWindowsCopilot" /f > nul
cls
echo Process completed successfully. 
pause
goto windowstweakspage2


:chrome-mv2
cls
    echo !blue!=================================================================!white!
    echo        Extend Google Chrome Manifest V2 support to June 2025
    echo !blue!=================================================================!white!
    echo !pink![!white!1!pink!]!white! Enabled
    echo !pink![!white!2!pink!]!white! Disabled (default)
    echo !pink![!white!0!pink!]!white! Go Back
    choice /c 120 /n /m "» "
    if errorlevel 3 goto windowstweakspage3
    if errorlevel 2 reg delete "HKLM\SOFTWARE\Policies\Google\Chrome" /v "ExtensionManifestV2Availability" /f > nul
    if errorlevel 1 reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "ExtensionManifestV2Availability" /t REG_DWORD /d "2" /f > nul
cls
echo Process completed successfully. 
pause
goto windowstweakspage3

:darkmode
cls
    echo !blue!==============================!white!
    echo        Enable Dark Mode
    echo !blue!==============================!white!
    echo !pink![!white!1!pink!]!white! Yes, Enable Dark Mode
    echo !pink![!white!2!pink!]!white! No, Go Back
    choice /c 12 /n /m "» "
    if errorlevel 2 goto windowstweakspage3
    if errorlevel 1 (
        reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v AppsUseLightTheme /t REG_DWORD /d 0 /f > nul
        reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v ColorPrevalence /t REG_DWORD /d 0 /f > nul
        reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 1 /f > nul
        reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v SystemUsesLightTheme /t REG_DWORD /d 0 /f > nul
    )
cls
echo Process completed successfully. 
pause
goto windowstweakspage3

:cortana
cls
    echo !blue!==========================!white!
    echo      Disable Cortana
    echo !blue!==========================!white!
    echo !pink![!white!1!pink!]!white! Yes, Disable Cortana
    echo !pink![!white!2!pink!]!white! No, Go Back
    choice /c 12 /n /m "» "
    if errorlevel 2 goto windowstweakspage3
    if errorlevel 1 reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0" /f > nul
cls
echo Process completed successfully.
pause
goto windowstweakspage3




:apps
    cls
    echo !blue!==========================
    echo    !pink!+!white! APP INSTALLER !pink!+!white!
    echo Choose a category below:
    echo !blue!==========================!white!
    echo !pink![!white!1!pink!]!white! Web Browsers
    echo !pink![!white!2!pink!]!white! Communications
    echo !pink![!white!3!pink!]!white! Development
    echo !pink![!white!4!pink!]!white! PDF Viewers + Word Processors
    echo !pink![!white!5!pink!]!white! Game Launchers
    echo !pink![!white!6!pink!]!white! Microsoft Utilities (Sysinternals Suite, Visual C++ Runtimes, etc)
    echo !pink![!white!7!pink!]!white! Multimedia Tools
    echo !pink![!white!8!pink!]!white! Utilities
    echo !pink![!white!0!pink!]!white! Go Back
    choice /c 123456780 /n /m "Type the number: "
    if errorlevel 9 goto start
    if errorlevel 8 goto utilities
    if errorlevel 7 goto multimedia
    if errorlevel 6 goto msutilities
    if errorlevel 5 goto games
    if errorlevel 4 goto pdf
    if errorlevel 3 goto development
    if errorlevel 2 goto communications
    if errorlevel 1 goto browsers
pause
goto apps

:browsers
cls
    echo !blue!----------------------------------------------------------------------------------------------------
    echo                                  !pink!+!white! Web browser installer !pink!+!white!
    echo You can install a web browser here. 
    echo You may want to install a browser before or after uninstalling Edge or if you'd like a new browser.
    echo !blue!----------------------------------------------------------------------------------------------------!white!
    echo.
    echo !pink![!white!1!pink!]!white! Install Chrome
    echo !pink![!white!2!pink!]!white! Install Firefox
    echo !pink![!white!3!pink!]!white! Install Brave
    echo !pink![!white!4!pink!]!white! Install Microsoft Edge
    echo !pink![!white!0!pink!]!white! Go Back
    choice /c 12340 /n /m "Type the number: "
    if errorlevel 5 goto apps
    if errorlevel 4 start powershell -command "choco install microsoft-edge -y"
    if errorlevel 3 start powershell -command "choco install brave -y"
    if errorlevel 2 start powershell -command "choco install firefox -y"
    if errorlevel 1 start powershell -command "choco install googlechrome -y"
pause
goto apps


:communications
    cls
    echo !blue!----------------------
    echo   !pink!+!white! Communications !pink!+!white!
    echo !blue!----------------------!white!
    echo.
    echo 1. Discord
    echo 2. Signal
    echo 3. Skype
    echo 4. Slack
    echo 5. Telegram
    echo 6. Zoom
    echo 0. Go Back
    choice /c 1234560 /n /m "Type the number: "
    if errorlevel 7 goto apps
    if errorlevel 6 start powershell -command "choco install zoom -y"
    if errorlevel 5 start powershell -command "choco install telegram -y"
    if errorlevel 4 start powershell -command "choco install slack -y"
    if errorlevel 3 start powershell -command "choco install skype -y"
    if errorlevel 2 start powershell -command "choco install signal -y"
    if errorlevel 1 start powershell -command "choco install discord -y"

pause
goto apps

:development
    cls
    echo !blue!----------------------
    echo   !pink!+!white! Development !pink!+!white!
    echo !blue!----------------------!white!
    echo.
    echo 1. GitHub Desktop
    echo 2. Git
    echo 3. Notepad++
    echo 4. Visual Studio Code
    echo 5. Visual Studio 2022 Community
    echo 0. Go Back
    choice /c 123450 /n /m "Type the number: "
    if errorlevel 6 goto apps
    if errorlevel 5 start powershell -command "choco install visualstudio2022community -y"
    if errorlevel 4 start powershell -command "choco install vscode -y"
    if errorlevel 3 start powershell -command "choco install notepadplusplus -y"
    if errorlevel 2 start powershell -command "choco install git -y"
    if errorlevel 1 start powershell -command "choco install github-desktop -y"
pause
goto apps

:pdf
    cls
    echo !blue!----------------------
    echo   !pink!+!white! PDF Viewers and Word Processors !pink!+!white!
    echo !blue!----------------------!white!
    echo.
    echo 1. Adobe Acrobat Reader
    echo 2. Foxit PDF Reader
    echo 3. LibreOffice
    echo 4. Apache OpenOffice
    echo 5. Sumatra PDF
    echo 0. Go Back
    choice /c 123450 /n /m "Type the number: "
    if errorlevel 6 goto apps
    if errorlevel 5 start powershell -command "choco install sumatrapdf -y"
    if errorlevel 4 start powershell -command "choco install openoffice -y"
    if errorlevel 3 start powershell -command "choco install libreoffice-fresh -y"
    if errorlevel 2 start powershell -command "choco install foxitreader -y"
    if errorlevel 1 start powershell -command "choco install adobereader -y"
pause
goto apps

:games
    cls
    echo !blue!----------------------
    echo   !pink!+!white! Game Launchers !pink!+!white!
    echo !blue!----------------------!white!
    echo.
    echo 1. ATLauncher (Minecraft)
    echo 2. Epic Games Launcher
    echo 3. Nvidia GeForce NOW
    echo 4. Steam
    echo 0. Go Back
    choice /c 12340 /n /m "Type the number: "
    if errorlevel 5 goto apps
    if errorlevel 4 start powershell -command "choco install steam -y" 
    if errorlevel 3 start powershell -command "choco install nvidia-geforce-now -y"
    if errorlevel 2 start powershell -command "choco install epicgameslauncher -y"
    if errorlevel 1 goto atlauncher
goto apps

:atlauncher
    cls
    start powershell -command "(Invoke-WebRequest -Uri 'https://atlauncher.com/download/exe-setup' -OutFile (Join-Path ($env:TEMP) "ATLauncher.exe") -UseBasicParsing).Content"
    pause
    cls
    echo The ATLauncher installer has been downloaded successfully. Press any key to run the installer. 
    pause > nul
    cls
    for /f "tokens=*" %a in ('echo ^%TEMP%') do start "" "%a\ATLauncher.exe"
goto games

:msutilities
    cls
    echo !blue!----------------------------
    echo   !pink!+!white! Microsoft Utilities !pink!+!white!
    echo !blue!----------------------------!white!
    echo.
    echo 1. Autoruns
    echo 2. Power Automate
    echo 3. Sysinternals Process Monitor
    echo 4. Visual C++ Redistributables 2015-2022 
    echo 0. Go Back
    choice /c 12340 /n /m "Type the number: "
    if errorlevel 5 goto apps
    if errorlevel 4 start powershell -command "choco install vcredist140 -y"
    if errorlevel 3 start powershell -command "choco install procmon -y"
    if errorlevel 2 start powershell -command "choco install powerautomatedesktop -y"
    if errorlevel 1 start powershell -command "choco install autoruns -y"
goto apps

:multimedia
    cls
    echo !blue!------------------------------
    echo   !pink!+!white! Multimedia Programs (Page 1) !pink!+!white!
    echo !blue!------------------------------!white!
    echo.
    echo 1. Audacity
    echo 2. Equalizer APO
    echo 3. GIMP
    echo 4. HandBrake
    echo 5. iTunes
    echo 6. OBS Studio
    echo 7. Spotify
    echo 8. VLC Media Player
    echo 9. Yt-dlp
    echo 0. Go Back
    choice /c 1234567890 /n /m "Type the number: "
    if errorlevel 10 goto apps
    if errorlevel 9 start powershell -command "choco install yt-dlp -y"
    if errorlevel 8 start powershell -command "choco install vlc -y"
    if errorlevel 7 start powershell -command "choco install spotify -y"
    if errorlevel 6 start powershell -command "choco install obs-studio -y"
    if errorlevel 5 start powershell -command "choco install itunes -y"
    if errorlevel 4 start powershell -command "choco install handbrake -y"
    if errorlevel 3 start powershell -command "choco install gimp -y"
    if errorlevel 2 start powershell -command "choco install equalizerapo -y"
    if errorlevel 1 start powershell -command "choco install audacity -y"
goto apps


:utilities
    cls
    echo !blue!----------------------
    echo   !pink!+!white! Utilities (Page 1) !pink!+!white!
    echo !blue!----------------------!white!
    echo.
    echo 1. 7-Zip
    echo 2. AnyDesk
    echo 3. Bitwarden
    echo 4. CrystalDiskMark
    echo 5. CrystalDiskInfo
    echo 6. DDU (Display Driver Uninstaller)
    echo 7. BleachBit
    echo 8. WizTree
    echo 9. qBittorrent
    echo.
    echo 0. Go Back
    echo Press 'n' to go to the next page
    choice /c 1234567890n /n /m "Type the number: "
    if errorlevel 11 goto utilitiespage2
    if errorlevel 10 goto apps
    if errorlevel 9 start powershell -command "choco install qbittorrent -y"
    if errorlevel 8 start powershell -command "choco install wiztree -y"
    if errorlevel 7 start powershell -command "choco install bleachbit -y"
    if errorlevel 6 start powershell -command "choco install ddu -y"
    if errorlevel 5 start powershell -command "choco install crystaldiskinfo -y"
    if errorlevel 4 start powershell -command "choco install crystaldiskmark -y"
    if errorlevel 3 start powershell -command "choco install bitwarden -y"
    if errorlevel 2 start powershell -command "choco install anydesk -y"
    if errorlevel 1 start powershell -command "choco install 7zip -y"
goto apps

:utilitiespage2
    cls
    echo !blue!----------------------
    echo   !pink!+!white! Utilities (Page 2) !pink!+!white!
    echo !blue!----------------------!white!
    echo.
    echo 1. Rufus
    echo 2. F.lux
    echo 3. Google Drive
    echo 4. CPU-Z
    echo 5. GPU-Z
    echo 6. HWMonitor
    echo 7. Malwarebytes Anti-Malware (Broken AFAIK)
    echo 8. Revo Uninstaller
    echo 9. TeamViewer
    echo.
    echo 0. Go Back
    echo Press 'n' to go to the next page
    echo Press 'b' to go to the previous page
    choice /c 1234567890nb /n /m "Type the number: "
    if errorlevel 12 goto utilities
    if errorlevel 11 goto utilitiespage3
    if errorlevel 10 goto apps
    if errorlevel 9 start powershell -command "choco install teamviewer -y"
    if errorlevel 8 start powershell -command "choco install revo-uninstaller -y"
    if errorlevel 7 goto mbam
    if errorlevel 6 start powershell -command "choco install hwmonitor -y"
    if errorlevel 5 start powershell -command "choco install gpu-z -y"
    if errorlevel 4 start powershell -command "choco install cpu-z -y"
    if errorlevel 3 start powershell -command "choco install googledrive -y"
    if errorlevel 2 start powershell -command "choco install f.lux -y"
    if errorlevel 1 start powershell -command "choco install rufus -y"
goto apps


:mbam
    cls
    start powershell -command "(Invoke-WebRequest -Uri 'https://www.malwarebytes.com/mwb-download/thankyou' -OutFile (Join-Path ($env:TEMP) "Malwarebytes.exe") -UseBasicParsing).Content"
    pause
    cls
    echo The Malwarebytes installer has been downloaded successfully. Press any key to run the installer. 
    pause > nul
    cls
    for /f "tokens=*" %a in ('echo ^%TEMP%') do start "" "%a\Malwarebytes.exe"
goto utilitiespage2

:utilitiespage3
    cls
    echo !blue!----------------------
    echo   !pink!+!white! Utilities (Page 3) !pink!+!white!
    echo !blue!----------------------!white!
    echo.
    echo 1. MSI Afterburner
    echo 2. Winfetch (Neofetch for windows)
    echo 3. OpenRGB
    echo 4. Oracle VirtualBox
    echo 5. Parsec
    echo.
    echo 0. Go Back
    echo Press 'b' to go to the previous page
    choice /c 123450b /n /m "Type the number: "
    if errorlevel 7 goto utilitiespage2
    if errorlevel 6 goto apps
    if errorlevel 5 start powershell -command "choco install parsec -y"
    if errorlevel 4 start powershell -command "choco install virtualbox -y"
    if errorlevel 3 start powershell -command "choco install openrgb -y"
    if errorlevel 2 start powershell -command "choco install winfetch -y"
    if errorlevel 1 start powershell -command "choco install msiafterburner -y"
goto apps
pause
goto start

:tweak-script
    cls 
    echo This will apply a lot of tweaks. Are you sure you'd like to continue?
    pause

    echo Setting taskbar alignment to Left...
    reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAl" /t REG_DWORD /d "0" /f > nul
    
    echo Disabling Search Box Suggestions in start menu...
    reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "DisableSearchBoxSuggestions" /t REG_DWORD /d "1" /f > nul

    echo Disabling Windows Copilot...
    reg add "HKCU\Software\Policies\Microsoft\Windows\WindowsCopilot" /v "TurnOffWindowsCopilot" /t REG_DWORD /d "1" /f > nul

    echo Disabling WiFi-Sense...
    reg add "HKLM\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config" /v "AutoConnectAllowedOEM" /t REG_DWORD /d "0" /f > nul

    echo Disabling Location Services...
    reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Deny" /f > nul

    echo Disabling Windows Error Reporting...
    reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f > nul

    echo Enabling Long File Paths...
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "LongPathsEnabled" /t REG_DWORD /d "1" /f > nul

    echo Enabling Verbose Mode...
    reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "VerboseStatus" /t REG_DWORD /d "1" /f > nul

    echo Enabling Dark Mode...
    reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v AppsUseLightTheme /t REG_DWORD /d 0 /f > nul
    reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v ColorPrevalence /t REG_DWORD /d 0 /f > nul
    reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 1 /f > nul
    reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v SystemUsesLightTheme /t REG_DWORD /d 0 /f > nul

    echo Disabling Sticky Keys...
    reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v "Flags" /t REG_SZ /d "0" /f

    echo Disabling Toggle Keys...
    reg add "HKCU\Control Panel\Accessibility\ToggleKeys" /v "Flags" /t REG_SZ /d "0" /f

    echo Disabling Cortana...
    reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0" /f > nul

    echo Uninstalling Apps:
    
        echo Uninstalling OneNote
        powershell -command "Get-AppxPackage Microsoft.Office.OneNote* | Remove-AppxPackage"

        echo Uninstalling Windows Mail and Calendar
        powershell -command "Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage"
        
        echo Uninstalling Cortana
        powershell -command "Get-AppxPackage Microsoft.549981C3F5F10 | Remove-AppxPackage"
        
        echo Uninstalling Music
        powershell -command "Get-AppxPackage Microsoft.ZuneMusic* | Remove-AppxPackage"
        
        echo Uninstalling Microsoft To-Do
        powershell -command "Get-AppxPackage Microsoft.ToDo* | Remove-AppxPackage"
        
        echo Uninstalling Word
        powershell -command "Get-AppxPackage Microsoft.Office.Word* | Remove-AppxPackage"
        
        echo Uninstalling Excel
        powershell -command "Get-AppxPackage Microsoft.Office.Excel* | Remove-AppxPackage"
        
        echo Uninstalling PowerPoint
        powershell -command "Get-AppxPackage Microsoft.Office.PowerPoint* | Remove-AppxPackage"
        
        echo Uninstalling Outlook
        powershell -command "Get-AppxPackage Microsoft.Office.Outlook* | Remove-AppxPackage"
        
        echo Uninstalling Mixed Reality Portal
        powershell -command "Get-AppxPackage Microsoft.MixedReality.Portal* | Remove-AppxPackage"
        
        echo Uninstalling Microsoft News
        powershell -command "Get-AppxPackage Microsoft.MicrosoftNews* | Remove-AppxPackage"
        
        echo Uninstalling Office
        powershell -command "Get-AppxPackage Microsoft.Office.* | Remove-AppxPackage"
        
        echo Uninstalling Your Phone
        powershell -command "Get-AppxPackage Microsoft.YourPhone* | Remove-AppxPackage"
        
        echo Uninstalling Print to PDF
        powershell -command "Get-AppxPackage Microsoft.MicrosoftPrinttoPDF* | Remove-AppxPackage"
        
        echo Uninstalling SkyDrive
        powershell -command "Get-AppxPackage Microsoft.SkyDrive* | Remove-AppxPackage"
        
        echo Uninstalling Clipchamp
        powershell -command "Get-AppxPackage Clipchamp.Clipchamp* | Remove-AppxPackage"
        
        echo Uninstalling Maps
        powershell -command "Get-AppxPackage Microsoft.WindowsMaps* | Remove-AppxPackage"
        
        echo Uninstalling Office Hub
        powershell -command "Get-AppxPackage Microsoft.MicrosoftOfficeHub* | Remove-AppxPackage"
        
        echo Uninstalling Microsoft Teams
        powershell -command "Get-AppxPackage MSTeams* | Remove-AppxPackage"
        
        echo Uninstalling Outlook for Windows
        powershell -command "Get-AppxPackage Microsoft.OutlookForWindows* | Remove-AppxPackage"
        
        echo Uninstalling Get Started
        powershell -command "Get-AppxPackage Microsoft.Getstarted* | Remove-AppxPackage"

    echo Disabling Telemetry...
    reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f > nul
    reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d "0" /f > nul
    reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f > nul
    reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338387Enabled" /t REG_DWORD /d "0" /f > nul
    reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d "0" /f > nul
    reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338389Enabled" /t REG_DWORD /d "0" /f > nul
    reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353698Enabled" /t REG_DWORD /d "0" /f > nul
    reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /t REG_DWORD /d "0" /f > nul
    reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353694Enabled" /t REG_DWORD /d "0" /f > nul
    reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353696Enabled" /t REG_DWORD /d "0" /f > nul
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-310093Enabled" /t REG_DWORD /d "0" /f > nul
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-314563Enabled" /t REG_DWORD /d "0" /f > nul

    echo Disabling Advertising ID...
    reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisabledByGroupPolicy" /t REG_DWORD /d "1" /f > nul

    echo Hiding Cortana and Task View Buttons...
    reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCortanaButton" /t REG_DWORD /d "0" /f > nul
    reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t REG_DWORD /d "0" /f > nul

    echo More will be added to this script soon... check back later!
    pause
    goto start

    :wallpaper
    cls
    cd %temp%\UltimateWindowsToolbox
    powershell -command "Invoke-WebRequest https://raw.githubusercontent.com/PowerPCFan/UltimateWindowsToolbox/main/wallpaper.ps1 -OutFile "wallpaper.ps1""
    powershell.exe ".\wallpaper.ps1"
    echo Press any key to return to the homepage.
    pause > nul

:credits
cls
 echo !blue!==================================================================================================
 echo                                         !pink!+++ !white!Credits !pink!+++
 echo !blue!--------------------------------------------------------------------------------------------------!white!
 echo           This script features the Chris Titus Tech Winutil as Option 1 on the homepage
 echo       This script uses Microsoft Activation Scripts (!blue!massgrave.dev!white!) for Windows Activation
 echo               Thanks to PowerPCFan and Rage65 for making the rest of the script
 echo !blue!===================================================================================================!white!
 echo !pink!Press any key to go back.!white!
 pause > nul
 goto start
