## raspberry-pilot 安装指南

### 硬件要求

- 本田 Bosch 车型（雅阁、CRV 等）
- Giraffe + Panda (Harness + BlackPanda 也可以)
- 树莓派4B裸板（内存 2G 以上最好）
- 16G 以上内存卡 + 读卡器（Micro SD，推荐 class 10 或更好的卡）
- 树莓派保护壳（可选，建议使用纯散热片的那种，安静，主要起散热作用）
- Type-A to Type-C 数据线（用于连接树莓派和 Panda，给树莓派供电，长一点好，我用的3米的）


<center>
<img src="/files/raspberry_sdcard_io.jpg" class="max-h-400">
<p>自用 sd 卡性能测试</p>
</center>

### 树莓派安装 ubuntu server 系统


- Ubuntu Server 18.04.4 镜像：[下载地址](https://ubuntu.com/download/raspberry-pi/thank-you?version=18.04.4&architecture=arm64+raspi3)
- 镜像写入工具：[下载地址](https://www.balena.io/etcher/)


1. 下载安装 镜像写入工具 balenaEtcher
2. 下载 Ubuntu Server 18.04.4 镜像
3. 把 SD 卡（读卡器）插入电脑
4. 运行 balenaEtcher，选择镜像 -> 选择 SD 卡 -> 写入


<center>
<img src="/files/balena_flash.png" class="max-h-300">
<p>选择镜像，写入 SD 卡</p>
</center>


### 配置 raspberry-pilot 运行环境

#### 通过 SSH 连接到树莓派

- 把局域网网线插入树莓派有线口（DHCP），然后通过路由器查看获得树莓派的 IP 地址。
- SSH 连接到树莓派（默认用户名密码 ubuntu/ubuntu）

```bash
rming@rmbp:~$ ssh ubuntu@192.168.2.127
ubuntu@192.168.2.127's password:
Welcome to Ubuntu 18.04.4 LTS (GNU/Linux 5.3.0-1018-raspi2 aarch64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Thu Feb 27 09:37:53 UTC 2020

  System load:  1.11               Processes:           139
  Usage of /:   5.3% of 116.95GB   Users logged in:     1
  Memory usage: 14%                IP address for eth0: 192.168.2.127
  Swap usage:   0%

0 packages can be updated.
0 updates are security updates.

Your Hardware Enablement Stack (HWE) is supported until April 2023.

Last login: Thu Feb 27 09:37:27 2020 from 192.168.2.120
ubuntu@ubuntu:~$
```

#### 下载项目代码、配置代理、修改软件源

```bash
# 修改 ubuntu 软件源，使用清华大学源
# **建议修改**
sudo sed -i 's/ports.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list
sudo apt update
```

```bash
# 为 git 配置全局代理
# **可选，如果你有工具的话，建议设置**
# 把 192.168.2.120:1087 换成你的代理地址
git config --global http.proxy 192.168.2.120:1087
```

```bash
# 为命令行工具（wget 等）配置代理
# **可选，如果你有工具的话，建议设置**
# 把 http://192.168.2.120:1087 换成你的代理地址
export http_proxy=http://192.168.2.120:1087
export https_proxy=http://192.168.2.120:1087
```

```bash
# 下载 raspberry-pilot 项目代码
cd ~ && git clone https://github.com/Gernby/raspberry-pilot.git
```

```bash
# Pipfile 使用国内源
# **可选，推荐设置**
sed -i 's|pypi.org|mirrors.aliyun.com/pypi|g' ~/raspberry-pilot/Pipfile
# 修改脚本，跳过 lock
# **可选，推荐设置**
sed -i 's|pipenv install|pipenv install --skip-lock -v|g' ~/raspberry-pilot/finish_install.sh
```

#### 安装软件环境

```bash
bash ~/raspberry-pilot/start_install.sh
```

运行结束以后，断开 SSH 连接，重新连接一次，进入 shell，在执行下面的命令。

```bash
bash ~/finish_install.sh
```

有些软件下载、安装过程可能很慢，耐心等待（受你的网络和 SD 卡读写速度影响，受限于树莓派的硬件性能）。
