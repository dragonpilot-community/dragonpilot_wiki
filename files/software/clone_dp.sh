#/bin/bash
#2020-12-26 toyboxZ create
cat "$0"|grep -v grep | grep -lUP '\r$' >/dev/null && echo "先执行dos2unix '$0'" && exit

git_op_uri="$1"
updater_md5=6933f79b9e0e616a5bdedc7d8dd2dafe
[ "$git_op_uri" = "" ] && git_op_uri="/dragonpilot-community/dragonpilot.git"
git_host_list="hub.fastgit.org github.com.cnpmjs.org github.com"
git_host=github.com
branch=""

fastgit_ip=101.32.191.80

check_git_host() {
  echo "[$(date +'%F %T')] 正在检测git镜像站点速度"
  mount -o rw,remount /system #为写入/etc/hosts做准备
  
  local gc=10000; 
  for host in $git_host_list ;do
    sed -r -i "/.*[\t ]*${host}\$/d" /etc/hosts 2>/dev/null
    local lc=10000; local lip="";
    for ip in $(curl -m 2 "http://119.29.29.29/d?dn=${host}.&ttl=1" 2>/dev/null|sed 's/;/ /g'|awk -F ',' '{print $1}');do
      echo $ip|grep -E '^[1-9]*[0-9]*\.[0-9]+\.[0-9]+\.[0-9]+$' >/dev/null
      if [ $? -eq 0 ];then
        c=$(ping  -c 3 -i0.2 -W1 $ip 2>/dev/null |grep 'min/avg/max/mdev'|awk -F [=/] '{print $(NF-2)}'|awk -F '.' '{print $1}'); [ "$c" = "" ] && c=10000
        [ $c -lt $lc ] && lc=$c && lip=$ip
        [ $c -lt $gc ] && gc=$c && git_host=$host
      fi
    done
    
    #解决hub.fastgit.org在某些区域无法获取到最好ip的问题
    if [ "$host" = "hub.fastgit.org" -a "$lip" != "$fastgit_ip" ];then
      ip=$fastgit_ip
      wget -T2 --no-check-certificate "https://${fastgit_ip}/favicons/favicon.png" 2>/dev/null -O -|md5sum  |grep 346e09471362f2907510a31812129cd2 >/dev/null
      if [ $? -eq 0 ];then
        c=$(ping  -c 3 -i0.2 -W1 $ip 2>/dev/null |grep 'min/avg/max/mdev'|awk -F [=/] '{print $(NF-2)}'|awk -F '.' '{print $1}'); [ "$c" = "" ] && c=10000
        [ $c -lt $lc ] && lc=$c && lip=$ip
        [ $c -lt $gc ] && gc=$c && git_host=$host
      fi
    fi
    
    echo $lip|grep -E '^[1-9]*[0-9]*\.[0-9]+\.[0-9]+\.[0-9]+$' >/dev/null
    if [ $? -eq 0 ];then
      echo "$lip   $host" >> /etc/hosts
    else
      #httpDNS失效
      c=$(ping -c 1 -W1 $h 2>/dev/null |grep 'min/avg/max/mdev'|awk -F [=/] '{print $(NF-2)}'|awk -F '.' '{print $1}'); [ "$c" = "" ] && c=10000
      [ $c -lt $gc ] && gc=$c && git_host=$host
    fi
  done
  
}

clean_hosts(){
  for host in $git_host_list ;do
    sed -r -i "/.*[\t ]*${host}\$/d" /etc/hosts 2>/dev/null
  done
}

set_api_server() {
  sed 's#"https://api.commadotai.com/"#"https://c2.openpilot.net/myPilot/"#g' /data/openpilot/common/api/__init__.py -i
  sed 's#ATHENA_HOST + "/ws/v2/" + dongle_id#"wss://c2.openpilot.net/ws?dongleId=" + dongle_id#' /data/openpilot/selfdrive/athena/athenad.py -i
  grep 'from="' /data/params/d/GithubSshKeys >/dev/null ; s1=$?
  grep '127.0.0.1' /data/params/d/GithubSshKeys >/dev/null ; s2=$?
  [ $s1 -eq 0 -a $s2 -ne 0 ] && sed -i 's/from="/from="127.0.0.1\/32,/' /data/params/d/GithubSshKeys
}

get_git_branchs() {
  branchs="$(git ls-remote --heads https://$git_host$git_op_uri|awk -F '/' '{print $NF}'|grep -vw docs)"
  [ "$branchs" = "" ] && git_host=github.com && branchs="$(git ls-remote --heads https://$git_host$git_op_uri|awk -F '/' '{print $NF}'|grep -vw docs)"
  [ "$branchs" = "" ] && echo "[$(date +'%F %T')] 获取分支列表异常,请检查网络" && exit 1
}

complete_setup() {
  set_api_server 2>/dev/null
  [ -f /data/data/com.termux/files/continue.sh ] && return
  echo "#!/usr/bin/bash" > /data/data/com.termux/files/continue.sh
  echo "cd /data/openpilot" >> /data/data/com.termux/files/continue.sh
  echo "exec ./launch_openpilot.sh" >> /data/data/com.termux/files/continue.sh
  chmod u+x /data/data/com.termux/files/continue.sh
}

git_clone() {
  echo "[$(date +'%F %T')] 检查本地临时仓库/tmp/openpilot"
  if [ -d /tmp/openpilot ];then
    cd /tmp/openpilot
    git remote -v 2>/dev/null|grep  "$git_op_uri" >/dev/null || rm -rf /tmp/openpilot
    git branch    2>/dev/null|grep -w "$branch" >/dev/null || rm -rf /tmp/openpilot
    git fetch --depth 1 -f  origin "$branch" 2>/dev/null || rm -rf /tmp/openpilot
    git reset --hard FETCH_HEAD >/dev/null 2>&1 || rm -rf /tmp/openpilot
  fi
  [ -d /tmp/openpilot ] && complete_setup && return 0
  
  cd /tmp
  echo "[$(date +'%F %T')] 开始执行git clone https://$git_host$git_op_uri"
  git clone https://$git_host$git_op_uri /tmp/openpilot -b $branch --single-branch --depth=1
  while [ $? -ne 0 ];do
    echo "[$(date +'%F %T')] 执行git clone https://$git_host$git_op_uri失败,重试..."
    git_host=github.com
    git clone https://$git_host$git_op_uri /tmp/openpilot -b $branch --single-branch --depth=1
  done
  complete_setup && return 0
}

to_recovery=0
replace_repo() {
  rm -rf /data/openpilot
  mv -f /tmp/openpilot /data/
    
  echo "[$(date +'%F %T')] OP分支切换完成，将自动重启进行编译"
  seq 1 5|while read id;do sleep 1;echo -n ". ";done
  
  [ $to_recovery -eq 0 ] && reboot
  [ $to_recovery -eq 1 ] && reboot recovery
  
}

choos_branch() {
  echo "分支列表:"
  printf "$branchs\n"|awk '{printf("%-4d  %s\n",NR,$0)}'
  echo -n "输入数字选择分支:"
  read num
  branch=$(printf "$branchs\n"|awk '{print $0}'|sed -n "${num},${num}p")
}

set_branch() {
  echo $git_op_uri |grep dragonpilot >/dev/null
  if [ $? -ne 0 ] ;then
    choos_branch
    return
  fi
  printf "
[$(date +'%F %T')] 选择要执行的任务：
          1、安装testing分支(最新版)
          2、查看远程所有分支并选择
    
    输入数字选择:"
  read num
  [ "$num" = "1" ] && branch=testing && return
  [ "$num" = "2" ] && choos_branch && return
  [ "$num" = "3" ] && set_api_server && reboot && return
  
  echo "没有正确输入选项" && exit 1
}

update_neos() {
  echo "[$(date +'%F %T')] 准备下载NEOS和recovery v.${REQUIRED_NEOS_VERSION}"
  [ -d "/data/neoupdate" ] || mkdir "/data/neoupdate"
  
  cd "/data/neoupdate"
  lmd5="$(md5sum updater 2>/dev/null|awk '{print $1}')"
  [ "$updater_md5" != "$lmd5" ] && wget -T 60 "http://wiki.dragonpilot.cn/files/software/neosupdate/updater" -O updater 2>/dev/null
  file updater 2>/dev/null| grep 'ELF' >/dev/null
  if [ $? -ne 0  ];then
    echo "[$(date +'%F %T')] 获取NEOS下载器失败"
    exit 1
  fi
  chmod +x updater
  killall -9 ai.comma.plus.offroad 2>/dev/null
  
  update_url="http://wiki.dragonpilot.cn/files/software/neosupdate/update.${REQUIRED_NEOS_VERSION}.json"
  #update_url="http://192.168.2.106/neosupdate/update.${REQUIRED_NEOS_VERSION}.json"
  
  wget -T 10 $update_url 2>/dev/null -O - |grep ota_url >/dev/null
  [ $? -ne 0 ] && echo "[$(date +'%F %T')] 使用/tmp/openpilot/installer/updater/update.json做更新源" && update_url="file:///tmp/openpilot/installer/updater/update.json"
  
  echo "[$(date +'%F %T')] 正在下载NEOS和recovery,进度请查看EON屏幕(注意不要退出/关闭当前SSH终端); 下载完成后EON会自动重启安装NEOS\n"

  ./updater "$update_url" >/dev/null 2>&1 &
  while [ true ];do
    ps -ef|grep -v grep |grep updater >/dev/null
    if [ $? -ne 0 ];then
      sleep 3

      echo "[$(date +'%F %T')] 下载NEOS ROM失败,正在重试."
      ./updater "$update_url" >/dev/null 2>&1 &
    fi
    sleep 1
    [ -f /dev/progress.info ] && read l < /dev/progress.info 2>/dev/null && echo -n "\r$l\t\t\t"
  done
  
}

check_git_host
get_git_branchs

[ "$branch" = "" ] && set_branch
printf "$branchs\n"|grep -w "$branch" >/dev/null
[ $? -ne 0 ] && echo "[$(date +'%F %T')] 分支名不正确" && exit 1

free_size=$(df -k /data|tail -n1|awk '{print $(NF-2)}')
[ $free_size -le 4000000 ] && rm -rf /sdcard/realdata && rm -rf /sdcard/dashcam && rm -rf /sdcard/videos
free_size=$(df -k /data|tail -n1|awk '{print $(NF-2)}')
[ $free_size -le 4000000 ] && echo "[$(date +'%F %T')] /data分区可用空间太小，请先清理\nThere is not enough disk space in the /data partition" && exit 1

s1=$(date +%s)
git_clone
while [ $? -ne 0 ];do
  echo "[$(date +'%F %T')] git clone失败, 重试..."
  git_clone
done
s2=$(date +%s)

clean_hosts

if [ -f /tmp/openpilot/launch_env.sh ];then
  . /tmp/openpilot/launch_env.sh
else
  touch /data/params/d/AccessToken 2>/dev/null
fi

if [ "$REQUIRED_NEOS_VERSION" = "" ];then
  [ "$REQUIRED_NEOS_VERSION" = "" ] && REQUIRED_NEOS_VERSION=$(echo "$branch"|awk '{if(match($0,/.*0\.6\.[5-6].*/))print "12";}')
  [ "$REQUIRED_NEOS_VERSION" = "" ] && REQUIRED_NEOS_VERSION=$(echo "$branch"|awk '{if(match($0,/.*0\.7\.0.*/))print "13";}')
  [ "$REQUIRED_NEOS_VERSION" = "" ] && REQUIRED_NEOS_VERSION=$(echo "$branch"|awk '{if(match($0,/.*0\.7\.[1-9]{1}[^0].*/))print "14";}')
  [ "$REQUIRED_NEOS_VERSION" = "" ] && REQUIRED_NEOS_VERSION="NEOS_FOR_$branch"
fi

echo "[$(date +'%F %T')] git clone成功,耗时$((($s2-$s1+60)/60))min"

read neos_version < /VERSION
if [ "$neos_version" != "$REQUIRED_NEOS_VERSION" ]; then
  printf "[$(date +'%F %T')] 你选择的openpilot依赖于NEOS $REQUIRED_NEOS_VERSION,与当前的NEOS版本$neos_version不匹配,将会自动下载替换NEOS(更新后若有乱码请重启)\n"
  update_neos
else
  replace_repo
fi

