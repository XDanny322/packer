#!/bin/bash
########################################################################

echo "Setting username to be: $USER"

export PACKER_CACHE_DIR="/tmp"
echo "Setting Packer cache to /tmp"

echo "Starting For loop for creating VMs"

for instance_count in 1 2 3
do
    ./packer build -force \
       -var "output_dir=/Users/$USER/VirtualBox VMs/Packer-win2k6-Instance-${instance_count}" \
       -var "custom_vm_name=Packer-win2k6-Instance-${instance_count}" \
       -var "hostonly_vbox_name=vboxnet0" \
       -var "custom_autounattend=../../templates/win2k6/Autounattend.xml" \
       -var "custom_winrm=../../templates/win2k6/winrm.ps"
          ../../templates/win2k6/win2k6.json
done
