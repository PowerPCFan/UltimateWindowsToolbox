@echo off
title The Ultimate Windows Toolbox
cls
set w=[97m
set p=[95m
set b=[96m
color 0f
:: Enable ANSI Escape Sequences
Reg.exe add "HKCU\CONSOLE" /v "VirtualTerminalLevel" /t REG_DWORD /d "1" /f  > nul

::Enable Delayed Expansion
setlocal EnableDelayedExpansion > nul

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
        if exist "C:\ProgramData\chocolatey\bin\choco.exe" (
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
    echo.
    echo.                       %p%░██╗░░░░░░░██╗███████╗██╗░░░░░░█████╗░░█████╗░███╗░░░███╗███████╗░
    echo.                       %p%░██║░░██╗░░██║██╔════╝██║░░░░░██╔══██╗██╔══██╗████╗░████║██╔════╝░
    echo.                       %p%░╚██╗████╗██╔╝█████╗░░██║░░░░░██║░░╚═╝██║░░██║██╔████╔██║█████╗░░░
    echo.                       %p%░░████╔═████║░██╔══╝░░██║░░░░░██║░░██╗██║░░██║██║╚██╔╝██║██╔══╝░░░
    echo.                       %p%░░╚██╔╝░╚██╔╝░███████╗███████╗╚█████╔╝╚█████╔╝██║░╚═╝░██║███████╗░
    echo.                       %p%░░░╚═╝░░░╚═╝░░╚══════╝╚══════╝░╚════╝░░╚════╝░╚═╝░░░░░╚═╝╚══════╝░
    echo. %b%================================================================================================================
    echo. %w%             The Ultimate Windows Toolbox is the ULTIMATE Windows 10 and Windows 11 tweaking utility!
    echo. %b%================================================================================================================               
    echo         %p%[%w%1%p%]%w% Run the Chris Titus Tech Winutil          %p%[%w%2%p%]%w% Activate Windows for free
    echo.
    echo         %p%[%w%3%p%]%w% Find and Repair Problems in Windows       %p%[%w%4%p%]%w% Test your RAM on next reboot
    echo.
    echo         %p%[%w%5%p%]%w% Windows Tweaks                            %p%[%w%6%p%]%w% Install Apps (Browsers, Utilities, Etc)
    echo.
    echo         %p%[%w%7%p%]%w% All-in-one Windows Tweak Script
    echo.
    echo. 
    echo         %p%[%w%9%p%]%w% Credits
    echo.
    echo         %p%[%w%0%p%]%w% Exit
    echo. %b%================================================================================================================
    echo.
    echo %w%Choose an option and type the corresponding number.
    set choice=
    set /p choice= »
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' goto winutil
    if '%choice%'=='2' goto massgrave
    if '%choice%'=='3' goto repairverify
    if '%choice%'=='4' goto ramtestverify
    if '%choice%'=='5' goto windowstweaks
    if '%choice%'=='6' goto apps
    if '%choice%'=='7' goto tweak-script
    if '%choice%'=='9' goto credits
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
    echo Continuing with this will break Microsoft's EULA. 
    echo You should pay for a real Windows license. 
    echo Are you sure you'd like to proceed?
    pause
    powershell -command "irm https://get.activated.win | iex"
goto start

:repairverify
    cls
    echo -----------------------------------------------------------------------------------
    echo ****You need to REBOOT your PC after running this script.****
    echo Press 1 to continue and 0 to go back.
    echo -----------------------------------------------------------------------------------
    echo 1. Proceed
    echo 0. Go back
    set choice=
    set /p choice=Type the number. 
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' goto repairscript
    if '%choice%'=='0' goto start
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
    echo 0. NO, Go back
    set choice=
    set /p choice=Type the number. 
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' cmd /k C:\WINDOWS\system32\MdSched.exe
    if '%choice%'=='0' goto start
    echo "%choice%" is not valid, try again

:windowstweaks
    cls
    echo ============================================================================
    echo                      +++ WINDOWS TWEAKS (Page 1) +++
    echo ============================================================================                                    
    echo 1. Uninstall Microsoft Edge
    echo 2. Enable/Disable Bing Search in start menu searchbar
    echo 3. Enable/Disable Verbose Mode
    echo 4. Enable/Disable Hibernation
    echo 5. Enable/Disable Long Paths
    echo 6. Reset Windows Update
    echo 7. Change the alignment of the Taskbar
    echo 8. Change the behavior of UAC (User Account Control)
    echo 9. Change Windows SmartScreen settings
    echo.
    echo 0. Go Back
    echo Press 'n' to go to the next page
    echo ============================================================================
    set choice=
    set /p choice=Choose an option and type the corresponding number. 
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' goto removemsedge
    if '%choice%'=='2' goto bingsearch
    if '%choice%'=='3' goto verbose
    if '%choice%'=='4' goto hibernate
    if '%choice%'=='5' goto longpaths
    if '%choice%'=='6' goto resetupdateverify
    if '%choice%'=='7' goto taskbaralignment
    if '%choice%'=='8' goto uac
    if '%choice%'=='9' goto smartscreen
    if '%choice%'=='0' goto start
    if '%choice%'=='n' goto windowstweakspage2
    echo "%choice%" is not valid, try again
    echo.
goto start

:windowstweakspage2
    cls
    echo ============================================================================
    echo                      +++ WINDOWS TWEAKS (Page 2) +++
    echo ============================================================================                                    
    echo 1. Enable/Disable Windows Error Reporting
    echo 2. Enable/Disable Location Services
    echo 3. Enable/Disable Storage Sense
    echo 4. Enable/Disable Teredo IPv6 Tunneling
    echo 5. Enable/Disable WiFi-Sense
    echo 6. Configure the HOSTS file to block telemetry in Windows
    echo 7. Make Windows use UTC Time
    echo 8. Disable/Enable Windows Copilot
    echo.
    echo 0. Go Back
    echo Press 'b' to go to the previous page
    echo Press 'n' to go to the next page
    echo ============================================================================
    set choice=
    set /p choice=Choose an option and type the corresponding number. 
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' goto winerrorreporting
    if '%choice%'=='2' goto locationservices
    if '%choice%'=='3' goto storagesense
    if '%choice%'=='4' goto teredo
    if '%choice%'=='5' goto wifi-sense
    if '%choice%'=='6' goto hosts-telemetry
    if '%choice%'=='7' goto utc-time
    if '%choice%'=='8' goto copilot
    if '%choice%'=='0' goto start
    if '%choice%'=='b' goto windowstweaks
    if '%choice%'=='n' goto windowstweakspage3
    echo "%choice%" is not valid, try again
    echo.
goto start

:windowstweakspage3
    cls
    echo ============================================================================
    echo                      +++ WINDOWS TWEAKS (Page 3) +++
    echo ============================================================================                                    
    echo 1. Configure Google Chrome Manifest V2 support
    echo 2. Enable Dark Mode
    echo 3. Disable Cortana
    echo 4. Lower Keyboard + Mouse Data Queue to reduce input lag
    echo.
    echo 0. Go Back
    echo Press 'b' to go to the previous page
    echo ============================================================================
    set choice=
    set /p choice=Choose an option and type the corresponding number. 
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' goto chrome-mv2
    if '%choice%'=='2' goto darkmode
    if '%choice%'=='3' goto cortana
    if '%choice%'=='4' reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "30" /f & reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "35" /f
    if '%choice%'=='0' goto start
    if '%choice%'=='b' goto windowstweakspage2
    echo "%choice%" is not valid, try again
    echo.
goto start

:removemsedge
    cls
    @echo off
    echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    echo                                      WARNING!
    echo            This will permanently remove Edge and all of its components!
    echo    You can install another web browser in the apps category after Edge is removed.
    echo         If you'd like to cancel the Edge uninstallation, close this window.
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
    echo 0. Go Back
    if '%choice%'=='0' goto windowstweaks
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
    echo 0. Go Back
    if '%choice%'=='0' goto windowstweaks
    set choice=
    set /p choice=Type the number. 
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' powercfg.exe /hibernate off
    if '%choice%'=='2' powercfg.exe /hibernate on
pause
goto windowstweaks

:longpaths
    cls
    echo ================================================================================================
    echo                       +++ Background Info about File Paths in Windows +++
    echo.
    echo By default, there is a file path limit of 260 characters in Windows.
    echo For the average person this isn't a problem but for some people this will cause issues.
    echo With the settings below, you can enable Long File Paths which bypasses the 260 character limit.
    echo Even though there is a limit set by default, there isn't a good reason to have it on.
    echo Therefore I strongly recommend enabling Long File Paths below.
    echo ================================================================================================
    echo 1. Enable Long File Paths (Recommended)
    echo 2. Disable Long File Paths
    echo 0. Go Back
    if '%choice%'=='0' goto windowstweaks
    set choice=
    set /p choice=Type the number. 
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "LongPathsEnabled" /t REG_DWORD /d "1" /f > nul
    if '%choice%'=='2' reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "LongPathsEnabled" /t REG_DWORD /d "0" /f > nul
cls
echo Process completed successfully. 
pause
goto windowstweaks

:resetupdateverify
    cls
    echo Your PC will reboot after this! Are you sure you would like to proceed?
    echo -----------------------------------------------------------------------------------
    echo 1. YES, Proceed
    echo 0. NO, Go back
    set choice=
    set /p choice=Type the number. 
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' goto resetupdatescript
    if '%choice%'=='0' goto start
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

:taskbaralignment
    cls
    echo =====================
    echo   Taskbar Alignment
    echo =====================
    echo 1. Left Align
    echo 2. Center Align
    echo 3. Right Align (only works on Windows 10)
    echo 0. Go Back
    set choice=
    set /p choice=Type the number. 
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAl" /t REG_DWORD /d "0" /f > nul
    if '%choice%'=='2' reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAl" /t REG_DWORD /d "1" /f > nul
    if '%choice%'=='3' reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAl" /t REG_DWORD /d "2" /f > nul
    if '%choice%'=='0' goto windowstweaks
cls
echo Process completed successfully. 
pause
goto windowstweaks

:uac
    cls
    echo                                 USER ACCOUNT CONTROL SETTINGS
    echo.
    echo Choose when to be notified about changes to your computer
    echo User Account Control helps prevent potentially harmful programs from making changes to your computer.
    echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    echo 1. Always notify me about any changes made to my computer, even if done by me (most secure)
    echo 2. Notify me only when apps try to make changes to my computer (Default)
    echo 3. Notify me only when apps try to make changes to my computer (Don't dim my desktop)
    echo 4. NEVER notify me about any changes made to my computer (NOT RECOMMENDED)
    echo 0. Go Back
    set choice=
    set /p choice=Type the number. 
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop" /t REG_DWORD /d "1" /f > nul & reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d "1" /f > nul & reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d "2" /f > nul
    if '%choice%'=='2' reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop" /t REG_DWORD /d "1" /f > nul & reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d "1" /f > nul & reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d "5" /f > nul
    if '%choice%'=='3' reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop" /t REG_DWORD /d "0" /f > nul & reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d "1" /f > nul & reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d "5" /f > nul
    if '%choice%'=='4' reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop" /t REG_DWORD /d "0" /f > nul & reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d "1" /f > nul & reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d "0" /f > nul
    if '%choice%'=='0' goto windowstweaks
cls
echo Process completed successfully. 
pause
goto windowstweaks

:smartscreen
    cls
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
    echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    echo 1. Enable SmartScreen for Windows Security (default)
    echo 2. Disable SmartScreen for Windows Security
    echo 0. Go Back
    set choice=
    set /p choice=Type the number. 
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d "1" /f > nul
    if '%choice%'=='2' reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d "0" /f > nul
    if '%choice%'=='0' goto windowstweaks
cls
echo Process completed successfully. 
pause
goto windowstweaks

:winerrorreporting
    cls
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
    echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    echo 1. Enable Windows Error Reporting for the current user (default)
    echo 2. Disable Windows Error Reporting for the current user
    echo.
    echo 3. Enable Windows Error Reporting for ALL USERS (default)
    echo 4. Disable Windows Error Reporting for ALL USERS
    echo 0. Go Back
    set choice=
    set /p choice=Type the number. 
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' reg add "HKCU\Software\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "0" /f > nul
    if '%choice%'=='2' reg add "HKCU\Software\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f > nul
    if '%choice%'=='3' reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "0" /f > nul
    if '%choice%'=='4' reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f > nul
    if '%choice%'=='0' goto windowstweaks
cls
echo Process completed successfully. 
pause
goto windowstweaks

:locationservices
    cls
    echo                                    Location Services
    echo.
    echo Location Services are tracking your location 24/7. It might seem helpful for maps or weather,
    echo but it isn't worth it to be constantly giving Microsoft your location. They're just harvesting data. 
    echo.
    echo Below, you can enable or disable Location Services. I would HIGHLY recommend disabling it.
    echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    echo 1. Enable Location Services (please don't do this...)
    echo 2. Disable Location Services (Highly Recommended)
    echo 0. Go Back
    set choice=
    set /p choice=Type the number. 
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Allow" /f > nul
    if '%choice%'=='2' reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Deny" /f > nul
    if '%choice%'=='0' goto windowstweaks
echo Process completed successfully. 
pause
goto windowstweaks

:storagesense
    cls
    echo ============================================================================================
    echo                                     Storage Sense
    echo --------------------------------------------------------------------------------------------
    echo Storage Sense is a built-in Windows feature that automatically frees up disk space. 
    echo It can clean temporary files, empty the recycle bin, and even remove old versions of files. 
    echo This is helpful for keeping your drive from becoming full and improving performance. 
    echo However, you might want to disable it if you prefer more control over what gets deleted.
    echo ============================================================================================
    echo 1. Enable Storage Sense (default)
    echo 2. Disable Storage Sense
    echo 0. Go Back
    set choice=
    set /p choice=Type the number. 
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\StorageSense" /v "AllowStorageSenseGlobal" /t REG_DWORD /d "1" /f > nul
    if '%choice%'=='2' reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\StorageSense" /v "AllowStorageSenseGlobal" /t REG_DWORD /d "0" /f > nul
    if '%choice%'=='0' goto windowstweaks
echo Process completed successfully. 
pause
goto windowstweaks

:teredo
    cls
    echo ================================================================================================================================
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
    echo ================================================================================================================================
    echo 1. Enable Teredo (default)
    echo 2. Disable Teredo
    echo 0. Go Back
    set choice=
    set /p choice=Type the number. 
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' netsh interface teredo set state enabled
    if '%choice%'=='2' netsh interface teredo set state disabled
    if '%choice%'=='0' goto windowstweaks

echo Process completed successfully. 
pause
goto windowstweaks

:wifi-sense
    cls
    echo ===============================================================================================
    echo                                        WiFi-Sense
    echo -----------------------------------------------------------------------------------------------
    echo Wi-Fi Sense SOUNDS convenient, automatically connecting you to public Wi-Fi. 
    echo But it's a huge security risk. Connecting to unknown public Wi-Fi can leave your data vulnerable. 
    echo To add to this, Wi-Fi Sense spies on your geolocation 24/7. 
    echo Disabling it protects your privacy and gives you control over choosing secure Wi-Fi networks.
    echo ===============================================================================================
    echo 1. Enable WiFi-Sense (default)
    echo 2. Disable WiFi-Sense
    echo 0. Go Back
    set choice=
    set /p choice=Type the number. 
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' reg add "HKLM\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config" /v "AutoConnectAllowedOEM" /t REG_DWORD /d "1" /f > nul
    if '%choice%'=='2' reg add "HKLM\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config" /v "AutoConnectAllowedOEM" /t REG_DWORD /d "0" /f > nul
    if '%choice%'=='0' goto windowstweaks
echo Process completed successfully. 
pause
goto windowstweaks

:hosts-telemetry
    cls
    echo ====================================================================================================
    echo                                    HOSTS file and telemetry
    echo ----------------------------------------------------------------------------------------------------
    echo The HOSTS file has been around for years and it can be used to block websites and connections.
    echo Windows 10 and especially Windows 11 have a ton of telemetry and data that gets sent to Microsoft.
    echo You can use the HOSTS file to block the websites that Microsoft uses to harvest data from you.
    echo.
    echo If you experience problems with Microsoft services: 
    echo * Use the "Revert to default HOSTS file" option below
    echo * Use the "Revert to previous HOSTS file before tweaks" option below
    echo ====================================================================================================
    echo 1. Enable the custom HOSTS file to block telemetry (Last Updated September 5, 2024)
    echo 2. Revert to default HOSTS file
    echo 3. Revert to previous HOSTS file before tweaks (only works if you've done tweaks previously)
    echo 0. Go Back
    set choice=
    set /p choice=Type the number. 
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' goto customhosts-wget
    if '%choice%'=='2' goto stockhosts
    if '%choice%'=='3' goto previoushosts
    if '%choice%'=='0' goto windowstweaks
goto windowstweaks

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
    echo ===============================================================
    echo                           UTC Time
    echo ---------------------------------------------------------------
    echo By default, Windows uses Local Time and Linux uses UTC Time.
    echo If you're dual-booting, there will be time errors and problems.
    echo You can fix this by forcing Windows to use UTC Time.
    echo ===============================================================
    echo 1. Enable UTC Time
    echo 2. Disable UTC Time (default)
    echo 0. Go Back
    set choice=
    set /p choice=Type the number. 
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' reg add "HKLM\SYSTEM\CurrentControlSet\Control\TimeZoneInformation" /v "RealTimeIsUniversal" /t REG_DWORD /d "1" /f > nul
    if '%choice%'=='2' reg delete "HKLM\SYSTEM\CurrentControlSet\Control\TimeZoneInformation" /v "RealTimeIsUniversal" /f > nul
    if '%choice%'=='0' goto windowstweaks
echo Process completed successfully. 
pause
goto windowstweaks

:copilot
    cls
    echo ======================================================================
    echo                            Windows Copilot
    echo ----------------------------------------------------------------------
    echo Some Windows users like me find Copilot to be annoying and intrusive.
    echo You can disable or enable copilot with the options below.
    echo You may need to restart your computer for changes to take effect.
    echo ======================================================================
    echo 1. Enable Copilot (default setting)
    echo 2. Disable Copilot
    echo 0. Go Back
    set choice=
    set /p choice=Type the number. 
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' reg delete "HKCU\Software\Policies\Microsoft\Windows\WindowsCopilot" /v "TurnOffWindowsCopilot" /f > nul
    if '%choice%'=='2' reg add "HKCU\Software\Policies\Microsoft\Windows\WindowsCopilot" /v "TurnOffWindowsCopilot" /t REG_DWORD /d "1" /f > nul
    if '%choice%'=='0' goto windowstweaks
echo Process completed successfully. 
pause
goto windowstweaks

:chrome-mv2
    cls
    echo ======================================================================
    echo        Extend Google Chrome Manifest V2 support to June 2025
    echo ======================================================================
    echo 1. Enabled
    echo 2. Disabled (default)
    echo 0. Go Back
    set choice=
    set /p choice=Type the number. 
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "ExtensionManifestV2Availability" /t REG_DWORD /d "2" /f > nul
    if '%choice%'=='2' reg delete "HKLM\SOFTWARE\Policies\Google\Chrome" /v "ExtensionManifestV2Availability" /f > nul
    if '%choice%'=='0' goto windowstweaks
echo Process completed successfully. 
pause
goto windowstweaks

:darkmode
    cls
    echo ==============================
    echo        Enable Dark Mode
    echo ==============================
    echo 1. Yes, Enable Dark Mode
    echo 2. No, Go Back
    set choice=
    set /p choice=Type the number. 
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v AppsUseLightTheme /t REG_DWORD /d 0 /f > nul & reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v ColorPrevalence /t REG_DWORD /d 0 /f > nul & reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 1 /f > nul & reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v SystemUsesLightTheme /t REG_DWORD /d 0 /f > nul
    if '%choice%'=='2' goto windowstweaks
echo Process completed successfully. 
pause
goto windowstweaks

:cortana
    cls
    echo ==========================
    echo      Disable Cortana
    echo ==========================
    echo 1. Yes, Disable Cortana
    echo 2. No, Go Back
    set choice=
    set /p choice=Type the number. 
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0" /f > nul
    if '%choice%'=='2' goto windowstweaks
echo Process completed successfully.
pause
goto windowstweaks



:apps
    cls
    echo ==========================
    echo    + APP INSTALLER +
    echo Choose a category below:
    echo ==========================
    echo 1. Web Browsers
    echo 2. Communications
    echo 3. Development
    echo 4. PDF Viewers + Word Processors
    echo 5. Game Launchers
    echo 6. Microsoft Utilities (Sysinternals Suite, Visual C++ Runtimes, etc)
    echo 7. Multimedia Tools
    echo 8. Utilities
    echo 0. Go Back
    set choice=
    set /p choice=Type the number. 
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' goto browsers
    if '%choice%'=='2' goto communications
    if '%choice%'=='3' goto development
    if '%choice%'=='4' goto pdf
    if '%choice%'=='5' goto games
    if '%choice%'=='6' goto msutilities
    if '%choice%'=='7' goto multimedia
    if '%choice%'=='8' goto utilities
    if '%choice%'=='0' goto start
    echo "%choice%" is not valid, try again

:browsers
    cls
    echo ----------------------------------------------------------------------------------------------------
    echo                                  + Web browser installer +
    echo You can install a web browser here. 
    echo You may want to install a browser before or after uninstalling Edge or if you'd like a new browser.
    echo ----------------------------------------------------------------------------------------------------
    echo.
    echo 1. Install Chrome
    echo 2. Install Firefox
    echo 3. Install Brave
    echo 4. Install Microsoft Edge
    echo 0. Go Back
    set choice=
    set /p choice=Type the number. 
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' start powershell -command "choco install googlechrome -y"
    if '%choice%'=='2' start powershell -command "choco install firefox -y"
    if '%choice%'=='3' start powershell -command "choco install brave -y"
    if '%choice%'=='4' start powershell -command "choco install microsoft-edge -y"
    if '%choice%'=='0' goto apps
goto apps

:communications
    cls
    echo ---------------------------
    echo     + Communications +
    echo ---------------------------
    echo.
    echo 1. Discord
    echo 2. Signal
    echo 3. Skype
    echo 4. Slack
    echo 5. Telegram
    echo 6. Zoom
    echo 0. Go Back
    set choice=
    set /p choice=Type the number. 
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' start powershell -command "choco install discord -y"
    if '%choice%'=='2' start powershell -command "choco install signal -y"
    if '%choice%'=='3' start powershell -command "choco install skype -y"
    if '%choice%'=='4' start powershell -command "choco install slack -y"
    if '%choice%'=='5' start powershell -command "choco install telegram -y"
    if '%choice%'=='6' start powershell -command "choco install zoom -y"
    if '%choice%'=='0' goto apps
goto apps

:development
    cls
    echo ---------------------------
    echo     + Development +
    echo ---------------------------
    echo.
    echo 1. GitHub Desktop
    echo 2. Git
    echo 3. Notepad++
    echo 4. Visual Studio Code
    echo 5. Visual Studio 2022 Community
    echo 0. Go Back
    set choice=
    set /p choice=Type the number. 
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' start powershell -command "choco install github-desktop -y"
    if '%choice%'=='2' start powershell -command "choco install git -y"
    if '%choice%'=='3' start powershell -command "choco install notepadplusplus -y"
    if '%choice%'=='4' start powershell -command "choco install vscode -y"
    if '%choice%'=='5' start powershell -command "choco install visualstudio2022community -y"
    if '%choice%'=='0' goto apps
goto apps

:pdf
    cls
    echo -------------------------------------
    echo   + PDF Viewers & Word Processors +
    echo -------------------------------------
    echo.
    echo 1. Adobe Acrobat Reader
    echo 2. Foxit PDF Reader
    echo 3. LibreOffice
    echo 4. Apache OpenOffice
    echo 5. Sumatra PDF
    echo 0. Go Back
    set choice=
    set /p choice=Type the number. 
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' start powershell -command "choco install adobereader -y"
    if '%choice%'=='2' start powershell -command "choco install foxitreader -y"
    if '%choice%'=='3' start powershell -command "choco install libreoffice-fresh -y"
    if '%choice%'=='4' start powershell -command "choco install openoffice -y"
    if '%choice%'=='5' start powershell -command "choco install sumatrapdf -y"
    if '%choice%'=='0' goto apps
goto apps

:games
    cls
    echo ----------------------
    echo   + Game Launchers +
    echo ----------------------
    echo.
    echo 1. ATLauncher (Minecraft)
    echo 2. Epic Games Launcher
    echo 3. Nvidia GeForce NOW
    echo 4. Steam
    echo 0. Go Back
    set choice=
    set /p choice=Type the number. 
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' goto atlauncher
    if '%choice%'=='2' start powershell -command "choco install epicgameslauncher -y"
    if '%choice%'=='3' start powershell -command "choco install nvidia-geforce-now -y"
    if '%choice%'=='4' start powershell -command "choco install steam -y"
    if '%choice%'=='0' goto apps
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
    echo ----------------------------
    echo   + Microsoft Utilities +
    echo ----------------------------
    echo.
    echo 1. Autoruns
    echo 2. Power Automate
    echo 3. Sysinternals Process Monitor
    echo 4. Visual C++ Redistributables 2015-2022 
    echo 0. Go Back
    set choice=
    set /p choice=Type the number. 
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' start powershell -command "choco install autoruns -y"
    if '%choice%'=='2' start powershell -command "choco install powerautomatedesktop -y"
    if '%choice%'=='3' start powershell -command "choco install procmon -y"
    if '%choice%'=='4' start powershell -command "choco install vcredist140 -y"
    if '%choice%'=='0' goto apps
goto apps

:multimedia
    cls
    echo ------------------------------
    echo  Multimedia Programs (Page 1)
    echo ------------------------------
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
    set choice=
    set /p choice=Type the number. 
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' start powershell -command "choco install audacity -y"
    if '%choice%'=='2' start powershell -command "choco install equalizerapo -y"
    if '%choice%'=='3' start powershell -command "choco install gimp -y"
    if '%choice%'=='4' start powershell -command "choco install handbrake -y"
    if '%choice%'=='5' start powershell -command "choco install itunes -y"
    if '%choice%'=='6' start powershell -command "choco install obs-studio -y"
    if '%choice%'=='7' start powershell -command "choco install spotify -y"
    if '%choice%'=='8' start powershell -command "choco install vlc -y"
    if '%choice%'=='9' start powershell -command "choco install yt-dlp -y"
    if '%choice%'=='0' goto apps
goto apps

:utilities
    cls
    echo ----------------------
    echo   Utilities (Page 1)
    echo ----------------------
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
    set choice=
    set /p choice=Type the number. 
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' start powershell -command "choco install 7zip -y"
    if '%choice%'=='2' start powershell -command "choco install anydesk -y"
    if '%choice%'=='3' start powershell -command "choco install bitwarden -y"
    if '%choice%'=='4' start powershell -command "choco install crystaldiskmark -y"
    if '%choice%'=='5' start powershell -command "choco install crystaldiskinfo -y"
    if '%choice%'=='6' start powershell -command "choco install ddu -y"
    if '%choice%'=='7' start powershell -command "choco install bleachbit -y"
    if '%choice%'=='8' start powershell -command "choco install wiztree -y"
    if '%choice%'=='9' start powershell -command "choco install qbittorrent -y"
    if '%choice%'=='0' goto apps
    if '%choice%'=='n' goto utilitiespage2
goto apps

:utilitiespage2
    cls
    echo ----------------------
    echo   Utilities (Page 2)
    echo ----------------------
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
    set choice=
    set /p choice=Type the number. 
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' start powershell -command "choco install rufus -y"
    if '%choice%'=='2' start powershell -command "choco install f.lux -y"
    if '%choice%'=='3' start powershell -command "choco install googledrive -y"
    if '%choice%'=='4' start powershell -command "choco install cpu-z -y"
    if '%choice%'=='5' start powershell -command "choco install gpu-z -y"
    if '%choice%'=='6' start powershell -command "choco install hwmonitor -y"
    if '%choice%'=='7' goto mbam
    if '%choice%'=='8' start powershell -command "choco install revo-uninstaller -y"
    if '%choice%'=='9' start powershell -command "choco install teamviewer -y"
    if '%choice%'=='0' goto apps
    if '%choice%'=='b' goto utilities
    if '%choice%'=='n' goto utilitiespage3
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
    echo ----------------------
    echo   Utilities (Page 3)
    echo ----------------------
    echo.
    echo 1. MSI Afterburner
    echo 2. Winfetch (Neofetch for windows)
    echo 3. OpenRGB
    echo 4. Oracle VirtualBox
    echo 5. Parsec
    echo.
    echo 0. Go Back
    echo Press 'b' to go to the previous page
    set choice=
    set /p choice=Type the number. 
    if not '%choice%'=='' set choice=%choice:~0,100%
    if '%choice%'=='1' start powershell -command "choco install msiafterburner -y"
    if '%choice%'=='2' start powershell -command "choco install winfetch -y"
    if '%choice%'=='3' start powershell -command "choco install openrgb -y"
    if '%choice%'=='4' start powershell -command "choco install virtualbox -y"
    if '%choice%'=='5' start powershell -command "choco install parsec -y"
    if '%choice%'=='0' goto apps
    if '%choice%'=='b' goto utilitiespage2
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

:credits
cls
 echo ==================================================================================================
 echo                                         +++ Credits +++
 echo --------------------------------------------------------------------------------------------------
 echo           This script features the Chris Titus Tech Winutil as Option 1 on the homepage
 echo       This script uses Microsoft Activation Scripts (massgrave.dev) for Windows Activation
 echo               Thanks to PowerPCFan and Rage65 for making the rest of the script
 echo ===================================================================================================
 pause
 goto start
