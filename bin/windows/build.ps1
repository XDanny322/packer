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

    "Working on instance: $instance_count"
    $kickstart_file = "..\..\templates\centos7\ks.cfg"

    "IP Changing for this instance $instance_count"
    (Get-Content $kickstart_file).Replace("MYIP"       ,"192.168.56.10$instance_count") | Set-Content $kickstart_file
    (Get-Content $kickstart_file).Replace("MYHOSTNAME" ,"packer$instance_count")        | Set-Content $kickstart_file

    .\dos2unix.exe $kickstart_file

    "Printing out kickstart file."
    "#################################################################"
    "#################################################################"
    (Get-Content $kickstart_file)
    "#################################################################"
    "#################################################################"

    .\packer.exe build -force `
       -var "output_dir=C:\\Users\\${windows_username}\\VirtualBox VMs\\Packer-CentOS-Instance-${instance_count}" `
       -var "custom_vm_name=Packer-CentOS-Instance-${instance_count}" `
       ..\..\templates\centos7\centos7.json


    "Undoing IP Changing for this instance $instance_count"
    (Get-Content $kickstart_file).Replace("192.168.56.10$instance_count" , "MYIP")        | Set-Content $kickstart_file
    (Get-Content $kickstart_file).Replace("packer$instance_count"        , "MYHOSTNAME")  | Set-Content $kickstart_file

    "Done with $instance_count."
}

