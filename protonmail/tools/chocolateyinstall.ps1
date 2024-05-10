$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url      = 'https://github.com/ProtonMail/inbox-desktop/releases/download/v1.0.2/Proton-Mail-1.0.1-Setup.exe'
$checksum = '19fee55e7a6235699c297e16fb04fcebdbe9b4c075d548d19e919706e92dc182'

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
