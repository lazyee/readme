# openssl编译配置
# https://www.csdn.net/tags/MtjaEgxsNjE0OTgtYmxvZwO0O0OO0O0O.html
# 如何裁减openssl库
# https://www.jianshu.com/p/f510823735fc

SOURCE_PATH=/Users/leeorz/Documents/openssl/openssl-OpenSSL_1_1_1i
BUILD_DIR_NAME=openssl_mac_build
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
./Configure LIST | grep darwin

function opensslc
{
    # make clean all
    ./Configure darwin64-x86_64-cc \
    no-asm \
    no-async \
    shared \
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

    # #这里是定义用几个CPU编译
    make j8
    make install
}

opensslc