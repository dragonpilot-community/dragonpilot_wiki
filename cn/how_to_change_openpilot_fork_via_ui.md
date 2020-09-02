## 通过界面安装 openpilot 分支版本

![通过界面安装 openpilot 分支版本](/files/install_fork_via_ui.gif)

### 简介

因为大部分用户并不是专业人员，不会通过 ssh 操作切换第三方的 fork，所以我根据官方的 openpilot 安装方式改写了这个项目，使 openpilot 的非官方 fork 安装也可以通过界面操作完成。

由于国内网络访问 github 的速度不佳，我制作了这个存储在 gitee 上的 [openpilot 代码镜像项目](/mirror.md)，当你通过这种方式安装 openpilot 的时候，程序会根据你的网络自动选择代码的下载地址（github 或者 gitee），从而解决了安装速度慢的问题。


### 支持的 fork

fork|github|Software Url
-|-|-
commaai|https://github.com/commaai/openpilot| d.sdut.me/op/{分支}
afa|https://github.com/rming/openpilot| d.sdut.me/afa/{分支}
dragonpilot|<a style="white-space: nowrap;" href="https://github.com/dragonpilot-community/dragonpilot">https://github.com/dragonpilot-community/dragonpilot</a>|d.sdut.me/dp/{分支}
kegman|https://github.com/kegman/openpilot|d.sdut.me/kegman/{分支}
gernby|https://github.com/gernby/openpilot|d.sdut.me/gernby/{分支}
arne|https://github.com/arne182/openpilot|d.sdut.me/arne/{分支}


**备注：** `fork` 又叫做 `分叉`, `branch` 又叫做 `分支`

所以，一个 fork 的安装地址就变成了如下的格式：

```bash
# d.sdut.me/{FORK}/{BRANCH}
d.sdut.me/{分叉}/{分支}
```


以 kegman 项目举例，如果我们想安装 `kegman-0.7.3` 分支，那么我们在 Software Url 界面应该填入的地址就是：

```bash
d.sdut.me/kegman/kegman-0.7.3
```

以 dragonpilot 项目举例，如果我们想安装 `devel-zhs` 分支，那么我们在 Software Url 界面应该填入的地址就是：

```bash
d.sdut.me/dp/devel-zhs
```
备注：这里的 `dp` 是 `dragonpilot` 的简写，当然，你也可以写 `d.sdut.me/dragonpilot/devel-zhs`

安装官方版本就变成了：

```bash
d.sdut.me/op/release2
```
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
