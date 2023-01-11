### ffmpeg 常用参数参数
|参数|描述|取值|
|:--|:--|:--|
|-ss |指定了视频的时分秒|hh:mm:ss.0 or 100.1(秒数)|
|-i |指定输入文件的路径|/xxx/yyy.mp3|
|-y |输出文件默认覆盖|-|
|-vn|表示vedio not，即输出不包含视频|-|
|-t |持续时间|hh:mm:ss.0 or 100.1(秒数)|
|-to| 到小时：分：秒.毫秒 处截止|hh:mm:ss.0 or 100.1(秒数)|
### 剪切视频
对视频进行原样输出(这种方式可能存在开头卡住和结尾花屏的问题,但是速度较快)
```shell
ffmpeg -i input.mp4 -ss 00:00:00 -t 00:03:00 -vcodec copy -acodec copy output.mp4
```
对视频进行原样输出(非常非常非常非常非常非常慢,重编码)
```shell
ffmpeg -i input.mp4 -ss 00:00:00 -t 00:03:00 -vcodec copy -b:v 0 output.mp4
```
-vcodec copy -b:v 0 保证剪切出来的视频分辨率不会变化

### 拼接音频
```shell
ffmpeg -i "concat:xxxx.mp3|yyyy.mp3" -acodec copy output.mp3
```

### 移除视频水印
ffmpeg的去处水印并不是完整去除,而是对其进行涂抹
### 抽取视频图片
##### 1.截取一张特定时间点的图片
```shell
ffmpeg -ss hh:mm:ss -i input.mp4 -vframes 1 output.jpg
```
###### 参数
    -vframes 1 表示视频的第一帧。
上述指令，会自动选取最接近设定时间点的位置，并执行截屏。这个速度非常快。
当然也可以使用 -q:v 1，用于指定在时间点附近，选取图像质量最高的那一张。
##### 2.每秒钟截取一张
```shell
ffmpeg -i input.mp4 -vf fps=1 image_%d.jpg
```
###### 参数
    -vf fps=1 表示 frame per second截取一张
    image_%d.png 会生成类似 image_1.png iamge_2.png等文件。

##### 3.每间隔X时间截取一张
```shell
ffmpeg -i input.mp4 -vf fps=1/500 image_%d.jpg
```
这个指令是，每间隔500秒，截取一张图片。

##### 4.每间隔X个关键帧截取一张
```shell
ffmpeg -i input.mp4 -vf "select='eq(pict_type,PICT_TYPE_I)'" -vsync vfr image_%d.jpg
```
上述指令会选取间隔帧选取一张图像元素完整，没有缺损的帧，并截屏返回。在做图片故事梗概的时候很有用。

### 从视频中导出音频
```shell
ffmpeg -i xxxxx.mp4 -f mp3 -vn xxxxx.mp3
```
###### 参数
    -f 表示format，即输出格式

### 剪切音频
```shell
ffmpeg -y -ss 00:00:00.0 -to 00:00:00.0 -i xxxxx.mp3 -vn -acodec copy xxxxx_cut.mp3
```
###### 参数
    -ac 1 设置声道数为1
    -ar 48000 设置采样率为48000Hz

###  修改音频文件采样率：
```shell
ffmpeg -i input.wav -ar 16000 output.wav
```

### 多通道变单通道
```shell
ffmpeg -i input.wav -ac 1 output.wav
```

### 转换格式
```shell
ffmpeg -i input.mp3 output.wav
```

### 提取一个通道并重采样
```shell
ffmpeg -i input.wav -ac 1 -ar 16000 output.wav

ffmpeg -loglevel quiet -i input.mp3  -acodec pcm_s16le -ar 8000 -ab 16k -ac 1 output.wav
```
### 修改采样精度（位数）
```shell
ffmpeg -y -i input.wav -ac 1 -ar 16000 -vn output.wav
```

### 导出pcm文件
```shell
# 指定时间导出
#ffmpeg -y -ss 00:00:00.0 -to 00:00:00.0 -i xxxxx.mp3 --ar 8000 -f s16le xxxxx_cut.mp3
# 导出全部
ffmpeg -y -i xxxxx.mp3 --ar 8000 -f s16le xxxxx_cut.mp3
```

### GIF
```shell
ffmpeg -i input.mp4 -s 640:360 output.gif
```
-s: 设置输出size

### 转换成DVD的视频
```shell
ffmpeg -i clip.mp4 -f dvd -target ntsc-dvd -r 30000/1001 -vf scale=720:480 -aspect 16:9 -vb 8000k -g 12 -mbd rd -trellis 1 -flags +mv0 -cmp 0 -subcmp 2 clip.mpg

ffmxpeg -i input.mp4 -y -target pal-dvd -aspect 16:9 output.mpg
```
