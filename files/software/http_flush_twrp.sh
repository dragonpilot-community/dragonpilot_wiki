#!/bin/sh

[ -d /data/neoupdate ] || mkdir -p /data/neoupdate

cd /data/neoupdate ; [ $? -ne 0 ] && echo "进入neoupdate目录异常(create working dir error)." && exit 1


TWRP_URL=http://wiki.dpp.cool/otherFiles/software/twrp-3.3.1-0-leecolepro3.img
ONEPLUS3T_TWRP_URL=http://wiki.dpp.cool/otherFiles/software/twrp-3.3.1-0-oneplus3t.img
TWRP=/data/neoupdate/twrp-3.3.1-0.img

TWRP_SHA256SUM=aedd7935a2afe5e62fa92f36859a3a2993685d487d258bb32ccf668b953c54c3
ONEPLUS3T_TWRP_SHA256SUM=27d53363d984d27cf1992f1a3475b8abd4fa8c9c9f271239dcdf5a49cc86a6d6

system="letv"
check_system() {
  cat /proc/cmdline 2>/dev/null | grep letv >/dev/null
  if [ $? -ne 0 ];then
    echo "无法识别到乐视pro3,如果你的手机是一加3T,请输入y/Y确认继续"
    echo "EON is not LETV leecole pro3,If is oneplus3t, type y/Y to continue"
    echo -n "input:"
    read c
    [ "$c" != "y" -a "$c" != "Y" ] && echo "exit." && exit 1
    
    system="oneplus3t"
    TWRP_URL=$ONEPLUS3T_TWRP_URL
    TWRP_SHA256SUM=$ONEPLUS3T_TWRP_SHA256SUM
  fi
  free_size=$(df -k /data|tail -n1|awk '{print $(NF-2)}')
  [ $free_size -le 2839504 ] && echo "/data分区可用空间太小，请先清理\nThere is not enough disk space in the /data partition" && exit 1
}


recovery_dev=$(readlink  /dev/block/platform/*/*/by-name/recovery)

dowload_update_recovery(){

  [ ! -f $TWRP ] && echo "开始下载TWRP(start download TWRP)" && wget --dns-timeout=5 --connect-timeout=5 $TWRP_URL -O $TWRP
  
  sum=$(sha256sum  $TWRP |awk '{print $1}')
  [ "$sum" != "$TWRP_SHA256SUM" ] && rm $TWRP && echo "TWRP下载失败(download TWRP fail)" && return 1
  
  [ "$recovery_dev" = "" ] && echo "无法获取recovery设备(can't find recovery block)" && exit 1

  bak=/data/neoupdate/recovery.bak.$(date +%s).img
  dd if=$recovery_dev of=$bak  && echo "旧recovery备份在$bak"
  
  echo "开始安装TWRP(start flush TWRP)"
  dd if=$TWRP of=$recovery_dev && echo "TWRP recovery安装成功(flush TWRP succes)" && return 0
  
  echo "TWRP recovery安装失败(flush TWRP fail)" && exit 1
}

flush_previous_recovery() {
  f=$(ls -1t /data/neoupdate/recovery.bak.*.img|head -n1)
  [ "$f" = "" ] && echo "找不到recovery镜像备份(can't find recovery backup img)" && return 1
  
  echo "开始恢复到recovery到上一次安装前的状态(install previous backup recovery)"
  dd if=$f of=$recovery_dev && echo "recovery恢复成功(flush previous backup recovery succes)" && return 0
}


recovery(){
  clear
  while true;do  
    printf "
      操作选项：
      [1]下载安装TWRP recovery(install TWRP recovery)
      [2]恢复到recovery到上一次安装前的状态(install previous backup recovery)
      [3]退出操作
      [4]重启进入recovery
    "
    echo -n "请输出选择:" && read o
    
    [ "$o" = "1" ] && dowload_update_recovery
    [ "$o" = "2" ] && flush_previous_recovery
    [ "$o" = "3" ] && exit 0
    [ "$o" = "4" ] && reboot recovery
  done
  echo "是否安装TWRP recovery(已经安装过的请忽略),输入y/Y确认继续"
  read r
  echo $r|grep -E 'y|Y' >/dev/null
  if [ $? -ne 0 ];then
    echo "你选择了不安装是否安装TWRP recovery"
    return 0
  fi

}


check_system

echo "在执行以下操作前请确保EON接上电源\nMake sure that the EON is powered on before doing the following operations\n"

recovery
