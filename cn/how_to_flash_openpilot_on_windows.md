## Windows 下一键安装 openpilot 教程

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



### 下载运行一键安装脚本

1. 下载 [Windows 一键安装包（v14）](http://d.sdut.me/neos/auto_install_v14_win.zip)
2. 解压并打开目录，运行脚本 `flash.bat`，按照脚本提示进行操作

参考视频：[Windows 下一键安装 openpilot 全纪录](https://www.bilibili.com/video/av76232185/)

**如果一键安装失败，请参考 [Windows 下手动分布安装 openpilot 教程](/cn/how_to_flash_openpilot_on_windows_step_by_step.md)**

<center><img src="/files/windows_flash_neos1.png"></center>
<center><img src="/files/windows_flash_neos2.png"></center>


### 系统初始化设置

手机将在重启后进入 openpilot 系统，但是在使用之前，还需要链接无线WIFI、编译安装openpilot，当然这些都是自动完成的，我们只需要按照界面提示，选择确认即可。

<center>
<img src="/files/openpilot_init_1.jpg" alt="openpilot 初始化" class="max-h-100" />
<img src="/files/openpilot_init_2.jpg" alt="openpilot 初始化" class="max-h-100" />
</center>

<center>
<img src="/files/openpilot_init_3.jpg" alt="openpilot 初始化" class="max-h-100" />
<img src="/files/openpilot_init_4.jpg" alt="openpilot 初始化" class="max-h-100" />
</center>

<center>
<img src="/files/openpilot_init_5.jpg" alt="openpilot 初始化" class="max-h-100" />
<img src="/files/openpilot_init_6.jpg" alt="openpilot 初始化" class="max-h-100" />
</center>

<center>
<img src="/files/openpilot_init_7.jpg" alt="openpilot 初始化" class="max-h-100" />
<div style="width:220px;height:10px;display:inline-block;"></div>
</center>

<center>
{% bilibili %}av76232185{% endbilibili %}
</center>
