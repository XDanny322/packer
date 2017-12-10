# Packer builds
This is a quick Virtual box to packer tool, I am using to build test environments on workstations.   The idea of repo is to be able to quickly create N number of CentOS machines for testing.  As part of creating these machines, two network gets built within each VM.

* NAT network.  Each machine to use the host's network interface, to talk to the internet.  This does not allow the internet to talk to the machine.  The IP range on this is '10\*.'
* Host-only network.  Each VM will have a 192.168.56.X ip address.  Your window workstation will also have one of these ips.  The idea is that each server, including your workstation, can talk to each other.  This is helpful if you want to test something and only need your workstation (and also not have to worry about possibility of effect other systems.)

For now, even tho under the templates / directory there is ubuntn and rhel, those have not been setup yet, and the primary use of this is Centos (and because it was enough for my testing).

By default, I have made the VM file (vmdk file) live in your "C:\Users\<username>\VirtualBox VMs"

It takes about 10-15 min per VM creation.

## Requirements
* You need to have virtual box installed on your desk. As of writing, i have tested / using version 5.1.30
* If windows, you make need to enable unrestricted mode, by, opening an Admin PowerShell prompt and enter
    Get-ExecutionPolicy
    Set-ExecutionPolicy unrestricted


## How to run

* Ensure virtual box is installed on your windows laptop|workstation.  https://www.virtualbox.org/wiki/Downloads
* git clone this report

* Windows:
   * Within that directory, edit `.\build.ps1`, changing the number of instance of VMs you want.  Look in the for loop please.
   * On a power shell window, run `.\build.ps1`
* Mac:
   * TBD


## Notes

### Packer debug mode

Turn on the following system variables:

```
export PACKER_LOG=1
export PACKER_LOG_PATH="/tmp/packer_dlai.log"
```