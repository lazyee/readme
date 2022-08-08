```
void packageAAR(project,android,name){
    android.libraryVariants.all{ variant->
        //自定义aar名称
        variant.outputs.all{
            def currentTime = new Date().format("yyyyMMddHHmmss",TimeZone.getDefault())
            def aarName = "${name}_${currentTime}_V${android.defaultConfig.versionName}"
            if (variant.buildType.name == 'debug') {
                aarName +=  "_debug"
            }
            outputFileName = aarName + ".aar"
        }

        //复制AAR到指定目录
        def assembleTask
        if(variant.hasProperty("assembleProvider")){
            assembleTask = variant.assembleProvider.get()
        }else {
            assembleTask = variant.assemble
        }

        assembleTask.doLast { assemble ->
            def outputPath = [".","outputs"].join(File.separator)
            copy {
                from variant.outputs*.outputFile
                into outputPath
            }
        }
    }
}
```

### 使用方式
1. 上述代码复制到`module`的`build.gradle`空白处
2. 在`android`模块中,添加`packageAAR(project,android,"aarName")`
3. 执行`module`模块的`assembleDebug`或者`assembleRelease`方法
4. 在`module`的`outputs`目录下查找生成的`aar`

