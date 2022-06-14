##### 克隆指定版本tag的源码
```shell
git clone --branch 1.0.0 https://xxxxxxxxxxx
```
##### 创建本地tag
```shell
git tag -a 1.0.0 -m 'message'
```
##### 推送单个tag
```shell
git push origin 1.0.0
```
##### 推送全部tag (未验证)
```shell
git push origin --tags
```
##### 删除本地tag
```shell
git tag -d 1.0.0
```
##### 删除远程tag
```shell
git push origin :refs/tags/1.0.0
```

