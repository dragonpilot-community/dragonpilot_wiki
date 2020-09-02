## 常见术语


名称|别名|链接|解释
-|-|-|-
EON|EON DevKit|[buy](https://comma.ai/shop/products/eon-gold-dashcam-devkit) [install](https://community.comma.ai/Installing_EON)|1+ 3T 手机 或者 乐视 3 pro 手机，加上3D打印的带有散热风扇的框架，手机上运行的是修改定制的 Android 系统，用来运行 Openpilot。
EON Gold|LEON|-|乐视 3 pro 版本的 EON。
NEOS|-|-|运行在 EON 手机上的系统，是基于 Android 定制修改的系统，在此系统基础上运行 Openpilot
TWRP|-|[维基百科](https://zh.wikipedia.org/wiki/TWRP)|Team Win Recovery Project是一个开放源码软件的定制恢复模式映像，供基于安卓的设备使用。它提供了一个支持触摸屏的界面，允许用户向第三方安装固件和备份当前的系统。因此，经常在root系统时安装，虽然它并不是root之后才能安装。
一加 3T|OP3T|[维基百科](https://en.wikipedia.org/wiki/OnePlus_3T)<br>[参数规格](https://www.oneplus.com/cn/support/spec/oneplus-3t)|上一代 EON 中使用的手机。由于供应不足，官方已停止使用。
乐视 Pro 3|Lepro, LeEco, x727|[参数规格](http://www.lemall.com/cn/phone/lepro3.html)|EON 套件里的手机，x727
openpilot|OP|[维基百科](https://en.wikipedia.org/wiki/Openpilot)|自动驾驶系统软件，主要由 Python、c++、java、React Native编写
dragonpilot|DP, 龙芯驾驶辅助系统|[github](https://github.com/dragonpilot-community/dragonpilot)|基于 openpilot 的开源驾驶辅助系统。dragonpilot 的 fork
Panda OBD-II Interface|熊猫, Panda|[buy](https://comma.ai/shop/products/panda-obd-ii-dongle)|CAN总线转USB的适配器，分灰熊猫（有报警度GPS，没有WIFI）、白熊猫（有WIFI，没有高精度GPS）2个版本
Giraffe connector|长颈鹿, Giraffe|[buy](https://comma.ai/shop/products/giraffe) [install](https://community.comma.ai/Installing_Giraffe)|转接原车OBD接口出来，可以从中读取信息，不同车型设计了不同的版本
车道保持辅助系统|LKAS|[维基百科](https://en.wikipedia.org/wiki/Lane_departure_warning_system#Lane_keeping)<br>[百度百科](https://baike.baidu.com/item/LKAS)|自动检测并操作转向，把车辆保持在车道内的系统。
自适应巡航控制|ACC|[维基百科](https://en.wikipedia.org/wiki/Adaptive_cruise_control)<br>[百度百科](https://baike.baidu.com/item/%E8%87%AA%E9%80%82%E5%BA%94%E5%B7%A1%E8%88%AA%E6%8E%A7%E5%88%B6)|汽车巡航控制系统，可以设定最高速度，系统自动调节车速，保持与前方车辆的安全距离。
驾驶辅助系统|ADAS|[维基百科](https://en.wikipedia.org/wiki/Advanced_driver-assistance_systems) <br>[百度百科](https://baike.baidu.com/item/%E9%AB%98%E7%BA%A7%E9%A9%BE%E9%A9%B6%E8%BE%85%E5%8A%A9%E7%B3%BB%E7%BB%9F)|用于帮助驾驶员更好的驾驶车辆的辅助系统.
自动换道辅助系统|ALCA|-|基于安全考虑，虽然在一些其他分支中实现了，但是在官方版本中尚未添加这个功能。
远光自动控制系统|AHB|[百度百科](https://baike.baidu.com/item/远光自动控制)|夜间行驶的时候，自动切换远近光，可以更清楚的看清道路，并根据前方是否有车，自动切换回近光，防止干扰其他车辆驾驶员
Bosch|-|[维基百科](https://en.wikipedia.org/wiki/Robert_Bosch_GmbH#Mobility_Solutions)<br>[百度百科](https://baike.baidu.com/item/博世)|汽车零件供应商，在讨论openpilot的时候，通常指汽车上的博世提供的汽车辅助系统硬件（比如 CRV 上的博世ACC硬件）
Nidec|-|-|汽车零件供应商，在讨论openpilot的时候，通常指汽车上的Nidec提供的汽车辅助系统硬件（比如 2016+ 本田 Pilot）.
OBD-II|-|[维基百科](https://en.wikipedia.org/wiki/On-board_diagnostics#OBD-II)<br>[百度百科](https://baike.baidu.com/item/车载自诊断系统)|车载自诊断系统
CAN总线|CAN, CAN bus|[维基百科](https://en.wikipedia.org/wiki/CAN_bus)<br>[百度百科](https://baike.baidu.com/item/CAN总线)|为ECU之间通信提供了一种标准化协议的的通信方式
INDI|-|-|一种类似于 PIF、PID、LQR 的控制算法
LQR|-|-|一种和 INDI、PIF、PID 类似的控制算法
PID|-|[维基百科](https://en.wikipedia.org/wiki/PID_controller)<br>[百度百科](https://baike.baidu.com/item/PID)|一种类似 INDI、LQR、PIF 的控制算法。
PIF|-|-|一种类似于 INDI、LQR、PID 的控制算法，F 是指前级反馈
Advance-Angle|-|[discord](https://discordapp.com/channels/469524606043160576/538741329799413760/615266067002032158)|一种与 LQR 类似的控制算法，使用EPS电机扭矩来计算更精确的转向角
Chffr|-|-|一个可以把手机当做行车记录仪的应用程序，2019年年中下架了。
Chffrplus|-|[guide](https://community.comma.ai/Running_ChffrPlus_on_the_EON)|安装在 [EON DevKit](#EON) 上的程序，可以当做行车记录仪使用。
Comma.ai|-|[website](http://comma.ai)|Openpilot 背后的公司
Comma Connect|-|-|A mobile app for [Android](https://play.google.com/store/apps/details?id=ai.comma.connect&hl=en_US) and [iOS](https://apps.apple.com/us/app/comma-connect/id1456551889)|
Comma Pedal|-|[维基百科](https://community.comma.ai/Comma_Pedal)|一个可以使不支持 stop & go 功能的汽车支持全速域 ACC 功能的油门控制硬件，官方没有提供硬件销售和支持，但是可以在 OpenPilot 中使用。
Comma API|-|[docs](https://api.comma.ai/#comma-api-spec)|
Comma Points|-|[维基百科](https://community.comma.ai/FAQ#commapoints)|在官方平台上行使用并上传了行车记录，可以获得的积分奖励。
Comma Power|-|[buy](https://comma.ai/shop/products/power)|使用汽车的 OBD-II 接口为 Giraffe 供电
Comma Prime|Prime|[buy](https://comma.ai/shop/products/comma-prime-sim-card)|官方的会员服务，一些额外的权益（比如永久行车记录的的存储）。
Driver Support Unit|DSU|-|丰田汽车上实现 巡航系统 和 紧急刹车制动 的嵌入式系统.
动态雷达巡航控制系统|DRCC|-|使用前摄像头和前保险杠出的前雷达检测前车距离，保持驾驶员设定的安全距离，实现自适应巡航的系统。
电子控制单元|ECU|[维基百科](https://en.wikipedia.org/wiki/Electronic_control_unit)<br>[百度百科](https://baike.baidu.com/item/ECU)|汽车电子设备中的任何嵌入式系统，用于控制车辆中的一个或多个电气系统或子系统。
电子助力转向|EPS, EPAS|[维基百科](https://en.wikipedia.org/wiki/Power_steering#Electric_systems)<br>[百度百科](https://baike.baidu.com/item/EPS)|传感器可以检测到转向角度和扭矩，通过一个连接到转向柱上的电机，系统可以控制电机提供转向扭矩，辅助驾驶员转向。
指纹信息|-|[discord](https://discordapp.com/channels/469524606043160576/524327905937850394/597941450407149599) <br>[creating](https://community.comma.ai/Creating_Fingerprints)|每个车型都不同的一组CAN总线信号数据，OpenPilot 可以通过它识别出当前车辆型号。
固件|-|[维基百科](https://en.wikipedia.org/wiki/Firmware)|直接在诸如Panda之类的硬件上运行的底层软件。
刷机|-|[维基百科](https://en.wikipedia.org/wiki/Firmware#Flashing)|一种将固件写入硬件设备的方法。
fork|custom fork|[维基百科](https://en.wikipedia.org/wiki/Fork_(software_development))|开发人员复制项目代码，然后在此基础上二次开发，新开发出来的项目代码就叫做fork
FrEON|OpenFrEON|[github](https://github.com/ch4se/OpenFrEON)|"Free EON"... EON 的开源版本，项目里包含3D打印所需要的模型文件。由 @Chase#7213 设计
General Motors Local Area Network|GMLAN|[维基百科](https://en.wikipedia.org/wiki/General_Motors_Local_Area_Network)|通用汽车开发的CAN总线总线的超集。
heat sink|heatsink|[维基百科](https://en.wikipedia.org/wiki/Heat_sink)|被动冷却装置
hugging|-|-|车辆行驶过程中偏向于一侧车道线的情况
车道偏离报警系统|LDA|-|在车道线清晰的情况下，通过摄像头判断车辆是否偏离车道，通过报警提示驾驶员，但是不会有其他辅助操作。
LiveParameters|-|-|在车辆上不断更新、学习的校准数据.
机器学习模型|model|[维基百科](https://en.wikipedia.org/wiki/Machine_learning)<br>[百度百科](https://baike.baidu.com/item/机器学习)|-
Original Equipment Manufacturer|OEM|[维基百科](https://zh.wikipedia.org/wiki/%E4%BB%A3%E5%B7%A5%E7%94%9F%E4%BA%A7)<br>[百度百科](https://baike.baidu.com/item/原始设备制造商)|OEM 是受托厂商按来样厂商之需求与授权，按照厂家特定的条件而生产，所有的设计图等都完全依照来样厂商的设计来进行制造加工。
OpenStreetMap|OSM|[维基百科](https://zh.wikipedia.org/wiki/%E9%96%8B%E6%94%BE%E8%A1%97%E5%9C%96)|一个开源项目，旨在创建一个免费的可编辑的世界地图。
Open-source software|OSS|[维基百科](https://zh.wikipedia.org/wiki/%E5%BC%80%E6%BA%90%E8%BD%AF%E4%BB%B6)|开源软件
Panda Paw|Paw|[buy](https://comma.ai/shop/products/panda-paw)|一种帮助为熊猫救砖的装置。
ping pong|ping ponging|-|想要保持在车道中间，但是车辆一会靠近左侧车道，一会靠近右侧车道，这种来回摇摆的情况较做 ping-pong
汽车防撞系统|PCS|[维基百科](https://zh.wikipedia.org/zh-cn/%E6%B1%BD%E8%BB%8A%E9%98%B2%E6%92%9E%E7%B3%BB%E7%B5%B1)|汽车防撞系统是一种利用通讯、控制与资讯科技侦测车辆周遭的动态状况，以辅助汽车驾驶人的安全科技。依各家车厂不同的命名，另有预防碰撞系统、前方碰撞预警系统、减少碰撞系统等异称。
Stop-and-Go|SnG|-|车辆在拥堵路况下，刹车停下来，然后再往前形式一段后停下来，这种情况叫做SnG，通常说拥堵路况下的驾驶模式
Snapdragon Neural Processing Engine|SNPE|[dev info](https://developer.qualcomm.com/software/qualcomm-neural-processing-sdk)|美国高通公司出品的神经网络处理引擎，可运行于搭载了高通Zeroth机器智能平台的820芯片处理器，开发者可以在SNPE上搭建自己的深度学习网络模型
STL 文件|[百度百科](https://baike.baidu.com/item/STL/7899225)|3D模型文件，通常指用于3D打印的3D模型文件，比如 FrEON 中的框架、底座。
TensorFlow|TF|[维基百科](https://en.wikipedia.org/wiki/TensorFlow)<br>[百度百科](https://baike.baidu.com/item/TensorFlow)|开源及机器学习引擎
丰田 Safety Sense 2|TSS-2|[info](https://www.toyota.com/content/ebrochure/CFA_TSS_2.pdf)|TSS 2.0建立在以前的TSS-C和TSS-P套件的基础上,并由六个主动安全和驾驶员辅助系统组成：PCS，DRCC，LDA，AHB，RSA和LTA。
丰田 Safety Sense C|TSS-C|[info](https://www.toyota.com/content/ebrochure/CFA_TSS_C.pdf)|一种用于紧凑型车辆的高级主动安全套件，由主动安全和驾驶员辅助系统组成：PCS，DRCC，LDA和AHB。
丰田 Safety Sense P|TSS-P|[info](https://www.toyota.com/content/ebrochure/CFA_TSS_P.pdf)|适用于中型和大型车辆的高级主动安全套件，包括主动安全和驾驶员辅助系统：PCS，LDA和AHB。
Zorro Steering Sensor|ZSS|[github](https://github.com/zorrobyte/betterToyotaAngleSensorForOP)|一个DIY角度传感器来替代TSS-P Toyota中使用的劣质传感器（尤其是Prius和Prius Prime出现问题）
