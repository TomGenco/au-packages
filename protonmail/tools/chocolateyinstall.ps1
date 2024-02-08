$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url      = 'https://github.com/ProtonMail/inbox-desktop/releases/download/v0.9.3/Proton.Mail.Beta-0.9.3.Setup.exe'
$checksum = '3794278bf13f713c229ffb352ffbc3a5b743481787c4dfc66076f9d54d4e3b47'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url

  softwareName   = 'Proton Mail Beta*'

  checksum       = $checksum
  checksumType   = 'sha256'

  silentArgs     = '-s'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs