# Packer builds
This is a quick Virtual box to packer tool, I am using to build test environments on workstations.   The idea of this repo is to be able to quickly create N number of machines for testing.  As part of creating these machines, two network gets built within each VM.

* NAT network.  Each machine to use the host's network interface, to talk to the internet.  This does not allow the internet to talk to the machine.  The IP range on this is '10\*.'
* Host-only network.  Each VM will have a 192.168.56.X ip address.  Your window workstation will also have one of these ips.  The idea is that each server, including your workstation, can talk to each other.  This is helpful if you want to test something and only need your workstation (and also not have to worry about possibility of effect other systems.)

For now, even tho there are multiple templates, only CentOS and Win2k6 is working (because it was enough for my testing).

It takes about 10-15 min per VM creation.

This works with Windows and Mac OS.

## Requirements
* You need to have virtual box installed on your desk. As of writing, I have tested / using version 5.1.30
* If running on windows, you make need to enable unrestricted mode, by, opening an Admin PowerShell prompt and enter
    `Get-ExecutionPolicy`
    `Set-ExecutionPolicy unrestricted`

## How to run on your host
* Ensure virtual box is installed on your windows laptop|workstation.  https://www.virtualbox.org/wiki/Downloads
* git clone this repo

* Windows:
   * Within bin/windows directory, edit `.\build.ps1`, changing the number of instance of VMs you want.  Look in the for loop please.
   * On a power shell window, the below, depending on the guest OS you need
      * `.\centos.ps1`
      * `.\win2k6.ps1`
* Mac:
   * Within bin/mac directory, edit `./build.ps1`, changing the number of instance of VMs you want.  Look in the for loop please.
      * run `./centos.sh`
      * run `./win2k6.sh`

## Notes
### Packer debug mode
Turn on the following system variables:

```
export PACKER_LOG=1
export PACKER_LOG_PATH="/tmp/packer_dlai.log"
```

### Links:

* http://www.hurryupandwait.io/blog/creating-windows-base-images-for-virtualbox-and-hyper-v-using-packer-boxstarter-and-vagrant