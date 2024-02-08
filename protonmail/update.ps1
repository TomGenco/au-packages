import-module au

$releases = 'https://github.com/ProtonMail/inbox-desktop/releases'

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"           #1
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"      #2
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $regex   = '.exe$'
    $url     = $download_page.links | ? href -match $regex | select -First 1 -expand href
    $version = $url -split '-|.Setup.exe' | select -Last 1 -Skip 2
    return @{ Version = $version; URL32 = $url }
}

update