# Set variables
$temp = $env:Temp

# Changes directory to %temp%
Set-Location $temp

# Deletes old Windows Toolbox files if you've ran it before
Remove-Item -Recurse -Force -Confirm:$false "UltimateWindowsToolbox"
# Creates new directory for Windows Toolbox
New-Item -Name "UltimateWindowsToolbox" -Type Directory

# Sets location to the windows toolbox folder
Set-Location "UltimateWindowsToolbox"

# Downloading scripts and prerequisites
Invoke-WebRequest https://raw.githubusercontent.com/PowerPCFan/UltimateWindowsToolbox/main/ultimatewindowstoolbox.cmd -OutFile "ultimatewindowstoolbox.cmd"
Invoke-WebRequest https://raw.githubusercontent.com/PowerPCFan/UltimateWindowsToolbox/main/welcome.txt -OutFile "welcome.txt"

# Converts LF (Unix) line endings to CR LF (Windows)
(Get-Content "UltimateWindowsToolbox.cmd" -Raw) -replace "`n", "`r`n" | Set-Content "UltimateWindowsToolbox.cmd"

# Change execution policy and run script
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser -Force
powershell.exe ".\ultimatewindowstoolbox.cmd"