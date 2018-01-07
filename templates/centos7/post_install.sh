#!/bin/bash
########################################################################
# 
# Added hardcoded hostnames to /etc/hosts
# 
echo '

#
# Hard coding due to no DNS
#
192.168.56.101 packer1.localdomain.com packer1
192.168.56.102 packer2.localdomain.com packer2 
192.168.56.103 packer3.localdomain.com packer3 
192.168.56.104 packer4.localdomain.com packer4 
192.168.56.105 packer5.localdomain.com packer5 
192.168.56.106 packer6.localdomain.com packer6 
192.168.56.107 packer7.localdomain.com packer7' >> /etc/hosts

#disable Firewalld
systemctl disable firewalld
systemctl stop firewalld