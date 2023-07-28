#!/bin/bash
# To run this script on all nodes
#sinfo --Node | tail -n +2 | awk '{print $1}'| sort -u | uniq > host.list 
#clush --machinefile=host.list install.sh
#
sudo dnf install -y zlib-devel libcurl-devel.x86_64 openssl-devel.x86_64 make.x86_64 libaio-devel
git clone https://github.com/axboe/fio
cd fio && git checkout fio-3.35 && sed -i 's/FIO_NET_CLIENT_TIMEOUT.*5000,/FIO_NET_CLIENT_TIMEOUT          = 30000,/g' server.h  && ./configure --prefix=/usr/local && make -j 6 && sudo make install
