Invoke-WebRequest https://raw.githubusercontent.com/PowerPCFan/UltimateWindowsToolbox/main/ultimatewindowstoolbox.cmd -OutFile %USERPROFILE%\AppData\Local\Temp\ultimatewindowstoolbox.cmd
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser
powershell.exe "%USERPROFILE%\AppData\Local\Temp\ultimatewindowstoolbox.cmd"
