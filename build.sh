#!/bin/bash
# create by lehoon 2024.08.08
# 编译iotdb时序库c++客户端
#set -x
RED='\033[0;31m'
GREEN='\033[1;32m'
GREEN_DARK='\033[0;32m'
GREEN_UNDERLINE='\033[4;32m'
NC='\033[0m'

function red_log() {
	echo -ee "${RED}$1${NC}"
}

function green_log() {
	echo -e "${GREEN}$1${NC}"
}

cd thrift
make clean

if [ ! -x bootstrap.sh ]; then
	chmod +x ./bootstrap.sh
fi

if [ ! -e ./configure ]; then
	./bootstrap.sh
fi

if [ ! -x ./configure ]; then
	chmod +x ./configure
fi

./configure --with-cpp --with-java=no --with-erlang=no --with-nodejs=no --with-python=no --with-py3=no --with-as3=no --with-erlang=no --with-nodejs=no --with-lua=no --with-perl=no --with-php=no --with-php_extension=no --with-dart=no --with-ruby=no --with-haskell=no --with-go=no --with-swift=no --with-rs=no --with-cl=no --with-haxe=no --with-dotnetcore=no --with-d=no --with-csharp=no --with-qt5=no 
make -j2

#thrift c++库位置 thrift/lib/cpp/.libs

cd ..

if [ -d build ]; then
	rm rf build
fi

mkdir build && cd build 
cmake ..
make -j2
