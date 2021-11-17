## Openpilot 国内镜像


以下内容属于ssh高阶内容，需要使用ssh工具进行git操作，如果有兴趣的请先阅读高阶教程
* [配置putty和winscp](putty_and_winscp.md)
* [使用 Putty SSH 切换 openpilot 分支版本](how_to_change_openpilot_fork_on_windows.md)
* [iPhone 手机上 SSH 连接到 openpilot](how_to_connect_openpilot_via_iphone.md)


### 背景

因为 github.com 的访问速度较慢，Openpilot 源码较大（>600M），一些分支版本甚至超过1G，这让 Openpilot 的下载安装变得非常痛苦，基于以上原因，你可以使用以下镜像地址替换 github 地址。


来源|域名
-|-
github| github.com
cnpmjs| github.com.cnpmjs.org
fastgit| hub.fastgit.org

当你需要下载 官方版本时，只需要把  `https://github.com/commaai/openpilot`替换成  `https://github.com.cnpmjs.org/commaai/openpilot` 或者 `https://hub.fastgit.org/commaai/openpilot` 即可，其他分支相同。


### cnpmjs地址列表

分支版本|git 地址
-|-
官方版本|https://github.com.cnpmjs.org/commaai/openpilot
afa版（已暂停更新）|https://github.com.cnpmjs.org/rming/openpilot
dragonpilot（多语言多选项）|https://github.com.cnpmjs.org/dragonpilot-community/dragonpilot
Gernby|https://github.com.cnpmjs.org/gernby/openpilot
kegman（多参数可调本田支持较好）|https://github.com.cnpmjs.org/kegman/openpilot
arne182（多参数可调丰田支持较好）|https://github.com.cnpmjs.org/arne182/ArnePilot
ShaneSmiskol（可支持白熊）|https://github.com.cnpmjs.org/ShaneSmiskol/openpilot
raspberry-pilot|https://github.com.cnpmjs.org/gernby/raspberry-pilot


### fastgit地址列表

分支版本|git 地址
-|-
官方版本|https://hub.fastgit.org/commaai/openpilot
afa版（已暂停更新）|https://hub.fastgit.org/rming/openpilot
dragonpilot（多语言多选项）|https://hub.fastgit.org/dragonpilot-community/dragonpilot
Gernby|https://hub.fastgit.org/gernby/openpilot
kegman（多参数可调本田支持较好）|https://hub.fastgit.org/kegman/openpilot
arne182（多参数可调丰田支持较好）|https://hub.fastgit.org/arne182/ArnePilot
ShaneSmiskol（可支持白熊）|https://hub.fastgit.org/ShaneSmiskol/openpilot
raspberry-pilot|https://hub.fastgit.org/gernby/raspberry-pilot

