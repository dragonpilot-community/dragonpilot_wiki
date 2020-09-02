## FAQ

### Openpilot 一代硬件、二代硬件、二代硬件有什么区别？

* [Openpilot 硬件一览表](/cn/hardwares.md)

**第二代相比较第一代有 2 个明显改进：**

- 体积缩小了，panda 和 harness 变成了 2 个小黑盒子，giraffe 变成了线束，可以放进原车的 ACC 盒子里，第一代不行。
- 新增硬件 harness ，可以检测是否连接了EON，自动切换原车和 OP，而第一代需要手动拨动开关切换。

**第三代硬件 Comma2 改进：**

- 内置 Black Panda，前置红外摄像头，可以在夜间监控驾驶员是否安全驾驶。
- 移除了手机电池，避免设备长时间暴晒下的高温锂电池爆炸风险。


### Openpilot 的主要特性包括哪些？

Openpilot 官方版本支持 **车道保持** 、**ACC巡航**、**自动辅助变道**。

**车道保持：**控制方向盘，使车辆保持在左右两车道正中间。

**ACC巡航：**检测前车、障碍物，根据前车速度调节车速（油门、刹车），与前车保持安全距离。

**自动辅助变道：**当驾驶员需要切换车道时，需要打开转向灯（常亮），确认变向车道安全后，然后朝变道方向轻推方向盘，车辆将驶向旁边车道，变道完成后，需要驾驶员关闭转向灯。

* 0.6.4 之后的版本在测试过程中发现，如果没有车道线情况下，会跟随前车轨迹行驶


### 如何购买 openpilot 硬件？

参考： [Openpilot 硬件购买篇](cn/how_to_buy_openpilot.md)


### 如何安装 openpilot 软件？

参考：


- [Windows 下一键安装 openpilot 教程](cn/how_to_flash_openpilot_on_windows.md)
- [Windows 下手动安装 openpilot 教程](cn/how_to_flash_openpilot_on_windows_step_by_step.md)
- [macOS 下手动安装 openpilot 教程](cn/how_to_flash_openpilot_on_mac.md)
- [通过界面安装 openpilot 分支版本](cn/how_to_change_openpilot_fork_via_ui.md)
- [使用 Putty SSH 切换 openpilot 分支版本](cn/how_to_change_openpilot_fork_on_windows.md)




### Openpilot 与 原车 Acc LKAS 的区别到底有多大？

区别很大，例如本田原厂的LKA只能支持 3 度的横向控制，并且有撞线才拉回的感觉，openpilot完全没有，车自己保持在车道正中间，比雅阁自带的还要好很多很多，就像你自己开的一样稳。

* 0.6.4 之后的版本在测试过程中发现，如果没有车道线情况下，会 **跟随前车轨迹行驶**


### Stop & Go 路况表现怎么样？

在堵车排队的路况下，部分原车支持 ACC 排队的车型，支持较好，可以获得和原车一样的体验，当然也要注意防止加塞车辆没有被正确识别的情况。

原车不支持**全速域ACC**的情况下，可以尝试加装 [hw-pedal](https://github.com/commaai/neo/tree/master/pedal)，不过有一定的未知风险。


### Openpilot 还不具备预碰撞缓解功能（AEB）？

Openpilot 软件本身暂时不支持 AEB 刹车，只能在激活自动驾驶的时候，检测到前方车辆或障碍物距离太近，提示用户或刹车减速。


**通过 Supported Cars 表格的 Longitudinal 列，显示 Stock 的为使用原厂纵向控制，包括 ACC、AEB，显示 Yes 为 Openpilot 实现的纵向控制，暂时不支持 AEB。**


* 如果原车支持 AEB 并且安装 Openpilot 后仍然使用的 原厂纵向控制（Longitudinal Stock），那么不影响原厂 AEB 功能
* 如果安装 Openpilot 后使用 Openpilot 纵向控制（Longitudinal YES），那么暂时不支持 AEB 功能
* 0.6.4 版本开始支持 本田 Nidec 系列的原厂AEB

### Openpilot 硬件设备可以启动车辆时自动开机，熄火时自动关机么？

EON 通电自动开机，熄火不会自动关机。
分支版本可以实现 USB 断电后延时关机，比如： [dragonpilot](https://github.com/dragonpilot-community/dragonpilot) 。

PS. 为了避免 EON 在阳光下长时间照射，带来分锂电池爆炸风险，需要每次停车从前挡风玻璃上取下来，相对繁琐，所以熄火自动关机变得不太那么重要，毕竟也不差这一步操作。


### EON 可以一次性安装，以后上车即用么？

如果你使用的是没有电池的 Comma 2，那么你可以把它一直挂在前挡风玻璃上，不用取下来。

但是如果你使用的是带有锂电池的手机（乐视3Pro 或 一加3T），那么建议每次停车从前挡风玻璃上取下来，避免 EON 在阳光下长时间照射，带来分锂电池爆炸风险。


### openpilot 只能运行在一加 3T 手机上么，其他手机可以么？

因为 openpilot 的路径预测程序使用了 高通的机器学习平台（SNPE），所以目前只针对 骁龙821 CPU 进行了适配，并且因为摄像头模块等原因，目前只适配了 一加 3T 和 乐视 3 pro 两个机型。

如果需要运行在高通处理器的其他手机上，你可能需要修改摄像头相关的驱动代码。

openpilot 目前已经可以运行在具有足够运算能力的电脑上了，Comma 官方 3月28日 在官方博客发布了 [Self-Driving Car For Free](https://medium.com/@comma_ai/self-driving-car-for-free-82e871fe0587)，文章中指出，openpilot 代码中已经支了 TensorFlow 的模型，新的模型已经放出（只是目前训练数据有限，能力较 SNPE 模型较差），因此我们可以把 openpilot 运行在任何支持 TensorFlow 模型的平台上了（运算能力足够的前提下），经过社区开发者的尝试，目前来看 Jetson TX2 是目前比较合适的 DIY 硬件。

