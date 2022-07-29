### drozer[地址](https://labs.withsecure.com/tools/drozer/)
### [用户指南地址](https://labs.withsecure.com/assets/BlogFiles/mwri-drozer-user-guide-2015-03-23.pdf)
-------
#### macos环境
1. 下载`drozer`包,例如`drozer-2.4.4-py2-none-any.whl`(`drozer`只能在`python2.7`运行)
    ```shell
    pip install drozer-2.4.4-py2-none-any.whl
    ```
2. pip下载twisted
    ```shell
    pip install twisted
    ```
3. 下载`agent.apk`或者使用`drozer`编译`agent.apk`并且安装到手机,安装完成之后点击`Embedded Server`开关开启服务
    ```shell
    drozer agent build
    ```
4. 设置端口转发,默认情况下，`drozer`使用`31415`端口
    ```shell
    adb forward tcp:31415 tcp:31415
    ```
5. `drozer`链接到控制台
    ```shell
    drozer console connect
    ```
-------
### 执行命令的时候遇到的问题
#### drozer could not find or compile a required extension library.
```shell
dz> run scanner.provider.finduris -a cn.cmit.smartoffice
Scanning cn.cmit.smartoffice...
drozer could not find or compile a required extension library.
```
这是因为我本地的电脑安装了pyenv,需要硬编码来依赖相应的模块
#### 解决方法
找到当前版本的python安装的包路径
```shell
/Users/leeorz/.pyenv/versions/2.7.18/lib/python2.7/site-packages/pydiesel/reflection/utils/class_loader.py
```
修改apk_path即可
```
#apk_path = os.path.join(relative_to, *source_or_relative_path.split("/"))
apk_path = "/Users/leeorz/.pyenv/versions/2.7.18/lib/python2.7/site-packages/drozer/modules/common/ZipUtil.apk"
java_path = apk_path.replace(".apk", ".java")
```