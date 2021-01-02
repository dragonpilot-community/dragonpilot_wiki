## Dragonpilot特性【基于2020-11-28 (0.7.10.0)】


### 丰田设定任意速度巡航(低于原车设定值)

若你的车是openpilot 做纵向控制，可以在dragonpilot中这个特性，让你能在复杂的小路/弯路下使用<u>**当前**</u>车速(例如低于45km/h)设定巡航速度，该能力在dp的0.7.10(当前是devel-i18n/testing)分支中加入，[效果演示](https://www.bilibili.com/video/BV1P54y1674i)

###### 打开这个功能需要SSH到终端进行：

###### 开启低速重写
```shell
echo -n 1 > /data/params/d/dp_toyota_lowest_cruise_override
```
###### 在上述条件下，开启使用当前速度做巡航速度
```shell
echo -n 1 > /data/params/d/dp_toyota_lowest_cruise_override_vego
```
######  设定触发条件速度(以OP上看到的速度为准，可以稍微大0.x避免判断不准确)，低于该速度可以使用这个特性
```shell
echo -n 41.2 > /data/params/d/dp_toyota_lowest_cruise_override_at
```
###### 设定最低巡航速度 7km/h
```shell
echo -n 7 > /data/params/d/dp_toyota_lowest_cruise_override_speed
```

######  关闭当前速度做巡航速度特性 （仅用dp_toyota_lowest_cruise_override_speed做固定低速巡航值）：

```shell
echo -n 0 > /data/params/d/dp_toyota_lowest_cruise_override_vego
```

###### 彻底关闭低速巡航

```shell
echo -n 0 > /data/params/d/dp_toyota_lowest_cruise_override
```



### dynamic gas

若你的车是openpilot 做纵向控制，可以在dragonpilot中这个特性，让你能在拥堵的市区道路、快道、高速等更近平顺的加油&跟车。目前在丰田汉兰达2018和雷克萨斯NX上体验，比原来OP控车更加平顺，该能力在dp的0.7.10(当前是devel-i18n/testing)分支中加入。 

 大体原理：
简化[ShaneSmiskol](https://github.com/ShaneSmiskol/openpilot)的DynamicGas代码， 读取雷达数据，在跟车时判断与前车的相对速度，若相对速度较小，则max_gas降低；同时兼顾与前车的相对距离，如果相对距离较远，max_gas会大一些，否则max_gas会小一些 。

###### 打开这个功能需要SSH到终端进行：


###### 第一步 开启dynamic gas
```shell
echo -n 1 > /data/params/d/dp_dynamic_gas
```
###### 第二步 也可以在dp的“操控设置”中, “加速模式”选择：节能、普通、运动。注意选择“关闭”DynamicGas也会不起作用
```shell
echo -n 1 > /data/params/d/dp_accel_profile
```
###### 第三步 (可选)也可以在dp的“操控设置”中，跟车距离设置为“长距离”在高速上体验会更换
```shell
echo -n 3 > /data/params/d/dp_dynamic_follow
```

在行驶过程中，可以 通过dp界面按钮调整“加速模式”， 也可以调整DynamicGas的max_gas数值。目前以汉兰达为例，经济模式比较像人在控制油门；也可以dp界面按钮调整“跟车距离”调整跟车距离，长距离在高速上会比较安全。行车中操作dp界面注意安全，让副驾进行调整！




### honda eps 模式

如果你的本田车，已经进行了eps的限制解除（eps破解），那么可以尝试开启dp内的honda eps模式，在2020-11-18日以后的dp0.7.10版本，可以使用这个

 大体原理：
参考了CFranHonda的数值， 设置了/selfdrive/car/honda/interface.py内的dp_honda_eps_mod数值
启用honda eps模式后会使用调整后的数值，可能会获得更好的转弯效果，具体需要自行测试

###### 打开这个功能需要SSH到终端进行：

###### 开启 honda eps模式
```shell
echo -n 1 > /data/params/d/dp_honda_eps_mod
```
###### 关闭 honda eps模式
```shell
echo -n 0 > /data/params/d/dp_honda_eps_mod
```



### scripts文件夹内的小应用

* dp的scripts文件夹内有一些常用的sh程序，使用ssh到终端运行，可以处理一些简单问题

###### 用途说明

* complete_setup.sh ，没有使用ui界面进行第一次安装openpilot的时候，生成引导文件continue.sh
######  运行方法
```shell
cd /data/openpilot/scripts/ && ./complete_setup.sh
```

* rebuild.sh ，清除缓存，重新scons文件，某些黑屏情况时候可以尝试重新scons
######  运行方法
```shell
cd /data/openpilot/scripts/ && ./rebuild.sh 
```
* reset_dp.sh，重置dp内的选项设定恢复默认状态
######  运行方法
```shell
cd /data/openpilot/scripts/ && ./reset_dp.sh
```

* reset_update.sh，清除panda固件并重新拉取源更新，重新scons（不清除缓存）
######  运行方法
```shell
cd /data/openpilot/scripts/ && ./reset_update.sh
```

* update_panda_firmware.sh ，强制更新panda固件，更换版本分支后突然出现不能控车情况下可以考虑强制更新panda固件
######  运行方法
```shell
cd /data/openpilot/scripts/ && ./update_panda_firmware.sh
```


### dp内启用第三方软件方法


###### 使用代码方法，需要SSH到终端进行：
1.下载需要的app,以com.autonavi.amapauto.apk为例

```shell
cd /data/ && git clone https://github.com/dragonpilot-community/apps.git apps -b com.autonavi.amapauto.apk
```
2. 在sdard内新建文件夹  apks 文件夹
```shell
cd /sdard/ && mkdir apks
```
3. 把下载的apk文件复制到指定文件夹
```shell
cd /data/apps/ && cp com.autonavi.amapauto.apk /sdcard/apks/
```

###### 使用winscp或者其他可视化工具方法：

配置winscp参考这个页面

* [配置putty和winscp](putty_and_winscp.md)

下载文件
仅包含mixplorer文件管理器和高德车机版4.9版本
https://cloud.189.cn/t/y2y6jerqIfA3

用winscp把文件传输到/sdcard/apks/文件夹内

### 开启屏幕录制(行车记录)按钮

如果你希望在屏幕上能直接操作是否启用录屏功能，可以使用该开关。值得注意的通过这个开关设置操作的操作是永久生效的(与“设置”内的dragonpilot“行车记录”配置是互通关系)，例如你选择了录像启动后停车熄火，下一次车辆启动会自动录像。

###### 打开这个功能需要SSH到终端进行：

```shell
echo -n 1 > /data/params/d/dp_dashcam_ui
```

###### 