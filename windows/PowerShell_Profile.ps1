[System.Console]::OutputEncoding = [System.Text.Encoding]::UTF8
[System.Console]::InputEncoding = [System.Text.Encoding]::UTF8

. ~/dotfiles/windows/functions.ps1
. ~/dotfiles/windows/aliases.ps1

if (Get-Module posh-git -ListAvailable) {
    Import-Module posh-git
    Start-SshAgent -Quiet
}
