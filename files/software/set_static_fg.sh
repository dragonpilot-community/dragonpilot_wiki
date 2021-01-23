#!/bin/sh

manufacturer() {
  find /data/openpilot/selfdrive/car/ -type d -maxdepth 1 -mindepth 1|grep -v '__'
}

car_list() {
  cd /data/openpilot
  printf ' 
import os
import sys
car_folder = sys.argv[1]
try:
  brand_name = car_folder.split("/")[-1]
  model_names = __import__("selfdrive.car.%%s.values" %% brand_name, fromlist=["CAR"]).CAR
  for c in sorted(model_names.__dict__.keys()):
    if not c.startswith("__"):
      print("%%s" %% getattr(model_names, c))
except (ImportError, IOError):
  pass
' > /data/openpilot/.get_car.py
  list=$(python /data/openpilot/.get_car.py ${d} 2>/dev/null)
  rm /data/openpilot/.get_car.py 2>/dev/null
}

manufacturer|awk -F '/' '{printf("%-2d %s\n",NR,$NF)}'
echo
echo "手工指定车型工具,用于免除OP没有录入指纹\n注意eon换到其他车辆上需要重新执行本脚本"
echo -n "请选择汽车制造商：" ; read m
d=$(manufacturer|sed -n "${m},${m}p")
car_list
printf "$list"|awk '{printf("%-2d %s\n",NR,$0)}'
echo -n "请选择车型：" ; read m
type=$(printf "$list"|sed -n "${m},${m}p")

echo "制造商:$(basename $d), 车型:${type}"
echo -n "确认写入以上信息吗(y/Y)?" ; read c
echo "$c"|grep -E 'y|Y' >/dev/null
if [ $? -eq 0 ];then
  sed -i "/export FINGERPRINT/d"  /data/data/com.termux/files/continue.sh
  sed -i "/export SKIP_FW_QUERY/d"  /data/data/com.termux/files/continue.sh
  sed -i "/launch_openpilot.sh/iexport FINGERPRINT='${type}'" /data/data/com.termux/files/continue.sh
  sed -i "/launch_openpilot.sh/iexport SKIP_FW_QUERY=True" /data/data/com.termux/files/continue.sh
  echo  "写入成功，请手工重启OP或者输入(r/R)进行重启验证:" ; read c
  echo "$c"|grep -E 'r|R' >/dev/null && reboot
fi
