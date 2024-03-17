$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url      = 'https://github.com/ProtonMail/inbox-desktop/releases/download/v1.0.0/Proton.Mail-1.0.0.Setup.exe'
$checksum = 'efe5fccaaba5ed9e8e8295e9fb10daf707d2d3b38b27b2f7748bb3d8e3d59ce0'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url

  softwareName   = 'Proton Mail'

  checksum       = $checksum
  checksumType   = 'sha256'

  silentArgs     = '-s'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
