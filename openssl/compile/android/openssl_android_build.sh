# openssl编译配置
# https://www.csdn.net/tags/MtjaEgxsNjE0OTgtYmxvZwO0O0OO0O0O.html
# 如何裁减openssl库
# https://www.jianshu.com/p/f510823735fc
# ndk 架构配置
# https://blog.csdn.net/XieEDeHeiShou/article/details/112027189

API=21
#自己下载的NDK路径
# NDK=/Users/leeorz/Documents/android_ndk/android-ndk-r21d
# Android Studio下载的NDK路径
NDK=/Users/leeorz/Library/Android/sdk/ndk/21.4.7075529
SOURCE_PATH=/Users/leeorz/Documents/openssl/openssl-OpenSSL_1_1_1i
# 编译工具链路径
TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/darwin-x86_64
# 编译环境
SYSROOT=$TOOLCHAIN/sysroot

BUILD_DIR_NAME=openssl_android_build
OUTPUT="$SOURCE_PATH/$BUILD_DIR_NAME"
OPENSSL_DIR="$SOURCE_PATH/openssldir"



cd $SOURCE_PATH
# pwd
echo "删除[$BUILD_DIR_NAME]文件夹"
rm -rf $BUILD_DIR_NAME
mkdir $BUILD_DIR_NAME

echo "查看操作系统信息"
uname -a
# ls -all
echo "查看支持的CPU架构"
./Configure LIST | grep android


function opensslc
{
    export ANDROID_NDK_HOME=$NDK
    export PATH=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/darwin-x86_64/bin:$PATH
    export PATH=$ANDROID_NDK_HOME/toolchains/$TOOLCHAIN-4.9/prebuilt/darwin-x86_64/bin:$PATH
    # make clean all
    ./Configure $ARCH \
    -D__ANDROID_API__=$API \
    no-asm \
    shared \
    no-async \
    no-md2 \
    no-md4 \
    no-mdc2 \
    no-poly1305 \
    no-blake2 \
    no-siphash \
    no-sm3 \
    no-rc2 \
    no-rc4 \
    no-rc5 \
    no-idea \
    no-aria \
    no-bf \
    no-cast \
    no-camellia \
    no-seed \
    no-sm4 \
    no-chacha \
    no-ec \
    no-dsa \
    no-sm2 \
    no-dso \
    no-engine \
    no-err \
    no-comp \
    no-ocsp \
    no-cms \
    no-ts \
    no-srp \
    no-cmac \
    no-ct \
    --prefix=$OUTPUT \
    --openssldir=$OPENSSL_DIR \

    #这里是定义用几个CPU编译
    make
    make install
}

# arch64-linux-android-4.9 llvm                      x86-4.9
# arm-linux-androideabi-4.9 renderscript              x86_64-4.9
#编译arm
ARCH=android-arm64
TOOLCHAIN=arm-linux-androideabi
#输出目录
OUTPUT="$SOURCE_PATH/$BUILD_DIR_NAME/$ARCH"
opensslc

# #编译x86_64
# ARCH=android-x86_64
# CPU=x86-64
# TOOL_CPU_NAME=x86_64
# #输出目录
# OUTPUT="$SOURCE_PATH/$BUILD_DIR_NAME/$ARCH"
# TOOL_PREFIX="$TOOLCHAIN/bin/$TOOL_CPU_NAME-linux-android"
# CC="$TOOLCHAIN/bin/$ARCH-linux-android$API-clang"
# CXX="$TOOLCHAIN/bin/$ARCH-linux-android-"
# OPTIMIZE_CFLAGS="-march=$CPU"
#opensslc

# #编译x86 32位
# ARCH=x86
# CPU=i686
# TOOL_CPU_NAME=i686
# #输出目录
# OUTPUT="$SOURCE_PATH/$BUILD_DIR_NAME/$ARCH"
# TOOL_PREFIX="$TOOLCHAIN/bin/$TOOL_CPU_NAME-linux-android"
# CC="$TOOLCHAIN/bin/$CPU-linux-android$API-clang"
# CXX="$TOOLCHAIN/bin/$CPU-linux-android-"
# OPTIMIZE_CFLAGS="-march=$CPU"
# opensslc

    # no-async \
    # no-md2 \
    # no-md4 \
    # no-mdc2 \
    # no-poly1305 \
    # no-blake2 \
    # no-siphash \
    # no-sm3 \
    # no-rc2 \
    # no-rc4 \
    # no-rc5 \
    # no-idea \
    # no-aria \
    # no-bf \
    # no-cast \
    # no-camellia \
    # no-seed \
    # no-sm4 \
    # no-chacha \
    # no-ec \
    # no-dsa \
    # no-sm2 \
    # no-dso \
    # no-engine \
    # no-err \
    # no-comp \
    # no-ocsp \
    # no-cms \
    # no-ts \
    # no-srp \
    # no-cmac \
    # no-ct \