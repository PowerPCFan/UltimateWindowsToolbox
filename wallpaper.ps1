Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
Add-Type @"
using System;
using System.Runtime.InteropServices;
public class Wallpaper {
    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
"@

# Create the main form
$form = New-Object System.Windows.Forms.Form
$form.Text = "Windows Wallpapers"
$form.Size = New-Object System.Drawing.Size(400, 400)
$form.BackColor = [System.Drawing.Color]::FromArgb(30, 30, 30)
$form.ForeColor = [System.Drawing.Color]::White
$form.Font = New-Object System.Drawing.Font("Georgia", 10)

# Create a label for instructions
$label = New-Object System.Windows.Forms.Label
$label.Text = "Select a Windows version to view wallpapers:"
$label.AutoSize = $true
$label.Location = New-Object System.Drawing.Point(10, 10)
$form.Controls.Add($label)

# Function to create wallpaper selection form with scrolling
function Show-Wallpapers {
    param (
        [string]$version,
        [string[]]$wallpaperUrls,
        [string[]]$names
    )

    $wallpapersForm = New-Object System.Windows.Forms.Form
    $wallpapersForm.Text = "$version Wallpapers"
    $wallpapersForm.Size = New-Object System.Drawing.Size(400, 400)
    $wallpapersForm.BackColor = [System.Drawing.Color]::FromArgb(30, 30, 30)
    $wallpapersForm.ForeColor = [System.Drawing.Color]::White
    $wallpapersForm.Font = New-Object System.Drawing.Font("Georgia", 10)

    # Home button at the top-left
    $homeButton = New-Object System.Windows.Forms.Button
    $homeButton.Text = "Back"
    $homeButton.Location = New-Object System.Drawing.Point(10, 10)
    $homeButton.Size = New-Object System.Drawing.Size(100, 30)
    $homeButton.BackColor = [System.Drawing.Color]::FromArgb(45, 45, 45)
    $homeButton.ForeColor = [System.Drawing.Color]::White
    $homeButton.Add_Click({ $wallpapersForm.Close(); $form.Show() })
    $wallpapersForm.Controls.Add($homeButton)

    # Apply button at the top-right
    $applyButton = New-Object System.Windows.Forms.Button
    $applyButton.Text = "Apply"
    $applyButton.Location = New-Object System.Drawing.Point(280, 10)
    $applyButton.Size = New-Object System.Drawing.Size(100, 30)
    $applyButton.BackColor = [System.Drawing.Color]::FromArgb(45, 45, 45)
    $applyButton.ForeColor = [System.Drawing.Color]::White
    $applyButton.Add_Click({
        $selectedWallpaperUrl = $null
        foreach ($radioButton in $panel.Controls | Where-Object { $_ -is [System.Windows.Forms.RadioButton] }) {
            if ($radioButton.Checked) {
                $index = [Array]::IndexOf($names, $radioButton.Text)
                $selectedWallpaperUrl = $wallpaperUrls[$index]
                break
            }
        }

        if ($selectedWallpaperUrl) {
            try {
                # Remove existing folder if it exists
                if (Test-Path $env:Temp\Wallpapers) {
                    Remove-Item $env:Temp\Wallpapers -Recurse -Force
                }
                # Create the new Wallpapers folder
                mkdir "$env:Temp\Wallpapers"

                # Download the wallpaper to the new folder
                $tempPath = Join-Path $env:Temp\Wallpapers (Split-Path $selectedWallpaperUrl -Leaf)
                Invoke-WebRequest -Uri $selectedWallpaperUrl -OutFile $tempPath

                # Set the downloaded image as wallpaper using user32.dll
                [Wallpaper]::SystemParametersInfo(20, 0, $tempPath, 3)

                [System.Windows.Forms.MessageBox]::Show("Wallpaper applied successfully!")
                $wallpapersForm.Close()
            } catch {
                [System.Windows.Forms.MessageBox]::Show("Error applying wallpaper: $_")
            }
        } else {
            [System.Windows.Forms.MessageBox]::Show("Error: Please select a wallpaper.")
        }
    })
    $wallpapersForm.Controls.Add($applyButton)

    # Create a scrollable panel for the wallpapers
    $panel = New-Object System.Windows.Forms.Panel
    $panel.Location = New-Object System.Drawing.Point(10, 50)
    $panel.Size = New-Object System.Drawing.Size(360, 320)
    $panel.AutoScroll = $true
    $panel.BackColor = [System.Drawing.Color]::FromArgb(30, 30, 30)

    # Create dynamic radio buttons for wallpapers
    $yPosition = 10
    foreach ($name in $names) {
        $radioButton = New-Object System.Windows.Forms.RadioButton
        $radioButton.Text = $name
        $radioButton.Location = New-Object System.Drawing.Point(10, $yPosition)
        $radioButton.Size = New-Object System.Drawing.Size(300, 30)
        $radioButton.BackColor = [System.Drawing.Color]::FromArgb(30, 30, 30)
        $radioButton.ForeColor = [System.Drawing.Color]::White
        $panel.Controls.Add($radioButton)
        $yPosition += 30
    }

    # Add the panel to the form
    $wallpapersForm.Controls.Add($panel)

    $wallpapersForm.ShowDialog()
}

# Buttons for Windows versions
$yPosition = 40

# Windows XP Button
$xpButton = New-Object System.Windows.Forms.Button
$xpButton.Text = "Windows XP"
$xpButton.Location = New-Object System.Drawing.Point(10, $yPosition)
$xpButton.Size = New-Object System.Drawing.Size(360, 30)
$xpButton.BackColor = [System.Drawing.Color]::FromArgb(45, 45, 45)
$xpButton.ForeColor = [System.Drawing.Color]::White
$xpButton.Add_Click({
    Show-Wallpapers "Windows XP" @(
        "https://charliesmacadventures.neocities.org/wallpapers/WindowsXP/Ascent.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/WindowsXP/Bliss.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/WindowsXP/Red-moon-desert.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/WindowsXP/Autumn.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/WindowsXP/Follow.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/WindowsXP/Friend.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/WindowsXP/Tulips.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/WindowsXP/Vortec-space.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/WindowsXP/House.jpg"
    ) @(
        "Ascent",
        "Bliss",
        "Red Moon Desert",
		"Autumn",
		"Follow",
		"Friend",
		"Tulips",
		"Vortec Space",
		"House"
    )
})
$form.Controls.Add($xpButton)
$yPosition += 40

# Windows Vista Button
$vistaButton = New-Object System.Windows.Forms.Button
$vistaButton.Text = "Windows Vista"
$vistaButton.Location = New-Object System.Drawing.Point(10, $yPosition)
$vistaButton.Size = New-Object System.Drawing.Size(360, 30)
$vistaButton.BackColor = [System.Drawing.Color]::FromArgb(45, 45, 45)
$vistaButton.ForeColor = [System.Drawing.Color]::White
$vistaButton.Add_Click({
    Show-Wallpapers "Windows Vista" @(
        "https://charliesmacadventures.neocities.org/wallpapers/WindowsVista/Autumn-Leaves.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/WindowsVista/Desert-Landscape.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/WindowsVista/DockVista.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/WindowsVista/Forest-Flowers.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/WindowsVista/Forest.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/WindowsVista/Frangipani-Flowers.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/WindowsVista/Garden.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/WindowsVista/Green-Sea-Turtle.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/WindowsVista/Humpback-Whale.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/WindowsVista/img3.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/WindowsVista/img4.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/WindowsVista/img7.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/WindowsVista/img8.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/WindowsVista/img9.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/WindowsVista/img10.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/WindowsVista/img11.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/WindowsVista/img16.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/WindowsVista/img17.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/WindowsVista/img18.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/WindowsVista/img21.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/WindowsVista/img23.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/WindowsVista/Oryx-Antelope.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/WindowsVista/Toco-Toucan.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/WindowsVista/Tree.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/WindowsVista/Waterfall.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/WindowsVista/Winter-Leaves.jpg"
    ) @(
        "Autumn Leaves",
        "Desert Landscape",
        "DockVista",
		"Forest Flowers",
		"Forest",
		"Frangipani Flowers",
		"Garden",
		"Green Sea Turtle",
		"Humpback Whale",
		"img3",
        "img4",
        "img7",
		"img8",
		"img9",
		"img10",
		"img11",
		"img16",
		"img17",
		"img18",
        "img21",
        "img23",
		"Oryx Antelope",
		"Toco Toucan",
		"Tree",
		"Waterfall",
		"Winter Leaves"
    )
})
$form.Controls.Add($vistaButton)
$yPosition += 40

# Windows 7 Button
$win7Button = New-Object System.Windows.Forms.Button
$win7Button.Text = "Windows 7"
$win7Button.Location = New-Object System.Drawing.Point(10, $yPosition)
$win7Button.Size = New-Object System.Drawing.Size(360, 30)
$win7Button.BackColor = [System.Drawing.Color]::FromArgb(45, 45, 45)
$win7Button.ForeColor = [System.Drawing.Color]::White
$win7Button.Add_Click({
    Show-Wallpapers "Windows 7" @(
	    "https://charliesmacadventures.neocities.org/wallpapers/Windows7/Canyon.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/Windows7/Chrysanthemum.jpg",
		"https://charliesmacadventures.neocities.org/wallpapers/Windows7/Default.jpg",
		"https://charliesmacadventures.neocities.org/wallpapers/Windows7/Desert.jpg",
		"https://charliesmacadventures.neocities.org/wallpapers/Windows7/Flower.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/Windows7/Ice.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/Windows7/img17.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/Windows7/img18.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/Windows7/Koala.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/Windows7/Penguins.jpg",
		"https://charliesmacadventures.neocities.org/wallpapers/Windows7/Purple-Field.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/Windows7/Waterfall.jpg"
    ) @(
		"Canyon",
        "Chrysanthemum",
		"Default",
		"Desert",
        "Flower",
        "Ice",
		"img17",
        "img18"
		"Koala",
		"Penguins",
		"Purple Field",
		"Waterfall"
    )
})
$form.Controls.Add($win7Button)
$yPosition += 40

# Windows 8.1 Button
$win8Button = New-Object System.Windows.Forms.Button
$win8Button.Text = "Windows 8.1"
$win8Button.Location = New-Object System.Drawing.Point(10, $yPosition)
$win8Button.Size = New-Object System.Drawing.Size(360, 30)
$win8Button.BackColor = [System.Drawing.Color]::FromArgb(45, 45, 45)
$win8Button.ForeColor = [System.Drawing.Color]::White
$win8Button.Add_Click({
    Show-Wallpapers "Windows 8.1" @(
        "https://charliesmacadventures.neocities.org/wallpapers/Windows8-1/RainbowStripes.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/Windows8-1/SpaceNeedle.png",
		"https://charliesmacadventures.neocities.org/wallpapers/Windows8-1/Windows8Default.jpg"
    ) @(
        "Rainbow Stripes",
        "Space Needle",
		"Windows 8 Default"
    )
})
$form.Controls.Add($win8Button)
$yPosition += 40

# Windows 10 Button
$win10Button = New-Object System.Windows.Forms.Button
$win10Button.Text = "Windows 10"
$win10Button.Location = New-Object System.Drawing.Point(10, $yPosition)
$win10Button.Size = New-Object System.Drawing.Size(360, 30)
$win10Button.BackColor = [System.Drawing.Color]::FromArgb(45, 45, 45)
$win10Button.ForeColor = [System.Drawing.Color]::White
$win10Button.Add_Click({
    Show-Wallpapers "Windows 10" @(
        "https://charliesmacadventures.neocities.org/wallpapers/Windows10/Arch.jpg",
		"https://charliesmacadventures.neocities.org/wallpapers/Windows10/Archway-Islands.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/Windows10/Camping.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/Windows10/Camping-Ultrawide.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/Windows10/Windows10Default.jpg"
    ) @(
        "Arch",
		"Archway Islands",
        "Camping",
        "Camping (Ultrawide Version)",
        "Windows 10 Default Background"
    )
})
$form.Controls.Add($win10Button)
$yPosition += 40

# Windows 11 Button
$win11Button = New-Object System.Windows.Forms.Button
$win11Button.Text = "Windows 11"
$win11Button.Location = New-Object System.Drawing.Point(10, $yPosition)
$win11Button.Size = New-Object System.Drawing.Size(360, 30)
$win11Button.BackColor = [System.Drawing.Color]::FromArgb(45, 45, 45)
$win11Button.ForeColor = [System.Drawing.Color]::White
$win11Button.Add_Click({
    Show-Wallpapers "Windows 11" @(
	    "https://charliesmacadventures.neocities.org/wallpapers/Windows11/BlueFlow.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/Windows11/GreenFlow.jpg",
		"https://charliesmacadventures.neocities.org/wallpapers/Windows11/PinkFlow.jpg",
		"https://charliesmacadventures.neocities.org/wallpapers/Windows11/BlueGlow.jpg",
		"https://charliesmacadventures.neocities.org/wallpapers/Windows11/GreenGlow.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/Windows11/PinkGlow.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/Windows11/RedGlow.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/Windows11/Windows11DefaultLight.jpg",
        "https://charliesmacadventures.neocities.org/wallpapers/Windows11/Windows11DefaultDark.jpg"
    ) @(
		"Blue Flow",
        "Green Flow",
		"Pink Flow",
		"Blue Glow",
        "Green Glow",
        "Pink Glow",
		"Red Glow",
        "Windows 11 Default (Light)"
		"Windows 11 Default (Dark)"
    )
})
$form.Controls.Add($win11Button)

# Run the main form
$form.ShowDialog()
