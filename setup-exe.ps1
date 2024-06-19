$uri = "https://dl.google.com/chrome/install/latest/chrome_installer.exe";
$path = "$PSScriptRoot\ChromeSetup.exe";
Invoke-WebRequest -Uri $uri -OutFile $path;
Start-Process $path /install -NoNewWindow -Wait;
Remove-Item $path;

$chromeInstalled = (Get-Item (Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\chrome.exe').'(Default)').VersionInfo;
if ($chromeInstalled.FileName -eq $null) {
  Write-Host "Chrome failed to install";
}

