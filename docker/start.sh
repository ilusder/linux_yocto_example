#!/bin/bash

### Stage 2 - clone yocto repos ###
mkdir -p /home/dev/embProject 
cd /home/dev/embProject && git clone git://git.yoctoproject.org/poky.git && cd poky && git checkout dunfell

cd /home/dev/embProject && git clone https://github.com/STMicroelectronics/meta-st-stm32mp.git && cd meta-st-stm32mp && git checkout dunfell

cd /home/dev/embProject && git clone https://github.com/openembedded/meta-openembedded.git && cd meta-openembedded && git checkout dunfell


### Stage 3 - configure build ###
#cd /home/dev/embProject && source poky/oe-init-build-env build-mp1

tail -f /var/log/bootstrap.log
