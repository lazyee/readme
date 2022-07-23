#!/bin/bash
# FFMPEG 配置选项详细说明
# https://cloud.tencent.com/developer/article/1393972
# ffmpeg减少编译包体积技巧
# https://blog.csdn.net/u010926168/article/details/124530522


#FFMPEG源码路径
SOURCE_PATH=/Users/leeorz/Downloads/ffmpeg
BUILD_DIR_NAME=ffmpeg_mac_build
OUTPUT="$SOURCE_PATH/$BUILD_DIR_NAME"
cd $SOURCE_PATH
# pwd
echo "删除[$BUILD_DIR_NAME]文件夹"
rm -rf $BUILD_DIR_NAME
mkdir $BUILD_DIR_NAME

function ffmpegc
{

    ./configure \
    --prefix=$OUTPUT \
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
    --enable-decoder=pcm_s16le \
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

    make clean all
    #这里是定义用几个CPU编译
    make -j8
    # make install
}

ffmpegc


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