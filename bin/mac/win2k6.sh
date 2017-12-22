#!/bin/bash
########################################################################

echo "Setting username to be: $USER"

export PACKER_CACHE_DIR="/tmp"
echo "Setting Packer cache to /tmp"

echo "Starting For loop for creating VMs"

for instance_count in 1 
do
  ./packer build -force \
     -var "custom_autounattend=../../templates/win2k6/scripts/Autounattend.xml" \
     -var "custom_enable_rdp=../../templates/win2k6/scripts/enable-rdp.bat" \
     -var "custom_vm_name=Packer-win2k6-Instance-${instance_count}" \
     -var "custom_winrm=../../templates/win2k6/scripts/winrm.ps1" \
     -var "hostonly_vbox_name=vboxnet0" \
     -var "output_dir=/Users/$USER/VirtualBox VMs/Packer-win2k6-Instance-${instance_count}" \
       ../../templates/win2k6/win2k6.json
done
