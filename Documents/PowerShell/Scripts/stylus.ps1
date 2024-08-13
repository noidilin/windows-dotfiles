function Update-CatppuccinStylus { 
    # Update catppuccin stylus themes
    $url = "https://github.com/catppuccin/userstyles/releases/download/all-userstyles-export/import.json"
    $file = "$env:USERPROFILE\.config\stylus\color-fatigue.json"

    # Download the file
    Invoke-WebRequest -Uri $url -OutFile $file

    # Update the file using the Replace-MochaPalette function with the stylus switch
    Replace-MochaPalette -filePath $file -stylus
}
