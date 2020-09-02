## macOS 下手动安装 openpilot 教程

-------
**重要：**

**不要在 Android 9.0 系统下解锁刷机！！！**

**请先降级到 Android 8.0 系统以下再刷机！！！**

**否则会出现 fastboot `FAILED (status read failed (Too many links)) 的报错！！`**

-------


### 开启手机 USB 调试

1. 打开 "设置 - 关于手机 - 版本号"，连续点击版本号 7 次以上，打开开发者选项设置
2. 重新进入 "设置 - 开发者选项"，开启 "OEM 解锁" 选项，开启 USB 调试选项  

参考视频：[一加3T手机开启手机USB调试模式](https://www.bilibili.com/video/av76104673/)

<center>
<img src="/files/enable_usb_debug_1.png" class="max-h-300">
<img src="/files/enable_usb_debug_2.png" class="max-h-300">
<img src="/files/enable_usb_debug_3.png" class="max-h-300">
</center>

### 安装 NEOS 系统

1. 打开官方地址：https://github.com/commaai/eon-neos
2. 按照 Restoring on OS X 步骤操作，安装软件
- 确保已经安装了 Homebrew （https://brew.sh）
- 运行下列命令，安装必要软件
```bash
# 解压、压缩系统镜像要用
brew install unzip simg2img
#
# fastboot 和 adb 工具
brew cask install android-platform-tools
```
3. 按住一加手机『音量上』和 『电源键』进入 Fastboot 模式（乐视 pro3 是 『音量下』 和 『电源键』）。
4. 使用 git clone https://github.com/commaai/eon-neos 项目，并打开目录、运行 `./download.py` 下载系统镜像
5. 系统镜像下载完成后，手机（处于 fastboot 模式）通过 USB 连接到电脑，运行 `./flash.sh`
6. 不要断开你的手机，直到脚本运行结束，刷机完成


<center>
{% bilibili %}av66821136{% endbilibili %}
</center>
