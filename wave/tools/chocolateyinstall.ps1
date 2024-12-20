$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64        = 'https://dl.waveterm.dev/releases-w2/Wave-win32-x64-0.10.2.msi'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url64bit      = $url64

  softwareName  = 'Wave' 
  checksum64    = '87efca88c4177e587f3a3365a8efb1bf1cf3fe867658240145cc4db1be7f311f8ad746c22bd202969e3f8bcbb7253743ef17c5888f80d41c67a76beed5a3a79d'
  checksumType64= 'sha512'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
