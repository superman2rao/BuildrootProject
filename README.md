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

## V1.1
1. This version is a generic version with following features  
1. Separate project directory for custom tools for isolation from the buildroot source directory  
1. Timezone Asia/Kolkata  
1. With default root password "root123"  
1. Some common settings such as /dev management (Dynamic using devtmpfs + eudev), Toolchain C++ support, Creating cpio root filesystem with gz compression  

Note:- * Files external.desc, Config.in, external.mk are necessary to work with BR2_EXTERNAL  
* defconfig to this specific build is available in configs directory. Make sure the extension of this file is _defconfig to list in buildroot's list-defconfigs command.  
* To build with this defconfig run  
* $ make BR2_EXTERNAL=<path/to/br2_external/directory> list-defconfigs  
* $ make mlinux_defconfig # It will be listed from above command  
* $ make  
* Important: eth0 is renamed to enp... like naming scheme (most probabily due to "/dev management (Dynamic using devtmpfs + eudev)").  

## V1.2
1. Following changes are made in external-toolchian branch.  
1. This version includes major development towards creation of external toolchain using buildroot for x86_64 target architecture.  
1. "external_x86_64_toolchain_defconfig" defconfig file related to this change is available in configs directory.  
1. To re-create run below commands
* $ make BR2_EXTERNAL=<path/to/br2_external/directory> list-defconfigs  
* $ make external_x86_64_toolchain_defconfig # It will be listed from above command  
* $ make sdk # command to generate the external buildroot toolchain, building of toolchain sdk may take a significant amount of time  

Note:- Ready to use toolchain "x86_64-buildroot-linux-gnu_sdk-buildroot.tar.gz" kept in toolchain directory.  
* GCC version: __13.x__  
* binutils version: __2.43.1__  
* glibc version: __2.41.70-xxxx__  
* Kernel header version: __6.12.x or later__  
* Having SSP, SSP-Strong, C++, etc features enabled

