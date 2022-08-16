### 使用Android SDK中自带的签名工具`apksigner`进行签名
#### apksigner 
是android sdk24推出的签名工具,在V1基础上增加了V2签名策略,所以在古早版本之前是没有`apksigner`的,需要使用JDK的`jarsigner`,所以这里不做讨论

#### 关于V1和V2签名
从Android 7(24)开始, 谷歌增加新签名方案 V2 Scheme (APK Signature);
但Android 7(24)以下版本, 只能用旧签名方案 V1 scheme (JAR signing)
##### V1签名:
来自JDK(jarsigner), 对zip压缩包的每个文件进行验证, 签名后还能对压缩包修改(移动/重新压缩文件)
对V1签名的apk/jar解压,在META-INF存放签名文件(MANIFEST.MF, CERT.SF, CERT.RSA),
其中MANIFEST.MF文件保存所有文件的SHA1指纹(除了META-INF文件), 由此可知: V1签名是对压缩包中单个文件签名验证
##### V2签名:
来自Google(apksigner), 对zip压缩包的整个文件验证, 签名后不能修改压缩包(包括zipalign),
对V2签名的apk解压,没有发现签名文件,重新压缩后V2签名就失效, 由此可知: V2签名是对整个APK签名验证
V2签名优点很明显:
签名更安全(不能修改压缩包)
签名验证时间更短(不需要解压验证),因而安装速度加快
注意: apksigner工具默认同时使用V1和V2签名,以兼容Android 7.0以下版本

#####  Example
```shell
./apksigner sign --ks [keyPath] --ks-key-alias [alias] --ks-pass pass:[keyPassword]  --key-pass pass:[aliasPassword] --out [outputPath] input.apk
```
##### 参数:
    --ks                 签名文件路径
    --ks-key-alias       生成签名文件的时候指定的的alias
    --ks-pass            keystore密码
    --key-pass           对应alias的密码
    --v1-signing-enabled 是否开启V1签名,默认开启
    --v2-signing-enabled 是否开启V2签名,默认开启
    --out                签名后的apk输出路径

### keytool 查看apk签名信息
```shell
keytool -printcert -jarfile [apkPath]
```