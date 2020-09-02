## Openpilot 硬件购买篇

### openpilot 是什么

openpilot 是 [comma](http://comma.ai/) 公司开源的一个自动驾驶辅助系统，包含 软件 和 硬件 两部分，其中软件和第一代硬件都是开源的，可以在 [github](https://github.com/commaai) 上找到。

因为在 openpilot 的发展过程中，硬件进行了一次更新，所以我们接下来，分别介绍一下。

#### 一代硬件

名称|图片
-|-
Giraffe|<img src="/files/giraffe1.png" class="max-h-100"><img src="/files/giraffe2.png" class="max-h-100"><img src="/files/giraffe3.png" class="max-h-100">
Panda|<img src="/files/panda1.png" class="max-h-100"><img src="/files/panda2.png" class="max-h-100"><img src="/files/panda3.png" class="max-h-100">
Comma power|<img src="/files/comma_power1.jpg" class="max-h-100"><img src="/files/comma_power2.jpg" class="max-h-100">
EON|<img src="/files/eon_front.jpg" class="max-h-100"><img src="/files/eon_back1.jpg" class="max-h-100"><img src="/files/eon_back.jpg" class="max-h-100">

一代硬件包含 Giraffe、Panda (White / Grey)、Comma power 和 EON 四部分，其中 Comma power 有些车型是必须配备的，而有些车型因为 Giraffe 接口上自带电源，所以不需要 Comma power.


Giraffe 又叫 "长颈鹿"，是连接 Panda 和 原车 ACC 模块的桥梁，它起到的作用，就是转换不同车型的不同接口到 OBD 接口，然后可以顺利的连接到 Panda，Giraffe 通常需要根据不同车型的不同接口定制，常见的型号有 Honda Bosch Giraffe，Honda Nidec Giraffe， Toyota Giraffe，不论是那种车型的 Giraffe，一般都会有多个指拨开关，用来配置模式、切换系统连接到原车还是openpilot。

Panda 又叫 "熊猫"，是一个基于 [opendbc](https://github.com/commaai/opendbc) 的汽车 OBD 协议解码器，可以通过不同的 DBC 定义，解析和发送的 OBD 信号，起到了数据转换和解析的网关作用，其中分灰熊猫（有GPS，没有WIFI）、白熊猫（有WIFI，没有GPS）2个版本。

Comma power 是从驾驶座下方取电的装置，汽车点火后，从 OBD 接口中取电，然后为 Panda 和 EON 供电，大部分丰田车型，都需要 Comma power 取电，而大部分本田车型（Honda Bosch）都不需要（思域除外）。

EON 是全套设备的 "大脑"，负责运行 neos 系统（基于 Android 6 定制开发的系统） 和 openpilot 软件，EON 由两部分组成，一是手机（一加3T 或 乐视 3 pro），二是外壳散热套件（有开源，可自己 3D 打印）。

#### 二代硬件

名称|图片
-|-
Harness connector<br>(黑色盒子是 harness)|<img src="/files/harness_connectors_with_harness.png" class="max-h-100"><img src="/files/harness_connectors.png" class="max-h-100">
Harness|<img src="/files/harness1.jpeg" class="max-h-100">
Panda (Black)|<img src="/files/black_panda.png" class="max-h-100"><img src="/files/black_panda1.png" class="max-h-100">
Comma power v2|<img src="/files/comma_power_v2.png" class="max-h-100">
EON|<img src="/files/eon_front.jpg" class="max-h-100"><img src="/files/eon_back1.jpg" class="max-h-100"><img src="/files/eon_back.jpg" class="max-h-100">

二代硬件包含 Harness、Panda (Black)、Comma power v2 和 EON 四部分。

Harness 是二代硬件中新加入的部分，其中部分线束代替了原来 Giraffe 的功能，用来连接 Panda 和原车 ACC 模块，另外 Harness 模块中还加入了自动切换功能（继电器），可以在 EON 工作不正常、没有连接的时候，自动切换到原车 ACC，和原来 Giraffe 上的指拨开关功能一致，但是自动切换的实现，更加方便了。

Black Panda，如果说 Grey Panda 是对 White Panda 的一次升级，Black Panda 可以说是 Grey Panda 的再次升级，想必 Grey 版本，Black 使用 USB Type-C 口与 Harness 传输 OBD 数据，而且体积更小，同时包含高精度 GPS，可以说是 Grey Panda 的体积缩小版，更加方便固定在前挡风玻璃上。

Comma power v2 的升级，也是接口的升级，使用 RJ-45（网线口）代替原有接口，使用一条网线即可实现供电的连接，另外，据说 Comma power v2 还可以作为额外的一路 CAN 总线数据，提供 VIN 查询（待验证），虽然作为本田雅阁车主，不需要这个东西，但是还是对他的未来功能，抱有幻想。

在本次的升级中， EON 没有任何变化，但是相信新版的 EON 也在研发中了，而且从代码中可以看到新版 EON 的名字 -- UNO。


### 一代和二代有什么区别

第二代相比较第一代有 2 个明显改进：
1. 体积缩小了，Panda 和 Harness 变成了 2 个小黑盒子，Giraffe 变成了线束，可以放进原车的 ACC 盒子里，第一代不行。
2. 新增硬件 Harness ，可以检测是否连接了 EON，自动切换原车和 OP，而第一代需要手动拨动开关切换。

经过一段时间的使用，主管体验上可以明显感受到的，车辆出现报错的情况变少了，拆掉 EON 也更加方便了，尤其是像我这样的使用场景（工作日上班，市内短途用不到辅助驾驶，周末小长途用 openpilot 省心省力）。

虽然二代相比一代有了一些改进，但是价格上也变贵了，再加上从官方购买需要过海关缴税，因此一些人还在观望，等待国内仿制版本的出现。

#### 新硬件发布后，旧硬件还可以正常使用么

George Hotz 在 discord 说对于一代硬件的软件支持，至少还会持续一年，也就是说，即使你现在购买了一代硬件，也是可以继续使用的，并且可以得到官方软件的支持。


#### 三代硬件

名称|图片
-|-
Harness connector<br>(黑色盒子是 harness)|<img src="/files/harness_connectors_with_harness.png" class="max-h-100"><img src="/files/harness_connectors.png" class="max-h-100">
Harness|<img src="/files/harness1.jpeg" class="max-h-100">
Comma power v2|<img src="/files/comma_power_v2.png" class="max-h-100">
Comma two(内置 Black panda)|<img src="/files/comma_2_1.jpg" class="max-h-100"><img src="/files/comma_2_2.jpg" class="max-h-100">


三代硬件包含 Harness、Comma power v2 和 Comma two 三部分。

Harness 和 Comma power v2 都和二代硬件中是一致的，没有变化，

Comma two，是原来 EON 的升级版本，其中：

- 内置 Black Panda，不再需要单独安装
- 增加红外 LED 夜间补光，方便夜间实现驾驶员监控
- 移除了手机电池，可以长期安装在车内

可以说 Comma two 的发布，是 Comma 向产品化又迈出了一大步，很大程度上完善了产品功能，极大的提升了用户体验。

其实对于 EON 升级到 Comma two，移除手机电池是一个很重要的更新，有动手能力的同学可以自己 DIY，不过操作过程需要注意，移除电池后保留电池保护板，电池供电线仍然需要提供稳定供电。

#### 新硬件发布后，旧硬件还可以正常使用么

George Hotz 在 discord 说对于一代硬件的软件支持，至少还会持续一年，也就是说，即使你现在购买了一代硬件，也是可以继续使用的，并且可以得到官方软件的支持。


### 怎么买，从哪买

目前，官方已经下架了一代硬件、二代硬件，全面销售三代硬件，但是国内仍然有商家在卖旧款硬件，同时跟进研发类似功能的新硬件。

就当前的时间点，下面我们说一说，有哪些购买方案和购买途径。

#### 一代硬件方案

商品|花费|购买途径
-|-|-
一代 Giraffe|  300 RMB | 国内商家
一代 White Panda|  350 RMB | 国内商家 
二手 乐视 3 pro 手机|  300 RMB | 二手闲鱼
手机支架|  50 RMB | 淘宝

总价：~ 1000 RMB

总结：手机靠捡漏，配件买国产，手机支架凑活用，1000 RMB 就可以尝试一下，花钱少，见效快。

问题：
- 手机散热问题
- 一代硬件问题：外观裸露，不能自动切换
- 缺少高精度 GPS 模块（政策限制，国内好像没啥效果）
- 需要自己把 乐视 3 pro 手机刷成 openpilot（难度不大）
- 手机中有电池，驾驶结束需要取下来，防止放在车里温度过高有爆炸风险

其实对于散热的问题，再购买一个专业的散热支架套件（含风扇、Gopro底座）是非常有必要的，因为 openpilot 的运算量较大，在夏天高温环境下，容易导致 EON 因为温度过高而不能正常工作，散热套件加持，可以一年四季长时间使用，可以在国内商家处买到，价格大约在 700 RMB左右。


#### 二代硬件方案

商品|花费|购买途径
-|-|-
Black Panda| - | 官方已停售<br>国内商家有售 
Harness（含连接线束、OBD电源线）|  官方售价 $200 | 官方在售<br>国内商家有售 
二手 乐视 3 pro 手机|  300 RMB | 二手闲鱼
散热支架套件|  700 RMB | 国内商家 


总价：~ 4000 RMB

总结：第二代硬件更新后，解决了车辆报错的问题，但是可以体验到自动切换原车和OP，可以隐藏安装，价格也还算合理值得推荐。

问题：
- 需要自己把 乐视 3 pro 手机刷成 openpilot（难度不大）
- 手机中有电池，驾驶结束需要取下来，防止放在车里温度过高有爆炸风险

#### 三代硬件方案（最新款硬件）

商品|花费|购买途径
-|-|-
Harness（含连接线束、OBD电源线）|  $200 | 官方在售<br>国内商家有售 
comma two（内置 Black panda、红外 LED、移除电池，含散热壳）|  $999 | 官方

总价：~ 8257 RMB

总结：官方最新全能套件，解决了目前遇到的所有问题，可以长期安装在车内，不用担心电池高温爆炸风险，同时散热风扇更静音。


* 海关报税的时候，选类别千万不要选择汽车配件，大陆法律中严禁个人进口汽车配件
* 如果想操作一下的话，可以在 discord （或邮件）联系 comma 官方客服，请求发 USPS 快递，因为 USPS 快递过海关的时候是抽检的，所以有一定的概率避过海关检查，节省掉一部分费用。


### 是否值得买

当你花 3k 块钱装了个 Android 大屏听歌看导航的时候，我已经装上 openpilot 体验了一把自动驾驶，其实都是改装的乐趣，如果预算足够，尽管买，不过都是玩具而已，目前的情况，并不能做到使用过程中一点问题没有

openpilot 目前可以说是加强版的 ACC(自适应巡航) 和 LKAS(车道保持)，可以自动控制方向盘，真正把车子保持在车道中间，不像大多数原车 LKAS 一样左右摇摆，提高了安全性，真正意义上的驾驶辅助，而 ACC 可以在长途驾驶中 释放右脚，不用紧绷神经、放松下来，减缓驾驶疲劳，也是有利于安全驾驶的。

因此：
- 如果你经常长途驾驶，并且封闭路况居多，非常推荐购买，既省心省力，又有利于安全；
- 如果你大部分时间都在市内道路，路况复杂，人乱车多，那就不建议购买，因为 openpilot 目前还不能很好的处理这种路况；
- 如果你想在车里睡觉、玩手机，让车子自己开，那么请马上放弃购买（目视前方，注意路况，既是对自己负责，也是对别人负责）


### 特殊说明

- 大部分车型原厂的 EPS 都会有转向扭矩限制，因此 openpilot 并不能全角度的自动转向（本田车型限制尤其严重）。
- 文中避税方式仅供参考，不作推荐。
- 文中购买链接仅供参考，无利益关系。
