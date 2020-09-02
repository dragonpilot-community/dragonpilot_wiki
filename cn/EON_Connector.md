## EON 快拆底座制作指南


> EON Connector by **CloudJ** is licensed under the [Creative Commons - Attribution license](https://zh.wikipedia.org/wiki/%E7%9F%A5%E8%AF%86%E5%85%B1%E4%BA%AB%E8%AE%B8%E5%8F%AF%E5%8D%8F%E8%AE%AE).


因为 EON 手机里有锂电池，不能长时间暴晒在阳光下，如果温度过高有爆炸风险，所以台湾网友 **CloudJ** 制作了一个磁吸快拆底座，既实现了 EON 的位置固定，又可以方便连接 EON 和 panda 的数据线，避免每次拔插插头的繁琐。

<center>
<image src="/files/eon_connector.jpg" alt="EON Connector 快拆底座">
</center>

### 材料列表

名称|数量|用途|图片|参考链接
-|-|-|-|-
3D打印底座|1套<br>（公母）|基座框架，固定位置|<image src="/files/eon_connector_bom_1.png" class="max-h-100">|[thingiverse 文件下载](https://www.thingiverse.com/thing:3497526)
D5*5mm 圆柱磁铁|20个|分别安装到公座和母座上，通过磁力连接固定2个底座|<image src="/files/eon_connector_bom_2.jpg" class="max-h-100">|[购买链接](https://item.taobao.com/item.htm?id=596765060083)
M885 10P弹簧针连接器|1套<br>（公母）|通过弹簧针触点的方式，连接 EON 的数据线与 panda 的数据线|<image src="/files/eon_connector_bom_3.png" class="max-h-100">|[购买链接1](https://item.taobao.com/item.htm?id=520700001937)<br>[购买链接2](https://item.taobao.com/item.htm?id=542533555733)
3M 双面胶|2个|粘贴固定公座到 EON 支架，<br>粘贴固定母座到前挡风玻璃|<image src="/files/eon_connector_bom_4.png" class="max-h-100">|[购买链接](https://detail.tmall.com/item.htm?id=526923033714)
Mini USB 上弯头<br>Mini USB 右弯头|各1条|快拆公座触点连接器连接到 EON<br>快拆母座触点连接器连接到 panda|<image src="/files/eon_connector_bom_5.png" class="max-h-100">|[购买链接](https://item.taobao.com/item.htm?id=15684291170)

附件：[CloudJ 发布的原版材料列表](/files/eon_connector_bom.pdf)

以上材料属于必需材料，另外还需要一些可选、或者需要但没有列出的工具或者材料：

- [必需]电烙铁、焊锡丝：用于焊接数据线到弹簧针触点，使连接更可靠
- [推荐]热熔胶枪、胶棒：用于填充3D打印底座凹槽，使背面平整，方便用3M胶粘贴
- [可选]台钳：用于把圆柱磁铁压入3D打印底座，实际上普通钳子也可以凑活用
- [可选]M2外六角螺帽、M2螺丝7mm以上：用于固定弹簧针连接器，实际上不用螺丝已经很牢固了

### 3D打印底座材料的选择

因为快拆底座的制作材料中，底座框架是需要自己制作的，CloudJ 提供了 stl 文件下载，你可以下载文件，并从淘宝找到 3D 打印服务，当然也可以根据自己的需求，改进原底座的设计。

经过网友们的摸索和尝试，发现打印材料的选择上非常重要，以下是几种常见材料和制作方式的优缺点：

材料|优点|缺点
-|-|-
SLA光敏树脂|乳白色外观，表面光滑，美观，精度足够|材料韧性不够，偏脆，在安装圆柱磁铁的过程中，容易开裂损坏； 温度耐受不高，有被 [高温暴晒后变形、变脆的风险](https://www.youtube.com/watch?v=DOHc-Gg7jTw)<br>**不推荐！不推荐！**
7500尼龙|材料韧性很好，在安装圆柱磁铁的过程中很容易压紧固定|黑色外观，精度够用（推荐选择）
胶木CNC加工|材料柔韧性好，安装圆柱磁铁方便紧固，外观美观，表面光滑|加工成本高（不在意成本的话是最佳选择）


以下分别是 SLA 打印、尼龙打印的展示：

<center>
<image src="/files/eon_connector_sla.jpg" class="max-h-300" alt="SLA光敏树脂3D打印效果"> <image src="/files/eon_connector_nilong.jpg" class="max-h-300" alt="尼龙材料3D打印效果">
</center>

### 磁铁的极向和固定

<center>
<image src="/files/eon_connector_ns.jpg" class="max-h-300" alt="磁铁的极向和固定">
</center>

#### 使用 NS 极交错安装圆柱磁铁

使用 NS 极交错安装圆柱磁铁，这样的防错设计，可以避免磁吸安装过程中方向错误，导致数据线、电源线接错，对汽车电路造成损害。
不过安装过程一定要耐心仔细，确认好了，公座、母座的对应磁铁极向正确，不然磁铁一旦安装完成，取出来可就没那么容易了。

#### 尽量使磁铁安装在同一个平面

尽量使磁铁外露部分保持在一个平面，并且圆柱磁铁不要完全推入到凹槽底座中，使公座、母座的不同极向平面完全接触，这样才能获得最好的吸力，起到更好的固定效果。



### 其他相关图片


<center>
<image src="/files/eon_connector_extra_1.jpg" class="max-h-300" alt="弹簧针连接器焊接接线">
</center>
<center>
弹簧针连接器焊接接线
</center>

------

<center>
<image src="/files/eon_connector_extra_2.jpg" class="max-h-300" alt="热熔胶填充">
</center>
<center>
热熔胶填充
</center>

------

<center>
<image src="/files/eon_connector_extra_3.jpg" class="max-h-300" alt="3M胶固定公座到EON支架">
</center>
<center>
3M胶固定公座到EON支架
</center>

------

<center>
<image src="/files/eon_connector_extra_4.jpg" class="max-h-300" alt="SLA打印底座安装磁铁失败">
</center>
<center>
SLA打印底座安装磁铁失败
</center>


