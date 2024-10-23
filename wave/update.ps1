import-module Chocolatey-AU

function global:au_BeforeUpdate($Package) {}

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"           #1
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"      #2
        }
        ".\wave.nuspec" = @{
            "(<version>)[^<]*" = "$($Latest.Version)"
        }
    }
}

function global:au_GetLatest {
    $Releases = "https://api.github.com/repos/wavetermdev/waveterm/releases/latest"
    $PageSource = Invoke-RestMethod -Uri $Releases

    if ($PageSource.tag_name -match 'v([\d.-]+)') {
        $Version = $Matches[1]
    } else {
        throw "Unable to grab tag name"
    }

    Write-Host "newversion=$($Version)"

    Write-Output "newversion=$($Version)" >> $Env:GITHUB_OUTPUT

    @{
        Version = $Version
        Url64 = "https://dl.waveterm.dev/releases-w2/Wave-win32-x64-$($Version).exe"
    }
}

update -ChecksumFor none