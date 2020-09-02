## Panda 固件更新教程

### 简明教程

```bash
# flash panda
pkill -f boardd && cd /data/openpilot/panda/board && make

# reboot eon
reboot
```

**注意：在新版本的 openpilot 和 NEOS 中，建议使用 comma power 或者 debug board 为 panda 供电的情况下更新固件，因为有部分用户反映，在 panda 连接 汽车OBD 的情况下更新固件，会遇到一些报错。**


### 通过 EON 自动更新固件

1. 从 Giraffe 上断开 Panda
2. 汽车熄火断电，把 Panda 插到汽车的 OBD2 接口上
3. EON 关机，通过 USB 数据线连接到 Panda
4. EON 连接到 Panda 后会触发通电自动开机
5. Panda 会闪一会绿灯
6. 当 Panda 闪红灯的时候，就是固件更新完毕了
7. 把 Panda 从汽车 OBD2 上拔下来，插回到 Giraffe 上

这可能是为 Panda 更新固件最简单的方法了。

**备注/异常处理：**
- 当 Panda 闪绿灯的时候，表示 EON 正在为 Panda 更新固件，但是 grey Panda 从一插到 OBD2 接口上就开始闪绿灯（不知道通电后 Panda 在搞什么），然后几秒钟后绿灯不闪了，过一会儿（就进入正常流程了），又开始闪绿灯，几秒钟后，Panda 开始闪红灯。
- 如果 Panda 插在 OBD2 上更新固件有问题，那么你需要把它从 OBD2 上拔下来，用 debug board 或者 comma power + Giraffe(从车上拔下来) 为 Panda 供电，总之就是排除因为 CAN 总线通信的干扰。

### 通过 EON 手动更新固件

1. 汽车熄火断电（译者注：Panda 需要 Comma power 供电）
2. 进入 EON 的 ssh
3. 执行命令

```bash
cd /data/openpilot/panda ; pkill -f boardd ; PYTHONPATH=..; python -c "from panda import Panda; Panda().flash()"
```

如果上面的命令报错，则尝试下面这个：

```bash
cd /data/openpilot/panda/board && make recover
```


### 通过 USB 手动更新固件

硬件设备： [Panda Paw](https://comma.ai/shop/products/panda-paw)
这是最可靠的方式了，前提是你得有 [Panda Paw](https://comma.ai/shop/products/panda-paw) 。

首先，Panda 进入固件更新模式(DFU):

1. Panda Paw 电源开关关闭
2. Panda Paw 的一端插到 Panda 上
3. 把 Panda Paw 的 Mini USB 接口接到 笔记本 USB
4. 打开 Panda Paw 电源开关的同时，长按 boot 按钮

然后[在 linux 上或者 mac 上运行如下指令](https://github.com/commaai/panda/blob/029c1ec7ba89fbcb94fdac2690378ef4c1a32b43/UPDATING.md)，为 panda 更新固件：

```bash
# 在电脑上安装 pandacan
sudo pip install --upgrade pandacan 
# 更新固件
PYTHONPATH="" sudo python -c "import panda; panda.flash_release()"
```

### 通过 WIFI 使用 curl 手动更新固件

这是在 linux 下最简单的操作方法，可以参考Github 上 Panda 的 Makefile 和 社区的帮助： 

1. Panda 连接到 12V 电源，保证没有 CAN 信号传入到 Panda（汽车一定不能启动），除非你能发送 0x7F 阻止 CAN 信号，否则固件升级会失败（[参考 69 和 97](http://www.st.com/content/ccc/resource/technical/document/application_note/b9/9b/16/3a/12/1e/40/0c/CD00167594.pdf/files/CD00167594.pdf/jcr:content/translations/en.CD00167594.pdf)）
2. 记下你的 Panda wifi 名字 和 密码 (用 chffr)
3. 从 [Github](https://github.com/commaai/panda-artifacts) 下载固件并解压
4. 通过 WIFI 连接到 Panda
5. 打开命令行，切换目录到固件目录（比如：cd ~/Downloads）
6. 执行如下命令，当看到 Panda 闪灯后，再执行下一个命令：
    1. `curl http://192.168.0.10/`
    2. `curl http://192.168.0.10/espupdate2 --upload-file user2.bin`
    3. `curl http://192.168.0.10/stupdate --upload-file panda.bin`
    4. `curl http://192.168.0.10/espupdate1 --upload-file user1.bin`
7. 刷完  `panda.bin` 后， Panda 的灯应该是快速闪烁的（可能是多个颜色）

如果还有什么不明白的，可以参考对照[这个视频](https://youtu.be/6LyyhCbR4Ps)。
