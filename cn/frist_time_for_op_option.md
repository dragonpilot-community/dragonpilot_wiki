## 首次使用dragonpilot时候各种画面说明

建议第一次使用dp时候，开启社区功能+启用ssh功能

开启路径--设置--开发人员--开启功能

![1607316661217](../files/frist_time_for_op_option/1607316661217.png)



其他画面说明，**一般仅devel分支和testing分支会一直更新**，其他固定版本号的不会更新

是否配对comma connect不影响设备使用

![1607315297309](../files/frist_time_for_op_option/1607315297309.png)

点击更新按钮后显示

![1607315513086](../files/frist_time_for_op_option/1607315513086.png)

点击设置按钮后显示

![1607315783775](../files/frist_time_for_op_option/1607315783775.png)

![1607315900969](../files/frist_time_for_op_option/1607315900969.png)

点击dragonpilot按钮后显示

![1607316282227](../files/frist_time_for_op_option/1607316282227.png)



##### 启动NEOS时候画面，开机comma的逗号logo

![1607228086578](../files/settle_normal_problem/1607228086578.png)

##### 启动openpilot时候画面，系统开启完成编译软件时候logo，包含进度条

![1607228119352](../files/settle_normal_problem/1607228119352.png)

##### 安装画面，installing openpilot字样无进度条说明是在下载，不是在安装！！

![1607228843006](../files/settle_normal_problem/1607228843006.png)

![1607228774289](../files/settle_normal_problem/1607228774289.png)

ssh输入tmux at，查看下载速度，一般安装至少200M左右，如果速度慢请改用其他方法安装
```shell
tmux at
```

![1607229124004](../files/settle_normal_problem/1607229124004.png)

![1607228907382](../files/settle_normal_problem/1607228907382.png)


##### 升级画面

![](../files/settle_normal_problem/1607064638431.png)

##### 升级进度画面，会有两个进度条

直接连接网络在线升级neos会先升级recovery

![1607253113000](../files/settle_normal_problem/1607253113000.png)

然后升级system

<img src="../files/settle_normal_problem/1607253046747.png" alt="1607253046747" style="zoom:150%;" />

如果网络速度不佳，就会升级失败

![1607253186060](../files/settle_normal_problem/1607253186060.png)

多次自动升级失败请使用点击下面链接采用手动升级方法

[手动升级NEOS15](updateNEOS15.md)

