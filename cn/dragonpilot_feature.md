## Dragonpilot特性


### 丰田设定任意速度巡航(低于原车设定值)

若你的车是openpilot 做纵向控制，可以在dragonpilot中这个特性，让你能在复杂的小路/弯路下使用<u>**当前**</u>车速(例如低于45km/h)设定巡航速度，该能力在dp的0.7.10(当前是devel-i18n/testing)分支中加入，[效果演示](https://www.bilibili.com/video/BV1P54y1674i)

###### 打开这个功能需要SSH到终端进行：

```shell
#开启低速重写
echo -n 1 > /data/params/d/dp_toyota_lowest_cruise_override
#在上述条件下，开启使用当前速度做巡航速度
echo -n 1 > /data/params/d/dp_toyota_lowest_cruise_override_vego
#设定触发条件速度(以OP上看到的速度为准，可以稍微大0.x避免判断不准确)，低于该速度可以使用这个特性
echo -n 41.2 > /data/params/d/dp_toyota_lowest_cruise_override_at
#设定最低巡航速度 7km/h
echo -n 7 > /data/params/d/dp_toyota_lowest_cruise_override_speed
```

######  关闭当前速度做巡航速度特性 （仅用dp_toyota_lowest_cruise_override_speed做固定低速巡航值）：

```shell
echo -n 0 > /data/params/d/dp_toyota_lowest_cruise_override_vego
```

###### 彻底关闭低速巡航

```shell
#关闭低速重写(系统默认)
echo -n 0 > /data/params/d/dp_toyota_lowest_cruise_override
```


### dynamic gas

若你的车是openpilot 做纵向控制，可以在dragonpilot中这个特性，让你能在拥堵的市区道路、快道、高速等更近平顺的加油&跟车。目前在丰田汉兰达2018和雷克萨斯NX上体验，比原来OP控车更加平顺，该能力在dp的0.7.10(当前是devel-i18n/testing)分支中加入。 

 大体原理：
简化[ShaneSmiskol](https://github.com/ShaneSmiskol/openpilot)的DynamicGas代码， 读取雷达数据，在跟车时判断与前车的相对速度，若相对速度较小，则max_gas降低；同时兼顾与前车的相对距离，如果相对距离较远，max_gas会大一些，否则max_gas会小一些 。

###### 打开这个功能需要SSH到终端进行：

```shell
#第一步 开启dynamic gas
echo -n 1 > /data/params/d/dp_dynamic_gas
#第二步 也可以在dp的“操控设置”中, “加速模式”选择：节能、普通、运动。注意选择“关闭”DynamicGas也会不起作用
echo -n 1 > /data/params/d/dp_accel_profile
#第三步 (可选)也可以在dp的“操控设置”中，跟车距离设置为“长距离”在高速上体验会更换
echo -n 3 > /data/params/d/dp_dynamic_follow
```

在行驶过程中，可以 通过dp界面按钮调整“加速模式”， 也可以调整DynamicGas的max_gas数值。目前以汉兰达为例，经济模式比较像人在控制油门；也可以dp界面按钮调整“跟车距离”调整跟车距离，长距离在高速上会比较安全。行车中操作dp界面注意安全，让副驾进行调整！