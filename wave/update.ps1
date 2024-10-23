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
    Write-Host "tag_name=$($PageSource.tag_name)"
    if ($PageSource.tag_name -match 'v([\d.]+)(-beta)?' -and 3 -gt $Matches.Count ) {
        $Version = $Matches[1]
    } else {
        throw "Tag name does not match regex or is beta"
    }

    Write-Host "newversion=$($Version)"

    Write-Output "newversion=$($Version)" >> $Env:GITHUB_OUTPUT

    @{
        Version = $Version
        Url64 = "https://dl.waveterm.dev/releases-w2/Wave-win32-x64-$($Version).msi"
    }
}

update -ChecksumFor none