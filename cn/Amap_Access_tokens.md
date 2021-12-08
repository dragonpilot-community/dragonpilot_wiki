# 高德地图api申请教程

**按照图示，对应页面申请web端api，然后输入对应key和安全秘钥**

**注意：**

**mapbox的秘钥是必要的，填写mapbox秘钥点击链接，[dragonpilot导航生成秘钥说明](mapbox_Access_tokens.md)。**

**高德地图仅作为选择地点，不作为导航使用，导航使用mapbox组件。**



## 1.SSH开启高德地图作为导航选项的选择地点地图

echo -n 1 > /data/params/d/dp_nav_amap_enable

![image-20211208102631331](../files/Amap_Access_tokens/image-20211208102631331.png)



## 2.申请高德开发者资格

申请页面

https://console.amap.com/dev/id/choose

![image-20211116150500204](../files/Amap_Access_tokens/image-20211116150500204.png)

![image-20211116150513811](../files/Amap_Access_tokens/image-20211116150513811.png)

![image-20211116150614834](../files/Amap_Access_tokens/image-20211116150614834.png)

![image-20211116150727922](../files/Amap_Access_tokens/image-20211116150727922.png)



## 3.登陆控制台，申请key和安全秘钥

![image-20211208100729178](../files/Amap_Access_tokens/image-20211208100729178.png)

![image-20211208100819738](../files/Amap_Access_tokens/image-20211208100819738.png)

![image-20211208100843622](../files/Amap_Access_tokens/image-20211208100843622.png)

![image-20211208101001398](../files/Amap_Access_tokens/image-20211208101001398.png)

![image-20211208102858864](../files/Amap_Access_tokens/image-20211208102858864.png)



![image-20211208101101044](../files/Amap_Access_tokens/image-20211208101101044.png)

## 4.登陆设备（ip地址：8082）填写高德apikey和安全秘钥

![image-20211208103202087](../files/Amap_Access_tokens/image-20211208103202087.png)

![image-20211208101222688](../files/Amap_Access_tokens/image-20211208101222688.png)

![image-20211208101240581](../files/Amap_Access_tokens/image-20211208101240581.png)



可以通过搜下拉菜单，保存（最近/住家/工作）地址到设备内，下次可以直接点击设备内对应地址，发起快捷导航

导航基于mapbox数据，有时候可能因为网络速度需要等待

![image-20211208101323492](../files/Amap_Access_tokens/image-20211208101323492.png)

![image-20211208102031045](../files/Amap_Access_tokens/image-20211208102031045.png)