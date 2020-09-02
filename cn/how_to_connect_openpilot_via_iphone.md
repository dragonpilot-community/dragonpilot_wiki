## iPhone 手机上 SSH 连接到 openpilot

### EON 端设置

1. 打开 "设置 - 网络 - 共享网络设置" 
2. 打开 "设置 WLAN 热点"，设置 共享 WIFI 的密码
3. 打开 "便携式 WIFI 开关" 

### iPhone 上 SSH 客户端设置

1. 连接刚才在 EON 上共享的 WIFI 信号（如果没有更改，默认是 weedle-xxxxx，密码是你刚才设置的密码）
2. 点击网络连接，查看 路由器IP地址 （通常是 192.168.43.1，这就是 EON 的IP）
3. 打开你的 SSH 客户端，填写必要的信息（这里我们使用私钥认证的方式），见下表
4. 保存连接即可

选项|填写|备注
-|-|-
主机 / Host| `192.168.43.1`|EON 的IP，这里默认是 `192.168.43.1`
端口 / Port| `8022`|SSH 端口号，这里默认是 `8022`
用户名 / Username| `root`|默认 `root`
私钥 / Private Key| -----BEGIN PRIVATE KEY-----<br>MIIEvAIBA ....<br>....<br>-----END PRIVATE KEY----- |下载地址：http://d.sdut.me/eonkeys/<br>pem 为私钥文件格式，<br>txt 内容可以在网页里打开复制<br>ppk 格式为客户端 putty 专用


<center>
{% bilibili %}av75851896{% endbilibili %}
</center>
<center>视频中使用的 SSH 软件是 `iOS` 和 `WebSSH app`</center>
