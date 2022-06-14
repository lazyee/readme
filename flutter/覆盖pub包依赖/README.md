flutter开发中经常会遇到,自己项目依赖的pub包版本过新,但是第三方包也依赖了这个包,但是版本比较旧,这个时候就需要使用`dependency_overrides`统一该pub包在项目中的版本

在`pubspec.yaml`中添加
```shell
dependency_overrides:
  decimal: 1.5.0
```
