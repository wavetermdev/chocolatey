$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64        = 'https://dl.waveterm.dev/releases-w2/Wave-win32-x64-0.8.12.exe'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url64bit      = $url64

  softwareName  = 'Wave' 
  checksum64    = 'A0749E49A492F3C2B4D36701A3BEE346D40FB4ECDF611DB6FF4F15CD798A6778F7C863CFED4C8DAA5F4D3CCC63F9EFAB89A9279E46B3966A2069F6BBD52F1115'
  checksumType64= 'sha512'
  silentArgs   = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs # https://docs.chocolatey.org/en-us/create/functions/install-chocolateypackage
