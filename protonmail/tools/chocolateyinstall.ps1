$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url      = 'https://github.com/ProtonMail/inbox-desktop/releases/download/v1.0.1/Proton.Mail-1.0.1.Setup.exe'
$checksum = '00ef8d8a9d081beff1e97874d2e2397ffb7c6cfcc576a2a3bec3eb354502a2ab'

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
