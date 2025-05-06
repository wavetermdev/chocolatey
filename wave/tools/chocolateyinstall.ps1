$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64        = 'https://dl.waveterm.dev/releases-w2/Wave-win32-x64-0.11.3.msi'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url64bit      = $url64

  softwareName  = 'Wave' 
  checksum64    = '0e849f01aeefc3ee060e3d7ca086390a10d5997d0c74ab83638bbe2f3d0e0ac489a38ee5dd9328f8f38c73bc960eef73b895534dbb9c84a8af6d72af28eae7e2'
  checksumType64= 'sha512'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
