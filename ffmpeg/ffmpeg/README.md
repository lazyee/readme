### 从视频中导出音频
```shell
ffmpeg -i xxxxx.mp4 -f mp3 -vn xxxxx.mp3
```
-i 表示input，即输入文件
-f 表示format，即输出格式
-vn表示vedio not，即输出不包含视频

### 剪切音频
```shell
ffmpeg -y -ss 00:00:00.0 -to 00:00:00.0 -i xxxxx.mp3 -vn -acodec copy xxxxx_cut.mp3
```
-ss 从 小时：分：秒 处开始切割 
-t 持续时间
-to 到小时：分：秒.毫秒 处截止
-ac 1 设置声道数为1
-ar 48000 设置采样率为48000Hz

### 查看音频格式：
```shell
ffprobe input.wav
```

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
ffmpeg -i input.mp3 outpit.wav
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
