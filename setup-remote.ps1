$uri = "https://dl.google.com/dl/edgedl/chrome-remote-desktop/chromeremotedesktophost.msi";
$path = "$PSScriptRoot\chromeremotedesktophost.msi";
Invoke-WebRequest -Uri $uri -OutFile $path;

# save log from installation to temp file 
$tmpFile = [System.IO.Path]::GetTempFileName()
Start-Process msiexec -ArgumentList "/i $path /qn /L*v $tmpFile" -NoNewWindow -Wait
