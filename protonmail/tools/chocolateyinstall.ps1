$ErrorActionPreference = 'Stop'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://github.com/ProtonMail/inbox-desktop/releases/download/v0.9.3/Proton.Mail.Beta-0.9.3.Setup.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url

  softwareName  = 'Proton Mail Beta*'

  checksum      = '3794278BF13F713C229FFB352FFBC3A5B743481787C4DFC66076F9D54D4E3B47'
  checksumType  = 'sha256'

  silentArgs    = '-s'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs