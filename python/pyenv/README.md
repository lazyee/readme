### 使用pyenv配置Python (Mac)

##### 安装pyenv
```shell
brew install pyenv
```

##### 添加环境变量到~/.zshrc 或者 ~/.bash_profile中
```shell
export PYENV_ROOT=/usr/local/var/pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
```

##### 查看正在使用的python版本
```shell
pyenv version
```

#####  查看系统支持的python版本
```shell
pyenv versions
```

##### 查看可以安装的python有哪些
```shell
pyenv install -l
```

##### 安装指定版本的python
```shell
 pyenv install 3.6.0
```


##### 全局切换python版本
```shell
 pyenv global 3.6.0
```