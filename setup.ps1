Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
$tmpFile = [System.IO.Path]::GetTempFileName()

& {$P = $env:TEMP + '\chromeremotedesktophost.msi'; Invoke-WebRequest 'https://dl.google.com/dl/edgedl/chrome-remote-desktop/chromeremotedesktophost.msi' -OutFile $P;Start-Process 'msiexec.exe' -ArgumentList '/I $P  /qn /L*v $tmpFile'  -NoNewWindow -Wait; Remove-Item $P}

& {$P = $env:TEMP + '\chrome_installer.msi'; Invoke-WebRequest 'https://dl.google.com/tag/s/dl/chrome/install/googlechromestandaloneenterprise64.msi' -OutFile $P; Start-Process 'msiexec.exe' -ArgumentList '/I $P  /qn /L*v $tmpFile'  -NoNewWindow  -Wait; Remove-Item $P}
