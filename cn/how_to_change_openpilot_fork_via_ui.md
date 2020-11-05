## 通过界面安装 openpilot 分支版本

![通过界面安装 openpilot 分支版本](/files/install_fork_via_ui.gif)

### 简介

因为大部分用户并不是专业人员，不会通过 ssh 操作切换第三方的 fork，所以我根据官方的 openpilot 安装方式改写了这个项目，使 openpilot 的非官方 fork 安装也可以通过界面操作完成。

由于国内网络访问 github 的速度不佳，我制作了这个存储在 gitee 上的 [openpilot 代码镜像项目](/mirror.md)，当你通过这种方式安装 openpilot 的时候，程序会根据你的网络自动选择代码的下载地址（github 或者 gitee），从而解决了安装速度慢的问题。


### 支持的 fork


installer使用镜像为 https://hub.fastgit.org/dragonpilot-community/dragonpilot 内镜像

##### 尽量使用电信wifi情况下用界面UI安装，已知北方移动宽带，联通宽带容易出现下载失败

界面UI现在仅有以下两个分支dp的两个分支，如果研究过官方installer代码，有自己编译installer的能力，可以生成后联系我们添加对应网址

【devel-i18n分支】http://dpp.cool/cn/devel-i18n

【testing分支】http://dpp.cool/cn/testing


### 使用方法

如果你是在安装 NEOS 系统后第一次进入 openpilot，那么可以直接输入上述地址即可。

NEOS 系统安装参考：

- [Windows 下手动分布安装 openpilot 教程](/cn/how_to_flash_openpilot_on_windows_step_by_step.md)
- [Windows 下一键安装 openpilot 教程](/cn/how_to_flash_openpilot_on_windows.md)
- [macOS 下手动安装 openpilot 教程](cn/how_to_flash_openpilot_on_mac.md)


如果你已经安装了 openpilot，那么你可以通过先 **卸载 openpilot**，然后重新回到输入 Software Url 的界面，输入上述地址即可。


<center>
<img src="/files/uninstall1.jpg" class="max-h-300">
<img src="/files/uninstall2.jpg" class="max-h-300">
<img src="/files/uninstall3.jpg" class="max-h-300">
</center>



### 安装脚本更新

上述 fork 还在不断更新，程序会每半小时抓取一次 git 项目里的 **新增分支**，然后生成对应的安装脚本，并上传到服务器。

如果你发现安装地址有任何问题，或者有什么建议需要反馈，请 [联系我们](/about.md)。

### 相关源码

- [https://d.sdut.me/installers](https://d.sdut.me/installers/)
- [https://github.com/rming/openpilot/tree/installer](https://github.com/Rming/openpilot/blob/installer/installer/make_installer.py)
- [https://github.com/Rming/openpilot.download](https://github.com/Rming/openpilot.download)
