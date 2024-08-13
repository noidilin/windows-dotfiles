function Replace-MochaPalette {
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
