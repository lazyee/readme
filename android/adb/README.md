### 查看设备
```shell
adb devices -l
```
### 查看adb服务占用的端口
```shell
adb nodaemon server
```
### adb连接指定设备
```shell
adb -s xxxxxx shell
```

### adb拉取文件
```shell
adb -s xxxxxxx pull /storage/self/primary/xxxxx.txt /Users/xxxx/Desktop
```

### adb推送文件
```shell
adb -s xxxxxxx push /Users/xxxx/Documents/xxxxx.mp3 /storage/emulated/0
```