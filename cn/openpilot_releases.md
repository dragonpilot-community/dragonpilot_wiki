## Openpilot 版本更新记录

- [更新记录[英文原版]](openpilot_releases_en.md)

### Version 0.7.6 (2020-06-05)

* 白熊猫即将被废弃，请升级为 comma 2 或者 黑熊猫
* 支持日产奇骏 2017, 聆风 2018-19 和 Rogue 2019（感谢 avolmensky）
* 支持马自达 CX-5 2017（仅录像模式，感谢 Jafaral）
* 通过使用 thneed 在模型中节约了大量 CPU 计算
* 大量的代码精简重构

### Version 0.7.5 (2020-05-13)

 * 支持右舵车型的驾驶员监控
 * 更新驾驶模型: 改进急转弯路况驾驶和前车速度检测
 * 更新驾驶员监控模型：Comma 2 上的整体改进
 * 在设置中新增前置摄像头预览开关，方便调整设备安装位置
 * 新增一些现代、起亚、Genesis 车型支持（感谢 xx979xx）
 * 支持日产奇骏 2019、日产聆风 2018（感谢 avolmensky）
 * 改进丰田 Rav4 2020 车型的横向控制

### Version 0.7.4 (2020-03-20)

 * 更新驾驶模型: 改进切换车道和前车检测
 * 更新驾驶员监控模型: 改进眨眼检测
 * 提高车辆校准稳定性
 * 改进丰田普锐斯 2019、2020 车型上的横向控制
 * 改进大众高尔夫车型上的横向控制：增加 20％ 转向扭矩
 * 修复丰田 CHR 2017、2018 车型上误用转向角传感器的问题
 * 支持本田 Insight （感谢 theantihero）
 * 精简代码（车辆抽象 和 UI 部分）


### Version 0.7.3 (2020-02-21)

 * ~~改进后置摄像头的自动对焦~~
 * 支持丰田汉兰达 2020（感谢 che220）
 * 支持雷克萨斯 NX 300h 2018 （感谢 kengggg）
 * 提升 ECU 固件查询速度
 * 修复停车熄火后，设备进程管理会挂掉的问题

### Version 0.7.2 (2020-02-07)

 * 基于ECU固件版本的指纹识别（丰田、本田车型）
 * 更新驾驶模型: 改善弯道和车道变换期间的路径预测并更好地追踪前车车速
 * 改善极端光线条件下的驾驶员监控，添加无法准确监控的警告
 * 支持丰田 Rav4 2019 混动（感谢 illumiN8i）
 * 支持雷克萨斯 RX 2016, 2017, 2020（感谢 illumiN8i）
 * 支持克莱斯勒 Pacifica 2020 混动（感谢 adhintz）

### Version 0.7.1 (2020-01-20)

 * 支持 comma two 硬件
 * 支持自动变道辅助（需车速大于 70km/h）
 * 使用自定义的 msgq 代替 zmq
 * Supercombo model: 校准和驾驶模型合并以后，可以更好的检测前车
 * 更健壮的升级程序，需要升级 NEOS （感谢 jyoung8607）
 * 改进低速 ACC 调教

### Version 0.7 (2019-12-13)

 * 开始使用 SCons 构建系统
 * 为所有支持的车型添加车道偏离预警（LDW）功能
 * NEOS 更新：提高 WiFi 速度（感谢 jyoung8607）
 * 基于场景的自适应驾驶员监控
 * 基于端到端模式训练的新驾驶模型：改善车道线检测 和 前车检测
 * 更加智能的转向扭矩限制警告
 * 改进通用车型的纵向控制: 使用正确的计算方法处理 15Hz 雷达数据
 * 把通用车型的适配、丰田断开 DSU 模块模式、comma 电子油门踏板 加入到社区功能（需要启用开关）
 * 移除 "通过 SIM 卡流量上传" 的开关：非 WiFi 环境下，只上传 qlog 和 qcamera 文件
 * 重构 Panda 代码，符合 ISO26262 和 SIL2 标准
 * 支持本田 Nidec 系列车型前方碰撞预警系统（FCW）信号的转发
 * 大众汽车适配成为标准：comma Harness 可以拦截原厂摄像头数据


### Version 0.6.6 (2019-11-05)

 * 支持大众车型（感谢 jyoung8607）
 * 支持丰田卡罗拉混动（TSS 2.0）（感谢 u8511049）
 * 支持雷克萨斯 ES（TSS 2.0）（感谢 energee）
 * 修复了通用车型的点火检测问题，不再需要锁定安全模式
 * 记录并显示 Panda 固件版本和 Panda Dongle ID（感谢 martinl）
 * 使用新的驾驶模型: 改进路径预测和前车检测
 * 新的驾驶员监控模型，体积缩小了 4 倍，可以运行在 DSP 上
 * 如果 Panda 的固件错误，则显示警告并不启动 openpilot
 * 修复了 EON 在驾驶结束后终止进程的问题
 * 不再支持没有 120 欧姆电阻的丰田 giraffe

### Version 0.6.5 (2019-10-07)

* NEOS 更新：升级到 Python3 并且 更新了安装程序
* 支持新版本硬件（comma Harness）
* 使用新的驾驶模型: 横向控制对车道线的依赖性降低
* 使用新的驾驶员监控模型: 更准确的面部识别和眼部检测
* 重新设计 EON 停车模式的显示界面，可以用来显示更新和警告
* 提高允许的最大加速度上限
* 3天没有启动车辆，切断EON 供电，防止汽车电池电量耗尽
* 支持雷克萨斯 CT 混动车系（感谢 thomaspich）
* 紧急警告时使用更大报警音量
* 添加切换到行车记录仪模式的开关
* 修复在没有 DSU 的丰田车型上“无效的车辆参数”的报错问题

### Version 0.6.4 (2019-09-08)

 * 支持本田 Nidec 系列车型自动刹车辅助系统（AEB）信号的转发
 * 改进在倾斜路面工况下的车道保持
 * 不间断防撞预警系统
 * 不间断驾驶状态监控（除了在右舵驾驶的国家）
 * 驾驶状态监控学习用户的正常驾驶姿势
 * 支持本田飞度车系（感谢 energee）
 * 支持雷克萨斯IS车系

### Version 0.6.3 (2019-08-12)

 * 通过 EON 发出声音警告（需要更新 NEOS 系统）
 * 改进驾驶状态监控：眼动追踪和改进的意识逻辑
 * 使用新的驾驶模型改进路径预测
 * 改进在宽车道和道路出口工况下的车道定位
 * 改进 RAV4 的横向控制
 * 通过数据模型进行减速过弯
 * 使用开源回归测试以验证输出与参考日志
 * 使用开源回归测试合理检查所有车型

### Version 0.6.2 (2019-07-29)

 * 新的自动驾驶模型！
 * 使用双实线改善车道跟踪
 * 极大改进了静止车辆检测
 * 极大减少了因为错误识别导致的制动
 * 弯道工况下更好的引导线跟踪
 * 利用神经网络改进车辆变道加塞预测
 * 改进丰田凯美瑞和C-HR的横向控制（感谢 zorrobyte）
 * 修复吉普车型上Openpilot异常断开控制的情况（感谢 adhintz）
 * 修复汽车熄火时延时过度到停车状态的问题

### Version 0.6.1 (2019-07-21)

 * comma 会员可以通过[ssh.comma.ai](https://ssh.comma.ai)进行远程 SSH 访问
 * panda 代码 Misra-c2012 符合规定，针对覆盖率进行了测试
 * 驾驶员注意力不集中或没有响应，在 3 次警告后，openpilot 锁定
 * 支持丰田 Sienna（感谢 wocsor）

### Version 0.6 (2019-07-01)

 * 新的模型，2倍像素、相同时间下十倍效率
 * 在正确的车道线上时，车辆不应该驶出
 * openpilot 的CPU使用率从 75% 降到大约 65%
 * 0.2% 的数据（qlogs）上传后，即可在浏览器中看到行驶路线图
 * loggerd 和 sensord 模块也开源了，现在 openpilot 的所有代码都是开源的
 * panda 安全代码符合MISRA标准，并在发布版本中有已签名版本
 * 新的 NEOS 系统比以前小了 500MB，并且 usr/pipenv 可以复用
 * 支持雷克萨斯 ES 混动车型（感谢 wocsor）
 * 改进对已支持的丰田 TSS2 车型的调教
 * 其他一些稳定性改进

### Version 0.5.13 (2019-05-31)

 * 当汽车关闭时（不适用于GM），熊猫耗电量降低70％，降至80mW
 * 汽车关闭时，EON功耗降低40％，降至1100mW
 * 将CPU利用率降低20％并提高稳定性
 * 暂时删除已映射的功能以提高稳定性
 * 为不支持的汽车添加 openpilot 行车记录模式
 * 将 controlsd 同步到 boardd 以减少延迟
 * 删除斯巴鲁长颈鹿的熊猫支持

### Version 0.5.12 (2019-05-16)

 * 改善普锐斯和普锐斯Prime的横向控制
 * 在写入磁盘之前压缩日志
 * 当存储空间达到 90％ 时，删除旧的驾驶数据
 * 修复跟随距离的小偏移
 * 各种小型 CPU 优化
 * 改善停车模式的功耗（需要 NEOS 更新）
 * 为爱沙尼亚添加默认速度限制（感谢 martinl）
 * 支持斯巴鲁 Crosstrek （感谢martinl）
 * 支持丰田亚洲龙（Avalon）（感谢njbrown09）
 * 支持丰田 Rav4 TSS 2.0（感谢 wocsor）
 * 支持丰田卡罗拉 TSS 2.0（感谢 wocsor）

### Version 0.5.11 (2019-04-17)

 * Add support for Subaru
 * Reduce panda power consumption by 60% when car is off
 * Fix controlsd lag every 6 minutes. This would sometimes cause disengagements
 * Fix bug in controls with new angle-offset learner in MPC
 * Reduce cpu consumption of ubloxd by rewriting it in C++
 * Improve driver monitoring model and face detection
 * Improve performance of visiond and ui
 * Honda Passport 2019 support
 * Lexus RX Hybrid 2019 support thanks to schomems!
 * Improve road selection heuristic in mapd
 * Add Lane Departure Warning to dashboard for Toyota thanks to arne182

### Version 0.5.10 (2019-03-19)

 * Self-tuning vehicle parameters: steering offset, tire stiffness and steering ratio
 * Improve longitudinal control at low speed when lead vehicle harshly decelerates
 * Fix panda bug going unexpectedly in DCP mode when EON is connected
 * Reduce white panda power consumption by 500mW when EON is disconnected by turning off WIFI
 * New Driver Monitoring Model
 * Support QR codes for login using comma connect
 * Refactor comma pedal FW and use CRC-8 checksum algorithm for safety. Reflashing pedal is required.
   Please see `#hw-pedal` on [discord](discord.comma.ai) for assistance updating comma pedal.
 * Additional speed limit rules for Germany thanks to arne182
 * Allow negative speed limit offsets

### Version 0.5.9 (2019-02-10)

 * Improve calibration using a dedicated neural network
 * Abstract planner in its own process to remove lags in controls process
 * Improve speed limits with country/region defaults by road type
 * Reduce mapd data usage with gzip thanks to eFiniLan
 * Zip log files in the background to reduce disk usage
 * Kia Optima support thanks to emmertex!
 * Buick Regal 2018 support thanks to HOYS!
 * Comma pedal support for Toyota thanks to wocsor! Note: tuning needed and not maintained by comma
 * Chrysler Pacifica and Jeep Grand Cherokee support thanks to adhintz!

### Version 0.5.8 (2019-01-17)

 * Open sourced visiond
 * Auto-slowdown for upcoming turns
 * Chrysler/Jeep/Fiat support thanks to adhintz!
 * Honda Civic 2019 support thanks to csouers!
 * Improve use of car display in Toyota thanks to arne182!
 * No data upload when connected to Android or iOS hotspots and "Enable Upload Over Cellular" setting is off
 * EON stops charging when 12V battery drops below 11.8V

### Version 0.5.7 (2018-12-06)

 * Speed limit from OpenStreetMap added to UI
 * Highlight speed limit when speed exceeds road speed limit plus a delta
 * Option to limit openpilot max speed to road speed limit plus a delta
 * Cadillac ATS support thanks to vntarasov!
 * GMC Acadia support thanks to CryptoKylan!
 * Decrease GPU power consumption
 * NEOSv8 autoupdate

### Version 0.5.6 (2018-11-16)

 * Refresh settings layout and add feature descriptions
 * In Honda, keep stock camera on for logging and extra stock features; new openpilot giraffe setting is 0111!
 * In Toyota, option to keep stock camera on for logging and extra stock features (e.g. AHB); 120Ohm resistor required on giraffe.
 * Improve camera calibration stability
 * More tuning to Honda positive accelerations
 * Reduce brake pump use on Hondas
 * Chevrolet Malibu support thanks to tylergets!
 * Holden Astra support thanks to AlexHill!

### Version 0.5.5 (2018-10-20)

 * Increase allowed Honda positive accelerations
 * Fix sporadic unexpected braking when passing semi-trucks in Toyota
 * Fix gear reading bug in Hyundai Elantra thanks to emmertex!

### Version 0.5.4 (2018-09-25)

 * New Driving Model
 * New Driver Monitoring Model
 * Improve longitudinal mpc in mid-low speed braking
 * Honda Accord hybrid support thanks to energee!
 * Ship mpc binaries and sensibly reduce build time
 * Calibration more stable
 * More Hyundai and Kia cars supported thanks to emmertex!
 * Various GM Volt improvements thanks to vntarasov!

### Version 0.5.3 (2018-09-03)

 * Hyundai Santa Fe support!
 * Honda Pilot 2019 support thanks to energee!
 * Toyota Highlander support thanks to daehahn!
 * Improve steering tuning for Honda Odyssey

### Version 0.5.2 (2018-08-16)

 * New calibration: more accurate, a lot faster, open source!
 * Enable orbd
 * Add little endian support to CAN packer
 * Fix fingerprint for Honda Accord 1.5T
 * Improve driver monitoring model

### Version 0.5.1 (2018-08-01)

 * Fix radar error on Civic sedan 2018
 * Improve thermal management logic
 * Alpha Toyota C-HR and Camry support!
 * Auto-switch Driver Monitoring to 3 min counter when inaccurate

### Version 0.5 (2018-07-11)

 * Driver Monitoring (beta) option in settings!
 * Make visiond, loggerd and UI use less resources
 * 60 FPS UI
 * Better car parameters for most cars
 * New sidebar with stats
 * Remove Waze and Spotify to free up system resources
 * Remove rear view mirror option
 * Calibration 3x faster

### Version 0.4.7.2 (2018-06-25)

 * Fix loggerd lag issue
 * No longer prompt for updates
 * Mitigate right lane hugging for properly mounted EON (procedure on wiki)

### Version 0.4.7.1 (2018-06-18)

 * Fix Acura ILX steer faults
 * Fix bug in mock car

### Version 0.4.7 (2018-06-15)

 * New model!
 * GM Volt (and CT6 lateral) support!
 * Honda Bosch lateral support!
 * Improve actuator modeling to reduce lateral wobble
 * Minor refactor of car abstraction layer
 * Hack around orbd startup issue

### Version 0.4.6 (2018-05-18)

 * NEOSv6 required! Will autoupdate
 * Stability improvements
 * Fix all memory leaks
 * Update C++ compiler to clang6
 * Improve front camera exposure

### Version 0.4.5 (2018-04-27)

 * Release notes added to the update popup
 * Improve auto shut-off logic to disallow empty battery
 * Added onboarding instructions
 * Include orbd, the first piece of new calibration algorithm
 * Show remaining upload data instead of file numbers
 * Fix UI bugs
 * Fix memory leaks

### Version 0.4.4 (2018-04-13)

 * EON are flipped! Flip your EON's mount!
 * Alpha Honda Ridgeline support thanks to energee!
 * Support optional front camera recording
 * Upload over cellular toggle now applies to all files, not just video
 * Increase acceleration when closing lead gap
 * User now prompted for future updates
 * NEO no longer supported :(

### Version 0.4.3.2 (2018-03-29)

 * Improve autofocus
 * Improve driving when only one lane line is detected
 * Added fingerprint for Toyota Corolla LE
 * Fixed Toyota Corolla steer error
 * Full-screen driving UI
 * Improved path drawing

### Version 0.4.3.1 (2018-03-19)

 * Improve autofocus
 * Add check for MPC solution error
 * Make first distracted warning visual only

### Version 0.4.3 (2018-03-13)

 * Add HDR and autofocus
 * Update UI aesthetic
 * Grey panda works in Waze
 * Add alpha support for 2017 Honda Pilot
 * Slight increase in acceleration response from stop
 * Switch CAN sending to use CANPacker
 * Fix pulsing acceleration regression on Honda
 * Fix openpilot bugs when stock system is in use
 * Change starting logic for chffrplus to use battery voltage

### Version 0.4.2 (2018-02-05)

 * Add alpha support for 2017 Lexus RX Hybrid
 * Add alpha support for 2018 ACURA RDX
 * Updated fingerprint to include Toyota Rav4 SE and Prius Prime
 * Bugfixes for Acura ILX and Honda Odyssey

### Version 0.4.1 (2018-01-30)

 * Add alpha support for 2017 Toyota Corolla
 * Add alpha support for 2018 Honda Odyssey with Honda Sensing
 * Add alpha support for Grey Panda
 * Refactored car abstraction layer to make car ports easier
 * Increased steering torque limit on Honda CR-V by 30%

### Version 0.4.0.2 (2018-01-18)

 * Add focus adjustment slider
 * Minor bugfixes

### Version 0.4.0.1 (2017-12-21)

 * New UI to match chffrplus
 * Improved lateral control tuning to fix oscillations on Civic
 * Add alpha support for 2017 Toyota Rav4 Hybrid
 * Reduced CPU usage
 * Removed unnecessary utilization of fan at max speed
 * Minor bug fixes

### Version 0.3.9 (2017-11-21)

 * Add alpha support for 2017 Toyota Prius
 * Improved longitudinal control using model predictive control
 * Enable Forward Collision Warning
 * Acura ILX now maintains openpilot engaged at standstill when brakes are applied

### Version 0.3.8.2 (2017-10-30)

 * Add alpha support for 2017 Toyota RAV4
 * Smoother lateral control
 * Stay silent if stock system is connected through giraffe
 * Minor bug fixes

### Version 0.3.7 (2017-09-30)

 * Improved lateral control using model predictive control
 * Improved lane centering
 * Improved GPS
 * Reduced tendency of path deviation near right side exits
 * Enable engagement while the accelerator pedal is pressed
 * Enable engagement while the brake pedal is pressed, when stationary and with lead vehicle within 5m
 * Disable engagement when park brake or brake hold are active
 * Fixed sporadic longitudinal pulsing in Civic
 * Cleanups to vehicle interface

### Version 0.3.6.1 (2017-08-15)

 * Mitigate low speed steering oscillations on some vehicles
 * Include board steering check for CR-V

### Version 0.3.6 (2017-08-08)

 * Fix alpha CR-V support
 * Improved GPS
 * Fix display of target speed not always matching HUD
 * Increased acceleration after stop
 * Mitigated some vehicles driving too close to the right line

### Version 0.3.5 (2017-07-30)

 * Fix bug where new devices would not begin calibration
 * Minor robustness improvements

### Version 0.3.4 (2017-07-28)

 * Improved model trained on more data
 * Much improved controls tuning
 * Performance improvements
 * Bugfixes and improvements to calibration
 * Driving log can play back video
 * Acura only: system now stays engaged below 25mph as long as brakes are applied

### Version 0.3.3  (2017-06-28)

  * Improved model trained on more data
  * Alpha CR-V support thanks to energee and johnnwvs!
  * Using the opendbc project for DBC files
  * Minor performance improvements
  * UI update thanks to pjlao307
  * Power off button
  * 6% more torque on the Civic

### Version 0.3.2  (2017-05-22)

  * Minor stability bugfixes
  * Added metrics and rear view mirror disable to settings
  * Update model with more crowdsourced data

### Version 0.3.1  (2017-05-17)

  * visiond stability bugfix
  * Add logging for angle and flashing

### Version 0.3.0  (2017-05-12)

  * Add CarParams struct to improve the abstraction layer
  * Refactor visiond IPC to support multiple clients
  * Add raw GPS and beginning support for navigation
  * Improve model in visiond using crowdsourced data
  * Add improved system logging to diagnose instability
  * Rewrite baseui in React Native
  * Moved calibration to the cloud

### Version 0.2.9  (2017-03-01)

  * Retain compatibility with NEOS v1

### Version 0.2.8  (2017-02-27)

  * Fix bug where frames were being dropped in minute 71

### Version 0.2.7  (2017-02-08)

  * Better performance and pictures at night
  * Fix ptr alignment issue in boardd
  * Fix brake error light, fix crash if too cold

### Version 0.2.6  (2017-01-31)

  * Fix bug in visiond model execution

### Version 0.2.5  (2017-01-30)

  * Fix race condition in manager

### Version 0.2.4  (2017-01-27)

  * OnePlus 3T support
  * Enable installation as NEOS app
  * Various minor bugfixes

### Version 0.2.3  (2017-01-11)

  * Reduce space usage by 80%
  * Add better logging
  * Add Travis CI

### Version 0.2.2  (2017-01-10)

  * Board triggers started signal on CAN messages
  * Improved autoexposure
  * Handle out of space, improve upload status

### Version 0.2.1  (2016-12-14)

  * Performance improvements, removal of more numpy
  * Fix boardd process priority
  * Make counter timer reset on use of steering wheel

### Version 0.2  (2016-12-12)

  * Car/Radar abstraction layers have shipped, see cereal/car.capnp
  * controlsd has been refactored
  * Shipped plant model and testing maneuvers
  * visiond exits more gracefully now
  * Hardware encoder in visiond should always init
  * ui now turns off the screen after 30 seconds
  * Switch to openpilot release branch for future releases
  * Added preliminary Docker container to run tests on PC

### Version 0.1  (2016-11-29)
  * Initial release of openpilot
  * Adaptive cruise control is working
  * Lane keep assist is working
  * Support for Acura ILX 2016 with AcuraWatch Plus
  * Support for Honda Civic 2016 Touring Edition
