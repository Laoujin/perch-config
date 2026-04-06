$script:CdAliasesPath = "$PSScriptRoot\..\cd-aliases.ini"

function Get-CdAliases {
    $aliases = @{}
    if (Test-Path $script:CdAliasesPath) {
        Get-Content $script:CdAliasesPath | ForEach-Object {
            if ($_ -match '^([^#\[=]+)=(.+)$') {
                $aliases[$matches[1].Trim()] = $matches[2].Trim()
            }
        }
    }
    $aliases
}

function Start-DevTerminal {
    param(
        [string]$Project,
        [string]$Dir
    )

    if ($Project) {
        $aliases = Get-CdAliases
        if ($aliases.ContainsKey($Project)) {
            $Dir = $aliases[$Project]
        } else {
            Write-Error "Unknown project: $Project"
            return
        }
    }

    if (-not $Dir) {
        $Dir = "C:\Users\woute\Dropbox\Personal\Programming\UnixCode"
    }

    $WslDir = $Dir -replace '^C:', '/mnt/c' -replace '\\', '/'
    wt -p "PowerShell" -d $Dir `; split-pane -V -p "Ubuntu" -d $WslDir
}

Register-ArgumentCompleter -CommandName Start-DevTerminal -ParameterName Project -ScriptBlock {
    param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)
    (Get-CdAliases).Keys | Where-Object { $_ -like "$wordToComplete*" } | Sort-Object | ForEach-Object {
        [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
    }
}

Set-Alias dev Start-DevTerminal
