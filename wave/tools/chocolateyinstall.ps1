$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64        = 'https://dl.waveterm.dev/releases-w2/Wave-win32-x64-0.11.0.msi'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url64bit      = $url64

  softwareName  = 'Wave' 
  checksum64    = '11680be405ffde7a29dd27b00e5d5f75a6a09e008bb413c97c6135b259812dc671a8198fdc1e1eaa4bbfac6222227e5f96ed28526da96b8f3b0997909288ce88'
  checksumType64= 'sha512'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
