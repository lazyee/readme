## git 还原到某次提交
#### reset
1. git log 查看提交记录
2. 选择某次提交的commit ID
3. 使用git reset --hard [commit ID]
```shell
git reset --hard 8a86bfae22855227d4e5bc848af5f50b338308b1
```