## Buildroot Kernel building Project
**This Project will explain the buildroot x86_64 kernel image generation with different configurations**  

## Experimentation pre-requisites  
    > Buildroot version - buildroot-2025.02.9  
    > Kernel version - linux-6.12.61  
    > Inbuilt buildroot toolchain  
## V1.0
1. This version is very basic and with all default configurations  
1. Changes made are highlighted in defconfig  
1. Tested in qemu with host internet connected network and block device (sda)  
1. Using udhcp -i <interface_name> command IP has assigned and internet working, but ping was not happening(Not fully explored).  
