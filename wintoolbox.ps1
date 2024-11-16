# Set variables:
$temp = $env:Temp

# Changes directory to the Windows temp folder.
Set-Location $temp

# Deletes old Windows Toolbox files to avoid conflicts if you've run the script before.
Remove-Item -Recurse -Force -Confirm:$false "UltimateWindowsToolbox"
# Creates new directory for UltimateWindowsToolbox's files and scripts
New-Item -Name "UltimateWindowsToolbox" -Type Directory

# Sets location to the windows toolbox folder
Set-Location "UltimateWindowsToolbox"

# Downloads main script
Invoke-WebRequest https://raw.githubusercontent.com/PowerPCFan/UltimateWindowsToolbox/main/ultimatewindowstoolbox.cmd -OutFile "ultimatewindowstoolbox.cmd"
# Downloads welcome.txt - welcome message for the main script
Invoke-WebRequest https://raw.githubusercontent.com/PowerPCFan/UltimateWindowsToolbox/main/welcome.txt -OutFile "welcome.txt"

# Converts LF/Line Feed (Unix) line endings to CR+LF/Carriage Return + Line Feed (Windows) to ensure the script runs correctly
(Get-Content "UltimateWindowsToolbox.cmd" -Raw) -replace "`n", "`r`n" | Set-Content "UltimateWindowsToolbox.cmd"

# Changes PowerShell's execution policy to Unrestricted
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser -Force

# Runs the script
powershell.exe ".\ultimatewindowstoolbox.cmd"
