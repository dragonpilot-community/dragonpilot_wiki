## 通过界面安装 openpilot 分支版本

![通过界面安装 openpilot 分支版本](/files/install_fork_via_ui2.gif)

### 简介

因为大部分用户并不是专业人员，不会通过 ssh 操作切换第三方的 fork，不同小组根据官方的 openpilot 安装方式改写了这项目，使 openpilot 的非官方 fork 安装也可以通过界面操作完成。



目前DP和MP都可以通过UI界面进行安装



###  DP fork

由于国内网络访问 github 的速度不佳，dp维护小组使用了CDN加速，下载CDN上的git压缩包，加快下载速度

分支名|特点|域名
-|-
0.7.8-i18n分支|0.7.8稳定分支|https://wiki.dpp.cool/0.7.8-i18n
devel-i18n分支|开发分支，相对稳定测试分支|https://wiki.dpp.cool/devel-i18n
testing分支|新功能尝鲜分支，可能不稳定有bug|https://wiki.dpp.cool/testing



### 买买熊团队支持的 MP fork（MyPilot）
分支名|域名
-|-
MP稳定版本|https://c2.openpilot.net
MP定制版本| https://c2.openpilot.net/op/custom 

pc浏览器直接访问https://c2.openpilot.net 可以看到对应的界面管理页面以及MP版本说明

![mypliot](../files/how_to_change_openpilot_fork_via_ui/mypliot.jpg)



### SSH安装方法

如果使用界面安装多次失败，主要是手机热点或者移动宽带，联通宽带失败情况下，请尝试用ssh代码安装

使用ssh代码，属于高阶内容，需要使用ssh工具进行git操作，如果有兴趣的请先阅读高阶教程
* [配置putty和winscp](cn/putty_and_winscp.md)
* [使用 Putty SSH 切换 openpilot 分支版本](cn/how_to_change_openpilot_fork_on_windows.md)
* [iPhone 手机上 SSH 连接到 openpilot](cn/how_to_connect_openpilot_via_iphone.md)

查看教程后，按照教程使用ssh工具连接你设备，然后复制下面代码进行安装

以下是使用DP安装脚本工具：

```bash
wget "http://wiki.dragonpilot.cn/files/software/clone_dp.sh" -O clone_dp.sh && \
dos2unix clone_dp.sh && sh clone_dp.sh
```

putty下ssh使用DP脚本工具效果如图

![1614668110907](../files/how_to_change_openpilot_fork_via_ui/1614668110907.png)


###  NEOS 系统安装参考：
- [Windows 下手动安装 NEOS系统+openpilot软件教程](cn/how_to_flash_openpilot_on_windows_step_by_step.md)
- [Windows 下一键安装 NEOS系统+openpilot软件 教程](/cn/how_to_flash_openpilot_on_windows.md)
- [macOS 下手动安装 NEOS系统+openpilot软件教程](cn/how_to_flash_openpilot_on_mac.md)


如果你已经安装了 openpilot，那么你可以通过先 **卸载 openpilot**，然后重新回到输入 Software Url 的界面，输入上述地址即可。


<center>
<img src="/files/uninstall1.jpg" class="max-h-300">
<img src="/files/uninstall2.jpg" class="max-h-300">
<img src="/files/uninstall4.jpg" class="max-h-300">
</center>



### 相关源码（自动生成installer有兴趣的请自行研究）

- [https://d.sdut.me/installers](https://d.sdut.me/installers/)
- [https://github.com/rming/openpilot/tree/installer](https://github.com/Rming/openpilot/blob/installer/installer/make_installer.py)
- [https://github.com/Rming/openpilot.download](https://github.com/Rming/openpilot.download)
