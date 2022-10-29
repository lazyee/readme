##### 命令行创建Application
```shell
flutter create xxxx
```
##### 指定iOS和Android的开发语言
```shell
flutter create -i swift -a kotlin xxxx
flutter create -i objc -a kotlin xxxx
flutter create -i swift -a java xxxx
flutter create -i objc -a java xxxx
```

##### 命令行创建Module
```shell
flutter create -t module xxxx
# or
flutter create --template module xxxx
```

##### 命令行创建Plugin
```shell
flutter create -t plugin xxxx
# or
flutter create --template plugin xxxx
```

##### 命令行创建package
```shell
flutter create -t package xxxx
# or
flutter create --template package xxxx
```
#### flutter开启或者关闭某平台支持
```shell
#查看flutter配置
flutter config
flutter config --enable-web
flutter config --no-enable-web
flutter config --enable-macos-desktop
flutter config --no-enable-macos-desktop
flutter config --enable-windows-desktop
flutter config --no-enable-windows-desktop
```
