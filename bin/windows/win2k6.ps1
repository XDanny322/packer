 <#
    .SYNOPSIS
     This is a quick powershell script to call packer, to create
     VMs using virtual box.
    .NOTES
     NAME: build.ps1
     AUTHOR: Danny Lai
     LASTEDIT: 10/17/2017
#>

#Username
$windows_username = $env:UserName
"Setting Windows username to be: $windows_username"

$env:PACKER_CACHE_DIR="C:\TEMP"
"Setting Packer cache to "
Get-ChildItem Env:PACKER_CACHE_DIR

"Starting For loop for creating VMs"

.\packer.exe build -force `
   -var "output_dir=C:\\Users\\${windows_username}\\VirtualBox VMs\\Packer-Win2k6" `
   -var "custom_vm_name=Packer-Win2k6" `
   -var "hostonly_vbox_name=VirtualBox Host-Only Ethernet Adapter" `
   ..\..\templates\win2k6\win2k6.json

