# http://stackoverflow.com/a/1275261/118220
Function Please-Fucking-Exit-Powershell {
  exit
}

Function Just-Load-My-Sproinking-Profile {
  . $PROFILE
}

Function Go-Up {
  Set-Location ..
}

Function What-Is-My-Wifi-ESSID {
  (netsh.exe wlan show interfaces | Select-String " SSID").Line.Split(":")[1].Trim()
}

Function CmderPrePrompt {
  $osname = (Get-WmiObject -Class win32_operatingsystem).Caption
  return {
    Write-Host -NoNewline "$([Environment]::UserName)" -ForegroundColor "green"
    Write-Host -NoNewline " at "
    Write-Host -NoNewline "$(hostname)" -ForegroundColor "magenta"
    Write-Host -NoNewline " under "
    Write-Host -NoNewline "$script:osname" -ForegroundColor "red"
    Write-Host -NoNewline " in "
    Write-Host -NoNewline "$PWD" -ForegroundColor cyan
    Write-VcsStatus
  }.GetNewClosure()
}
