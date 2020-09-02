## EON 手机分区一键备份恢复工具

因为自己碰到了 [一加3T手机WIFI mac 丢失问题](Oneplus3t_wifi_mac_02_00.md)，而且最近在微信群里也有其他朋友出现了类似情况，让我觉得备份手机的一些分区是非常重要的，可以在手机出现一些奇怪的问题是，进行恢复使用。

因此，自己写了一个脚本，用来备份和恢复系统的一些分区（可能这些分区是闻所未闻，平时也不会操作的，但是一旦分区出现了问题，也可能影响手机正常使用）。


Github: [openpilot_partition_backup](https://github.com/Rming/openpilot_partition_backup)


### 使用教程

如果手机可以开机，并且可以通过 SSH 连接到手机操作，如果手机无法正常开机，则重启手机进入TWRP模式下操作。

#### 开机SSH状态下的操作步骤

1. 手机正常开机并联网
2. 电脑通过局域网连接到手机 SSH

```bash
# 把脚本下载到 /sdcard 目录（可选，因为用户目录不可写）
cd /sdcard/

# 下载脚本 zip 包
wget https://github.com/Rming/openpilot_partition_backup/archive/master.zip

# 解压 zip 包，打开脚本目录
unzip master.zip && cd openpilot_partition_backup-master

# 运行程序
bash partition_backup.sh
```


#### 在TWRP模式下的操作步骤

1. 手机连接到电脑，开启 adb 调试、解锁 bootloader，重启进入 TWRP 模式
2. 在电脑端命令行运行：
  
```bash
# 下载脚本文件 zip 包
wget https://github.com/Rming/openpilot_partition_backup/archive/master.zip

# 解压 zip 包
unzip master.zip

# 把脚本文件上传到手机 /sdcard
adb push openpilot_partition_backup-master /sdcard/

# 进入手机 shell
adb shell

```

3. 在手机 shell 中运行


```bash
source /sdcard/openpilot_partition_backup-master/bash_init.sh
bash /sdcard/openpilot_partition_backup-master/partition_backup.sh
```


### 演示

![下载脚本并备份 persist 分区](/files/1.gif)
<center>下载脚本并备份 persist 分区</center>

---------

![备份所有分区](/files/2.gif)
<center>备份所有分区</center>

---------


![使用备份恢复 persist 分区](/files/3.gif)
<center>使用备份恢复 persist 分区</center>

---------


![使用备份恢复所有分区](/files/1.gif)
<center>使用备份恢复所有分区（没有镜像自动跳过）</center>

---------


