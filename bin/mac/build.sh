#!/bin/bash
########################################################################

echo "Setting username to be: $USER"

PACKER_CACHE_DIR="/tmp"
echo "Setting Packer cache to /tmp"

echo "Starting For loop for creating VMs"

for instance_count in 1 2 3
do
    kickstart_file="..\..\templates\centos7\ks.cfg"

    echo "IP Changing for this instance $instance_count"

    sed -i 's/MYIP/192.168.56.10$instance_count/g' $kickstart_file
    sed -i 's/MYHOSTNAME/packer$instance_count/g'  $kickstart_file

    dos2unix $kickstart_file

    echo "Printing out kickstart file."
    echo "#################################################################"
    echo "#################################################################"
    cat $kickstart_file
    echo "#################################################################"
    echo "#################################################################"

    ./packer.exe build -force \
       -var "output_dir=/Users/$USER/VirtualBox VMs/Packer-CentOS-Instance-${instance_count}" \
       -var "custom_vm_name=Packer-CentOS-Instance-${instance_count}" \
       ..\..\templates\centos7\centos7.json

    echo "Undoing IP Changing for this instance $instance_count"
    sed -i 's/192.168.56.10$instance_count/MYIP/g' $kickstart_file
    sed -i 's/packer$instance_count/MYHOSTNAME/g'  $kickstart_file

done