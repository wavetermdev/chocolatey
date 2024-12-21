$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64        = 'https://dl.waveterm.dev/releases-w2/Wave-win32-x64-0.10.3.msi'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url64bit      = $url64

  softwareName  = 'Wave' 
  checksum64    = '29f678c772703e8d2acfa100e694036a82179379c2ba408af0d6fe7c65cfd17788cdbe4759cb163504404dfdcdbb3a49d02227bab3980c3a12a650bd00c3a092'
  checksumType64= 'sha512'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
