#!/bin/bash
# libmp3lame指导文档
# http://zhgeaits.me/android/2016/06/17/android-ffmpeg.html
# 关于libmp3lame编译看下android-study/demo/libmp3lame-ndk-compile

# FFMPEG 配置选项详细说明
# https://cloud.tencent.com/developer/article/1393972
# ffmpeg减少编译包体积技巧
# https://blog.csdn.net/u010926168/article/details/124530522

# 记一次NDK编译ffmpeg
# https://juejin.cn/post/6996581801179217928

# 项目中用到的FFmpeg依赖库
# https://github.com/bravobit/FFmpeg-Android
# 这里只编译了x86和arm,所以我们这里也只编译这两个架构的ffmpeg即可

# 目标Android版本,这里的API以项目中minSdkVersion为准,否则会导致低版本的手机运行失败
API=21
#自己下载的NDK路径
# NDK=/Users/leeorz/Documents/android_ndk/android-ndk-r21d
# Android Studio下载的NDK路径
NDK=/Users/leeorz/Library/Android/sdk/ndk/21.4.7075529
#FFMPEG源码路径
SOURCE_PATH=/Users/leeorz/Documents/ffmpeg/source/ffmpeg
# 编译工具链路径
TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/darwin-x86_64
# 编译环境
SYSROOT=$TOOLCHAIN/sysroot

BUILD_DIR_NAME=ffmpeg_android_build

cd $SOURCE_PATH
# pwd
echo "删除[$BUILD_DIR_NAME]文件夹"
rm -rf $BUILD_DIR_NAME
mkdir $BUILD_DIR_NAME

function ffmpegc
{
    echo "======================================"
    echo "CC:$CC"
    echo "CXX:$CXX"
    echo "======================================"
# --disable-logging \
    ./configure \
    --prefix=$OUTPUT \
    --target-os=android \
    --arch=$ARCH  \
    --cpu=$CPU \
    --cross-prefix=$CXX \
    --cc=$CC \
    --disable-asm \
    --enable-cross-compile \
    --disable-securetransport \
    --disable-shared \
    --enable-small \
    --enable-static \
    --disable-network \
    --disable-swscale \
    --disable-postproc \
    --disable-videotoolbox \
    --disable-appkit \
    --disable-coreimage \
    --disable-avfoundation \
    --disable-pixelutils \
    --disable-symver \
    --disable-doc \
    --disable-runtime-cpudetect \
    --disable-avdevice \
    --disable-debug \
    --disable-ffplay \
    --disable-ffprobe \
    --disable-decoders \
    --enable-decoder=mp3 \
    --enable-decoder=aac \
    --enable-decoder=pcm_alaw \
    --enable-decoder=pcm_alaw_at \
    --enable-decoder=pcm_bluray \
    --enable-decoder=pcm_dvd \
    --enable-decoder=pcm_f16le \
    --enable-decoder=pcm_f24le \
    --enable-decoder=pcm_f32be \
    --enable-decoder=pcm_f32le \
    --enable-decoder=pcm_f64be \
    --enable-decoder=pcm_lxf \
    --enable-decoder=pcm_f64le \
    --enable-decoder=pcm_s16be \
    --enable-decoder=pcm_s16be_planar \
    --enable-decoder=pcm_s16le \
    --enable-decoder=pcm_s16le_planar \
    --enable-decoder=pcm_s24be \
    --enable-decoder=pcm_s24daud \
    --enable-decoder=pcm_s24le \
    --enable-decoder=pcm_s24le_planar \
    --enable-decoder=pcm_s32be \
    --enable-decoder=pcm_s32le \
    --enable-decoder=pcm_s32le_planar \
    --enable-decoder=pcm_s64be \
    --enable-decoder=pcm_s64le \
    --enable-decoder=pcm_s8 \
    --enable-decoder=pcm_s8_planar \
    --enable-decoder=pcm_sga \
    --enable-decoder=pcm_u16be \
    --enable-decoder=pcm_u16le \
    --enable-decoder=pcm_u24be \
    --enable-decoder=pcm_u24le \
    --enable-decoder=pcm_u32be \
    --enable-decoder=pcm_u32le \
    --enable-decoder=pcm_u8 \
    --enable-decoder=pcm_vidc \
    --disable-encoders \
    --enable-encoder=pcm_s16le \
    --disable-bsfs \
    --disable-parsers \
    --enable-parser=mpegaudio \
    --enable-parser=aac \
    --enable-parser=aac_latm \
    --disable-demuxers \
    --enable-demuxer=mp3 \
    --enable-demuxer=aac \
    --enable-demuxer=wav \
    --enable-demuxer=pcm_s16le \
    --enable-demuxer=mov \
    --disable-muxers \
    --enable-muxer=mp3 \
    --enable-muxer=matroska_audio \
    --enable-muxer=ac3 \
    --enable-muxer=wav \
    --enable-muxer=pcm_s16le \
    --disable-bsfs \
    --disable-filters \
    --enable-filter=aresample \
    --enable-libmp3lame \
    --enable-encoder=libmp3lame \
    --sysroot=$SYSROOT \
    --extra-ldflags="$EXTRA_LDFLAGS" \
    --extra-cflags="-Os -fpic $EXTRA_CFLAGS" \
    
# --enable-encoder=libmp3lame
    make clean all
    #这里是定义用几个CPU编译
    make -j8
    make install
}
# $OPTIMIZE_CFLAGS"



#编译arm
ARCH=aarch64
CPU=armv8-a
TOOL_CPU_NAME=aarch64
#输出目录
OUTPUT="$SOURCE_PATH/$BUILD_DIR_NAME/$ARCH"
TOOL_PREFIX="$TOOLCHAIN/bin/$TOOL_CPU_NAME-linux-android"
CC="$TOOLCHAIN/bin/$ARCH-linux-android$API-clang"
CXX="$TOOLCHAIN/bin/$ARCH-linux-android-"
OPTIMIZE_CFLAGS="-march=$CPU"
ARMEABI=arm64-v8a
LAMEDIR=/Users/leeorz/Documents/git/android/android-study/demo/libmp3lame-ndk-compile
EXTRA_LDFLAGS="-L$LAMEDIR/obj/local/$ARMEABI"
EXTRA_CFLAGS="-O2 -fpic -I$LAMEDIR/jni/libmp3lame_3.100 -I$LAMEDIR/jni/include $OPTIMIZE_CFLAGS"
ffmpegc


# #编译x86_64
# ARCH=x86_64
# CPU=x86-64
# TOOL_CPU_NAME=x86_64
# #输出目录
# OUTPUT="$SOURCE_PATH/$BUILD_DIR_NAME/$ARCH"
# TOOL_PREFIX="$TOOLCHAIN/bin/$TOOL_CPU_NAME-linux-android"
# CC="$TOOLCHAIN/bin/$ARCH-linux-android$API-clang"
# CXX="$TOOLCHAIN/bin/$ARCH-linux-android-"
# OPTIMIZE_CFLAGS="-march=$CPU"
# ffmpegc

#编译x86 32位
ARCH=x86
CPU=i686
TOOL_CPU_NAME=i686
#输出目录
OUTPUT="$SOURCE_PATH/$BUILD_DIR_NAME/$ARCH"
TOOL_PREFIX="$TOOLCHAIN/bin/$TOOL_CPU_NAME-linux-android"
CC="$TOOLCHAIN/bin/$CPU-linux-android$API-clang"
CXX="$TOOLCHAIN/bin/$CPU-linux-android-"
OPTIMIZE_CFLAGS="-march=$CPU"
ARMEABI=x86
LAMEDIR=/Users/leeorz/Documents/git/android/android-study/demo/libmp3lame-ndk-compile
EXTRA_LDFLAGS="-L$LAMEDIR/obj/local/$ARMEABI"
EXTRA_CFLAGS="-O2 -fpic -I$LAMEDIR/jni/libmp3lame_3.100 -I$LAMEDIR/jni/include $OPTIMIZE_CFLAGS"
ffmpegc

# FFmpeg-android的configuration
# configuration: --target-os=linux --cross-prefix=/root/bravobit/ffmpeg-android/toolchain-android/bin/i686-linux-android- --arch=x86 --cpu=i686 --enable-runtime-cpudetect --sysroot=/root/bravobit/ffmpeg-android/toolchain-android/sysroot --disable-asm --enable-pic --enable-libx264 --enable-libfreetype --enable-libmp3lame --enable-libvorbis --enable-libvpx --enable-libopus --enable-pthreads --enable-libass --enable-libfribidi --enable-fontconfig --enable-libfdk-aac --disable-debug --enable-version3 --enable-hardcoded-tables --disable-ffplay --disable-linux-perf --disable-doc --disable-shared --enable-static --enable-runtime-cpudetect --enable-nonfree --enable-network --enable-avresample --enable-avformat --enable-avcodec --enable-indev=lavfi --enable-hwaccels --enable-ffmpeg --enable-zlib --enable-gpl --enable-small --enable-nonfree --disable-asm --pkg-config=pkg-config --pkg-config-flags=--static --prefix=/root/bravobit/ffmpeg-android/build/x86 --extra-cflags='-I/root/bravobit/ffmpeg-android/toolchain-android/include -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -fno-strict-overflow -fstack-protector-all -march=i686' --extra-ldflags='-L/root/bravobit/ffmpeg-android/toolchain-android/lib -Wl,-z,relro -Wl,-z,now -pie' --extra-cxxflags=

    # --enable-parser=ac3 \
    # --enable-parser=dvaudio \
    # --enable-demuxer=flac \
    # --enable-bsf=aac_adtstoasc \
    # --enable-bsf=mp3_header_decompress \

    # --enable-muxer=flac \
    # --enable-parser=amr \
    # --enable-muxer=ogg \
    # --enable-demuxer=aax \
    # --enable-demuxer=ac3 \
    # --enable-demuxer=ogg \

    # --enable-muxer=mp4 \
    # --enable-demuxer=mpegvideo \
    # --enable-demuxer=moflex \

    # --enable-demuxer=mmf \
    # --enable-demuxer=mods \

    # --enable-demuxer=mlp \
    # --enable-demuxer=mlv \
    # --enable-demuxer=mm \
    # --enable-demuxer=m4v \
    # --enable-demuxer=matroska \
    # --enable-demuxer=mca \
    # --enable-demuxer=mcc \
    # --enable-demuxer=mgsts \
    # --enable-demuxer=microdvd \
    # --enable-demuxer=mjpeg \
    # --enable-demuxer=mjpeg_2000 \

# --enable-demuxer=libgme \
#     --enable-demuxer=libmodplug \
#     --enable-demuxer=libopenmpt \
#     --enable-demuxer=live_flv \
#     --enable-demuxer=lmlm4 \
#     --enable-demuxer=loas \
#     --enable-demuxer=lrc \
#     --enable-demuxer=luodat \
#     --enable-demuxer=lvf \
#     --enable-demuxer=lxf \

    # --enable-demuxer=imf \
    # --enable-demuxer=ingenient \
    # --enable-demuxer=ipmovie \
    # --enable-demuxer=ipu \
    # --enable-demuxer=ircam \
    # --enable-demuxer=iss \
    # --enable-demuxer=iv8 \
    # --enable-demuxer=ivf \
    # --enable-demuxer=ivr \
    # --enable-demuxer=jacosub \
    # --enable-demuxer=jv \
    # --enable-demuxer=kux \
    # --enable-demuxer=kvag \

    # --enable-demuxer=image_qdraw_pipe \
    # --enable-demuxer=image_qoi_pipe \
    # --enable-demuxer=image_sgi_pipe \
    # --enable-demuxer=image_sunrast_pipe \
    # --enable-demuxer=image_svg_pipe \
    # --enable-demuxer=image_tiff_pipe \
    # --enable-demuxer=image_vbn_pipe \
    # --enable-demuxer=image_webp_pipe \
    # --enable-demuxer=image_xbm_pipe \
    # --enable-demuxer=image_xpm_pipe \
    # --enable-demuxer=image_xwd_pipe \
#   disable-decoders 去掉对m4a无效
#   disable-parsers 去掉对m4a无效
# --disable-demuxers \
#     --enable-demuxer=mp3 \
#     --enable-demuxer=aac \
#     --enable-demuxer=aax \
#     --enable-demuxer=ac3 \
#     --enable-demuxer=ogg \
#     --enable-demuxer=flac \
#     --enable-demuxer=wav \
#     --enable-demuxer=mpegvideo \
#     --enable-demuxer=pcm_s16le \


    # --enable-decoder=mp3_at \
    # --enable-decoder=mp3adu \
    # --enable-decoder=mp3adufloat \
    # --enable-decoder=mp3float \
    # --enable-decoder=mp3on4 \
    # --enable-decoder=mp3on4float \
    # --enable-decoder=mpeg4 \

# WARNING: Option --enable-demuxer=matroska_audio did not match anything
# WARNING: Option --enable-muxer=aac did not match anything
# WARNING: Option --enable-muxer=aax did not match anything
    # --disable-avfilter \
    # --disable-swresample \
    # --enable-ffmpeg \

# cd /Users/leeorz/Downloads/ffmpeg
# pwd
# ./configure

# 编译到android
# --cross-prefix=arm-linux- --enable-cross-compile --target-os=android --cc=arm-linux-gcc --arch=arm 


# ./configure --disable-logging --disable-avfilter
# ./configure \
#     --prefix=./ffmpeg_build \
# #   --prefix=/usr/local \
#     # --enable-gpl \
# #    --enable-nonfree \
# #    --enable-libass \
# #    --enable-libfdk-aac \
# #    --enable-libfreetype \
# #    --enable-libmp3lame \
#     # --enable-libtheora \
#     # --enable-libvorbis \
#     # --enable-libvpx \
# #    --enable-libx264 \
# #    --enable-libx265 \
#     # --enable-libopus \
#     # --enable-libxvid \
#     --disable-logging \
#     --disable-avfilter \
#     --disable-network \
#     --disable-swscale \
#     --disable-swresample \
#     --disable-postproc \
#     --disable-doc \
#     --disable-avdevice \
#     --disable-ffprobe \
#     --disable-ffplay \
#     --samples=fate-suite /

# make clean
# make install