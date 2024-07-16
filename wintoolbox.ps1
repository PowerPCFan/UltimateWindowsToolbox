Invoke-WebRequest https://raw.githubusercontent.com/PowerPCFan/UltimateWindowsToolbox/main/ultimatewindowstoolbox.cmd -OutFile C:\windows\temp\ultimatewindowstoolbox.cmd
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser
powershell.exe "C:\windows\temp\ultimatewindowstoolbox.cmd"
