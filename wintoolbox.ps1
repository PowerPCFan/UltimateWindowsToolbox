$temp = $env:Temp

Remove-Item "$temp\ultimatewindowstoolbox.cmd"
Remove-Item "$temp\welcome.txt"

Invoke-WebRequest https://raw.githubusercontent.com/PowerPCFan/UltimateWindowsToolbox/main/ultimatewindowstoolbox.cmd -OutFile "$temp\UltimateWindowsToolbox\ultimatewindowstoolbox.cmd"
Invoke-WebRequest https://raw.githubusercontent.com/PowerPCFan/UltimateWindowsToolbox/main/welcome.txt -OutFile "$temp\UltimateWindowsToolbox\welcome.txt"

Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser
powershell.exe "$temp\ultimatewindowstoolbox.cmd"
