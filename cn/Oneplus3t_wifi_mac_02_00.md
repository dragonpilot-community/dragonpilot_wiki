## 一加3T手机WIFI mac 丢失问题

-------
**重要：**

**不要在 Android 9.0 系统下解锁刷机！！！**

**请先降级到 Android 8.0 系统以下再刷机！！！**

**否则会出现 fastboot `FAILED (status read failed (Too many links)) 的报错！！`**

**同时会导致 mac 丢失的问题！！**

-------

### 起因

最近在对一加3T手机刷机过程电脑突然报了一个错误信息，`usb_read failed with status e00002eb`，然后刷机进程就中断了。

![usb_read failed with status e00002eb](/files/usb_error.jpg)

重试刷机后，虽然刷机过程一切正常，但是手机出现了一个奇怪的问题，起先在 Android 系统下，一切正常，WIFI地址获取正常、蓝牙开关连接正常，但是刷完 Openpilot 以后，
发现 WIFI 无法正常使用，WIFI mac 地址 变成了 `02:00:00:00:00:00`，并且无法打开 WIFI 连接。

![mac address 02:00:00:00:00:00](/files/mac_02_00_00.jpg)


WIFI 无法连接，那我怎么去下载 Openpilot 呢，怎么连接手机 SSH 进行操作呢，真的是只能离线使用了。

有微信群友建议使用 usb-eth 连接手机，我找到了一个 usb-eth 但是尝试后发现，手机并不能识别我的这个 USB网卡，可能是 NEOS 目前只支持特定网卡芯片驱动的原因。

### 探究原因

后来得知，一般出现莫名其妙的刷机问题，都有可以通过 [9008救砖工具](#) 解决，于是找了一台 Windows 台式机，尝试使用工具修复，但是修复完毕后，在使用 TWRP 恢复备份的时候，又出现了 `Failed to mount '/persist'(Invalid argument)` 的报错提示。

![Failed to mount '/persist'(Invalid argument)](/files/twrp_persist_error.jpg)


由 TWRP 的报错得知，可能出问题的是手机 `persist` 分区，经过一番了解：

> persist分区是用于保存FRP(factory reset protcect)功能用到帐号、密码等受保护的信息，避免在恢复出厂设置后被清空。

> 什么是Persist分区：Persist分区是系统的一个ext4分区，由于我们的线刷包都不包含这个分区，所以你需要自己动手修复，这个分区内包含DRM相关文件、传感器注册表、你的wifi、蓝牙、mac地址都在这里了。

> 一般解锁手机都要强制禁止访问PERSIST分区中的账号信息，因此需要配合修改版的系统，让系统不读取账号信息也能工作（原生安卓表示你们都是渣渣）


> 检查系统persist分区或主板硬件wf模块persist分区里面有个文件persist.img管蓝牙和wf的       Persist: persist分区是系统的一个ext4分区，这个分区内包含DRM相关文件、传感器注册表、你的wifi、蓝牙、mac地址都在这里了，如果你发现指南针不动了，陀螺仪没反应了，相机打开要好几秒了，那么恭喜你，多半是Pensist分区问题



### 解决问题


于是找微信群大佬们导出了别人手机里的 persist.img 镜像，然后倒入到我的手机里，然后重启进入系统，问题解决了，不过因为倒入的是别人手机的 persist 分区信息，所以，我的手机 WIFI mac 地址变得和别人一样，但是并无大碍。

#### 从正常使用的手机中导出 persist.img 镜像到电脑

找到一台可以正常使用的手机，连接到电脑，开启 adb 调试，重启进入 TWRP 模式，在电脑端命令行运行：
  
```bash
# 把 persist 镜像备份到 /sdcard/persist.img
adb shell "dd if=/dev/block/bootdevice/by-name/persist of=/sdcard/persist.img"

# 把 persist.img 镜像 下载到电脑上
adb pull /sdcard/persist.img  ~/
```

#### 把 persist.img 镜像导入到 mac 丢失的手机

丢失 mac 的手机，连接到电脑，开启 adb 调试，重启进入 TWRP 模式，在电脑端命令行运行：

```bash
# 把 persist.img 镜像 上传到手机
adb push ~/persist.img /sdcard/persist.img

# 把 persist.img 镜像写入 persist 分区
adb shell "dd if=/sdcard/persist.img of=/dev/block/bootdevice/by-name/persist"

# 重启手机
adb shell reboot
```


这里操作的是 persist 分区，其他分区（firmware、dsp、bt_firmware）也是一样的原理，替换分区名字就可以了。
