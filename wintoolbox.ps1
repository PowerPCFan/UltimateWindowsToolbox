$temp = $env:Temp

rmdir "%temp%\UltimateWindowsToolbox"
mkdir "%temp%\UltimateWindowsToolbox"

Remove-Item "$temp\UltimateWindowsToolbox\ultimatewindowstoolbox.cmd"
Remove-Item "$temp\UltimateWindowsToolbox\welcome.txt"

Invoke-WebRequest https://raw.githubusercontent.com/PowerPCFan/UltimateWindowsToolbox/main/ultimatewindowstoolbox.cmd -OutFile "$temp\UltimateWindowsToolbox\ultimatewindowstoolbox.cmd"
Invoke-WebRequest https://raw.githubusercontent.com/PowerPCFan/UltimateWindowsToolbox/main/welcome.txt -OutFile "$temp\UltimateWindowsToolbox\welcome.txt"

Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser
powershell.exe "$temp\UltimateWindowsToolbox\ultimatewindowstoolbox.cmd"
