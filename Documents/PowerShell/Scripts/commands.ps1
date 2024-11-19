Set-Alias -Name c -Value cls
Set-Alias -Name rl -Value Reload-Profile
# if (Get-Command btm) { Set-Alias -Name btm -Value _btm }
if (Get-Command lazygit) { Set-Alias -Name lg -Value lazygit }

function Replace-MochaPalette {
    <#
    .SYNOPSIS
        A function to replace catppuccin mocha color palette
    .DESCRIPTION
        A function to replace catppuccin mocha color palette. A file path must be include to start replacing the hex color code inside it.
        Use switch `-stylus` when replacing stylus userstyles.
    #>
    param (
        [string]$filePath,
        [switch]$stylus
    )

    # Get the content from the file
    $content = Get-Content -Path $filePath -Raw

    # Apply the mandatory replacements
    ## The backtick (`) is used to indicate that the command continues on the next line, making the script easieer to read
    $updatedContent = $content `
        -replace '#f5c2e7', '#9f9fbd' `
        -replace '#cba6f7', '#797994' `
        -replace '#f38ba8', '#b07878' `
        -replace '#eba0ac', '#cc9393' `
        -replace '#fab387', '#d6caab' `
        -replace '#f9e2af', '#ebd6b7' `
        -replace '#a6e3a1', '#778777' `
        -replace '#94e2d5', '#9bb09b' `
        -replace '#89dceb', '#92b3b3' `
        -replace '#74c7ec', '#769494' `
        -replace '#89b4fa', '#7d96ad' `
        -replace '#b4befe', '#9db2cf' `
        -replace '#cdd6f4', '#b3b3b3' `
        -replace '#bac2de', '#9d9d9d' `
        -replace '#a6adc8', '#878787' `
        -replace '#9399b2', '#707070' `
        -replace '#7f849c', '#5d5d5d' `
        -replace '#6c7086', '#4e4e4e' `
        -replace '#585b70', '#414141' `
        -replace '#45475a', '#353535' `
        -replace '#313244', '#2a2a2a' `
        -replace '#1e1e2e', '#1e1e1e' `
        -replace '#181825', '#191919' `
        -replace '#11111b', '#151515'

    # Conditionally apply the color replacement based on the $stylus switch
    if ($stylus) {
        $updatedContent = $updatedContent `
            -replace '"updateInterval":24,"updateOnlyEnabled":true', '"updateInterval":0,"updateOnlyEnabled":true' `
            -replace '"name":"accentColor","value":null', '"name":"accentColor","value":"rosewater"' `
            -replace '#f5e0dc', '#c0baad' `
            -replace '#f2cdcd', '#a69f91'
    } else {
        $updatedContent = $updatedContent `
            -replace '#f5e0dc', '#dcb5a5' `
            -replace '#f2cdcd', '#c8a492'
    }

    # Write the updated content back to the file
    Set-Content -Path $filePath -Value $updatedContent
}

function Update-Stylus { 
    <#
    .SYNOPSIS
        A function that update catppuccin stylus userstyles
    #>
    $url = "https://github.com/catppuccin/userstyles/releases/download/all-userstyles-export/import.json"
    $file = "$env:USERPROFILE\.config\stylus\color-fatigue.json"
    Invoke-WebRequest -Uri $url -OutFile $file # download the file the config path
    Replace-MochaPalette -filePath $file -stylus # update file with stylus switch on
}

function yz {
    <#
    .SYNOPSIS
        A function that allows yazi to cd into cwd.
    #>
    $tmp = [System.IO.Path]::GetTempFileName()
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -LiteralPath $cwd
    }
    Remove-Item -Path $tmp
}

# Source: https://www.geeksforgeeks.org/disk-cleanup-using-powershell-scripts/
# 1 Removing recycle bin files
function Delete-RecyleBin {
    <#
    .SYNOPSIS
        A function that allows yazi to cd into cwd.
    #>
  # Set the path to the recycle bin on the C drive
  $Path = 'C' + ':\$Recycle.Bin'
  # Get all items (files and directories) within the recycle bin path, including hidden ones
  Get-ChildItem $Path -Force -Recurse -ErrorAction SilentlyContinue |
    # Remove the items, excluding any files with the .ini extension
    Remove-Item -Recurse -Exclude *.ini -ErrorAction SilentlyContinue
  # Display a success message
  Write-Host "All the necessary data removed from recycle bin successfully" -ForegroundColor Green
}
# 2 Remove Temp files from various locations 
function Delete-TempData {
  Write-Host "Erasing temporary files from various locations" -ForegroundColor Yellow  
  # Specify the path where temporary files are stored in the Windows Temp folder
  $Path1 = 'C' + ':\Windows\Temp' 
  # Remove all items (files and directories) from the Windows Temp folder
  Get-ChildItem $Path1 -Force -Recurse -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue  
  # Specify the path where temporary files are stored in the Windows Prefetch folder
  $Path2 = 'C' + ':\Windows\Prefetch' 
  # Remove all items (files and directories) from the Windows Prefetch folder
  Get-ChildItem $Path2 -Force -Recurse -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue  
  # Specify the path where temporary files are stored in the user's AppData\Local\Temp folder
  $Path3 = 'C' + ':\Users\*\AppData\Local\Temp' 
  # Remove all items (files and directories) from the specified user's Temp folder
  Get-ChildItem $Path3 -Force -Recurse -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
  # Display a success message
  Write-Host "removed all the temp files successfully" -ForegroundColor Green
}
# 3 Using Disk cleanup Tool  
function Run-DiskCleanUp {
  # Display a message indicating the usage of the Disk Cleanup tool
  Write-Host "Using Disk cleanup Tool" -ForegroundColor Yellow  
  # Run the Disk Cleanup tool with the specified sagerun parameter
  cleanmgr /sagerun:1 | out-Null  
  # Emit a beep sound using ASCII code 7
  Write-Host "$([char]7)"  
  # Display a success message indicating that Disk Cleanup was successfully done
  Write-Host "Disk Cleanup Successfully done" -ForegroundColor Green  
}
# 4 function that combines all the clean functions
function Clean-All {
  Delete-RecyleBin
  Delete-TempData
  Run-DiskCleanUp
}

# function _btm {
#   btm -C "$env:USERPROFILE\.config\bottom\bottom.toml" @args
# }

function Reload-Profile {
  . $PROFILE
}
