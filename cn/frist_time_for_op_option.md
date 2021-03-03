## 首次使用dragonpilot时候各种画面说明

##### 建议第一次使用dp时候，开启社区功能+启用ssh功能

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



##### 英文界面改中文界面方法，右上角齿轮--安卓设置--语言--中文--备份按钮返回--重启，就可以

![dp英文界面改中文界面方法](../files/frist_time_for_op_option/dp英文界面改中文界面方法.gif)

##### op软件默认北美时区，时区不正确修改方法，右上角齿轮--安卓设置--时间--关闭自动时间--选择时区---修改24小时--备份选项--重启，就可以

![修改时区](../files/frist_time_for_op_option/修改时区.gif)

##### openpilot默认选项展示

![1614755751882](../files/frist_time_for_op_option/1614755751882.png)

![默认选项-账户-设备-wifi-开发人员](../files/frist_time_for_op_option/默认选项-账户-设备-wifi-开发人员.gif)

![op服务](../files/frist_time_for_op_option/op服务.png)

![op默认选项](../files/frist_time_for_op_option/op默认选项.gif)

##### dp选项展示

dp选项展示--操控选项

<img src="../files/frist_time_for_op_option/dp操控.png" alt="dp操控" style="zoom:150%;" />


![dp选项-操控](../files/frist_time_for_op_option/dp选项-操控.gif)

dp选项展示--介面设置

![dp界面](../files/frist_time_for_op_option/dp界面.png)

![dp选项--介面设置](../files/frist_time_for_op_option/dp选项--介面设置-1614755264580.gif)

dp选项展示--第三方应用设置

![dp-第三方](../files/frist_time_for_op_option/dp-第三方.png)

![dp选项--第三方应用](../files/frist_time_for_op_option/dp选项--第三方应用.gif)

dp选项展示--车型设置

![dp车型](../files/frist_time_for_op_option/dp车型.png)

![dp选项--车型设置](../files/frist_time_for_op_option/dp选项--车型设置.gif)



dp选项展示--服务-硬件-指纹-其他

![dp服务](C:/Users/Administrator/Desktop/dp服务.png)

![DP选项展示-服务（需重启）](../files/frist_time_for_op_option/DP选项展示-服务（需重启）.gif)

![dp硬件](../files/frist_time_for_op_option/dp硬件.png)

![DP选项展示-硬件-调校](../files/frist_time_for_op_option/DP选项展示-硬件-调校.gif)

![DP选项展示-指纹-其他](../files/frist_time_for_op_option/DP选项展示-指纹-其他.gif)

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

