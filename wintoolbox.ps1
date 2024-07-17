Invoke-WebRequest https://raw.githubusercontent.com/PowerPCFan/UltimateWindowsToolbox/main/ultimatewindowstoolbox.cmd -OutFile C:\Users\$Env:UserName\AppData\Local\Temp\ultimatewindowstoolbox.cmd
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser
powershell.exe "C:\Users\$Env:UserName\AppData\Local\Temp\ultimatewindowstoolbox.cmd"
