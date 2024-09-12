$temp = $env:Temp

cd $temp
rmdir "UltimateWindowsToolbox"
mkdir "UltimateWindowsToolbox"
cd "UltimateWindowsToolbox"
Invoke-WebRequest https://raw.githubusercontent.com/PowerPCFan/UltimateWindowsToolbox/main/ultimatewindowstoolbox.cmd -OutFile "ultimatewindowstoolbox.cmd"
Invoke-WebRequest https://raw.githubusercontent.com/PowerPCFan/UltimateWindowsToolbox/main/welcome.txt -OutFile "welcome.txt"

Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser
powershell.exe ".\ultimatewindowstoolbox.cmd"
