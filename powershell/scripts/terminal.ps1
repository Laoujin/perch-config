function Start-DevTerminal {
    param(
        [string]$Dir = "C:\Users\woute\Dropbox\Personal\Programming\UnixCode"
    )
    $WslDir = $Dir -replace '^C:', '/mnt/c' -replace '\\', '/'
    wt -p "PowerShell" -d $Dir `; split-pane -V -p "Ubuntu" -d $WslDir
}

Set-Alias dev Start-DevTerminal
