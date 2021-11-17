## NEOS 降级指南

NEOS 是运行在 EON 上的，基于 Android 6.0 改造的系统，为了适配 openpilot 的版本更新， NEOS 系统也在不断的更新，新版本的 NEOS 没有开源系统代码，但是官方会在 Github 释放出下载链接，如果你的系统安装了新版的 openpilot，也会收到系统升级提示，可以通过点击升级按钮升级系统。

- commaai/eon-neos：[https://github.com/commaai/eon-neos](https://github.com/commaai/eon-neos)
- neos 镜像下载地址请到常用软件下载中下载：[常用软件资料下载](openpilot_software_free_download.md)


### 系统版本

但是有时候，我们需要运行旧版本的 openpilot，但新版本的 NEOS 系统无法正常使用，所以需要先降级 NEOS，然后安装 旧版本 openpilot。

备注：比如，你需要运行 arne-0512 版本，那么你需要下载安装 NEOS 9，然后安装 openpilot。


下表是 openpilot 版本和 NEOS 版本的对应关系：

openpilot 版本| NEOS 版本
-|-
0.5.xx| 9
0.6.0 ~ 0.6.3| 10.3
0.6.4 | 10.4
0.6.5 ~ 0.6.6| 12
0.7.0 | 13
0.7.1 ~ 0.7.3| 14
0.7.4 ~ 0.7.9| 14.1
0.7.10-0.82| 15.1
0.8.3| 16.2
0.8.4-0.87| 17
0.8.8以上| 18

其中，NEOS 12 以下的版本都是 Python 2 环境，NEOS 12 以上则完全使用了 Python 3 环境，NEOS 13 加入了 SCons 工具，系统版本和 NEOS 版本可以通过一下命令查询：

```bash
# 查询 NEOS 主版本号
root@localhost:/$ cat /VERSION
10

# 查询 NEOS 子版本号，可能不存在这个文件，比如 v12 系统中
root@localhost:/$ cat /REVISION
3
```

```bash
# 查询 NEOS 主版本号
root@localhost:/$ python --version
Python 2.7.16
```

```bash
# 查询 openpilot 版本号
root@localhost:/$ cat /data/openpilot/selfdrive/common/version.h
#define COMMA_VERSION "0.6.2-release"

# 查询 panda 版本号
root@localhost:/$ cat /data/openpilot/panda/VERSION
v1.4.2
```

### 简易版本降级步骤
##### UI界面安装降级方法

1.设备上点击卸载

2.重启设备后在UI页面上输入dp安装网址进行安装对应分支，如0.66分支。参考下面链接

[[通过UI界面安装 openpilot 分支版本](how_to_change_openpilot_fork_via_ui.md)]

3.dp对应版本会自动下载对应neos，使用阿里云配置国内镜像服务器，下载速度足够，如有问题请联系dp相关管理人员进行维护

##### DP脚本工具降级方法

```bash
wget "http://wiki.dragonpilot.cn/files/software/clone_dp.sh" -O clone_dp.sh && \
dos2unix clone_dp.sh && sh clone_dp.sh
```
putty下ssh使用DP脚本工具效果如图

![1614668110907](../files/how_to_change_openpilot_fork_via_ui/1614668110907.png)



### 通用版本降级步骤

1. 确保你的电脑上安装了 最新版的 Fastboot（[fastboot 下载地址](https://developer.android.com/studio/releases/platform-tools?hl=zh_cn)）。
2. 手机解锁了 bootloader，并且获得了 root 权限（[B 站参考视频](https://www.bilibili.com/video/av66821136)）。
3. 下载你所需要版本的系统镜像([常用软件资料下载](openpilot_software_free_download.md))。
4. 按住一加手机『音量上』和 『电源键』进入 Fastboot 模式（乐视 pro3 是 『音量下』 和 『电源键』）。
5. 手机通过 USB 数据线连接到电脑。
6. 把  boot.img、system.simg 和 fastboot.exe 一个目录里。
7. 执行如下命令：
```bash
# flash boot and system
fastboot flash boot boot.img
fastboot flash system system.simg
#
# clear userdata
fastboot erase userdata
fastboot format cache
fastboot reboot
```
8. 重启 EON 后输入 WIFI 密码，连接到无线网络（查看下 EON 的IP备用），输入安装地址：`https://openpilot.comma.ai`，等待安装完成
9. openpilot 安装完成后会重启，重启后会出现升级界面，**一定不要点升级！！**
10. SSH 进入到 EON，使用如下命令安装你需要安装的 openpilot 版本：
```bash
# 删除默认安装的新版本 openpilot
cd /data
rm -rf openpilot
#
# 安装旧版本的 openpilot fork
git clone https://gitee.com/afaaa/kegman
cd openpilot
git checkout {你所需要使用的版本分支}
#
# 编译旧版本的 openpilot
# 0.7 之前的版本使用 make
scons -i
#
#等待编译完成后，重启
reboot
```

