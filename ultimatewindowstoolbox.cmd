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
    echo 9. Credits
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
    if '%choice%'=='9' goto Credits
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
    echo            This will perminetly remove Edge and all of its components!
    echo    You can install another web browser in the apps catagory after edge is removed.
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
    echo -
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
    echo -
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
    echo -
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
    echo -
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
    echo -
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
    echo -
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
    echo -
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
    echo -
    echo 1. 7-Zip
    echo 2. AnyDesk
    echo 3. Bitwarden
    echo 4. CrystalDiskMark
    echo 5. CrystalDiskInfo
    echo 6. DDU (Display Driver Uninstaller)
    echo 7. BleachBit
    echo 8. WizTree
    echo 9. qBittorrent
    echo -
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
    echo -
    echo 1. Rufus
    echo 2. F.lux
    echo 3. Google Drive
    echo 4. CPU-Z
    echo 5. GPU-Z
    echo 6. HWMonitor
    echo 7. Malwarebytes Anti-Malware
    echo 8. Revo Uninstaller
    echo 9. TeamViewer
    echo -
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
    echo -
    echo 1. MSI Afterburner
    echo 2. Winfetch (Neofetch for windows)
    echo 3. OpenRGB
    echo 4. Oracle VirtualBox
    echo 5. Parsec
    echo -
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

:Credits
 echo ==================================================================================================
 echo                                             Credits
 echo --------------------------------------------------------------------------------------------------
 echo                        This sscript uses the Chris Titus Tech Winutil
 echo               Thanks to PowerPCFan and Rage65 for making the rest of the script
 echo ===================================================================================================
 pause
 goto start
