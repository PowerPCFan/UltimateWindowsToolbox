Invoke-WebRequest https://raw.githubusercontent.com/PowerPCFan/UltimateWindowsToolbox/main/ultimatewindowstoolbox.cmd -OutFile %temp%\ultimatewindowstoolbox.cmd
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser
powershell.exe "%temp%\ultimatewindowstoolbox.cmd"
