## Windows 下手动分布安装 openpilot 教程

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
<img src="/files/enable_usb_debug_1.png" class="max-h-300" />
<img src="/files/enable_usb_debug_2.png" class="max-h-300" />
<img src="/files/enable_usb_debug_3.png" class="max-h-300" />
</center>

### 安装驱动

[adb 和 fastboot 安装工具下载](http://d.sdut.me/adb/)

[一加手机3T工具箱 V2.0.0 下载](http://d.sdut.me/%E4%B8%80%E5%8A%A0%E6%89%8B%E6%9C%BA3T%E5%B7%A5%E5%85%B7%E7%AE%B1V2.0.0/)
- 上面提供的 2 个软件功能重叠，可全安装，或者只选择第 "一加手机3T工具箱V2.0.0" 安装。
- **一加手机3T工具箱** 启动后，选择第 1 项、第 2 项 安装驱动。

<center>
<img src="/files/oneplus_tools.png" alt="一加手机3T工具箱V2.0.0" class="max-h-500" />
</center>


### 解锁 Bootloader

**『一加手机3T工具箱』 启动后，可选择第 3 项、第 4 项 可以解锁，如果不确定是否解锁成功，可以使用下列步骤手动解锁。**


1. 按住一加手机『音量上』和 『电源键』进入 Fastboot 模式（乐视 pro3 是 『音量下』 和 『电源键』）。
<center>
<img src="/files/fastboot_mode_lock.jpg" alt="fastboot 模式解锁前" class="max-h-400" />
<img src="/files/fastboot_mode_unlock.jpg" alt="fastboot 模式解锁后" class="max-h-400" />
</center>
<center>解锁前 和 解锁后 fastboot 界面不同，DEVICE STATE 由 locked 变为 unlocked</center>
<br/>
2. 在命令行窗口运行 `fastboot.exe oem unlock` 命令。
<center>
<img src="/files/fastboot_oem_unlock.png" alt="解锁 bootloader" class="max-h-200" />
</center>
<br/>
3. 操作手机，选择解锁 Bootloader（音量键选择，电源键确认）。
<center>
<img src="/files/bootloader_unlock_select.jpg" alt="解锁 bootloader" class="max-h-300">
</center>
<br/>
4. 等待手机重启并解锁 Bootloader 后进入系统。


### 刷写 NEOS 系统

1. 按住一加手机『音量上』和 『电源键』进入 Fastboot 模式（乐视 pro3 是 『音量下』 和 『电源键』）。
<center>
<img src="/files/fastboot_mode_unlock.jpg" alt="fastboot 模式解锁后" class="max-h-400" />
</center>
2. 下载你所需要版本的 NEOS 系统镜像（v版本号越大，版本越新：[NEOS 系统下载](http://d.sdut.me/neos/)）  
3. 解压并将 boot.img 和 system.simg 放到 c 盘尽量短的目录内
<center>
<img src="/files/neos_files.png" alt="NEOS 系统镜像文件" class="max-h-300" />
</center>
4. 打开命令行，进入到 fastboot 目录，运行刷写固件的命令
```bash
fastboot.exe flash boot c:\tmp\v12\boot.img
fastboot.exe flash system c:\tmp\v12\system.simg
fastboot.exe erase userdata
fastboot.exe erase cache
``` 
<center>
<img src="/files/flash_neos.png" alt="刷入NEOS 系统" class="max-h-600" />
</center>
5. 写入完成后，使用命令 或 操作手机，重启即可进入 openpilot 
```bash
fastboot.exe reboot
```

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
