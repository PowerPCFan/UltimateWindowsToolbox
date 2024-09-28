$temp = $env:Temp

Set-Location $temp

Remove-Item -Recurse -Force -Confirm:$false "UltimateWindowsToolbox"
New-Item -Name "UltimateWindowsToolbox" -Type Directory

Set-Location "UltimateWindowsToolbox"

Invoke-WebRequest https://raw.githubusercontent.com/PowerPCFan/UltimateWindowsToolbox/main/ultimatewindowstoolbox.cmd -OutFile "ultimatewindowstoolbox.cmd"
Invoke-WebRequest https://raw.githubusercontent.com/PowerPCFan/UltimateWindowsToolbox/main/welcome.txt -OutFile "welcome.txt"

# Converts LF (Unix) line endings to CR LF (Windows)
(Get-Content "UltimateWindowsToolbox.cmd" -Raw) -replace "`n", "`r`n" | Set-Content "UltimateWindowsToolbox.cmd"

Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser -Force
powershell.exe ".\ultimatewindowstoolbox.cmd"