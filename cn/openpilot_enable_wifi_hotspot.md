## EON 开机自动开启 WIFI 热点

如果你的 EON 里装了 sim 卡，并且流量很多，可能会想车里的其他设备通过 EON 共享 WIFI 上网，EON 是可以设置 开机自动开启 WIFI 共享的。


```bash
# ssh 连接到设备
ssh eon

# 编辑引导文件
vi /data/data/com.termux/files/continue.sh 

# 在第二行出插入下面一行代码
service call wifi 37 i32 0 i32 1

# 重启 EON
reboot 
```



