#/bin/bash
#2020-12-26 toyboxZ create

branch="$1"
basename "$0"|grep -E '\.[0-9]+$' >/dev/null
if [ $? -ne 0 ];then
  dos2unix "$0"
  new_file="/dev/$(basename $0).$$"
  cp "$0" "$new_file"
  sh "$new_file" "$branch"
  exit
fi

git_dp_uri="/dragonpilot-community/dragonpilot.git"
git_host_list="github.com github.com.cnpmjs.org hub.fastgit.org"
git_host=github.com

check_git_host() {
  echo "[$(date +'%F %T')] 正在检测git镜像站点速度"
  local lh=$git_host; local lc=1000
  for h in $git_host_list ;do
    c=$(ping -c 1 -W1 $h 2>/dev/null |grep 'min/avg/max/mdev'|awk -F [=/] '{print $(NF-2)}'|awk -F '.' '{print $1}'); [ "$c" = "" ] && c=2000
    [ $c -lt $lc ] && lc=$c && lh=$h
  done
  [ "$lh" != "" ] && git_host=$lh
}

get_git_branchs() {
  branchs="$(git ls-remote --heads https://$git_host$git_dp_uri|awk -F '/' '{print $NF}'|grep -vw docs)"
}

complete_setup() {
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
    git remote -v 2>/dev/null|grep  "$git_dp_uri" >/dev/null || rm -rf /tmp/openpilot
    git branch    2>/dev/null|grep -w "$branch" >/dev/null || rm -rf /tmp/openpilot
    git fetch --depth 1 -f  origin "$branch" 2>/dev/null || rm -rf /tmp/openpilot
    git reset --hard FETCH_HEAD 2>/dev/null || rm -rf /tmp/openpilot
  fi
  [ -d /tmp/openpilot ] && complete_setup && return 0
  
  cd /tmp
  echo "[$(date +'%F %T')] 开始执行git clone https://$git_host$git_dp_uri"
  git clone https://$git_host$git_dp_uri /tmp/openpilot -b $branch --single-branch --depth=1
  while [ $? -ne 0 ];do
    echo "[$(date +'%F %T')] 执行git clone https://$git_host$git_dp_uri失败,重试..."
    git clone https://$git_host$git_dp_uri /tmp/openpilot -b $branch --single-branch --depth=1
  done
  complete_setup && return 0
}

to_recovery=0
replace_repo() {
  rm -rf /data/openpilot
  mv -f /tmp/openpilot /data/
    
  echo "[$(date +'%F %T')] DP分支切换完成，将自动重启进行编译"
  seq 1 10|while read id;do sleep 1;echo -n ". ";done
  
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
  printf "
[$(date +'%F %T')] 选择要执行的任务：
          1、安装testing分支(抢鲜版)
          2、安装devel-i18n(开发版,相对稳定)
          3、查看远程所有分支并选择
    
    输入数字选择:"
  read num
  [ "$num" = "1" ] && branch=testing && return
  [ "$num" = "2" ] && branch=devel-i18n && return
  [ "$num" = "3" ] && choos_branch && return
  
  echo "没有正确输入选项" && exit 1
}

update_neos() {
  echo "[$(date +'%F %T')] 开始下载NEOS v.${REQUIRED_NEOS_VERSION}"
  [ -d "/data/neoupdate" ] || mkdir "/data/neoupdate"
  
  cd "/data/neoupdate"
  file updater | grep 'ELF' >/dev/null || wget -T 60 "http://wiki.dragonpilot.cn/files/software/neosupdate/updater" -O updater
  file updater | grep 'ELF' >/dev/null
  if [ $? -ne 0  ];then
    echo "[$(date +'%F %T')] 获取NEOS下载器失败"
    exit 1
  fi
  chmod +x updater
  killall -9 ai.comma.plus.offroad
  
  update_url="http://wiki.dragonpilot.cn/files/software/neosupdate/update.${REQUIRED_NEOS_VERSION}.json"
  #update_url="http://192.168.2.106/neosupdate/update.${REQUIRED_NEOS_VERSION}.json"
  
  wget -T 10 $update_url 2>/dev/null -O - |grep ota_url >/dev/null
  [ $? -ne 0 ] && echo "[$(date +'%F %T')] 使用/tmp/openpilot/installer/updater/update.json做更新源" && update_url="file:///tmp/openpilot/installer/updater/update.json"
  
  ./updater "$update_url" &
  while [ true ];do
    ps -ef|grep -v grep |grep updater >/dev/null
    if [ $? -ne 0 ];then
      sleep 3
      echo "[$(date +'%F %T')] 下载NEOS ROM失败,正在重试."
      ./updater "$update_url" &
    fi
    sleep 1
  done
  
}

check_git_host
get_git_branchs

[ "$branch" = "" ] && set_branch
printf "$branchs\n"|grep -w "$branch" >/dev/null
[ $? -ne 0 ] && echo "[$(date +'%F %T')] 分支名不正确" && exit 1

free_size=$(df -k /data|tail -n1|awk '{print $(NF-2)}')
[ $free_size -le 4000000 ] && rm -rf /sdcard/realdata && rm -rf /sdcard/dashcam && rm -rf /sdcard/videos
[ $free_size -le 4000000 ] && echo "[$(date +'%F %T')] /data分区可用空间太小，请先清理\nThere is not enough disk space in the /data partition" && exit 1

s1=$(date +%s)
git_clone
while [ $? -ne 0 ];do
  echo "[$(date +'%F %T')] git clone失败, 重试..."
  git_clone
done
s2=$(date +%s)

. /tmp/openpilot/launch_env.sh
[ $? -ne 0 ] && echo "[$(date +'%F %T')] 读取openpilot环境变量异常" && exit 1

echo "[$(date +'%F %T')] git clone成功,耗时$((($s2-$s1)/60))min"

read neos_version < /VERSION
if [ "$neos_version" != "$REQUIRED_NEOS_VERSION" ]; then
  printf "[$(date +'%F %T')] 你选择的openpilot依赖于NEOS $REQUIRED_NEOS_VERSION,与当前的NEOS版本$neos_version不匹配,将会自动下载替换NEOS(更新后若有乱码请重启)\n"
  update_neos
else
  replace_repo
fi

