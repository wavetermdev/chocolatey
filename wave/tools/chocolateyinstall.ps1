$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64        = 'https://dl.waveterm.dev/releases-w2/Wave-win32-x64-0.11.2.msi'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url64bit      = $url64

  softwareName  = 'Wave' 
  checksum64    = '501d5068d0adae9e891116ee6fdf19e946a1926cf5a5804b00427fd155fc41b206872671d90ae0e4abd258502b5af68a40404db0e368374b871723e34291c311'
  checksumType64= 'sha512'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
