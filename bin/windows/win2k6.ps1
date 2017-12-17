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

For ( $instance_count=1 ; $instance_count -le 1 ; $instance_count++) {

    .\packer.exe build -force `
       -var "output_dir=C:\\Users\\${windows_username}\\VirtualBox VMs\\Packer-win2k6-Instance-${instance_count}" `
       -var "custom_vm_name=Packer-win2k6-Instance-${instance_count}" `
       -var "hostonly_vbox_name=VirtualBox Host-Only Ethernet Adapter" `
       -var "custom_autounattend=..\\..\\templates\\win2k6\\Autounattend.xml" `
       -var "custom_winrm=..\\..\\templates\\win2k6\\winrm.ps1" `
              ..\..\templates\win2k6\win2k6.json

    "Done with $instance_count."
}
