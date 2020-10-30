## 采集车辆指纹信息 1.0

官方说明参考来源

https://github.com/commaai/openpilot/wiki/Fingerprinting

修改get_fingerprint.py方法来源于微信@dingliangxue2012提供

Comma 官方指纹1.0支持移入社区支持,所以使用指纹1.0时候请打开Eon设备选项--开发人员--启用社区功能。

OpenPilot 通过对比 CAN 信号读取到的车辆指纹信息 与 已知的指纹列表 识别当前连接的什么车型（`/data/openpilot/selfdrive/car/{汽车厂商}/values.py` 文件中的指纹信息列表）。

现在，同一型号的不同配置车型有时候会有不同的指纹信息，如果 openpilot 还没有包含你车辆的指纹信息，那么你需要自己创建一个指纹信息。

如果你的 EON 开机并联网，你可以使用 [Workbench](https://github.com/jfrux/workbench) 在局域网里搜索到你的 EON，SSH 连接进去，抓取车辆指纹（EON 需要连接到车上）。

**操作步骤：**
1. 车辆熄火后，通过 Giraffe 或者 Car harness  把 PANDA（白熊，黑熊，C2分情况） 连接到车上，EON 连接到 PANDA 上，EON上运行openpilot。
2.  如果你用的是 Car harness（黑熊或者C2），在EON 的UI 界面将**启用openpilot**的选项**关闭**，这样你的EON会使用 **原车模式（stock mode）**。

【实际测试中发现，本田博世的摄像头（CRV，inspire）抓取1.0指纹需要修改can端口，
具体是把/data/openpilot/selfdrive/debug/get_fingerprint.py，
将文件内  if c.src in [0, 2] and c.address < 0x800: ，修改为  if c.src in [0, 1] and c.address < 0x800: ，
其他车型未知，如果抓取指纹出现和同类车型区别较大的时候，可以考虑这个修改】

3.   如果你使用的是Giraffe 和 白熊，设置你的Giraffe拨码成 **原车模式（stock mode）**（你需要采集原车发送的 CAN信号数据 ，而不是 openpilot 的），不需要修改文件
4. SSH 连接到 EON，在两个会话窗口中分别运行下面 2 个命令
```bash
/data/openpilot/selfdrive/boardd/boardd
```
```bash
cd /data/openpilot/selfdrive && PYTHONPATH=/data/openpilot PREPAREONLY=1 /data/openpilot/selfdrive/debug/get_fingerprint.py
```
4. 启动汽车，等大约 20 秒钟，确保可以得到如下的全部DBC消息：
<pre style="white-space: pre-wrap;word-wrap: break-word;">
number of messages 53:
fingerprint 2: 8, 64: 8, 65: 8, 72: 8, 73: 8, 280: 8, 281: 8, 290: 8, 312: 8, 313: 8, 314: 8, 315: 8, 316: 8, 326: 8, 544: 8, 545: 8, 546: 8, 552: 8, 554: 8, 557: 8, 576: 8, 577: 8, 722: 8, 801: 8, 802: 8, 805: 8, 808: 8, 816: 8, 826: 8, 837: 8, 838: 8, 839: 8, 842: 8, 912: 8, 915: 8, 940: 8, 1614: 8, 1617: 8, 1632: 8, 1650: 8, 1657: 8, 1658: 8, 1677: 8, 1697: 8, 1743: 8, 1759: 8, 1785: 5, 1786: 5, 1787: 5, 1788: 8, 2015: 8, 2016: 8, 2024: 8
</pre>
5. 熄火并重新启动几次，确保接收到了全部消息（某些消息仅在启动时发送）。
6. `<CTRL> + C` 关闭程序.
7. 将从第3步中获得的 DBC消息 复制到  `/data/openpilot/selfdrive/car/{汽车厂商}/values.py` 文件的 "FINGERPRINTS" 部分（创建新的车型，或者暂时覆盖之前已经存在的车型）。 
8. 汽车熄火，重启 EON。
