$temp = $env:Temp

Invoke-WebRequest https://raw.githubusercontent.com/PowerPCFan/UltimateWindowsToolbox/main/ultimatewindowstoolbox.cmd -OutFile "$temp\ultimatewindowstoolbox.cmd"
Invoke-WebRequest https://raw.githubusercontent.com/PowerPCFan/UltimateWindowsToolbox/main/welcome.txt -OutFile "$temp\welcome.txt"
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser
powershell.exe "$temp\ultimatewindowstoolbox.cmd"
