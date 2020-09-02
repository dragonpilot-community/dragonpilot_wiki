## EON USB网卡设置



comma smays 是 EON 连接有线调试的工具，据说 comma smays 用的网卡啊也是 **ax88772** 芯片的，我就淘宝找了一个 20 块钱的同款芯片 USB 网卡试了试，结果真的是免驱可用，这里记录一下使用过程，不确定其他芯片的网卡情况。


### 参数对比

选项|comma smays|ax88772 USB 网卡
-|-|-
图片|<img src="/files/comma_smays_1.png" class="max-h-100" alt="comma smays">|<img src="/files/ax88772_usb_eth_single.jpg" class="max-h-100" alt="ax88772 USB 网卡">
芯片|（ax88772）据说| ax88772(A/B/C) 我用的 C 款
供电线|自带，一体的| 通过 USB公对公连接任意 USB 口供电（5V）
OTG口|Micro USB| 通常是 Type-C 的，一共用了 4 根线，可以自己改 Micro USB
价格|官方 60 美元，淘宝 200 RMB|20 RMB
购买|[官方链接](https://comma.ai/shop/products/comma-smays-adapter) [淘宝链接](https://item.taobao.com/item.htm?id=600394276424)| [淘宝链接](https://item.taobao.com/item.htm?id=567076521038) （买带 3 USB 口版本）
<center>Comma Smays 与 其他 ax88772 网卡对比（淘宝链接没有利益关系，仅供参考）</center>
<br>

<center><img src="/files/ax88772_usb_eth.jpeg"  alt="EON 连接 USB网卡" ></center>


### 静态 IP 模式

EON 默认开启的是静态 IP 模式，我们可以通过 ifconfig 命令更改 IP 和 子网掩码：

```bash
# 默认状态
root@localhost:/$ ifconfig  eth0
eth0      Link encap:Ethernet  HWaddr 00:6F:00:00:07:5F
          inet addr:192.168.5.11  Bcast:192.168.5.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:6217 errors:0 dropped:0 overruns:0 frame:0
          TX packets:597 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:700037 (683.6 KiB)  TX bytes:109469 (106.9 KiB)

# 更改静态IP
root@localhost:/$ ifconfig eth0 192.168.2.201

# 更改子网掩码
root@localhost:/$ ifconfig eth0 netmask 255.255.254.0

# 启用网卡
root@localhost:/$ ifconfig eth0 up

# 更改后状态
root@localhost:/$ ifconfig  eth0
eth0      Link encap:Ethernet  HWaddr 00:6F:00:00:07:5F
          inet addr:192.168.2.201  Bcast:192.168.3.255  Mask:255.255.254.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:9285 errors:0 dropped:0 overruns:0 frame:0
          TX packets:1725 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:1328793 (1.2 MiB)  TX bytes:312694 (305.3 KiB)
```


### DHCP 客户端模式


EON 可以开启 USB 网卡的 DHCP 客户端模式，操作步骤如下：

1. USB 网卡通过 Type-C (Micro USB) 连接到 EON，USB 网口中插入网线，保证网络连接正常
2. EON 通过无线接入到局域网，电脑端通过 SSH 进入 EON
3. 在 EON 的 SSH 里执行 `dhcptool eth0` 启动 eth0 的 DHCP 客户端功能，命令会阻塞直至 DHCP 开启成功
4. 在 EON 的 SSH 里执行  `ifconfig eth0` 查看当前有线网卡的连接情况
```bash
root@localhost:/$ ifconfig eth0
eth0      Link encap:Ethernet  HWaddr 00:6F:00:00:07:5F
          inet addr:192.168.2.201  Bcast:192.168.3.255  Mask:255.255.254.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:6393 errors:0 dropped:0 overruns:0 frame:0
          TX packets:651 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:736167 (718.9 KiB)  TX bytes:118645 (115.8 KiB)
```
192.168.2.201 即我们的有线网卡IP
4. 重启 EON，只连接有线网卡（关闭无线网卡，有线、无线同时工作会有网络延迟异常的情况）

