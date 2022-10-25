###### 查看分支
```shell
git branch
#查看所有的远程分支
git branch -r
```

###### 修改本地分支名
```shell
git branch -m oldName newName
```
###### 修改远程分支名
```shell
git branch -m oldName newName
git push origin :oldName
git push --set-upstream origin newName
```

###### 切换分支
```shell
git checkout xxxx
```
###### 创建本地分支,并且切换到分支
```shell
git checkout -b xxxx
```
##### 创建本地分支并关联远程分支
```shell
git checkout -b 本地分支 origin/远程分支
```

##### 删除本地分支
```shell
git branch -d xxxx
```
##### 删除远程分支
```shell
git push origin --delete xxxx
```

#### 拉取分支
```shell
git pull
```