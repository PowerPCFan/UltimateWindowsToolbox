$username = $env:UserName

Invoke-WebRequest https://raw.githubusercontent.com/PowerPCFan/UltimateWindowsToolbox/main/ultimatewindowstoolbox.cmd -OutFile C:\Users\$username\AppData\Local\Temp\ultimatewindowstoolbox.cmd
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser
powershell.exe "C:\Users\$username\AppData\Local\Temp\ultimatewindowstoolbox.cmd"
