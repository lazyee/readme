### 检测Content Provider是否exported=true
##### 问题描述
`Content Provider`是安卓应用组件，以表格的形式把数据展给外部的应用。
每个`Content Provider`都对应一个以`content://`开头的特定`URI`，任何应用都可以通过这个`UR`操作`Content Provider`应用的数据库。
如果应用对权限控制不当就会造成信息泄露。
##### 检查方法：
1. 使用`drozer`获取所有可以访问的`URI`： 
    ```shell
    run scanner.provider.finduris -a packageName
    #packageName是待检测的应用包名
    ```
2. 使用`drozer`获取各个`URI`的数据：
    ```shell
    run app.provider.query content://com.mwr.example.sieve.DBContentProvider/Passwords/
    #content://com.mwr.example.sieve.DBContentProvider/Passwords是上一步骤中得到的可以访问的URI）
    ```
##### 整改建议
在被测应用的`AndroidManifest.xml`文件中，设置`provider`的`android:exported`属性为`false`或者通过设置自定义权限来限制对`Content Provider`的访问。
### 检测Activity是否exported=true
##### 问题描述
Activity是安卓应用组件，提供与用户进行交互的界面，如果应用对权限控制不当，可以绕过登录界面直接显示该界面。
##### 检查方法
1. 使用`drozer`检查APK中是否存在暴露的`activity`
    ```shell
    run app.activity.info -a packageName是待检测的应用包名
    #packageName是待检测的应用包名
    ```
2. 使用命令启动activity
    ```shell
    run app.activity.start --component packageName componentName
    #packageName是待检测的应用包名
    #componentName activity包名
    ```