Clear-Host
Write-Host 'Powershell' $PsVersionTable.PSVersion '-' $env:UserName'@'$env:ComputerName
Write-Host ' '

function Test-Administrator {
    $user = [Security.Principal.WindowsIdentity]::GetCurrent();
    (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

function prompt {
    $ps1 = $(if (test-path variable:/PSDebugContext) { '[DBG]' } else { '' }) + $(if ($nestedpromptlevel -ge 1) { '>>' }) + '>'
    $color = $(if (Test-Administrator) { 'Red' } else { 'DarkCyan' })

    # https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/write-host?view=powershell-6
    Write-Host $ps1 -NoNewLine -ForegroundColor $color
    return ' '
}

# https://github.com/joonro/Get-ChildItemColor
Import-Module Get-ChildItemColor
Set-Alias ls Get-ChildItemColor -option AllScope -Force

# shortcuts
Set-PSReadlineKeyHandler -Key ctrl+d -Function ViExit
