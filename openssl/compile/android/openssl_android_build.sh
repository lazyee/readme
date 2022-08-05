# openssl编译配置
# https://www.csdn.net/tags/MtjaEgxsNjE0OTgtYmxvZwO0O0OO0O0O.html
# 如何裁减openssl库
# https://www.jianshu.com/p/f510823735fc
# ndk 架构配置
# https://blog.csdn.net/XieEDeHeiShou/article/details/112027189
# 为 Android 编译 openssl 的注意事项
# https://www.bilibili.com/read/cv17026966/
# 修改 15-android.conf,将生成的so包移除版本后缀,位置在Configurations/15-android.conf中

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
echo "清空上次编译内容"
make clean
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

    make
    make install
}

# 查看支持的CPU架构
# android-arm
# android-arm64
# android-armeabi
# android-mips
# android-mips64
# android-x86
# android-x86_64
# android64
# android64-aarch64
# android64-mips64
# android64-x86_64

# 需要编译这5个架构so包
# arm64-v8a
# armeabi
# armeabi-v7a
# x86
# x86_64

# arch64-linux-android-4.9 llvm                      x86-4.9
# arm-linux-androideabi-4.9 renderscript              x86_64-4.9

#编译arm64-v8a
OUTPUT_DIR_NAME=arm64-v8a
ARCH=android-arm64
TOOLCHAIN=aarch64-linux-androideabi
#输出目录
OUTPUT="$SOURCE_PATH/$BUILD_DIR_NAME/$OUTPUT_DIR_NAME"
opensslc

# #编译armeabi-v7a
# OUTPUT_DIR_NAME=armeabi-v7a
# ARCH=android-arm
# TOOLCHAIN=arm-linux-androideabi
# # 输出目录
# OUTPUT="$SOURCE_PATH/$BUILD_DIR_NAME/$OUTPUT_DIR_NAME"
# opensslc

# #编译x86_64
# OUTPUT_DIR_NAME=x86_64
# ARCH=android-x86_64
# TOOLCHAIN=x86_64
# # 输出目录
# OUTPUT="$SOURCE_PATH/$BUILD_DIR_NAME/$OUTPUT_DIR_NAME"
# opensslc

# 编译x86 32位
OUTPUT_DIR_NAME=x86
ARCH=android-x86
TOOLCHAIN=x86
# 输出目录
OUTPUT="$SOURCE_PATH/$BUILD_DIR_NAME/$OUTPUT_DIR_NAME"
opensslc

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