##### [为 Android 编译 openssl 的注意事项](https://www.bilibili.com/read/cv17026966/)
修改 15-android.conf,将生成的so包移除版本后缀,位置在Configurations/15-android.conf中
```
my %targets = (
    "android" => {
        inherit_from     => [ "linux-generic32" ],
        template         => 1,
        ################################################################
        # Special note about -pie. The underlying reason is that
        # Lollipop refuses to run non-PIE. But what about older systems
        # and NDKs? -fPIC was never problem, so the only concern is -pie.
        # Older toolchains, e.g. r4, appear to handle it and binaries
        # turn out mostly functional. "Mostly" means that oldest
        # Androids, such as Froyo, fail to handle executable, but newer
        # systems are perfectly capable of executing binaries targeting
        # Froyo. Keep in mind that in the nutshell Android builds are
        # about JNI, i.e. shared libraries, not applications.
        cflags           => add(sub { android_ndk()->{cflags} }),
        cppflags         => add(sub { android_ndk()->{cppflags} }),
        cxxflags         => add(sub { android_ndk()->{cflags} }),
        bn_ops           => sub { android_ndk()->{bn_ops} },
        bin_cflags       => "-pie",
        enable           => [ ],
        shared_extension => ".so",###加入这行,指定后缀
    },
```
