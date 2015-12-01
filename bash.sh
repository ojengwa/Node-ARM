#!/bin/sh -e

#Define our target device
export TARGET_ARCH="-march=armv7-a"
export TARGET_TUNE="-mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb"

#Define the cross compilators on your system
export AR="arm-linux-gnueabi-ar"
export CC="arm-linux-gnueabi-gcc"
export CXX="arm-linux-gnueabi-g++"
export LINK="arm-linux-gnueabi-g++"
export CPP="arm-linux-gnueabi-gcc -E"
export LD="arm-linux-gnueabi-ld"
export AS="arm-linux-gnueabi-as"
export CCLD="arm-linux-gnueabi-gcc ${TARGET_ARCH} ${TARGET_TUNE}"
export NM="arm-linux-gnueabi-nm"
export STRIP="arm-linux-gnueabi-strip"
export OBJCOPY="arm-linux-gnueabi-objcopy"
export RANLIB="arm-linux-gnueabi-ranlib"
export F77="arm-linux-gnueabi-g77 ${TARGET_ARCH} ${TARGET_TUNE}"
unset LIBC

#Define flags
export CXXFLAGS="-march=armv7-a"
export LDFLAGS="-L${CSTOOLS_LIB} -Wl,-rpath-link,${CSTOOLS_LIB} -Wl,-O1 -Wl,--hash-style=gnu"
export CFLAGS="-isystem${CSTOOLS_INC} -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb3"
export CPPFLAGS="-isystem${CSTOOLS_INC}"
export CCFLAGS="-march=armv7-a"

#Tools
export CSTOOLS=/usr/arm-linux-gnueabi
export CSTOOLS_INC=${CSTOOLS}/include
export CSTOOLS_LIB=${CSTOOLS}/lib
export ARM_TARGET_LIB=$CSTOOLS_LIB
export GYP_DEFINES="armv7=1"

#Define other things, those are not 'must' to have defined but we added
export SHELL="/bin/bash"
export TERM="screen"
export LANG="en_US.UTF-8"
export MAKE="make"

#Export the path for your system
export HOME="/home/gioyik" #Change this one with the name of your user directory
export PATH="${CSTOOLS}/bin:/usr/arm-linux-gnueabi/bin/:${HOME}/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"

./configure --without-snapshot --dest-cpu=arm --dest-os=linux

bash --norc
